-- ============================================================================
--  0078 — College Board's Reading and Writing questions
--
--  400 questions from College Board's SAT Suite Question Bank, into the
--  English practice pool. Part 4 of 5.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

select seed_pool_question($qb$CB-5d3177aa$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In the early 1960s, the US had a strict national-origins quota system for immigrants.
· The number of new immigrants allowed from a country each year was based on how many people from that country lived in the US in
1890.
· This system favored immigrants from northern Europe.
? Almost 70% of slots were reserved for immigrants from Great Britain, Ireland, and Germany.
? The 1965 Hart-Celler Act abolished the national-origins quota system.
The student wants to present the significance of the Hart-Celler Act to an audience unfamiliar with the history of US immigration. Which choice
most effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5d3177aa.png$qb$, $qb$[{"label": "A", "body": "Almost 70% of slots were reserved for immigrants from Great Britain, Ireland, and Germany at the time the Hart-Celler Act was proposed."}, {"label": "B", "body": "Prior to the Hart-Celler Act, new immigration quotas were based on how many people from each country lived in the US in 1890."}, {"label": "C", "body": "The quota system in place in the early 1960s was abolished by the 1965 Hart-Celler Act."}, {"label": "D", "body": "The 1965 Hart-Celler Act abolished the national-origins quota system, which favored immigrants from northern Europe."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence presents the significance of the Hart-Celler Act to an audience unfamiliar with the history of US
immigration, noting that the 1965 act abolished the national-origins quota system and explaining why that mattered, historically: because the old
quota system had favored immigrants from northern Europe.
Choice A is incorrect. The sentence describes an aspect of immigration policy at the time the Hart-Celler Act was proposed; it doesn’t present the
significance of the Hart-Celler Act to an audience unfamiliar with the history of US immigration. Choice B is incorrect. The sentence describes an
aspect of immigration policy before the Hart-Celler Act; it doesn’t describe or present the significance of the act to an audience unfamiliar with
the history of US immigration. Choice C is incorrect. While the sentence indicates that the Hart-Celler Act abolished the old quota system, it
doesn’t explain the act or the quota system to an audience unfamiliar with the history of US immigration.$qb$);
select seed_pool_question($qb$CB-7c9d0e38$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Roughly 96% of Australia’s estimated 200,000 animal species are invertebrates.
· Invertebrates of the order Hymenoptera, which consists of sawflies, wasps, bees, and ants, are estimated to total 14,800 species in
Australia.
? Invertebrates of the order Coleoptera, which consists of beetles and weevils, are estimated to total 28,200 species in Australia.
? Some of these invertebrates’ populations are threatened by invasive bird and fish species.
The student wants to emphasize the different orders in which Australia’s invertebrate animals are classified. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7c9d0e38.png$qb$, $qb$[{"label": "A", "body": "In Australia, 28,200 species are estimated to be beetles and weevils, both classified as invertebrates of the order Coleoptera."}, {"label": "B", "body": "Among Australia’s many invertebrates, sawflies, wasps, bees, and ants belong to the order Hymenoptera, while beetles and weevils belong to the order Coleoptera."}, {"label": "C", "body": "Many sawflies, wasps, bees, and ants of the order Hymenoptera are threatened by some of Australia’s invasive bird and fish species."}, {"label": "D", "body": "The order Hymenoptera is estimated to make up 14,800 of Australia’s 200,000 animal species."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence emphasizes the different orders that Australia’s invertebrates belong to, specifying that sawflies,
wasps, bees, and ants belong to the order Hymenoptera, whereas beetles and weevils belong to the order Coleoptera.
Choice A is incorrect. The sentence only mentions one order, Coleoptera; it doesn’t emphasize the different orders that Australia’s invertebrates
belong to. Choice C is incorrect. The sentence only mentions one order, Hymenoptera; it doesn’t emphasize the different orders that Australia’s
invertebrates belong to. Choice D is incorrect. The sentence only mentions one order, Hymenoptera; it doesn’t emphasize the different orders that
Australia’s invertebrates belong to.$qb$);
select seed_pool_question($qb$CB-ff3865b3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? A wok is a cooking pan that originated in China during the Han dynasty (206 BCE–220 CE).
· The wok’s round, wide base helps to cook food evenly.
? The wok’s high, angled sides help to contain oil splatters.
? Grace Young is a cook and culinary historian.
? Her book The Breath of a Wok (2004) traces the history of the wok.
The student wants to describe the wok’s shape. Which choice most effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ff3865b3.png$qb$, $qb$[{"label": "A", "body": "Grace Young’s 2004 book, The Breath of a Wok, traces the history of the cooking pan."}, {"label": "B", "body": "Able to cook food evenly and contain oil splatters, the wok is the subject of Grace Young’s 2004 book."}, {"label": "C", "body": "A wok is a cooking pan with a round, wide base and high, angled sides."}, {"label": "D", "body": "The design of a wok, a type of cooking pan that originated in China during the Han dynasty, helps the pan cook food evenly and contain oil splatters."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. It summarizes the information that describes the wok’s shape from the second and third bullet points.
Choice A is incorrect. This choice doesn’t describe the shape of a wok. Choice B is incorrect. This choice doesn’t describe the shape of a wok,
just some of its features. Choice D is incorrect. This choice doesn’t describe the shape of a wok, only some of its benefits or functions.$qb$);
select seed_pool_question($qb$CB-35507eba$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Pointillism is a painting technique in which small, distinct dots of color are applied in patterns to form an image.
· Betty Acquah is an artist from Ghana who uses pointillism in her work.
? “By extending dabs of color in the subject matter into the background and vice-versa, an illusion of movement is created,” she says about
pointillism.
? Her work often portrays Ghanaian women, whom she sees as the “unsung heroines of the Ghanaian Republic.”
? Her pointillist painting “Exquisite” (2016) features five dancing women twirling their skirts.
The student wants to provide a quotation from Acquah that explains why she used pointillism in “Exquisite.” Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-35507eba.png$qb$, $qb$[{"label": "A", "body": "In painting “Exquisite,” Acquah applied pointillism to create what she called an “illusion of movement” within the painting’s five dancing women and their twirling skirts."}, {"label": "B", "body": "Pointillism, the technique used in Acquah’s “Exquisite,” involves the application of small, distinct dots of color."}, {"label": "C", "body": "In “Exquisite,” Acquah uses a technique that she says involves “extending dabs of color in the subject matter into the background and vice- versa.”"}, {"label": "D", "body": "“Exquisite” portrays Acquah’s fellow Ghanaian women as she sees them: the “unsung heroes of the Ghanaian Republic.”"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence provides Acquah’s quotation about pointillism’s "illusion of movement" to explain that she used
pointillism to create the illusion of movement in her painting of women dancing.
Choice B is incorrect. The sentence explains pointillism and indicates that Acquah used the technique in her painting, but it doesn’t provide a
quotation or explain why. Choice C is incorrect. While the sentence provides a quotation from Acquah about pointillism, the quotation merely
describes a specific aspect of the technique; the sentence doesn’t explain why Acquah used pointillism in her painting. Choice D is incorrect.
While the sentence provides a quotation from Acquah, the quotation illustrates Acquah’s views on Ghanaian women; the sentence doesn’t
explain why Acquah used pointillism in her painting.$qb$);
select seed_pool_question($qb$CB-3a715eca$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In retrospect, one of the lessons of the 2003 Human Genome Project is that a gene is affected by many factors, not the least of which is its
interactions with the protein products of other genes. ______ rather than just focusing on the human genome, efforts to better understand gene
mutations related to disease have begun to consider the human proteome, the complete set of proteins expressed by human genes.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "That said,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Accordingly,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Accordingly" logically signals that this sentence states a result or consequence of the previous information about
the 2003 Human Genome Project. Taking into account an important lesson of the 2003 project (that a gene is affected by interactions with the
protein products of other genes), research has begun to consider the human proteome instead of just the genome.
Choice A is incorrect because "in other words" illogically signals that the information in this sentence is a paraphrase or restatement of the
previous information about the 2003 Human Genome Project. Instead, this sentence states a result or consequence of that information. Choice
B is incorrect because "that said" illogically signals that the information in this sentence qualifies or contrasts with the previous information
about the 2003 Human Genome Project. Instead, this sentence states a result or consequence of that information. Choice C is incorrect because
"for example" illogically signals that this sentence provides an example supporting the previous information about the 2003 Human Genome
Project. Instead, this sentence states a result or consequence of that information.$qb$);
select seed_pool_question($qb$CB-f1631638$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Gaspar Enriquez is an artist.
· He specializes in portraits of Mexican Americans.
? A portrait is an artistic representation of a person.
? Enriquez completed a painting of the sculptor Luis Jimenez in 2003.
? He completed a drawing of the writer Rudolfo Anaya in 2016.
The student wants to emphasize a difference between the two portraits. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f1631638.png$qb$, $qb$[{"label": "A", "body": "The portraits, or artistic representations, of Luis Jimenez and Rudolfo Anaya were both completed by Enriquez in the early 2000s."}, {"label": "B", "body": "Enriquez has completed portraits of numerous Mexican Americans, including sculptor Luis Jimenez and writer Rudolfo Anaya."}, {"label": "C", "body": "While both are by Enriquez, the 2003 portrait of Luis Jimenez is a painting, and the 2016 portrait of Rudolfo Anaya is a drawing."}, {"label": "D", "body": "Luis Jimenez was a Mexican American sculptor, and Rudolfo Anaya was a Mexican American writer."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes a difference between the portraits, noting that one is a painting and the other is a
drawing.
Choice A is incorrect. The sentence emphasizes a similarity between the two portraits rather than a difference. Choice B is incorrect. The
sentence makes a generalization about Enriquez’s portraits; it doesn’t emphasize a difference between the portraits of Jimenez and Anaya.
Choice D is incorrect. While the sentence notes a difference between Jimenez and Anaya, it doesn’t emphasize a difference between, or even
mention, their portraits.$qb$);
select seed_pool_question($qb$CB-d10e46a2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The ancient Spartans were known for their bitingly concise—or laconic—wit, a quality they maintained even in the face of great peril. ______ when
Philip II of Macedon threatened Laconia (the region of Greece containing Sparta), he said, “If I invade Laconia, I shall turn you out.” The Spartans
replied with a single word: “If.”
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Rather,"}, {"label": "B", "body": "In other words,"}, {"label": "C", "body": "That said,"}, {"label": "D", "body": "For instance,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "For instance" logically signals that the concise, witty exchange between Philip II and the Spartans is an example
supporting the previous claim—that the Spartans employed wit even in the face of peril.
Choice A is incorrect because "rather" illogically signals that the exchange between Philip II and the Spartans contrasts with the previous claim
about the Spartans’ wit. Instead, the exchange is an example of their wit. Choice B is incorrect because "in other words" illogically signals that the
exchange between Philip II and the Spartans is a restatement of the previous claim about the Spartans’ wit. Instead, the exchange is an example
of their wit. Choice C is incorrect because "that said" illogically signals that the exchange between Philip II and the Spartans is an exception to
the previous claim about the Spartans’ wit. Instead, the exchange is an example of their wit.$qb$);
select seed_pool_question($qb$CB-fdd9a360$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The popular wood-wide web theory posits that trees can communicate and exchange resources with one another via common
mycorrhizal networks (CMNs) of fungi.
? Ecologist Dr. Suzanne Simard first suggested this theory in 1997.
? She described trees as “super-cooperators.”
? In the 2022 study “The Decay of the Wood-Wide Web?,” mycologist Dr. Justine Karst and colleagues evaluated dozens of CMN studies.
? They write that CMNs “have captured the interest of broad audiences. We are concerned, however, that recent claims about CMNs in
forests are disconnected from evidence.”
The student wants to use a quotation to emphasize a potential problem with the wood-wide web theory. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fdd9a360.png$qb$, $qb$[{"label": "A", "body": "Describing trees as “super-cooperators,” Simard first suggested that trees can exchange resources with one another in 1997."}, {"label": "B", "body": "In “The Decay of the Wood-Wide Web?,” Karst and colleagues note that common mycorrhizal networks “have captured the interest of broad audiences.”"}, {"label": "C", "body": "After evaluating dozens of CMN studies, Karst and colleagues expressed concern that recent claims about common mycorrhizal networks are “disconnected from evidence.”"}, {"label": "D", "body": "Despite the concerns expressed in the 2022 study “The Decay of the Wood-Wide Web?,” the wood-wide web theory remains popular."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. This choice uses a quotation to convey the authors’ criticism and challenge to the wood-wide web theory due to an
absence of evidence.
Choice A is incorrect. This choice doesn’t emphasize a potential problem with the wood-wide web theory. It uses a quotation to introduce the
theory and its originator. It doesn’t mention any criticism or challenge to the theory. Choice B is incorrect. This choice uses a quotation, but it
doesn’t emphasize a potential problem with the wood-wide web theory. It uses a quotation to describe the appeal and interest of the theory, but it
doesn’t indicate why the authors are concerned or what evidence they have. Choice D is incorrect. This choice doesn’t use a quotation at all. It
paraphrases the main idea of the 2022 study, but it doesn’t include any specific words or phrases from the notes. It also doesn’t emphasize a
potential problem with the theory, but rather its popularity.$qb$);
select seed_pool_question($qb$CB-1b94a80a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Wool is a natural—and economically important—fiber that is obtained from animals like sheep.
· Australia is a leading producer of wool.
? The thickness of wool fibers varies across sheep breeds.
? Merino sheep produce fine wool that is used for apparel.
? Rambouillet sheep produce fine wool that is used for apparel.
? Romney sheep produce thick wool that is used for rugs and blankets.
The student wants to emphasize how Romney wool differs from Merino and Rambouillet wool. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1b94a80a.png$qb$, $qb$[{"label": "A", "body": "Romney wool is just one of the many kinds of wools, each originating from a different breed of sheep."}, {"label": "B", "body": "Sheep wool varies from breed to breed, so Romney wool will be different than other kinds of wool."}, {"label": "C", "body": "The fine wool produced by Merino and Rambouillet sheep is used for apparel, whereas the thicker wool of Romney sheep is used in rugs and blankets."}, {"label": "D", "body": "Wool is an economically important fiber—especially in Australia—that can be used to make apparel or even rugs and blankets."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. This choice most effectively emphasizes how Romney wool differs from Merino and Rambouillet wool. It describes
the difference in thickness and the difference in what they’re used for.
Choice A is incorrect. This choice doesn’t emphasize how Romney wool differs from Merino and Rambouillet wool. It doesn’t mention Merino or
Rambouillet wool at all. Choice B is incorrect. This choice doesn’t emphasize how Romney wool differs from Merino and Rambouillet wool. It
doesn’t mention Merino or Rambouillet wool at all. Choice D is incorrect. This choice doesn’t emphasize how Romney wool differs from Merino
and Rambouillet wool. It doesn’t mention Romney, Merino or Rambouillet wool at all.$qb$);
select seed_pool_question($qb$CB-88308a39$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Shaun Tan is an Australian author.
· In 2008, he published Tales from Outer Suburbia, a book of fifteen short stories.
? The stories describe surreal events occurring in otherwise ordinary suburban neighborhoods.
? In 2018, he published Tales from the Inner City, a book of twenty-five short stories.
? The stories describe surreal events occurring in otherwise ordinary urban settings.
The student wants to emphasize a similarity between the two books by Shaun Tan. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-88308a39.png$qb$, $qb$[{"label": "A", "body": "Shaun Tan’s book Tales from Outer Suburbia, which describes surreal events occurring in otherwise ordinary places, contains fewer short stories than Tales from the Inner City does."}, {"label": "B", "body": "Tales from Outer Suburbia was published in 2008, and Tales from the Inner City was published in 2018."}, {"label": "C", "body": "Unlike Tales from the Inner City, Shaun Tan’s book Tales from Outer Suburbia is set in suburban neighborhoods."}, {"label": "D", "body": "Shaun Tan’s books Tales from Outer Suburbia and Tales from the Inner City both describe surreal events occurring in otherwise ordinary places."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence uses “both” to emphasize a thematic similarity between Tan’s two books, noting that both Tales from
Outer Suburbia and Tales from the Inner City describe surreal events occurring in otherwise ordinary places.
Choice A is incorrect. The sentence emphasizes a difference (one contains fewer stories than the other), not a similarity, between the two
books. Choice B is incorrect. The sentence indicates that Tan’s books were published ten years apart; it doesn’t emphasize a similarity between
the two books. Choice C is incorrect. The sentence uses “unlike” to emphasize a difference between Tales from Outer Suburbia and Tales from the
Inner City; it doesn’t emphasize a similarity between the two books.$qb$);
select seed_pool_question($qb$CB-a0da8114$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Tibetan mastiffs are large dogs native to the Himalayas.
· A mutation in their EPAS1 gene prevents excess hemoglobin production.
? A mutation in their HBB gene boosts hemoglobin’s oxygen-carrying ability.
? These mutations enable the dogs to withstand hypoxic (low-oxygen) conditions at high altitudes.
? In a 2016 study, Zhen Wang and colleagues noted that Tibetan wolves’ DNA has the same EPAS1 and HBB mutations.
? Wang and colleagues determined that the dogs first acquired these mutations by interbreeding with Tibetan wolves around 24,000 years
ago.
The student wants to present the conclusion of Zhen Wang and colleagues’ 2016 study. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a0da8114.png$qb$, $qb$[{"label": "A", "body": "Like Tibetan mastiffs, Tibetan wolves can withstand hypoxic conditions at high altitudes."}, {"label": "B", "body": "Both Tibetan mastiffs and Tibetan wolves have mutations in their EPAS1 and HBB genes, which prevent excess hemoglobin production and boost hemoglobin’s oxygen-carrying ability, respectively."}, {"label": "C", "body": "In addition to preventing excess hemoglobin production, a mutation in Tibetan mastiffs’ HBB gene boosts hemoglobin’s oxygen-carrying ability."}, {"label": "D", "body": "By interbreeding with Tibetan wolves around 24,000 years ago, Tibetan mastiffs acquired the genetic mutations that enable them to withstand hypoxic conditions."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence presents the conclusion of Zhen Wang and colleagues’ 2016 study: Tibetan mastiffs are able to
withstand hypoxic conditions due to their interbreeding with Tibetan wolves 24,000 years ago (which allowed the mastiffs to acquire the
necessary genetic mutations).
Choice A is incorrect. The sentence emphasizes a similarity between Tibetan mastiffs and Tibetan wolves; it doesn’t present the conclusions of
the 2016 study. Choice B is incorrect. The sentence emphasizes a similarity between the genes of Tibetan mastiffs and Tibetan wolves; it doesn’t
present the conclusions of the 2016 study. Choice C is incorrect. The sentence misrepresents information from the notes by indicating that a
mutation in mastiffs’ HBB gene prevents excess hemoglobin production; moreover, it doesn’t present the conclusions of the 2016 study.$qb$);
select seed_pool_question($qb$CB-0fab0c90$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Gullah are a group of African Americans who have lived in parts of the southeastern United States since the 18th century.
· Gullah culture is influenced by West African and Central African traditions.
? Louise Miller Cohen is a Gullah historian, storyteller, and preservationist.
? She founded the Gullah Museum of Hilton Head Island, South Carolina, in 2003.
? Vermelle Rodrigues is a Gullah historian, artist, and preservationist.
? She founded the Gullah Museum of Georgetown, South Carolina, in 2003.
The student wants to emphasize the duration and purpose of Cohen’s and Rodrigues’s work. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0fab0c90.png$qb$, $qb$[{"label": "A", "body": "At the Gullah Museums in Hilton Head Island and Georgetown, South Carolina, visitors can learn more about the Gullah people who have lived in the region for centuries."}, {"label": "B", "body": "Louise Miller Cohen and Vermelle Rodrigues have worked to preserve the culture of the Gullah people, who have lived in the United States since the 18th century."}, {"label": "C", "body": "Since 2003, Louise Miller Cohen and Vermelle Rodrigues have worked to preserve Gullah culture through their museums."}, {"label": "D", "body": "Influenced by the traditions of West and Central Africa, Gullah culture developed in parts of the southeastern United States in the 18th century."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes both the duration (the length of time) and the purpose of Cohen’s and Rodrigues’s work
by noting that the women have been working since 2003 to preserve Gullah culture.
Choice A is incorrect. While the sentence emphasizes what visitors to Cohen’s and Rodrigues’s museums can learn, it doesn’t mention the
duration or purpose of the women’s work. Choice B is incorrect. While the sentence emphasizes the purpose of Cohen’s and Rodrigues’s work, it
doesn’t mention the duration of that work (the length of time the women have been working to preserve Gullah culture). Choice D is incorrect.
While the sentence emphasizes where and when Gullah culture developed, it doesn’t mention the duration or purpose of Cohen’s and Rodrigues’s
work.$qb$);
select seed_pool_question($qb$CB-00e0170f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Magnetic levitation (maglev) trains are suspended above a track by powerful electromagnets, reducing friction and thus allowing for much faster
speeds. Though maglev advocates in the US have long imagined these trains crisscrossing the country, their dream remains unrealized. ______ of
the handful of maglev trains currently in operation, all are in Asia.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In fact,"}, {"label": "B", "body": "To that end,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "That said,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This sentence emphasizes just how far maglev advocates’ dreams are from coming true. “In fact” is a transition
used to emphasize the truth of a statement that modifies the previous statement and therefore fits perfectly in this context.
Choice B is incorrect. This choice uses a cause-and-effect transition, which doesn’t make sense here. Maglev advocates’ dream remaining
unrealized would not cause there to be only a few maglev trains, all located in Asia. Choice C is incorrect. This choice uses a disagreement
transition, which doesn’t make sense here. In fact, this sentence agrees with the previous sentence—both talk about how maglev trains are far
from becoming common in the US. Choice D is incorrect. This choice uses a disagreement transition, which doesn’t make sense here. In fact,
this sentence agrees with the previous sentence—both talk about how maglev trains are far from becoming common in the US.$qb$);
select seed_pool_question($qb$CB-56cad44a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Mexican tetras are a fish species with two distinct populations.
· Surface-dwelling tetras live on the surface and are able to see.
? Cave-dwelling tetras live in total darkness and have lost the ability to see.
? Cave-dwelling tetras have asymmetrical skulls with more sensory receptors on one side than the other.
? These receptors help cave-dwelling tetras navigate in darkness.
The student wants to emphasize a difference between surface-dwelling and cave-dwelling tetras. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-56cad44a.png$qb$, $qb$[{"label": "A", "body": "Surface-dwelling and cave-dwelling tetras may belong to the same species, but they are quite different."}, {"label": "B", "body": "Cave-dwelling tetras can no longer see but use sensory receptors on their skulls to navigate."}, {"label": "C", "body": "Mexican tetras are a fish species with two distinct populations: surface-dwelling tetras and cave-dwelling tetras."}, {"label": "D", "body": "Surface-dwelling tetras can see, whereas cave-dwelling tetras cannot."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence emphasizes a difference between surface-dwelling and cave-dwelling tetras, noting that while
surface-dwelling tetras can see, cave-dwelling tetras can’t.
Choice A is incorrect. While the sentence notes that surface-dwelling and cave-dwelling tetras are different, it doesn’t emphasize any difference
between the two populations of tetras. Choice B is incorrect because the sentence explains that cave-dwelling tetras use sensory receptors on
their skulls to navigate; it doesn’t emphasize a difference between surface-dwelling and cave-dwelling tetras. Choice C is incorrect. While the
sentence notes that there are two different populations of Mexican tetras, it doesn’t emphasize any difference between the two populations.$qb$);
select seed_pool_question($qb$CB-c071eca2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Iraqi artist Nazik Al-Malaika, celebrated as the first Arabic poet to write in free verse, didn’t reject traditional forms entirely; her poem “Elegy for a
Woman of No Importance” consists of two ten-line stanzas and a standard number of syllables. Even in this superficially traditional work, ______
Al-Malaika was breaking new ground by memorializing an anonymous woman rather than a famous man.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "therefore,"}, {"label": "B", "body": "in fact,"}, {"label": "C", "body": "moreover,"}, {"label": "D", "body": "though,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The first sentence tells us that Al-Malaika sometimes used "traditional forms". The second tells us that even when
she used traditional forms, Al-Malaika was "breaking new ground". To connect these ideas, we need a contrast word like "but." "Though" is a
contrast word similar to "but."
Choice A is incorrect. This isn’t a logical transition. The first sentence tells us that Al-Malaika sometimes used "traditional forms". The second
tells us that even when she used traditional forms, Al-Malaika was "breaking new ground". To connect these ideas, we need a contrast word like
"but." "Therefore" doesn’t show contrast; it shows cause and effect. Choice B is incorrect. This isn’t a logical transition. The first sentence tells us
that Al-Malaika sometimes used "traditional forms". The second tells us that even when she used traditional forms, Al-Malaika was "breaking
new ground". To connect these ideas, we need a contrast word like "but." "In fact" is a phrase that usually emphasizes the truth of the previous
statement. Choice C is incorrect. This isn’t a logical transition. The first sentence tells us that Al-Malaika sometimes used "traditional forms". The
second tells us that even when she used traditional forms, Al-Malaika was "breaking new ground". To connect these ideas, we need a contrast
word like "but." "Moreover" doesn’t show contrast—it introduces additional information that continues or supports the previous idea.$qb$);
select seed_pool_question($qb$CB-a7a944ed$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In astrophysics, a ring of debris orbiting a larger object within the object’s Roche limit is expected to persist as a ring, whereas a ring of debris
orbiting outside this limit would likely accrete into a satellite (e.g., a moon). Bruno Morgado and colleagues, ______ detected a dense ring of
material orbiting the trans-Neptunian object Quaoar at a distance of 2,500 miles, well outside the calculated Roche limit of 1,100 miles, that has
remained intact.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "though,"}, {"label": "B", "body": "for example,"}, {"label": "C", "body": "fittingly,"}, {"label": "D", "body": "likewise,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Though” logically signals that the information in this sentence—that Morgado and colleagues detected a dense ring
orbiting outside the Roche limit that remained intact—presents an exception to the previous sentence’s claim about debris orbiting outside an
object’s Roche limit. Such debris would be expected to accrete into a satellite, not remain intact as a ring.
Choice B is incorrect because “for example” illogically signals that the information about Morgado’s discovery exemplifies the previous
sentence’s claim about debris orbiting outside an object’s Roche limit. Instead, the sentence presents an exception to the claim. Choice C is
incorrect because “fittingly” illogically signals that the information about Morgado’s discovery aligns with the previous sentence’s claim about
debris orbiting outside an object’s Roche limit. Instead, the sentence presents an exception to the claim. Choice D is incorrect because “likewise”
illogically signals that the information about Morgado’s discovery is similar to the previous sentence’s claim about debris orbiting outside an
object’s Roche limit. Instead, the sentence presents an exception to the claim.$qb$);
select seed_pool_question($qb$CB-b5ed1a8b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In his 2023 collection The Diaspora Sonnets, Filipino American poet Oliver de la Paz leverages the sonnet form’s “diamond-like quality of
precision,” as he describes it. The poems often adhere scrupulously to the form’s centuries-old conventions, such as its characteristic fourteen-
line length. In the twelve-line poem “Diaspora Sonnet at the Feeders Before the Freeze,” ______ de la Paz playfully subverts sonnet conventions,
the poem’s truncated length conveying a sense of abruptness.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "fittingly,"}, {"label": "B", "body": "similarly,"}, {"label": "C", "body": "for example,"}, {"label": "D", "body": "by contrast,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “By contrast” logically signals that the information in this sentence—that one of de la Paz’s poems subverts sonnet
conventions—contrasts with the previous information that his poems often adhere to sonnet conventions.
Choice A is incorrect because “fittingly” illogically signals that the information in this sentence is an appropriate or expected outcome of the
previous information about de la Paz’s adherence to sonnet conventions. Instead, de la Paz’s subversion of sonnet conventions contrasts with
that information. Choice B is incorrect because “similarly” illogically signals that the information in this sentence is similar to the previous
information about de la Paz’s adherence to sonnet conventions. Instead, de la Paz’s subversion of sonnet conventions contrasts with that
information. Choice C is incorrect because “for example” illogically signals that the information in this sentence exemplifies the previous
information about de la Paz’s adherence to sonnet conventions. Instead, de la Paz’s subversion of sonnet conventions contrasts with that
information.$qb$);
select seed_pool_question($qb$CB-feb1e6da$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Biographer Michael Gorra notes that the novelist Henry James “lived in a world of second thoughts,” frequently tinkering with his novels and
stories after their initial publication. However, the differences between the 1881 first edition and the 1908 edition of his novel A Portrait of a Lady
are extreme, even by James’s standards; ______ some critics regard the two editions as two different novels altogether.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "by contrast,"}, {"label": "B", "body": "in fact,"}, {"label": "C", "body": "nevertheless,"}, {"label": "D", "body": "in other words,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "In fact" logically signals that the critics’ claim at the end of this sentence—that the two editions are essentially two
different novels altogether—offers additional emphasis in support of the previous claim that the differences between the editions are extreme.
Choice A is incorrect because "by contrast" illogically signals that the claim at the end of this sentence contrasts with the previous claim about
the differences between the editions. Instead, the critics’ opinion offers additional emphasis in support of that claim. Choice C is incorrect
because "nevertheless" illogically signals that the claim at the end of this sentence is true despite the previous claim about the differences
between the two editions. Instead, the critics’ opinion offers additional emphasis in support of that claim. Choice D is incorrect because "in other
words" illogically signals that the claim at the end of this sentence is merely paraphrasing the previous claim about the differences between the
two editions. The critics’ opinion adds new information to the previous claim rather than simply paraphrasing it.$qb$);
select seed_pool_question($qb$CB-d2b52c50$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? On January 3, 1959, Alaska became the 49th state to join the US.
· On August 21, 1959, Hawaii became the 50th state to join the US.
? A new 50-star US flag was unveiled the same day.
The student wants to emphasize the order in which Alaska and Hawaii became US states. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d2b52c50.png$qb$, $qb$[{"label": "A", "body": "Alaska, the 49th US state, became a state several months before Hawaii, the 50th state, did."}, {"label": "B", "body": "On August 21, 1959, a new 50-star US flag was unveiled."}, {"label": "C", "body": "The 49th and 50th states to join the US did so in the same year."}, {"label": "D", "body": "The same day that Hawaii became a US state—August 21, 1959—a new US flag was unveiled."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the order in which Alaska and Hawaii became US states, noting that Alaska became a US
state several months before Hawaii did.
Choice B is incorrect. The sentence specifies when the 50-star US flag was unveiled; it doesn’t emphasize the order in which Alaska and Hawaii
became US states. Choice C is incorrect. While the sentence indicates that the 49th and 50th states became US states in the same year, it
doesn’t identify which state was the 49th and which was the 50th; as a result, it doesn’t emphasize the order in which Alaska and Hawaii became
states. Choice D is incorrect. The sentence indicates that a new US flag was unveiled when Hawaii became a US state; it doesn’t emphasize the
order in which Alaska and Hawaii became states.$qb$);
select seed_pool_question($qb$CB-176edca6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A 2017 study of sign language learners tested the role of iconicity—the similarity of a sign to the thing it represents—in language acquisition. The
study found that the greater the iconicity of a sign, the more likely it was to have been learned. ______ the correlation between acquisition and
iconicity was lower than that between acquisition and another factor studied: sign frequency.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In fact,"}, {"label": "B", "body": "In other words,"}, {"label": "C", "body": "Granted,"}, {"label": "D", "body": "As a result,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Granted” logically signals that the information in this sentence—that iconicity is not as highly correlated with
acquisition as sign frequency is—is true in spite of the information in the previous sentence about the positive correlation between iconicity and
acquisition.
Choice A is incorrect because “in fact” illogically signals that this sentence either emphasizes or refutes the information in the previous sentence
about the positive correlation between acquisition and iconicity. Instead, it provides information about a different correlation—that between
acquisition and sign frequency. Choice B is incorrect because “in other words” illogically signals that this sentence merely restates the
information in the previous sentence about the positive correlation between acquisition and iconicity. Instead, this sentence provides information
about a different correlation—that between acquisition and sign frequency. Choice D is incorrect because “as a result” illogically signals that this
sentence is a consequence of the information in the previous sentence about the positive correlation between acquisition and iconicity. Instead,
this sentence provides information about a different correlation—that between acquisition and sign frequency.$qb$);
select seed_pool_question($qb$CB-10cd0327$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? A thermal inversion is a phenomenon where a layer of atmosphere is warmer than the layer beneath it.
· In 2022, a team of researchers studied the presence of thermal inversions in twenty-five gas giants.
? Gas giants are planets largely composed of helium and hydrogen.
? The team found that gas giants featuring a thermal inversion were also likely to contain heat-absorbing metals.
? One explanation for this relationship is that these metals may reside in a planet’s upper atmosphere, where their absorbed heat causes
an increase in temperature.
The student wants to present the study’s findings to an audience already familiar with thermal inversions. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-10cd0327.png$qb$, $qb$[{"label": "A", "body": "Heat-absorbing metals may reside in a planet’s upper atmosphere."}, {"label": "B", "body": "The team studied thermal inversions in twenty-five gas giants, which are largely composed of helium and hydrogen."}, {"label": "C", "body": "Researchers found that gas giants featuring a thermal inversion were likely to contain heat-absorbing metals, which may reside in the planets’ upper atmospheres."}, {"label": "D", "body": "Gas giants were likely to contain heat-absorbing metals when they featured a layer of atmosphere warmer than the layer beneath it, researchers found; this phenomenon is known as a thermal inversion."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. It describes the study’s findings in a way that assumes the audience is already familiar with thermal inversions.
Choice A is incorrect. This choice doesn’t fully describe the findings of the study, because it doesn’t include anything about thermal inversions.
Choice B is incorrect. This choice doesn’t describe the study’s findings. Choice D is incorrect. This choice isn’t suited for an audience already
familiar with thermal inversion. A familiar audience wouldn’t need to have the term defined.$qb$);
select seed_pool_question($qb$CB-4105f5ac$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$When, in 2017, Cambridge University students Lucy Moss and Toby Marlow decided they wanted to develop a musical together, one of their goals
was for their female actor friends to have good parts to play. ______ they created the show Six, a retelling of the history of King Henry VIII’s wives
in which each of the six queens has a starring role.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "In summary,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "To that end,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "To that end" logically signals that the information in this sentence—the students’ creation of a show with six
starring female roles—is the product of a goal or desire in the previous sentence (the students’ wish to develop a musical with roles for female
actors).
Choice A is incorrect because "in other words" illogically signals that the information in this sentence is a paraphrase or restatement of the
previous information about the students’ wish to develop a musical with roles for female actors. Instead, the students’ show is the product of
that desire. Choice B is incorrect because "in summary" illogically signals that the information in this sentence summarizes the previous
information about the students’ wish to develop a musical with roles for female actors. Instead, the students’ show is the product of that desire.
Choice C is incorrect because "for example" illogically signals that the information in this sentence is merely an example of the previous
information about the students’ wish to develop a musical with roles for female actors. Instead, the students’ show is the direct product of that
desire.$qb$);
select seed_pool_question($qb$CB-388b45aa$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Establishing Coordinated Universal Time (UTC) is no easy task. Each month, readings of a single second from atomic clocks around the world
are taken and sent to the International Bureau of Weights and Measures (BIPM) in France. ______ BIPM metrologists perform the meticulous
work of assembling these minutely disparate readings into a globally shared time standard.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "There,"}, {"label": "B", "body": "In particular,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Conversely,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "There" indicates that the work of calculating Coordinated Universal Time takes place at the International Bureau of
Weights and Measures in France. Because "there" indicates a location, it fits the context perfectly.
Choice B is incorrect. This choice uses an exemplification transition, which doesn’t make sense here. This sentence is describing where the work
of coordinating Coordinated Universal Time takes place, not giving an example of the work described in the previous sentence. Choice C is
incorrect. This choice uses an exemplification transition, which doesn’t make sense here. This sentence is describing where the work of
coordinating Coordinated Universal Time takes place, not giving an example of the work described in the previous sentence. Choice D is
incorrect. This choice uses a disagreement transition. But this sentence doesn’t disagree with the previous sentence. They both describe the
work involved in calculating Coordinated Universal Time.$qb$);
select seed_pool_question($qb$CB-4b376902$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? NASA uses rovers, large remote vehicles with wheels, to explore the surface of Mars.
· NASA’s rovers can’t explore regions inaccessible to wheeled vehicles.
? Rovers are also heavy, making them difficult to land on the planet’s surface.
? Microprobes, robotic probes that weigh as little as 50 milligrams, could be deployed virtually anywhere on the surface of Mars.
? Microprobes have been proposed as an alternative to rovers.
The student wants to explain an advantage of microprobes. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4b376902.png$qb$, $qb$[{"label": "A", "body": "Despite being heavy, NASA’s rovers can land successfully on the surface of Mars."}, {"label": "B", "body": "Microprobes, which weigh as little as 50 milligrams, could explore areas of Mars that are inaccessible to NASA’s heavy, wheeled rovers."}, {"label": "C", "body": "NASA currently uses its rovers on Mars, but microprobes have been proposed as an alternative."}, {"label": "D", "body": "Though they are different sizes, both microprobes and rovers can be used to explore the surface of Mars."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence explains an advantage of microprobes, noting that because microprobes weigh as little as 50
milligrams, they can explore areas inaccessible to rovers.
Choice A is incorrect. The sentence indicates that rovers can land successfully on Mars despite their weight; it doesn’t explain an advantage of
microprobes. Choice C is incorrect. While the sentence mentions that microprobes have been proposed as an alternative to rovers, it doesn’t
explain an advantage of microprobes. Choice D is incorrect. The sentence emphasizes a similarity between microprobes and rovers; it doesn’t
explain an advantage of microprobes.$qb$);
select seed_pool_question($qb$CB-dede8260$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? When medical students mention their patients on social media, they may violate patient confidentiality.
· Terry Kind led a study to determine how many medical schools have student policies that mention social media use.
? Kind and her team reviewed 132 medical school websites, examining publicly available student policies.
? Only thirteen medical schools had guidelines that explicitly mention social media, and only five defined what constitutes acceptable
social media use.
The student wants to emphasize the study’s methodology. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dede8260.png$qb$, $qb$[{"label": "A", "body": "The student policies of 132 medical schools can be found online, according to research by Terry Kind."}, {"label": "B", "body": "To find out how many medical schools have guidelines about student social media use, Terry Kind and her team examined the student policies of 132 medical schools."}, {"label": "C", "body": "Out of 132 medical schools, only thirteen had student policies that mentioned social media, and only five specified what use was acceptable."}, {"label": "D", "body": "Terry Kind and her team wanted to know how many medical schools have student social media policies in place about protecting patient confidentiality."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence effectively emphasizes Kind’s methodology: examining the student policies of 132 medical schools
for guidelines about student social media use.
Choice A is incorrect. The sentence specifies how many medical schools’ student policies are available online; it doesn’t emphasize the study’s
methodology. Choice C is incorrect. The sentence emphasizes the study’s results, not the study’s methodology. Choice D is incorrect. The
sentence emphasizes the aim of the study, not the study’s methodology.$qb$);
select seed_pool_question($qb$CB-ee51ad04$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The nautical mile (6,076 feet) is the measure of distance used in seafaring navigation.
? A nautical mile directly correlates to one minute (1/60th of a degree) of latitude.
· The curvature of Earth affects the accurate measurement of long distances when using flat maps.
? Measuring distances with latitude and longitude coordinates takes into account Earth’s curvature.
· Mariners use nautical charts marked with latitude and longitude to quickly calculate distances and positions.
The student wants to explain why nautical miles are used to measure distances in seafaring navigation. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ee51ad04.png$qb$, $qb$[{"label": "A", "body": "Nautical miles are a measure of distance equal to one minute of latitude, which is a feature nautical charts use to calculate distances and positions."}, {"label": "B", "body": "Since they directly correlate to the coordinates on nautical charts, which take into account Earth’s curvature, nautical miles are an efficient way to calculate distances at sea."}, {"label": "C", "body": "Using nautical miles for navigation at sea takes Earth’s curvature into account, whereas measuring distances with latitude and longitude coordinates does not."}, {"label": "D", "body": "Nautical charts use latitude and longitude to measure long distances; these charts are more accurate than flat maps for measuring distances in seafaring navigation because they account for Earth’s curvature."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence explains why nautical miles are used to measure distances in seafaring navigation, noting that they
directly correlate to the coordinates on nautical charts that take into account Earth’s curvature, making them an efficient way to calculate
distances at sea.
Choice A is incorrect. While the sentence describes what nautical miles are and their relationship to nautical charts, it doesn’t explain why
nautical miles are used to measure distances in seafaring navigation. Choice C is incorrect. While the sentence indicates a reason why nautical
miles are used, it misrepresents information from the notes: measuring distances with latitude and longitude does in fact account for Earth’s
curvature. Choice D is incorrect. The sentence explains why nautical charts are more accurate than flat maps; it doesn’t explain why nautical
miles specifically are used to measure distances in seafaring navigation.$qb$);
select seed_pool_question($qb$CB-81315093$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? A marathon is a long-distance running race that is 26.2 miles long.
· An ultramarathon is a long-distance running race of more than 26.2 miles.
? The Kepler Challenge is a one-day, 37.3-mile ultramarathon in New Zealand.
? The Spreelauf is a six-day, 261-mile ultramarathon in Germany.
The student wants to make a generalization about ultramarathons. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-81315093.png$qb$, $qb$[{"label": "A", "body": "Examples of ultramarathons include the 37.3-mile Kepler Challenge in New Zealand and the 261-mile Spreelauf in Germany."}, {"label": "B", "body": "A marathon is 26.2 miles long, but the Spreelauf ultramarathon, at 261 miles, is far longer."}, {"label": "C", "body": "Ultramarathons range widely in length, from a few dozen miles to a few hundred."}, {"label": "D", "body": "While the Kepler Challenge is a one-day ultramarathon, the Spreelauf is a six-day ultramarathon."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. This is the only choice that makes a generalization about ultramarathons.
Choice A is incorrect. This choice gives specific examples of ultramarathons but doesn’t say anything about them as a category. Choice B is
incorrect. This choice compares marathons in general to one specific ultramarathon but doesn’t say anything about ultramarathons as a
category. Choice D is incorrect. This choice contrasts two specific ultramarathons but doesn’t say anything about them as a category.$qb$);
select seed_pool_question($qb$CB-1773fa73$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? A commodity chain is the series of links connecting the production and purchase of a commodity on the world market.
· Chinese American anthropologist Anna Tsing studies the contemporary commodity chain of matsutake mushrooms.
? At one end of the matsutake chain are mushroom pickers in Oregon.
? At the other end are wealthy consumers who buy the costly matsutake in Japan.
? According to Tsing, “Japanese traders began importing matsutake in the 1980s, when the scarcity of matsutake in Japan first became
clear.”
The student wants to provide an overview of the matsutake commodity chain. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1773fa73.png$qb$, $qb$[{"label": "A", "body": "The contemporary matsutake commodity chain has its origins in the 1980s when, according to Tsing, “the scarcity of matsutake in Japan first became clear.”"}, {"label": "B", "body": "Commodity chains include the linked production and purchase of commodities, such as the matsutake mushroom, on the world market."}, {"label": "C", "body": "Decades after the Japanese import of matsutake began, a commodity chain now links matsutake pickers in Oregon with wealthy consumers of the costly mushrooms in Japan."}, {"label": "D", "body": "Wealthy consumers who buy the costly mushrooms in Japan are at one end of the matsutake commodity chain."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence provides an overview of the matsutake commodity chain, connecting the Oregon mushroom pickers
at one end to the Japanese consumers at the other.
Choice A is incorrect. While the sentence mentions the matsutake commodity chain, it focuses only on its origins; it does not provide an
overview. Choice B is incorrect. The sentence provides a general definition of commodity chains, not an overview of the matsutake chain. Choice
D is incorrect. While the sentence mentions the matsutake commodity chain, it focuses only on one end of the chain (the consumers); it does not
provide an overview.$qb$);
select seed_pool_question($qb$CB-6b5bc97d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Sasanian Empire lasted about 400 years (AD 224 to AD 651).
· The Sasanians controlled an area spanning 1.4 million square miles.
? This area included present-day Iran and Iraq.
? The empire’s capital was the ancient city of Ctesiphon.
? Ctesiphon was located near present-day Baghdad, Iraq.
The student wants to specify the location of Ctesiphon. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6b5bc97d.png$qb$, $qb$[{"label": "A", "body": "The Sasanian Empire began in AD 224 and ended in AD 651."}, {"label": "B", "body": "The capital of the Sasanian Empire, which spanned 1.4 million square miles, was Ctesiphon."}, {"label": "C", "body": "The Sasanians controlled an area of 1.4 million square miles, including present-day Iran and Iraq."}, {"label": "D", "body": "Ctesiphon, the capital of the Sasanian Empire, was located near present-day Baghdad, Iraq."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence specifies the location of Ctesiphon, noting that it was located near present-day Baghdad, Iraq.
Choice A is incorrect because the sentence explains when the Sasanian Empire began and ended; it doesn’t specify the location of Ctesiphon.
Choice B is incorrect because the sentence emphasizes that Ctesiphon was the capital of the Sasanian Empire; it doesn’t specify Ctesiphon’s
location. Choice C is incorrect because it emphasizes the size of the Sasanian Empire; it doesn’t specify the location of Ctesiphon.$qb$);
select seed_pool_question($qb$CB-5b8b69a2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Archaeologist Jon Erlandson and colleagues argue that humans first arrived in the Americas by sea.
· They propose that humans traveled between Pacific Ocean islands and coastlines from northeast Asia to the Americas.
? Many of these islands and coastal zones were later submerged as glaciers melted and sea levels rose.
? The researchers think that “a coastal route, including kelp forests and estuaries, would have provided a rich mix of marine, estuarine,
riverine, and terrestrial resources” such as seaweeds, fish, and birds.
? This proposed scenario is known as the kelp highway hypothesis.
The student wants to summarize the kelp highway hypothesis. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5b8b69a2.png$qb$, $qb$[{"label": "A", "body": "Pacific Ocean islands and coastlines likely contained “a rich mix of marine, estuarine, riverine, and terrestrial resources” such as seaweeds, fish, and birds, according to researchers."}, {"label": "B", "body": "One argument about how humans first arrived in the Americas is the kelp highway hypothesis proposed by Jon Erlandson and colleagues."}, {"label": "C", "body": "Humans may have first arrived in the Americas by sea, traveling between Pacific Ocean islands and coastlines and subsisting on a variety of resources."}, {"label": "D", "body": "As glaciers melted and sea levels rose, many Pacific Ocean islands and coastal zones were submerged."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. This choice summarizes the main idea of the kelp highway hypothesis, providing a high-level overview of how the
hypothesis explains human migration to the Americas.
Choice A is incorrect. This choice describes one aspect of the proposed scenario but doesn’t discuss human migration, which is the main focus
of the kelp highway hypothesis. Choice B is incorrect. This choice introduces the kelp highway hypothesis but doesn’t explain what it entails.
Choice D is incorrect. This choice describes one element of the proposed scenario but doesn’t discuss human migration, which is the main focus
of the kelp highway hypothesis.$qb$);
select seed_pool_question($qb$CB-37ec26e7$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In order to create the Global Positioning System (GPS), scientists had to develop an accurate mathematical model of Earth’s shape that
accounted for various forces, such as tides. ______ it was mathematician Gladys West who wrote the computer program that could perform
these necessary calculations.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Ultimately,"}, {"label": "B", "body": "In other words,"}, {"label": "C", "body": "Secondly,"}, {"label": "D", "body": "In addition,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "Ultimately" logically signals that West’s completion of the computer program was the conclusion of the process
described in the previous sentence, in which scientists working on GPS sought to develop a mathematical model of Earth.
Choice B is incorrect because "in other words" illogically signals that the information about West’s program is a restatement of the information
about the scientists’ efforts to develop a mathematical model of Earth. Instead, West’s program was the conclusion of those efforts. Choice C is
incorrect because "secondly" illogically signals that West’s completion of the computer program was merely the next step in the scientists’
efforts to develop a mathematical model of Earth. Instead, West’s program was the conclusion of those efforts. Choice D is incorrect because "in
addition" illogically signals that West’s completion of the computer program was merely additional information related to the scientists’ work on
GPS. Instead, West’s program was the conclusion of the scientists’ efforts to develop a mathematical model of Earth.$qb$);
select seed_pool_question($qb$CB-49fe306b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? From Earth, all the meteors in a meteor shower appear to originate from a single spot in the sky.
· This spot is called the meteor shower’s radiant.
? The Perseid meteor shower is visible in the northern hemisphere in July and August.
? Like many meteor showers, it is named for the location of its radiant.
? Its radiant is located within the constellation Perseus.
The student wants to explain the origin of the Perseid meteor shower’s name. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-49fe306b.png$qb$, $qb$[{"label": "A", "body": "The Perseid meteor shower is named for the constellation Perseus, the location of the meteor shower’s radiant."}, {"label": "B", "body": "A meteor shower’s name may be linked to a single spot in the sky."}, {"label": "C", "body": "The Perseid meteor shower, which has a radiant, is visible in the northern hemisphere in July and August."}, {"label": "D", "body": "From Earth, all the meteors in a meteor shower appear to originate from a radiant, such as the one within Perseus."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence explains the origin of the Perseid meteor shower’s name: the constellation Perseus, where the meteor
shower’s radiant is located.
Choice B is incorrect. The sentence makes a claim about meteor shower names in general; it doesn’t explain the origin of the Perseid meteor
shower’s name specifically. Choice C is incorrect. The sentence indicates when and where the Perseid meteor shower is visible; it doesn’t explain
the origin of the meteor shower’s name. Choice D is incorrect. The sentence discusses meteor showers in general; it doesn’t explain the origin of
the Perseid meteor shower’s name.$qb$);
select seed_pool_question($qb$CB-b5cd28a7$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Samuel Delany is a US writer known for his science fiction.
· Delany’s science fiction novel Babel-17 was published in 1966.
? The novel won a Nebula Award in 1967.
? The Nebula Awards are given each year to the best works of science fiction published in the US.
The student wants to indicate the title of a novel that won a Nebula Award. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b5cd28a7.png$qb$, $qb$[{"label": "A", "body": "Babel-17, by Samuel Delany, won a Nebula Award in 1967."}, {"label": "B", "body": "Samuel Delany published a science fiction novel in 1966."}, {"label": "C", "body": "Samuel Delany is an award-winning US writer known for his science fiction."}, {"label": "D", "body": "One of Samuel Delany’s novels was among the best works of science fiction published in the US."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence indicates the title of a novel that won a Nebula Award, noting that Babel-17 by Samuel Delany won the
award in 1967.
Choice B is incorrect because the sentence identifies the year that Samuel Delany published a science fiction novel; it doesn’t indicate the novel’s
title or that it won a Nebula Award. Choice C is incorrect because the sentence provides an introduction of Samuel Delany; it doesn’t indicate the
title of a novel that has won a Nebula Award. Choice D is incorrect because the sentence indicates that one of Samuel Delany’s novels met the
qualification for a Nebula Award; it doesn’t indicate the novel’s title or that it won an award.$qb$);
select seed_pool_question($qb$CB-290a5d77$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Guard cells are specialized cells that are part of a plant’s pores. These cells help regulate the amount of carbon dioxide a plant takes in. ______
they help regulate a plant’s water loss.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Additionally,"}, {"label": "B", "body": "Previously,"}, {"label": "C", "body": "In conclusion,"}, {"label": "D", "body": "Instead,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "Additionally" logically signals that guard cells’ role in regulating water loss is an additional function of these
specialized plant cells that is separate from the function of regulating carbon dioxide intake.
Choice B is incorrect because "previously" illogically signals that the activity described in this sentence occurs earlier in a chronological
sequence of events than the regulation of carbon dioxide intake described in the previous sentence. Instead, regulating water loss is an
additional function of guard cells that is separate from the function of regulating carbon dioxide intake. Choice C is incorrect because "in
conclusion" illogically signals that the description of guard cells’ role in regulating water loss concludes or summarizes the information about
guard cells provided in the previous sentences. Instead, regulating water loss is one of the two distinct functions of guard cells described in the
text. Choice D is incorrect because "instead" illogically signals that the activity described in this sentence happens in place of the activity of
regulating carbon dioxide intake described in the previous sentence. Rather, regulating water loss is an additional function of guard cells.$qb$);
select seed_pool_question($qb$CB-5888712f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Physicist Muluneh Abebe was working on a garment suited for both warm and cold conditions.
· He analyzed the emissivity, or ability to emit heat, of the materials he planned to use.
? Abebe found that reflective metal fibers emitted almost no heat and had an emissivity of 0.02.
? He found that silicon carbide fibers absorbed large amounts of heat and had an emissivity of 0.74.
? The amount of heat a material absorbs is equal to the amount of heat it emits.
The student wants to contrast the emissivity of reflective metal fibers with that of silicon carbide fibers. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5888712f.png$qb$, $qb$[{"label": "A", "body": "The ability of reflective metal fibers and silicon carbide fibers to emit heat was determined by an analysis of each material’s emissivity."}, {"label": "B", "body": "The amount of heat a material absorbs is equal to the amount it emits, as evidenced in Abebe’s analyses."}, {"label": "C", "body": "Though the reflective metal fibers and silicon carbide fibers had different rates of emissivity, Abebe planned to use both in a garment."}, {"label": "D", "body": "Whereas the reflective metal fibers had an emissivity of just 0.02, the silicon carbide fibers absorbed large amounts of heat, resulting in an emissivity of 0.74."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence uses “whereas” to contrast the emissivities of the two fibers, noting that the emissivity of the
reflective metal fibers was just 0.02, far lower than that of the silicon carbide fibers (0.74).
Choice A is incorrect. The sentence emphasizes the ability of reflective metal fibers and silicon carbide fibers to emit heat; it doesn’t contrast the
emissivities of the two fibers. Choice B is incorrect. The sentence states a law of thermodynamics: the amount of heat a material absorbs is
equal to the amount it emits. The sentence doesn’t contrast the emissivity of reflective metal fibers with that of silicon carbide fibers. Choice C is
incorrect. While the sentence includes a generalization about the emissivities of reflective metal fibers and silicon carbide fibers, it emphasizes
Abebe’s plans for their use in a garment; it doesn’t contrast the emissivities of the two fibers.$qb$);
select seed_pool_question($qb$CB-0acc26b2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Astronomers estimate that the number of comets orbiting the Sun is in the billions.
· 81P/Wild is one of many comets whose orbit has changed over time.
? 81P/Wild’s orbit once lay between the orbits of Uranus and Jupiter.
? The comet’s orbit is now positioned between the orbits of Jupiter and Mars.
The student wants to make and support a generalization about the orbits of comets. Which choice most effectively uses relevant information
from the notes to accomplish these goals?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0acc26b2.png$qb$, $qb$[{"label": "A", "body": "Astronomers estimate that the number of comets orbiting the Sun is in the billions; the comets’ orbits may change over time."}, {"label": "B", "body": "Like Uranus, Jupiter, and Mars, billions of comets orbit the Sun."}, {"label": "C", "body": "One example of a comet is 81P/Wild, whose orbit around the Sun once lay between Uranus’s and Jupiter’s orbits but is now positioned between those of Jupiter and Mars."}, {"label": "D", "body": "A comet’s orbit around the Sun may change over time: the orbit of comet 81P/Wild once lay between the orbits of Uranus and Jupiter but is now positioned between those of Jupiter and Mars."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence makes a generalization—that a comet’s orbit around the Sun may change over time—and supports the
generalization with the example of the orbit of comet 81P/Wild, which once lay between the orbits of Uranus and Jupiter but is now positioned
between the orbits of Jupiter and Mars.
Choice A is incorrect. The sentence emphasizes the number of comets orbiting the Sun and makes a generalization about their orbits, but it
doesn’t support the generalization with an example. Choice B is incorrect. The sentence makes a generalization about comets and compares
them to the planets Uranus, Jupiter, and Mars; it doesn’t make and support a generalization about comets’ orbits. Choice C is incorrect. While the
sentence provides an example of a comet whose orbit has changed, it doesn’t make a generalization about the orbits of comets.$qb$);
select seed_pool_question($qb$CB-1c6e1d55$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Historically, most conductors of major orchestras and opera companies have been European men, but a new, more diverse generation of artists
is stepping up to the podium. Mexico’s Alondra de la Parra took over as conductor for the Queensland Symphony Orchestra in 2017, ______ and
Colombia’s Lina Gonzalez-Granados did the same for the Los Angeles Opera in 2022.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in addition,"}, {"label": "B", "body": "lastly,"}, {"label": "C", "body": "granted,"}, {"label": "D", "body": "for instance,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “For instance” logically signals that the details in this sentence—that Mexican conductor Alondra de la Parra and
Colombian conductor Lina Gonzalez-Granados took new conducting positions—are examples supporting the previous claim about the new
generation of artists.
Choice A is incorrect because “in addition” illogically signals that the details in this sentence about de la Parra and Gonzalez-Granados are
merely additional facts related to the previous claim about the new generation of artists. Instead, they are examples supporting that claim.
Choice B is incorrect because “lastly” illogically signals that the details in this sentence about de la Parra and Gonzalez-Granados are the last
step or a concluding summary of the previous claim about the new generation of artists. Instead, they are examples supporting that claim.
Choice C is incorrect because “granted” illogically signals that the details in this sentence about de la Parra and Gonzalez-Granados are
exceptions to the previous claim about the new generation of artists. Instead, they are examples supporting that claim.$qb$);
select seed_pool_question($qb$CB-991e849a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Mary Anning (1799–1847), one of the world’s first paleontologists, lived in Lyme Regis along the Jurassic Coast of southern England. ______ she
made several important discoveries, including some of the first documented ichthyosaur and plesiosaur skeletons. Indeed, Anning’s
groundbreaking work secured the Jurassic Coast a place in the annals of paleontology.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "Likewise,"}, {"label": "C", "body": "There,"}, {"label": "D", "body": "Later,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “There” logically signals where the events described in this sentence (Anning making several important discoveries)
occurred: in Lyme Regis along the Jurassic Coast of southern England, which the previous sentence indicates is where she lived.
Choice A is incorrect because “for example” illogically signals that the information in this sentence about Anning’s discoveries exemplifies the
previous information about her living in Lyme Regis. Instead, the sentence refers to the discoveries Anning made while living there—as the
information in the third sentence makes clear. Choice B is incorrect because “likewise” illogically signals that the information about Anning’s
discoveries is similar to the previous information about her living in Lyme Regis. Instead, the sentence refers to the discoveries Anning made
while living there—as the information in the third sentence makes clear. Choice D is incorrect because “later” illogically signals that the
information in this sentence about Anning’s discoveries occurred after she lived in Lyme Regis, as described in the previous sentence. Instead,
the sentence refers to the discoveries Anning made while living there—as the information in the third sentence makes clear.$qb$);
select seed_pool_question($qb$CB-8622320e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Earth’s auroras—colorful displays of light seen above the northern and southern poles—result, broadly speaking, from the Sun’s activity. ______ the
Sun releases charged particles that are captured by Earth’s magnetic field and channeled toward the poles. These particles then collide with
atoms in the atmosphere, causing the atoms to emit auroral light.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Specifically,"}, {"label": "B", "body": "Similarly,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Hence,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Specifically” logically signals that the information in this sentence—that the Sun releases charged particles that
later collide with atoms, resulting in auroral light—provides specific, precise details about how auroras result from the Sun’s activity.
Choice B is incorrect because “similarly” illogically signals that the information in this sentence is similar to the general information about
auroras in the previous sentence. Instead, this sentence provides specific, precise details about how auroras form. Choice C is incorrect because
“nevertheless” illogically signals that the information in this sentence is despite the general information about auroras in the previous sentence.
Instead, this sentence provides specific, precise details about how auroras form. Choice D is incorrect because “hence” illogically signals that the
information in this sentence is a result of the general information about auroras in the previous sentence. Instead, this sentence provides
specific, precise details about how auroras form.$qb$);
select seed_pool_question($qb$CB-9336f63b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? A small number of US Navy sailors of Filipino descent served during the US Civil War (1861–1865).
· Stephen Amos was born in the Philippines around 1830.
? He enlisted in the US Navy in November 1863.
? Raphael Ignases was born in the Philippines around 1834.
? He enlisted in the US Navy in July 1861.
The student wants to emphasize the historical significance of Stephen Amos’s enlistment date. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9336f63b.png$qb$, $qb$[{"label": "A", "body": "Both Stephen Amos and Raphael Ignases were US Navy sailors of Filipino descent, but Amos enlisted in the Navy in 1863, two years later than Ignases."}, {"label": "B", "body": "Stephen Amos was a US Navy sailor of Filipino descent, along with Raphael Ignases, who was born in the Philippines around 1834."}, {"label": "C", "body": "Stephen Amos enlisted in the US Navy in 1863, making him one of the few sailors of Filipino descent to serve in the US Civil War (1861–1865)."}, {"label": "D", "body": "When Stephen Amos enlisted in the US Navy in November 1863, he joined sailors such as Raphael Ignases, who had been born in the Philippines around 1834."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. Noting the time frame of the US Civil War and the fact that Amos enlisted during this time frame, the sentence
emphasizes that Amos’s enlistment date places him among the historically significant group of US Navy sailors of Filipino descent who served
during the Civil War.
Choice A is incorrect. The sentence identifies Amos and Ignases and notes that Amos’s enlistment date was later than Ignases’s; the sentence
doesn’t explain the historical significance of the date. Choice B is incorrect. The sentence identifies Amos and Ignases as US Navy sailors of
Filipino descent, noting Ignases’s birth year; the sentence doesn’t provide Amos’s enlistment date or its historical significance. Choice D is
incorrect. The sentence provides Amos’s enlistment date and mentions that he served alongside a sailor of Filipino descent; it doesn’t explain the
historical significance of the date.$qb$);
select seed_pool_question($qb$CB-9922b364$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Ibn Sina was a Persian philosopher and physician.
· His book The Canon of Medicine recorded the most advanced medical knowledge of his time.
? It was published in the year 1025 CE.
? It was used as a medical textbook in Middle Eastern and European universities for centuries.
The student wants to identify the year that The Canon of Medicine was published. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9922b364.png$qb$, $qb$[{"label": "A", "body": "Ibn Sina’s book The Canon of Medicine was published in the year 1025 CE."}, {"label": "B", "body": "A Persian philosopher and physician wrote a medical textbook called The Canon of Medicine."}, {"label": "C", "body": "The Canon of Medicine was a medical textbook used by Middle Eastern and European universities for centuries."}, {"label": "D", "body": "Ibn Sina recorded the most advanced medical knowledge of his time in his book The Canon of Medicine."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence identifies the year in which the book was published.
Choice B is incorrect. While the sentence provides information about the book’s author, it doesn’t identify the year in which the book was
published. Choice C is incorrect. While the sentence provides information about the book’s historical use, it doesn’t identify the year in which the
book was published. Choice D is incorrect. While the sentence provides information about the book’s contents, it doesn’t identify the year in
which the book was published.$qb$);
select seed_pool_question($qb$CB-04397a63$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Haudenosaunee Confederacy is a nearly 1,000-year-old alliance of six Native nations in the northeastern US.
· The members are bound by a centuries-old agreement known as the Great Law of Peace.
? Historian Bruce Johansen is one of several scholars who believe that the principles of the Great Law of Peace influenced the US
Constitution.
? This theory is called the influence theory.
? Johansen cites the fact that Benjamin Franklin and Thomas Jefferson both studied the Haudenosaunee Confederacy.
The student wants to present the influence theory to an audience unfamiliar with the Haudenosaunee Confederacy. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-04397a63.png$qb$, $qb$[{"label": "A", "body": "Historian Bruce Johansen believes that the Great Law of Peace was very influential."}, {"label": "B", "body": "The influence theory is supported by the fact that Benjamin Franklin and Thomas Jefferson both studied the Haudenosaunee Confederacy."}, {"label": "C", "body": "The influence theory holds that the principles of the Great Law of Peace, a centuries-old agreement binding six Native nations in the northeastern US, influenced the US Constitution."}, {"label": "D", "body": "Native people, including the members of the Haudenosaunee Confederacy, influenced the founding of the US in many different ways."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence effectively presents the influence theory to an audience unfamiliar with the Haudenosaunee
Confederacy, explaining the theory’s position that the Great Law of Peace influenced the US Constitution while avoiding mention of the
Haudenosaunee Confederacy itself.
Choice A is incorrect. The sentence broadly emphasizes Johansen’s ideas about the Great Law of Peace; it doesn’t identify the influence theory
or effectively present it. Choice B is incorrect. The sentence emphasizes one fact that supports the influence theory; it doesn’t effectively present
the theory to an audience unfamiliar with the Haudenosaunee Confederacy. Choice D is incorrect. The sentence makes a broad generalization
about Native people’s influence on the founding of the US; it doesn’t effectively present the influence theory.$qb$);
select seed_pool_question($qb$CB-de01ccef$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The background colors of US and UK road signs are used to denote each sign’s purpose.
· Directional signs are a type of sign containing information such as route names, distance to a destination, etc.
? Highways, major roadways, and minor roadways in the US generally use green for directional signs.
? Highways in the UK generally use blue for directional signs.
? Major roadways in the UK generally use green for directional signs.
The student wants to contrast how green backgrounds are used in US and UK road signs. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-de01ccef.png$qb$, $qb$[{"label": "A", "body": "Blue backgrounds are generally used on directional highway signs in the UK, in contrast to the green highway signs used in the US."}, {"label": "B", "body": "In the US, green signs indicate directional information on both highways and major roadways, but in the UK, directional signs of this color generally appear only on major roadways."}, {"label": "C", "body": "Green road signs are used in both the US and UK to denote directional information on major roadways, like distance to a destination or route names."}, {"label": "D", "body": "Both the UK and the US use directional signs, which include information on route names and distance to a destination."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence contrasts how green backgrounds are used in US and UK road signs, noting that the US uses them for
both highways and major roadways while the UK uses them only for major roadways.
Choice A is incorrect. While the sentence does contrast US and UK road signs, the contrast focuses on the use of blue versus green backgrounds
rather than on the use of green backgrounds specifically. Choice C is incorrect. The sentence indicates a similarity between the uses of green
road signs in the US and the UK rather than contrasting them. Choice D is incorrect. The sentence indicates a similarity between road signs in the
US and those in the UK; it doesn’t contrast how green backgrounds are used in each country’s signs.$qb$);
select seed_pool_question($qb$CB-164a32e7$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Claude McKay (1889–1948) was a Jamaican American writer.
· Songs of Jamaica (1912) and Constab Ballads (1912) are two acclaimed poetry collections that McKay published while living in Jamaica.
? McKay moved to Harlem in New York City in 1914.
? He is best known as a poet and novelist of the Harlem Renaissance, a literary and cultural movement of the 1920s and 1930s.
? His most famous works include the poetry collection Harlem Shadows (1922) and the novel Home to Harlem (1928).
The student wants to emphasize Claude McKay’s accomplishments before moving to Harlem. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-164a32e7.png$qb$, $qb$[{"label": "A", "body": "Jamaican American writer Claude McKay is the author of works such as Songs of Jamaica (1912), Constab Ballads (1912), Harlem Shadows (1922), and Home to Harlem (1928)."}, {"label": "B", "body": "Although he is best known as a Harlem Renaissance writer, Claude McKay had published two acclaimed poetry collections in 1912 while living in Jamaica: Songs of Jamaica and Constab Ballads."}, {"label": "C", "body": "In 1914, Claude McKay moved to Harlem, where he would become known as a poet and novelist of the Harlem Renaissance (a literary and cultural movement of the 1920s and 1930s)."}, {"label": "D", "body": "Before moving to Harlem, Claude McKay—author of the poetry collection Harlem Shadows (1922) and the novel Home to Harlem (1928)—lived in Jamaica."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. This choice contrasts McKay’s fame as a Harlem Renaissance writer with his earlier achievements as a Jamaican
poet, and it names the two collections he published before moving to Harlem.
Choice A is incorrect. This choice doesn’t emphasize McKay’s accomplishments before moving to Harlem. It lists some of his works but doesn’t
distinguish between those he wrote in Jamaica and those he wrote in Harlem. Choice C is incorrect. This choice doesn’t emphasize McKay’s
accomplishments before moving to Harlem. It only mentions the year he moved and what he would become known for afterwards. Choice D is
incorrect. This choice doesn’t emphasize McKay’s accomplishments before moving to Harlem. It mentions that he lived in Jamaica, but it doesn’t
name any of the works he published there.$qb$);
select seed_pool_question($qb$CB-0d088ae0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Observing that a fire in a closed container soon went out, leading eighteenth-century scientists did not conclude that fresh air (specifically,
oxygen) is necessary for combustion; instead, many theorized that the container’s air had become saturated with a substance called phlogiston.
______ when Joseph Priestley first isolated oxygen gas in 1774, he termed it “dephlogisticated air.”
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "For this reason,"}, {"label": "C", "body": "Alternatively,"}, {"label": "D", "body": "Nevertheless,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "For this reason" logically signals that the reason Joseph Priestley termed oxygen "dephlogisticated air" was that he
accepted the theory mentioned in the previous sentence—that the presence of phlogiston, rather than the absence of oxygen, causes fire in a
closed container to go out.
Choice A is incorrect because "in other words" illogically signals that the information about Priestley terming oxygen "dephlogisticated air" is a
restatement of the previous theory concerning phlogiston. Instead, Priestley chose the term as a result of this theory. Choice C is incorrect
because "alternatively" illogically signals that Priestley termed oxygen "dephlogisticated air" as an alternative to the previous theory concerning
phlogiston. Instead, Priestley chose the term as a result of this theory. Choice D is incorrect because "nevertheless" illogically signals that
Priestley termed oxygen "dephlogisticated air" despite the previous theory concerning phlogiston. Instead, Priestley chose the term as a result of
this theory.$qb$);
select seed_pool_question($qb$CB-fbffb352$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Archaeologist Dr. Sada Mire founded the Horn Heritage Foundation to preserve the cultural history of regions in the Horn of Africa.
· Horn Heritage has overseen a preservation project to create 3D digital scans of ancient rock art in Somaliland.
? Paintings found at the Laas Geel caves are included in the scans.
? The Laas Geel paintings feature human figures and animals.
? Paintings found at the Dhagah Nabi Galay caves are included in the scans.
? The Dhagah Nabi Galay caves feature what are thought to be the earliest examples of writing in East Africa.
The student wants to emphasize a similarity between the Laas Geel paintings and the Dhagah Nabi Galay paintings. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fbffb352.png$qb$, $qb$[{"label": "A", "body": "The earliest examples of writing in East Africa are thought to be featured in the paintings at the Dhagah Nabi Galay caves in Somaliland."}, {"label": "B", "body": "The paintings at the Dhagah Nabi Galay caves feature examples of writing, while those at the Laas Geel caves feature humans and animals."}, {"label": "C", "body": "In Somaliland, the paintings in the Laas Geel caves feature human figures and animals."}, {"label": "D", "body": "The Laas Geel paintings and the Dhagah Nabi Galay paintings are both examples of ancient rock art found in Somaliland."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This choice compares the Laas Geel paintings and the Dhagah Nabi Galay paintings to one another and emphasizes
what they have in common: they are both ancient rock art found in the same region.
Choice A is incorrect. This choice only mentions the Dhagah Nabi Galay paintings. It doesn’t compare them to the Laas Geel paintings. Choice B
is incorrect. This choice doesn’t emphasize a similarity between the two paintings. Instead, it emphasizes a difference: the type of content they
depict. Choice C is incorrect. This choice only mentions the Laas Geel paintings. It doesn’t compare them to the Dhagah Nabi Galay paintings.$qb$);
select seed_pool_question($qb$CB-249508d9$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$With his room-sized installation Unicorn/My Private Sky, Norwegian artist Børre Sæthre succeeds in creating a whimsical yet perplexing
experience. ______ when visitors set foot inside the fantastically blue room and encounter the life-sized stuffed unicorn preening at the far end of
it, they are both dazzled and confused—as if stepping into a strange and enchanting new world.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Second,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "Indeed,"}, {"label": "D", "body": "Nevertheless,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "Indeed" logically signals that the description of the art installation in this sentence—its blue room and preening
unicorn that leave visitors "dazzled and confused"—offers additional emphasis in support of the previous sentence’s claim about the installation’s
"whimsical yet perplexing experience."
Choice A is incorrect because "second" illogically signals that the description in this sentence is a second, separate claim from the previous
sentence’s claim about the installation’s "whimsical yet perplexing experience." Instead, the specific details describing the installation emphasize
and support the previous claim. Choice B is incorrect because "instead" illogically signals that the description in this sentence is an alternative to
the previous sentence’s claim about the installation’s "whimsical yet perplexing experience." Rather, the specific details describing the installation
emphasize and support that claim. Choice D is incorrect because "nevertheless" illogically signals that the description in this sentence is true
despite the previous sentence’s claim about the installation’s "whimsical yet perplexing experience." Instead, the specific details describing the
installation emphasize and support that claim.$qb$);
select seed_pool_question($qb$CB-cfade68d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Marcela Guerrero is a curator at the Whitney Museum of American Art in New York.
· She curated the Whitney’s 2018 exhibition Pacha, Llaqta, Wasichay: Indigenous Space, Modern Architecture, New Art.
? This exhibition featured works by seven emerging Latino artists.
? She curated the Whitney’s 2020 exhibition Vida Americana: Mexican Muralists Remake American Art, 1925–1945.
? This exhibition included nearly 200 works by twentieth-century Latino and Mexican artists.
The student wants to describe the exhibition that Guerrero curated in 2018. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cfade68d.png$qb$, $qb$[{"label": "A", "body": "Held at the Whitney Museum of American Art, the exhibition Vida Americana: Mexican Muralists Remake American Art, 1925–1945 included nearly 200 works by twentieth-century Mexican and Latino artists."}, {"label": "B", "body": "Pacha, Llaqta, Wasichay: Indigenous Space, Modern Architecture, New Art, an exhibition at the Whitney Museum of American Art, featured works by seven emerging Latino artists."}, {"label": "C", "body": "In both 2018 and 2020, Marcela Guerrero curated exhibitions at the Whitney Museum of American Art in New York."}, {"label": "D", "body": "While one exhibition that Marcela Guerrero curated featured works by emerging artists, another included works by twentieth-century artists."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence describes the 2018 exhibition Guerrero curated, noting that the exhibition, which was titled Pacha,
Llaqta, Wasichay: Indigenous Space, Modern Architecture, New Art, featured the works of seven emerging Latino artists.
Choice A is incorrect. The sentence describes the exhibition Guerrero curated in 2020; it doesn’t describe her 2018 exhibition. Choice C is
incorrect. The sentence emphasizes a similarity between the two exhibitions Guerrero curated; it doesn’t describe her 2018 exhibition. Choice D
is incorrect. The sentence emphasizes a difference between the two exhibitions Guerrero curated; it doesn’t describe her 2018 exhibition.$qb$);
select seed_pool_question($qb$CB-d3725911$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the search for extraterrestrial life, astrobiologists Stuart Bartlett and Michael L. Wong propose that scientists avoid using the term “life.” ______
researchers should use another word: “lyfe.” This new term, they argue, could be used to draw distinctions between the known characteristics of
life on Earth and the potentially differing characteristics of lyfe on other planets.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Previously,"}, {"label": "B", "body": "Regardless,"}, {"label": "C", "body": "There,"}, {"label": "D", "body": "Instead,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Instead" logically signals that the idea in this sentence—that researchers should use the word "lyfe"—is an
alternative to the idea mentioned in the previous sentence (scientists’ use of the word "life").
Choice A is incorrect because "previously" illogically signals that the idea in this sentence occurs before the action in the first sentence. Instead,
the use of "lyfe" is an alternative to the previously mentioned use of "life." Choice B is incorrect because "regardless" illogically signals that the
idea in this sentence is true despite the information in the first sentence. Instead, the use of "lyfe" is an alternative to the previously mentioned
use of "life." Choice C is incorrect because "there" illogically signals that the idea in this sentence occurs in a place mentioned in the previous
sentence. Instead, the use of "lyfe" is an alternative to the previously mentioned use of "life."$qb$);
select seed_pool_question($qb$CB-9f1a0d91$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$“Tulip mania”—the rapid rise and sudden fall of the price of tulip bulbs in seventeenth-century Amsterdam—is often cited as an example of the
perils of rampant market speculation. However, recent research has demonstrated that the episode was neither as frenzied nor as disastrous as
has been thought. The popular myth surrounding it, ______ should be regarded with some skepticism.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "for example,"}, {"label": "B", "body": "by contrast,"}, {"label": "C", "body": "nevertheless,"}, {"label": "D", "body": "therefore,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This sentence is arguing that new evidence contradicting popular beliefs about “tulip mania” should cast doubt on
those beliefs. “Therefore” is a cause-and-effect transition, which fits perfectly in this context.
Choice A is incorrect. This choice uses an exemplification transition, which doesn’t make sense here. Skepticism about the popular beliefs is not
an example of recent evidence contradicting those beliefs—rather, skepticism is an effect of that recent evidence. Choice B is incorrect. This
choice uses a disagreement transition. But this sentence doesn’t disagree with the previous sentence. Instead, it connects a cause from the
previous sentence (new evidence that tulip mania was not as disastrous as thought) to an effect (that we should look with skepticism upon the
myth about its disastrousness). Choice C is incorrect. This choice uses a disagreement transition. But this sentence doesn’t disagree with the
previous sentence. Instead, it connects a cause from the previous sentence (new evidence that tulip mania was not as disastrous as thought) to
an effect (that we should look with skepticism upon the myth about its disastrousness).$qb$);
select seed_pool_question($qb$CB-e225cf02$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A team of ornithologists documented patterns of conspecific brood parasitism among wood ducks (Aix sponsa) in California. The researchers
observed several female wood ducks visiting dozens of nesting sites and laying eggs to be incubated by other nesting A. sponsa. Subject 7F64B,
______ visited a select few nesting sites before laying and incubating her eggs herself.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in particular,"}, {"label": "B", "body": "alternatively,"}, {"label": "C", "body": "for example,"}, {"label": "D", "body": "similarly,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Alternatively” logically signals that the information in this sentence—that Subject 7F64B incubated her own eggs—
describes a contrasting alternative to the brood parasitism behavior described in the previous sentence, in which female wood ducks laid eggs to
be incubated by other nesting ducks.
Choice A is incorrect because “in particular” illogically signals that Subject 7F64B’s behavior provides a specific, focused detail about, or
example of, the brood parasitism behavior described in the previous sentence. Instead, Subject 7F64B’s behavior represents a contrasting
alternative to that brood parasitism. Choice C is incorrect because “for example” illogically signals that Subject 7F64B’s behavior provides a
specific example of the brood parasitism behavior described in the previous sentence. Instead, Subject 7F64B’s behavior represents a
contrasting alternative to that brood parasitism. Choice D is incorrect because “similarly” illogically signals that Subject 7F64B’s behavior is
similar to the brood parasitism behavior described in the previous sentence. Instead, Subject 7F64B’s behavior represents a contrasting
alternative to that brood parasitism.$qb$);
select seed_pool_question($qb$CB-a2bff07e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Economist Elinor Ostrom’s studies of communities around the world have empirically demonstrated that common pool resources, such as
grazing lands, can be sustainably managed by the people who use them (rather than through private entities or centralized governments). ______
Ostrom’s work is a repudiation of the “tragedy of the commons,” the view that individuals will inevitably overexploit a finite shared resource if
given unfettered access to it.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "By contrast,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "That said,"}, {"label": "D", "body": "As such,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "As such" correctly signals that the claim in this sentence—that Ostrom’s work is a repudiation of the "tragedy of the
commons" view—follows logically from the information about Ostrom’s studies in the previous sentence. According to that sentence, Ostrom’s
studies demonstrate that common pool resources can in fact be sustainably managed by the people who use them.
Choice A is incorrect because "by contrast" illogically signals that the information in this sentence contrasts with the information about Ostrom’s
studies in the previous sentence. Instead, the claim that Ostrom’s work repudiates the "tragedy of the commons" view follows logically from that
information. Choice B is incorrect because "for example" illogically signals that the claim in this sentence exemplifies the information about
Ostrom’s studies in the previous sentence. Instead, the claim that Ostrom’s work repudiates the "tragedy of the commons" view follows logically
from that information. Choice C is incorrect because "that said" illogically signals that the information in this sentence is an exception or caveat
to the information about Ostrom’s studies in the previous sentence. Instead, the claim that Ostrom’s work repudiates the "tragedy of the
commons" view follows logically from that information.$qb$);
select seed_pool_question($qb$CB-804928b6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Mary Kang is a Korean American portrait photographer.
· She is based in New York City and in Austin, Texas.
? One of Kang’s photographs features artist Dominique Fung.
? In the portrait, Fung is seated on the floor.
? Five of Fung’s paintings are resting against the wall behind her.
The student wants to describe where Fung is in the photograph to an audience already familiar with Kang and Fung. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-804928b6.png$qb$, $qb$[{"label": "A", "body": "Dominique Fung is in a photograph by Mary Kang, a portrait photographer based in New York City and Austin, Texas."}, {"label": "B", "body": "Mary Kang is a photographer based in both New York City and Austin, Texas."}, {"label": "C", "body": "Five paintings by artist Dominique Fung can be seen in the background of Mary Kang’s photograph."}, {"label": "D", "body": "In Kang’s portrait of her, Fung is seated on the floor, with five of her paintings resting against the wall behind her."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence describes Fung’s location in Kang’s photograph, noting that Fung is seated on the floor. Additionally,
because the sentence is intended for an audience already familiar with the artists, it omits the artists’ first names and other biographical
information about them.
Choice A is incorrect. The sentence indicates that Fung appears in Kang’s photograph; it doesn’t describe Fung’s location in Kang’s photograph.
Choice B is incorrect. The sentence identifies Kang and where she is based; it doesn’t describe Fung’s location in Kang’s photograph. Choice C is
incorrect. The sentence describes the background of Kang’s photograph; it doesn’t describe Fung’s location in Kang’s photograph.$qb$);
select seed_pool_question($qb$CB-3c925481$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Pineapple is a fruit that contains ascorbic acid, an essential nutrient for humans.
· Every 100 grams (g) of pineapple contains 48 milligrams (mg) of ascorbic acid.
? Many animals can make ascorbic acid in their bodies, but humans cannot.
? Humans must get ascorbic acid from foods, including fruits and vegetables.
? Ascorbic acid is also known as vitamin C.
The student wants to provide an example of a fruit that contains vitamin C. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3c925481.png$qb$, $qb$[{"label": "A", "body": "Humans cannot make ascorbic acid in their bodies, but they can get it from foods, such as fruits, for example."}, {"label": "B", "body": "Vitamin C, also known as ascorbic acid, can be found in pineapple as well as other fruits."}, {"label": "C", "body": "Since humans cannot make vitamin C in their bodies, they must get it from food."}, {"label": "D", "body": "Many animals can make ascorbic acid, which is also known as vitamin C, in their bodies, but humans cannot."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence provides an example of a fruit that contains vitamin C, noting that vitamin C (also known as ascorbic
acid) can be found in pineapple as well as other fruits.
Choice A is incorrect. While the sentence does explain that humans can get vitamin C from fruits, it doesn’t provide an example of a specific fruit
that contains vitamin C. Choice C is incorrect. The sentence explains why humans must get vitamin C from foods; it doesn’t provide an example
of a fruit that contains vitamin C. Choice D is incorrect. The sentence compares vitamin C production in animals with vitamin C production in
humans; it doesn’t provide an example of a fruit that contains vitamin C.$qb$);
select seed_pool_question($qb$CB-17e49403$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$When, in the 1800s, geologists first realized that much of Earth had once been covered by great sheets of ice, some theorized that the
phenomenon was cyclical, occurring at regular intervals. Each Ice Age is so destructive, though, that it largely erases the geological evidence of
its predecessor. ______ geologists were unable to confirm the theory of cyclical Ice Ages until the 1960s.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Hence,"}, {"label": "B", "body": "Moreover,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Next,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Hence” logically signals that the information in this sentence—that geologists couldn’t confirm the theory of
cyclical Ice Ages until the 1960s—is a consequence of the previous information about the destructiveness of each Ice Age and the erasure of
necessary geological evidence.
Choice B is incorrect because “moreover” illogically signals that the information in this sentence is merely additional to the previous information
about the destructiveness of each Ice Age. Instead, the sentence identifies a specific consequence of that information. Choice C is incorrect
because “nevertheless” illogically signals that the information in this sentence is true despite the previous information about the destructiveness
of each Ice Age. Instead, the sentence identifies a specific consequence of that information. Choice D is incorrect because “next” illogically
signals that the information in this sentence is the next step in a process. Instead, the sentence identifies a specific consequence of the previous
information.$qb$);
select seed_pool_question($qb$CB-25755def$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Generally, an object will heat up when twisted.
· The twisting of an object is known as torsion.
? A 2019 study led by Zunfeng Liu and Ray Baughman tested the torsional heating of various fibers.
? When a 3-millimeter-thick sample of thermoplastic polyurethane (TPU) fiber was twisted, its average surface temperature increased by
6°C.
? When a 4-millimeter-thick sample of styrene-ethylene-butylene-styrene (SEBS) rubber fiber was twisted, its average surface temperature
increased by 3.5°C.
The student wants to contrast the two samples. Which choice most effectively uses relevant information from the notes to accomplish this
goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-25755def.png$qb$, $qb$[{"label": "A", "body": "When the fibers were twisted as part of the 2019 study, the surface temperature of both samples increased."}, {"label": "B", "body": "In 2019, researchers studied the effect of torsional heating on various fibers, including samples of SEBS rubber and TPU."}, {"label": "C", "body": "Twisting an object will generally cause its temperature to increase, a process known as torsional heating."}, {"label": "D", "body": "The SEBS rubber sample used in the 2019 study was thicker than the TPU sample."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence contrasts the two samples, noting that the SEBS rubber sample, at 4 millimeters thick, was thicker
than the TPU sample, which was 3 millimeters thick.
Choice A is incorrect because the sentence mentions a similarity between the TPU fiber and the SEBS rubber; it doesn’t contrast the two
samples. Choice B is incorrect because the sentence indicates that both the SEBS rubber and TPU samples were part of the 2019 study; it
doesn’t contrast the two samples. Choice C is incorrect because the sentence describes the process of torsional heating; it doesn’t contrast the
two samples.$qb$);
select seed_pool_question($qb$CB-5222ffab$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Neuroscientists Krishnan Padmanabhan and Zhen Chen sought to better understand the workings of the brain’s olfactory system.
· They devised a study using mathematical models.
? They found that certain fibers allow the brain to toggle from one method of processing smells to another.
? In one method, cells in the piriform cortex (where the perception of odor forms) capture olfactory information at a given moment.
? In the other, the cells track changes in olfactory information over time.
The student wants to summarize the study’s findings. Which choice most effectively uses relevant information from the notes to accomplish this
goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5222ffab.png$qb$, $qb$[{"label": "A", "body": "To arrive at these findings, which describe dual methods of processing smells in the piriform cortex, Padmanabhan and Chen devised a study using mathematical models."}, {"label": "B", "body": "Padmanabhan and Chen showed that olfactory information is captured by cells in the piriform cortex, where the perception of odor forms."}, {"label": "C", "body": "Using mathematical models, Padmanabhan and Chen devised a study to better understand the workings of the brain’s olfactory system."}, {"label": "D", "body": "According to Padmanabhan and Chen, the brain can toggle between capturing olfactory information at a given moment and tracking changes in that information over time."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence effectively summarizes the study’s findings, explaining what Padmanabhan and Chen found: that the
brain can toggle between one method of processing smells (capturing information at a given moment) and another (tracking changes in
information over time).
Choice A is incorrect. While the sentence mentions findings, it mainly focuses on Padmanabhan and Chen’s methodology. It doesn’t effectively
summarize the study’s findings. Choice B is incorrect. The sentence notes a fact about the olfactory system—that the perception of odor forms
in the piriform cortex—but doesn’t summarize the findings of Padmanabhan and Chen’s study. Choice C is incorrect. The sentence presents the
goal of Padmanabhan and Chen’s study; it doesn’t summarize the study’s findings.$qb$);
select seed_pool_question($qb$CB-4223d4a6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 1965, Yale University historians claimed that a world map called the Vinland Map was drawn in the fifteenth century.
· Since that time, the map’s age has been the subject of debate.
? In 2021, researchers conducted a study to analyze the elemental composition of the map’s ink.
? Their analysis revealed that the ink contains a titanium compound not used in inks until the 1920s.
? The researchers concluded that the map was drawn in the twentieth century.
The student wants to present the study and its findings. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4223d4a6.png$qb$, $qb$[{"label": "A", "body": "Given the debate about the Vinland Map’s age, researchers in 2021 conducted a study to analyze the elemental composition of the map’s ink."}, {"label": "B", "body": "A 2021 study of the Vinland Map’s ink revealed that it contains a titanium compound not used in inks until the 1920s, indicating that the map was drawn in the twentieth century."}, {"label": "C", "body": "The Vinland Map, believed by some to have been drawn in the fifteenth century, was the focus of a 2021 study."}, {"label": "D", "body": "Aware that a certain titanium compound was not used in inks until the 1920s, researchers in 2021 studied the elemental composition of the Vinland Map’s ink."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence effectively presents the study and its findings, providing relevant information: a 2021 study of the
Vinland Map found that the map’s ink contains a compound not used in inks until the twentieth century.
Choice A is incorrect. While the sentence introduces the study, it does not present the study’s findings. Choice C is incorrect. While the sentence
mentions the study, it does not effectively present the study or its findings. Choice D is incorrect. While the sentence introduces the study, it does
not present the study’s findings.$qb$);
select seed_pool_question($qb$CB-7aac173e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Architect Julian Abele studied Gregorian and neo-Gothic architecture in Europe.
· Abele worked for an architecture firm that was hired in 1924 to design buildings for Duke University’s new campus.
? Most of the buildings on Duke’s campus were designed in the Gregorian or neo-Gothic architectural styles.
? At the time, Abele was not formally credited with designing the buildings.
? Based on the buildings’ architectural styles, historians believe Abele designed most of the campus buildings.
The student wants to specify why historians believe Abele designed most of Duke’s campus buildings. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7aac173e.png$qb$, $qb$[{"label": "A", "body": "Given that most of the buildings on Duke’s campus feature architectural styles that Abele had studied in Europe, historians believe Abele is the one who designed them."}, {"label": "B", "body": "Though Abele wasn’t formally credited at the time, historians believe he designed most of the buildings on Duke’s campus."}, {"label": "C", "body": "Most of Duke’s campus buildings, which were designed by a firm Abele worked for, were designed in the Gregorian and neo-Gothic architectural styles."}, {"label": "D", "body": "Abele, an architect who studied Gregorian and neo-Gothic architecture in Europe, is believed to have designed most of the buildings on Duke’s campus."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence specifies why historians believe Abele designed most of Duke’s campus buildings, noting that most of
the buildings feature architectural styles that Abele had studied.
Choice B is incorrect. While the sentence explains that historians believe Abele designed most of Duke’s campus buildings, it doesn’t specify why
historians hold that belief. Choice C is incorrect because the sentence emphasizes the architectural styles of Duke’s campus buildings; it doesn’t
specify why historians believe Abele designed the buildings. Choice D is incorrect. While the sentence explains that Abele is believed to have
designed most of the buildings on Duke’s campus, it doesn’t specify why historians believe that he designed the buildings.$qb$);
select seed_pool_question($qb$CB-72ae9bca$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In the early 1900s, suffragists organized marches for women’s voting rights.
· Suffragists in the United Kingdom marched from Edinburgh to London.
? This march began on October 12, 1912, and ended on November 16, 1912.
? Suffragists in the United States marched from New York City to Albany, New York.
? This march began on December 16, 1912, and ended on December 28, 1912.
The student wants to emphasize the order in which the two marches occurred. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-72ae9bca.png$qb$, $qb$[{"label": "A", "body": "After suffragists in the UK marched from Edinburgh to London, suffragists in the US marched from New York City to Albany, New York."}, {"label": "B", "body": "In the early 1900s, suffragists in the UK and the US marched for women’s voting rights."}, {"label": "C", "body": "A march from New York City to Albany, New York, was followed by one that began in Edinburgh and ended in London."}, {"label": "D", "body": "From October 12 to November 16, 1912, suffragists in the UK marched from Edinburgh to London."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the order in which the two marches occurred, correctly indicating that the US march
(December 16 to December 28, 1912) occurred after the march in the UK (October 12 to November 16, 1912).
Choice B is incorrect. While the sentence mentions that both marches took place in the early 1900s, it doesn’t emphasize the order in which the
two marches occurred. Choice C is incorrect. While the sentence does emphasize the order in which the two marches occurred, the order is
incorrect. The UK march took place from October 12 to November 16, 1912, which was before the US march (December 1912). Choice D is
incorrect. While the sentence specifies the dates of the UK march, it doesn’t mention the US march or emphasize the order in which the two
marches occurred.$qb$);
select seed_pool_question($qb$CB-edf30612$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the late twentieth century, scholars directed much discussion toward issues of spatiality. Adherents to quantitative analytical approaches
delineated space with the use of GIS spatial technologies; ______ cultural geographer Doreen Massey defined space as the product of “an ever-
shifting social geometry of power and signification,” focusing instead on socio-political forces.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "for example,"}, {"label": "B", "body": "by contrast,"}, {"label": "C", "body": "as such,"}, {"label": "D", "body": "likewise,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "By contrast" logically signals that the information about how Massey defined space—by focusing on socio-political
forces—contrasts with the information in the previous clause, which discusses quantitative analytical approaches and spatial technologies.
Choice A is incorrect because "for example" illogically signals that the information that follows in the sentence exemplifies the quantitative
analytical approaches to defining space described previously. Instead, the information about Massey’s socio-political focus presents a
contrasting approach. Choice C is incorrect because "as such" illogically signals that the information that follows in the sentence is a direct result
or logical consequence of the quantitative analytical approaches to defining space described previously. Instead, the information about Massey’s
socio-political focus presents a contrasting approach. Choice D is incorrect because "likewise" illogically signals that the information that follows
in the sentence is similar to the quantitative analytical approaches to defining space described previously. Instead, the information about
Massey’s socio-political focus presents a contrasting approach.$qb$);
select seed_pool_question($qb$CB-742695d7$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Spiders are classified as arachnids.
? There are other types of arachnids besides spiders.
· Harvestmen are a type of arachnid.
? Harvestmen are also known as daddy longlegs.
· Harvestmen are not spiders.
The student wants to explain what harvestmen are. Which choice most effectively uses relevant information from the notes to accomplish this
goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-742695d7.png$qb$, $qb$[{"label": "A", "body": "Spiders, also known as harvestmen, are classified as arachnids."}, {"label": "B", "body": "There are other types of arachnids besides spiders, such as daddy longlegs."}, {"label": "C", "body": "The spiders known as daddy longlegs are classified as harvestmen."}, {"label": "D", "body": "Harvestmen, also known as daddy longlegs, are arachnids but not spiders."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence explains what harvestmen are, noting that they are also known as daddy longlegs and that they are
arachnids but not spiders.
Choice A is incorrect. While the sentence does mention harvestmen, its main focus is on spiders. Moreover, it misrepresents information from
the notes: harvestmen are not spiders. Choice B is incorrect. The sentence focuses on the broader point that arachnids include more than just
spiders; it doesn’t mention harvestmen directly or explain what they are. Choice C is incorrect. The sentence focuses on how daddy longlegs are
classified; it doesn’t explain what harvestmen are. Moreover, it misrepresents information from the notes. The notes indicate that harvestmen are
not spiders, and “harvestmen” is presented in the notes as an alternate name for “daddy longlegs,” not a category in which daddy longlegs
belong.$qb$);
select seed_pool_question($qb$CB-0a9b36f9$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Introduced in 2001, Luis von Ahn’s reCAPTCHA security software distinguished human users from autonomous spamming programs, or bots, by
prompting a website’s visitors to read distorted text and type it in a box. Over time, though, bots became capable of deciphering distorted text.
______ a version of reCAPTCHA that could detect humans by analyzing cursor movements was released in 2014.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "In other words,"}, {"label": "C", "body": "In response,"}, {"label": "D", "body": "Indeed,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “In response” logically signals that the information in this sentence—that a new version of reCAPTCHA capable of
analyzing cursor movements was released in 2014—was a direct response to the previously described issue of bots becoming capable of
deciphering distorted text.
Choice A is incorrect because “for example” illogically signals that the information in this sentence exemplifies the previously described issue of
bots deciphering distorted text. Instead, the release of the new version of reCAPTCHA was a direct response to that issue. Choice B is incorrect
because “in other words” illogically signals that the information in this sentence is a paraphrase or restatement of the previously described issue
of bots deciphering distorted text. Instead, the release of the new version of reCAPTCHA was a direct response to that issue. Choice D is
incorrect because “indeed” illogically signals that the information in this sentence offers additional emphasis in support of the previously
described issue of bots deciphering distorted text. Instead, the release of the new version of reCAPTCHA was a direct response to that issue.$qb$);
select seed_pool_question($qb$CB-974b5a8c$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Madison is a type of line dance that involves neat rows of dancers performing a repeated sequence of steps in unison. ______ many other
dances are also defined by order, repetition, and synchronicity, but the Madison is distinguished by its extreme uniformity; when an auditorium
full of dancers performs the Madison, one almost gets the impression of a military march.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "Of course,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "Moreover,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Of course" logically signals that the information that follows—about many dances being "defined by order,
repetition, and synchronicity"—acknowledges an obvious similarity between these dances and the previous description of the Madison. The
sentence then goes on to emphasize a distinguishing feature of the Madison.
Choice A is incorrect because "however" illogically signals that the information that follows contrasts with the previous description of the
Madison. Instead, the information about many dances’ features acknowledges an obvious similarity between these dances and the Madison. The
sentence then goes on to emphasize a distinguishing feature of the Madison. Choice C is incorrect because "specifically" illogically signals that
the information that follows specifies or elaborates on the previous description of the Madison. Instead, the information about many dances’
features acknowledges an obvious similarity between these dances and the Madison. The sentence then goes on to emphasize a distinguishing
feature of the Madison. Choice D is incorrect because "moreover" illogically signals that the information that follows adds to or expands on the
previous description of the Madison. Instead, the information about many dances’ features acknowledges an obvious similarity between these
dances and the Madison. The sentence then goes on to emphasize a distinguishing feature of the Madison.$qb$);
select seed_pool_question($qb$CB-3dcc7140$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Nissologists are scientists who study islands.
· Some nissologists define an island as any piece of land surrounded by water.
? Using that definition, they determined that Sweden has 221,000 islands.
? Other nissologists define an island as being 1 kilometer square, a certain distance from the mainland, and having at least 50 permanent
residents.
? Using that definition, they determined that Sweden has 24 islands.
The student wants to make and support a generalization about nissologists’ definition of an island. Which choice most effectively uses relevant
information from the notes to accomplish these goals?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3dcc7140.png$qb$, $qb$[{"label": "A", "body": "The definition of an island as any piece of land surrounded by water is supported by some nissologists, scientists who study islands."}, {"label": "B", "body": "Multiple counts of Sweden’s islands have been based on different definitions of an island."}, {"label": "C", "body": "Based on a recent count, Sweden has a relatively small number of islands with at least 50 permanent residents."}, {"label": "D", "body": "Nissologists’ different definitions can result in huge disparities in counts of islands, as the example of Sweden shows."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence makes a generalization about nissologists’ definition of an island—specifically, that the use of one
definition rather than another can result in huge disparities in the number of islands counted—and supports that generalization by citing Sweden
as an example.
Choice A is incorrect. The sentence introduces one definition of an island to an audience unfamiliar with nissologists; it doesn’t make a
generalization about nissologists’ definition of an island. Choice B is incorrect. While the sentence synthesizes information from the notes about
counts of Sweden’s islands, it doesn’t make and support a generalization about nissologists’ definition of an island. Choice C is incorrect. The
sentence makes an inference about islands in Sweden; it doesn’t mention nissologists’ definition of an island or make a generalization about it.$qb$);
select seed_pool_question($qb$CB-b7571c0a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Practical movie effects, such as the use of actual locations in a film, provide a more realistic visual experience than computer-generated imagery
(CGI) does, but giving audiences the “real thing” can be prohibitively expensive. ______ many filmmakers use a blended approach, employing
practical effects whenever possible and CGI elements as necessary to control costs.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "For this reason,"}, {"label": "C", "body": "Furthermore,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The first sentence tells us that practical effects are more realistic but also more expensive than CGI. The second
sentence tells us that many filmmakers use both kinds of effects, balancing realism with cost. To connect these ideas, we need a cause-and-
effect transition, like “therefore.” “For this reason” has the same meaning as “therefore.” .
Choice A is incorrect. This isn’t a logical transition. The first sentence tells us that practical effects are more realistic but also more expensive
than CGI. The second sentence tells us that many filmmakers use both kinds of effects, balancing realism with cost. To connect these ideas, we
need a cause-and-effect transition, like “therefore.” “Similarly” doesn’t show cause and effect: it shows the addition of another agreeing
idea. Choice C is incorrect. This isn’t a logical transition. The first sentence tells us that practical effects are more realistic but also more
expensive than CGI. The second sentence tells us that many filmmakers use both kinds of effects, balancing realism with cost. To connect these
ideas, we need a cause-and-effect transition, like “therefore.” “Furthermore” doesn’t show cause and effect: it shows the addition of another
agreeing idea. Choice D is incorrect. This isn’t a logical transition. The first sentence tells us that practical effects are more realistic but also
more expensive than CGI. The second sentence tells us that many filmmakers use both kinds of effects, balancing realism with cost. To connect
these ideas, we need a cause-and-effect transition, like “therefore.” “In other words” doesn’t show cause and effect: it shows a restatement of the
same idea in different words.$qb$);
select seed_pool_question($qb$CB-1e31470f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To perform a quad axel, a figure skater must leap into the air and complete four and a half rotations before landing, an extreme feat. ______ in
2022, when 17-year-old Ilia Malinin landed the first quad axel—considered the most difficult quad jump—in a high-level competition, the audience
was left awestruck.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Moreover,"}, {"label": "B", "body": "Fittingly,"}, {"label": "C", "body": "Next,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Fittingly" logically signals that the information in this sentence—that the audience was amazed when Malinin
landed the first quad axel—describes a suitable or appropriate reaction to the completion of this extremely difficult jump.
Choice A is incorrect. "Moreover" illogically signals that the information in this sentence merely adds to the previous information about the
difficulty of completing a quad axel. Instead, the audience’s amazement is a suitable or appropriate reaction to this accomplishment. Choice C is
incorrect. "Next" illogically signals that the information in this sentence is simply the next step in a process. Instead, the audience’s amazement
is a suitable or appropriate reaction to the accomplishment. Choice D is incorrect. "However" illogically signals that the information in this
sentence is in contrast or an exception to the difficulty of completing a quad axel. Instead, the audience’s amazement is a suitable or appropriate
reaction to this accomplishment.$qb$);
select seed_pool_question($qb$CB-1ccfcea4$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The French directors Colas Koola and Vivien Mermet-Guyenet (known as Koola and Viv) founded the video game studio BlueTwelve. They also
love cats. ______ they created an award-winning cat video game, Stray (2021), that lets the player explore a dystopian city from the perspective of
a clever orange house cat.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Intermittently,"}, {"label": "B", "body": "On the other hand,"}, {"label": "C", "body": "In fact,"}, {"label": "D", "body": "Nevertheless,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "In fact" logically signals that the information in this sentence about the creation of the video game offers additional
emphasis in support of the previous claim that video game studio founders Koola and Viv love cats.
Choice A is incorrect because "intermittently" illogically signals that the information in this sentence occurs sporadically or in intervals. Instead,
the creation of the video game offers additional emphasis in support of the previous claim about Koola and Viv. Choice B is incorrect because
"on the other hand" illogically signals that the information in this sentence contrasts with the previous claim about Koola and Viv. Instead, the
creation of the video game offers additional emphasis in support of that claim. Choice D is incorrect because "nevertheless" illogically signals
that the information in this sentence is true despite the previous claim that Koola and Viv love cats. Instead, the creation of the video game offers
additional emphasis in support of that claim.$qb$);
select seed_pool_question($qb$CB-45eaf7fb$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Tecozautla is a municipality in the state of Hidalgo, Mexico.
· Municipalities are governmental regions responsible for providing many public services to their residents.
? One service they provide is street lighting.
? Tecozautla covers an area of roughly 535 km².
? Hidalgo is divided into 84 municipalities.
The student wants to emphasize the size of Tecozautla. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-45eaf7fb.png$qb$, $qb$[{"label": "A", "body": "The municipality of Tecozautla in Hidalgo, Mexico, covers an area of roughly 535 km²."}, {"label": "B", "body": "Providing street lighting is just one example of the public services that municipalities provide."}, {"label": "C", "body": "Tecozautla is one of 84 governmental regions, known as municipalities, across Hidalgo."}, {"label": "D", "body": "Tecozautla—a governmental region in the state of Hidalgo, Mexico—provides many public services to its residents."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the size of Tecozautla, noting that it covers an area of roughly 535 km².
Choice B is incorrect. The sentence gives an example of a public service that municipalities provide; it doesn’t emphasize the size of Tecozautla.
Choice C is incorrect. While the sentence provides information about Tecozautla, it doesn’t emphasize Tecozautla’s size. Choice D is incorrect.
While the sentence provides information about Tecozautla, it doesn’t emphasize Tecozautla’s size.$qb$);
select seed_pool_question($qb$CB-d54e16ee$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Originally coined by economist Joan Robinson to refer to markets with multiple sellers of a product but only one buyer, the term “monopsony”
can also refer to markets where demand for labor is limited. In a product monopsony, the single buyer can force sellers to lower their prices.
______ in a labor monopsony, employers can force workers to accept lower wages.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Earlier,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "Similarly,"}, {"label": "D", "body": "In particular,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Similarly” logically signals that the information in this sentence about a labor monopsony is similar to the
information in the previous sentence about a product monopsony. In both types of markets, one party (an employer or a buyer) has the power to
force another party (a worker or seller) to accept less money (for labor or products).
Choice A is incorrect because “earlier” illogically signals that the information in this sentence about a labor monopsony occurs earlier (in a
chronological sequence) than the information about a product monopsony. Instead, it is similar to the information about a product
monopsony. Choice B is incorrect because “instead” illogically signals that the information in this sentence about a labor monopsony is an
alternative to the previous information about a product monopsony. Instead, it is similar to the information about a product monopsony. Choice
D is incorrect because “in particular” illogically signals that the information in this sentence about a labor monopsony provides specific details
elaborating on the previous information about a product monopsony. Instead, it is similar to the information about a product monopsony.$qb$);
select seed_pool_question($qb$CB-a1ca7ec4$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Cecilia Vicuña is a multidisciplinary artist.
· In 1971, her first solo art exhibition, Pinturas, poemas y explicaciones, was shown at the Museo Nacional de Bellas Artes in Santiago,
Chile.
? Her poetry collection Precario/Precarious was published in 1983 by Tanam Press.
? Her poetry collection Instan was published in 2002 by Kelsey St. Press.
? She lives part time in Chile, where she was born, and part time in New York.
The student wants to introduce the artist’s 1983 poetry collection. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a1ca7ec4.png$qb$, $qb$[{"label": "A", "body": "Before she published the books Precario/Precarious (1983) and Instan (2002), Cecilia Vicuña exhibited visual art at the Museo Nacional de Bellas Artes in Santiago, Chile."}, {"label": "B", "body": "Cecilia Vicuña is a true multidisciplinary artist whose works include numerous poetry collections and visual art exhibitions."}, {"label": "C", "body": "Published in 1983 by Tanam Press, Precario/Precarious is a collection of poetry by the multidisciplinary artist Cecilia Vicuña."}, {"label": "D", "body": "In 1971, Cecilia Vicuña exhibited her first solo art exhibition, Pinturas, poemas y explicaciones, in Chile, her country of birth."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence effectively introduces the poetry collection Precario/Precarious, noting that it is a collection by Vicuña
that was published in 1983 by Tanam Press.
Choice A is incorrect. While the sentence mentions the 1983 poetry collection Precario/Precarious, it focuses mainly on Vicuña’s visual art.
Choice B is incorrect. The sentence doesn’t introduce the 1983 poetry collection Precario/Precarious; instead, it introduces Vicuña. Choice D is
incorrect. The sentence emphasizes the location of Vicuña’s 1971 exhibition Pinturas, poemas y explicaciones; it doesn’t introduce the 1983
poetry collection Precario/Precarious.$qb$);
select seed_pool_question($qb$CB-47e238be$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Seismologists Kaiqing Yuan and Barbara Romanowicz have proposed that the magma fueling Iceland’s more than 30 active volcano systems
emerges from deep within Earth. The great depths involved—nearly 3,000 km—mark Iceland’s volcanoes as extreme outliers; ______ many of
Earth’s volcanoes are fed by shallow pockets of magma found less than 15 km below the surface.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "indeed,"}, {"label": "B", "body": "nevertheless,"}, {"label": "C", "body": "in addition,"}, {"label": "D", "body": "consequently,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The second part of the sentence says that many volcanoes use shallow pockets of magma. This is an elaboration of
the same underlying idea from the first part of the sentence, which says that the super deep magma of Icelandic volcanoes’ makes them outliers.
“Indeed” is a transition used for elaborating on the same idea, so it fits the context perfectly.
Choice B is incorrect. This choice uses a disagreement transition. But these two parts of the sentence agree with each other, so “nevertheless”
doesn’t make sense. Choice C is incorrect. This choice uses a transition that indicates the addition of a new idea. But the second part of the
sentence isn’t adding a new idea: it’s elaborating on the same idea expressed in the first part of the sentence. Choice D is incorrect. This choice
uses a cause-and-effect transition, which doesn’t make sense here. The fact that Iceland’s deep-magma volcanoes are outliers doesn’t cause
many other volcanoes to get fed by shallow pockets of magma.$qb$);
select seed_pool_question($qb$CB-b98b8f64$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? 1926: The US Congress gave the US Commerce Department authority to regulate safety standards in the fledgling commercial airline
industry.
? 1938: Congress transferred this authority to a new independent government agency called the Civil Aeronautics Authority (CAA).
? 1958: Congress transferred authority from the CAA to the newly established Federal Aviation Administration (FAA).
? The FAA’s first administrator, Elwood R. Quesada, updated safety standards and technologies for the era of commercial jets.
? The FAA remains the regulatory authority for airline safety.
The student wants to specify the order in which different government entities were given the authority to regulate airline safety in the US. Which
choice most effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b98b8f64.png$qb$, $qb$[{"label": "A", "body": "The CAA had the authority to regulate safety for US airlines from 1938 until 1958, at which point authority was transferred to the US Commerce Department by Elwood R. Quesada."}, {"label": "B", "body": "The FAA, CAA, and the US Commerce Department all had the authority to regulate US airline safety, but they possessed this authority at different times."}, {"label": "C", "body": "The FAA has regulated airline safety since it was established by the US Congress in 1958."}, {"label": "D", "body": "The authority to regulate US airline safety transferred from the US Commerce Department to the CAA in 1938, then from the CAA to the FAA in 1958."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence specifies the order in which different government entities were given the authority to regulate US
airline safety, noting that this role shifted from the US Commerce Department to the CAA in 1938, then from the CAA to the FAA in 1958.
Choice A is incorrect because it misrepresents information from the notes. The authority to regulate airline safety was transferred to the FAA in
1958, not to the US Commerce Department. Moreover, the sentence misrepresents Quesada’s role as described in the notes. Choice B is
incorrect. While the sentence mentions that all three entities had the authority to regulate US airline safety at different times, it doesn’t specify
the chronological order in which they held that authority. Choice C is incorrect. The sentence only mentions when the FAA began regulating US
airline safety; it doesn’t specify the order in which different government entities held that authority.$qb$);
select seed_pool_question($qb$CB-072666a3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The tiny transistors that control the flow of electricity in modern devices may one day be made of wood. Researchers in Switzerland have found a
way to use heat and chemicals to widen the grooves in dry pieces of balsa wood. ______ these grooves become wide enough that electrical
conductors can be passed through them.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "Previously,"}, {"label": "C", "body": "In contrast,"}, {"label": "D", "body": "As a result,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “As a result” logically signals that the information in this sentence—that the widened grooves in balsa wood can
accommodate electrical conductors—is a direct consequence of the researchers’ method described in the previous sentence (using heat and
chemicals to widen the grooves).
Choice A is incorrect because “for example” illogically signals that this sentence provides an example of the researchers’ method described in
the previous sentence. Instead, the sentence indicates a consequence of that method. Choice B is incorrect because “previously” illogically
signals that this sentence describes an event that occurred before the researchers’ development of the method described in the previous
sentence. Instead, the sentence indicates a consequence of that method. Choice C is incorrect because “in contrast” illogically signals that the
information in this sentence contrasts with the previous sentence’s description of the researchers’ method. Instead, the sentence indicates a
consequence of that method.$qb$);
select seed_pool_question($qb$CB-4c26f18a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? By interlocking their bodies, ants can form bridges to help fellow ants cross gaps.
· In 2020, Yasemin Ozkan-Aydin was inspired by ant behavior to design collaborative quadruped robots.
? Over the course of a year, she designed, built, tested, and refined her robots.
? Each robot is programmed to send a signal to another robot upon encountering a gap in a path.
? The signaled robot connects to the back of the signaler robot via magnetic sensors and pushes it across the gap.
The student wants to begin a narrative about the creation of the robots. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4c26f18a.png$qb$, $qb$[{"label": "A", "body": "When one of Yasemin Ozkan-Aydin’s robots encounters a gap in its path, it sends a signal to another robot; the signaled robot connects to the back of the signaler and pushes it across the gap."}, {"label": "B", "body": "After a year, Yasemin Ozkan-Aydin had designed, built, tested, and refined her robots."}, {"label": "C", "body": "Inspired by ants, which form bridges with their interlocked bodies to help fellow ants cross gaps, Yasemin Ozkan-Aydin set out to design quadruped robots capable of similarly collaborative behavior."}, {"label": "D", "body": "Ants, which have inspired the design of robots, form bridges by interlocking their bodies."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence effectively begins a narrative about the creation of the robots, explaining that ants’ gap-crossing
technique inspired Yasemin Ozkan-Aydin to "set out to design" robots that could collaborate in a similar manner.
Choice A is incorrect. The sentence describes how the robots work together to cross gaps; it doesn’t effectively begin a narrative about the
creation of the robots. Choice B is incorrect. The sentence provides an overview of the steps Ozkan-Aydin took in creating the robots; it doesn’t
effectively begin a narrative about their creation. Choice D is incorrect. The sentence explains how ants form bridges; it doesn’t effectively begin
a narrative about the creation of the robots.$qb$);
select seed_pool_question($qb$CB-a064955f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In most deer species, males grow antlers, and females don’t. ______ reindeer are different. They are the only deer species in which the females
grow antlers, too.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "Next,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "Thus,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "However" logically signals that the claim about reindeer in this sentence contrasts with the information about most
deer species in the previous sentence.
Choice A is incorrect because "similarly" illogically signals that the claim in this sentence is similar to the previous information about most deer
species. Instead, it contrasts with that information. Choice B is incorrect because "next" illogically signals that the claim about reindeer in this
sentence is the next step in a process. Instead, it contrasts with the previous information about most deer species. Choice D is incorrect because
"thus" illogically signals that the claim in this sentence results from the previous information about most deer species. Instead, it contrasts with
that information.$qb$);
select seed_pool_question($qb$CB-d7c5388f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Planetary scientists classify asteroids based on their composition.
· C-type asteroids are composed primarily of carbon.
? They account for roughly 75 percent of known asteroids.
? S-type asteroids are primarily made up of silicate minerals.
? They account for roughly 17 percent of known asteroids.
The student wants to emphasize a difference between C-type and S-type asteroids. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d7c5388f.png$qb$, $qb$[{"label": "A", "body": "Planetary scientists classify asteroids into types, two of which are the C-type and the S-type."}, {"label": "B", "body": "Planetary scientists consider an asteroid’s composition (such as whether the asteroid is composed mainly of silicate minerals or carbon) when classifying it."}, {"label": "C", "body": "Roughly 17 percent of known asteroids are classified as S-type asteroids; another percentage is classified as C-type asteroids."}, {"label": "D", "body": "C-type asteroids are mainly composed of carbon, whereas S-type asteroids are primarily made up of silicate minerals."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence emphasizes a difference between C-type and S-type asteroids, noting that C-type asteroids are mainly
composed of carbon, while S-type asteroids are mainly composed of silicate minerals.
Choice A is incorrect. The sentence states that C-type and S-type are two types of asteroids, but it doesn’t emphasize a difference between them.
Choice B is incorrect because it doesn’t directly mention C-type or S-type asteroids. Choice C is incorrect. While the sentence mentions that 17
percent of known asteroids are S-type asteroids, it doesn’t identify the percentage of asteroids that are C-type. Therefore, the sentence doesn’t
emphasize a difference between the two types.$qb$);
select seed_pool_question($qb$CB-dd087f31$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Chimamanda Ngozi Adichie’s 2013 novel Americanah chronicles the divergent experiences of Ifemelu and Obinze, a young Nigerian couple, after
high school. Ifemelu moves to the United States to attend a prestigious university. ______ Obinze travels to London, hoping to start a career there.
However, frustrated with the lack of opportunities, he soon returns to Nigeria.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Meanwhile,"}, {"label": "B", "body": "Nevertheless,"}, {"label": "C", "body": "Secondly,"}, {"label": "D", "body": "In fact,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Meanwhile” logically signals that the action described in this sentence (Obinze’s move to London to pursue a
career) is simultaneous with the action described in the previous sentence (Ifemelu’s move to the United States). The first sentence establishes
that the actions take place around the same time, referring to the characters’ “divergent experiences” following high school.
Choice B is incorrect because “nevertheless” illogically signals that the information in this sentence about Obinze’s move to London is true
despite the previous information about Ifemelu’s move to the United States. Instead, as the first sentence establishes, Obinze’s move and
Ifemelu’s move are related, parallel experiences that occur around the same time. Choice C is incorrect because “secondly” illogically signals that
the information in this sentence is a second point or reason separate from the previous information about Ifemelu’s move to the United States.
Instead, as the first sentence establishes, Obinze’s move and Ifemelu’s move are related, parallel experiences that occur around the same
time. Choice D is incorrect because “in fact” illogically signals that the information in this sentence emphasizes, modifies, or contradicts the
previous information about Ifemelu’s move to the United States. Instead, as the first sentence establishes, Obinze’s move and Ifemelu’s move are
related, parallel experiences that occur around the same time.$qb$);
select seed_pool_question($qb$CB-6d883838$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$According to Duverger’s law, countries with single-ballot majoritarian elections for single-member districts tend to polarize into two-party
systems, wherein dueling political parties consistently dominate the political system. ______ countries with proportional-representation electoral
systems tend to support multi-partyism, under which power gets distributed among many political parties.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Subsequently,"}, {"label": "B", "body": "Conversely,"}, {"label": "C", "body": "For instance,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Conversely" logically signals that the information in this sentence—that countries with proportional-representation
electoral systems tend toward multi-partyism—contrasts with the previous information about countries with single-ballot majoritarian elections,
which tend to have two-party systems.
Choice A is incorrect because "subsequently" illogically signals that the information in this sentence about countries with proportional-
representation electoral systems occurs later in a chronological sequence of events than the information in the previous sentence. Instead, it
contrasts with the previous information. Choice C is incorrect because "for instance" illogically signals that the information in this sentence
about countries with proportional-representation electoral systems is an example supporting the previous statement about countries with single-
ballot majoritarian elections. Instead, it contrasts with the previous statement. Choice D is incorrect because "in other words" illogically signals
that the information in this sentence about countries with proportional-representation electoral systems is a paraphrase or restatement of the
previous information about countries with single-ballot majoritarian elections. Instead, it contrasts with the previous information.$qb$);
select seed_pool_question($qb$CB-e965fd73$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Preston Singletary is a Tlingit glass artist who often collaborates with other artists. ______ he has worked with Tewa pottery artist Jody Naranjo
several times. Together, Singletary and Naranjo have created pottery-inspired glass pieces such as Sunset Stampede and Kiva Steps.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In conclusion,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "In comparison,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "For example" logically signals that this sentence—noting Singletary’s work with Jody Naranjo—provides an example
supporting the previous point about Singletary’s collaborations with other artists.
Choice A is incorrect because "in conclusion" illogically signals that the information in this sentence concludes or summarizes the previous point
about Singletary’s collaborations with other artists. Instead, it provides an example in support of that point. Choice C is incorrect because
"however" illogically signals that the information in this sentence contrasts with the previous point about Singletary’s collaborations with other
artists. Instead, it provides an example in support of that point. Choice D is incorrect because "in comparison" illogically signals that the
information in this sentence is being compared to the previous point about Singletary’s collaborations with other artists. Instead, it provides an
example in support of that point.$qb$);
select seed_pool_question($qb$CB-5c58cec0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$To guarantee the validity of experimental results, scientists rely on precise, unchanging standards of measurement. ______ metrologists
(scientists who study measurement) developed the SI, or International System of Units. The SI’s units of measurement are based on unchanging
values in nature, such as the mass of an electron or the speed of light.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In contrast,"}, {"label": "B", "body": "Regardless,"}, {"label": "C", "body": "In addition,"}, {"label": "D", "body": "For this reason,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "For this reason" logically signals that the information that follows—that metrologists developed the SI based on
unchanging values in nature—is a result of the previous claim that scientists rely on precise, unchanging standards of measurement to guarantee
the validity of experimental results.
Choice A is incorrect because "in contrast" illogically signals that the information that follows contrasts with the previous claim that scientists
rely on precise, unchanging standards of measurement. Instead, the information that metrologists developed the SI based on unchanging values
in nature is a result of that claim. Choice B is incorrect because "regardless" illogically signals that the information that follows is true despite the
previous claim that scientists rely on precise, unchanging standards of measure. Instead, the information that metrologists developed the SI
based on unchanging values in nature is a result of that claim. Choice C is incorrect because "in addition" illogically signals that the information
that follows is merely an additional fact related to the previous claim that scientists rely on precise, unchanging standards of measurement.
Instead, the information that metrologists developed the SI based on unchanging values in nature is a result of that claim.$qb$);
select seed_pool_question($qb$CB-0778b4ac$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Chromosomes are cellular structures that contain genes.
· Genes carry critical instructions for determining an organism’s physical traits.
? Members of the same species typically have the same number of chromosomes.
? The pineapple (Ananas comosus) and the melon (Cucumis melo) are species of fruits.
? The pineapple has fifty chromosomes.
? The melon has twenty-four chromosomes.
The student wants to specify how many chromosomes the pineapple has. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0778b4ac.png$qb$, $qb$[{"label": "A", "body": "The pineapple’s chromosomes contain genes, which are critical to determining an organism’s physical traits."}, {"label": "B", "body": "The pineapple (Ananas comosus) has fifty chromosomes."}, {"label": "C", "body": "The pineapple (Ananas comosus) and the melon (Cucumis melo) both have chromosomes, but the pineapple has more than the melon does."}, {"label": "D", "body": "The melon, a species of fruit, has twenty-four structures called chromosomes."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence directly specifies how many chromosomes the pineapple has, as indicated in the notes: fifty.
Choice A is incorrect. While the sentence mentions the pineapple’s chromosomes, it doesn’t specify how many it has. Choice C is incorrect. The
sentence indicates that the pineapple has more chromosomes than the melon; it doesn’t specify the exact number of chromosomes the
pineapple has. Choice D is incorrect. The sentence specifies how many chromosomes the melon has, not how many the pineapple has.$qb$);
select seed_pool_question($qb$CB-622a351d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 1978, Sámi activists staged protests to block the construction of a dam on the Alta River in Norway.
· The dam would disrupt Sámi fishing and reindeer herding.
? The dam was ultimately built, but the Alta conflict had a lasting impact.
? It brought international attention to the issue of Sámi rights.
? It led to a set of 2005 legal protections establishing Sámi rights to lands, waters, and resources.
The student wants to make and support a generalization about the Alta conflict. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-622a351d.png$qb$, $qb$[{"label": "A", "body": "During the Alta conflict, Sámi activists staged protests to block the construction of a dam on the Alta River in Norway that would disrupt local fishing and reindeer herding."}, {"label": "B", "body": "Although the dam that the Sámi activists had protested was ultimately built, the Alta conflict had a lasting impact."}, {"label": "C", "body": "Sámi rights to lands, waters, and resources received international attention and legal protections as a result of the Alta conflict."}, {"label": "D", "body": "The Alta conflict had a lasting impact, resulting in international attention and legal protections for Sámi rights to lands, waters, and resources."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. It makes a generalization—the conflict had a lasting impact—and then supports it with evidence—the attention and
protections were results of the conflict.
Choice A is incorrect. This choice doesn’t make a generalization about the conflict. It describes a specific event from the conflict. Choice B is
incorrect. This choice makes a generalization about the Alta conflict, but doesn’t support it. Choice C is incorrect. This choice makes a statement
about the aftermath of the conflict, but doesn’t support it. The statement is also a little too specific to be a generalization.$qb$);
select seed_pool_question($qb$CB-efa2be4f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The meter of a poem is the rhythmic structure or pattern of accents in its lines.
· Alliterative meter is structured by a pattern of repeated sounds.
? Quantitative meter is structured by a pattern of long and short syllables.
? The Old English poem Widsith uses an alliterative meter.
? The Sanskrit poem Meghadūta uses a quantitative meter.
The student wants to emphasize a difference between the meters of the two poems. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-efa2be4f.png$qb$, $qb$[{"label": "A", "body": "The poem Widsith is written in Old English, but Meghadūta is written in Sanskrit."}, {"label": "B", "body": "Alliterative meter is a pattern of repeated sounds, but quantitative meter is a rhythmic structure or pattern of accents."}, {"label": "C", "body": "The Sanskrit poem Meghadūta uses a quantitative meter, while the meter of the Old English poem Widsith uses a pattern of long and short syllables."}, {"label": "D", "body": "The lines of the poem Meghadūta use a pattern of long and short syllables, whereas Widsith’s lines use a pattern of repeated sounds."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. Noting that Meghadūta uses a pattern of long and short syllables in its lines (quantitative meter) and Widsith uses a
pattern of repeated sounds in its lines (alliterative meter), and signaling a contrast with “whereas,” the sentence emphasizes a difference
between the meters of the two poems.
Choice A is incorrect. The sentence indicates that the two poems were written in different languages; it doesn’t emphasize a difference between
the meters of the two poems. Choice B is incorrect. The sentence mentions the meters of the two poems but misrepresents information from
the notes; the overall definition of a meter (the rhythmic structure or pattern of accents in a poem’s lines) applies to both alliterative and
quantitative meters, not just quantitative. Choice C is incorrect. While the sentence emphasizes a difference between the meters of the two
poems, it misrepresents information from the notes; Widsith uses an alliterative meter, which is structured by a pattern of repeated sounds, not a
pattern of long and short syllables.$qb$);
select seed_pool_question($qb$CB-b4123d99$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For millennia, acorns were a staple food for the Tongva people, the Indigenous inhabitants of what is now the Los Angeles basin. Raw acorns
have an extremely bitter taste, though, due to their high tannin levels. ______ it was necessary to process the acorns—which involved grinding,
rinsing, and shaping the nuts into a dough—before eating them.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Therefore,"}, {"label": "B", "body": "Similarly,"}, {"label": "C", "body": "Afterward,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Therefore” logically signals that the information in this sentence—that it was necessary to process the acorns
before eating them—is a result or consequence of the previous information about raw acorns having an extremely bitter taste due to high tannin
levels.
Choice B is incorrect because “similarly” illogically signals that the need to process acorns is similar to the previous information about their bitter
taste. Instead, the need to process the acorns is a result or consequence of their bitter taste. Choice C is incorrect because “afterward” illogically
signals that the need to process acorns is an event that occurred later in a chronological sequence than the acorns’ bitter taste. Instead, the need
to process the acorns is a result or consequence of their bitter taste. Choice D is incorrect because “however” illogically signals that the need to
process acorns contrasts with the previous information about their bitter taste. Instead, the need to process the acorns is a result or
consequence of their bitter taste.$qb$);
select seed_pool_question($qb$CB-5645f119$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In a 2023 study, environmental scientist Jazmin Locke-Rodriguez and colleagues tested the use of floating treatment wetlands (FTWs) in
Florida.
? FTWs are artificial floating platforms of plants used to remediate polluted or nutrient-imbalanced water.
? Finding: FTWs using marigold flowers removed 52% more total phosphorus than the control.
? Finding: The test yielded 65 market-quality blooms per square meter.
? The authors concluded marigolds showed “promising potential as a commercially viable remediating crop cultivated on FTWs in South
Florida.”
The student wants to present the findings of the study. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5645f119.png$qb$, $qb$[{"label": "A", "body": "The authors concluded that marigolds grown on FTWs were “commercially viable,” having produced 65 blooms per square meter of market- quality blooms in a 2023 study."}, {"label": "B", "body": "In a 2023 study, Locke-Rodriguez and colleagues found that marigolds cultivated on FTWs produced 52% more market-quality flower blooms than the control."}, {"label": "C", "body": "Locke-Rodriguez and colleagues found that FTWs using marigolds not only helped remove phosphorus from the water but also yielded market-quality blooms."}, {"label": "D", "body": "FTWs using marigolds, Locke-Rodriguez and colleagues found, yielded 65 flower blooms and removed 52% of phosphorus from the water."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence presents both findings from the study, noting that FTWs using marigolds both removed phosphorus
from the water and yielded market-quality blooms.
Choice A is incorrect. While the sentence presents a finding from the study, the presentation is incomplete; the study found that marigolds
cultivated on FTWs both removed phosphorus from the water and yielded market-quality blooms. Choice B is incorrect. The sentence
misrepresents information in the notes. The figure of 52% refers to the amount of phosphorus removed by FTWs using marigolds when
compared to the control; the marigolds’ bloom yield was 65 market-quality blooms per square meter, and it was not compared to the control.
Choice D is incorrect. The sentence misrepresents information in the notes. The FTWs using marigolds removed 52% more phosphorus from the
water than did the control, not 52% of the total phosphorus. Additionally, the bloom figure is incomplete; the figure is 65 market-quality flower
blooms per square meter.$qb$);
select seed_pool_question($qb$CB-0c13dea9$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The chemical trimethylamine N-oxide not only gives fish their fishy smell but also protects them from crushing hydrostatic pressure in deep
waters. Trimethylamine N-oxide strengthens the bonds between water molecules in a fish’s body. ______ these water molecules maintain their
linked structure at extreme depths, thus preventing pressure-related damage.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Nevertheless,"}, {"label": "B", "body": "As a result,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "For instance,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “As a result” indicates that water molecules maintaining their linked structure at high pressures is caused by the
strengthening of these water molecules by trimethylamine N-oxide. So the transition “as a result” fits the context perfectly.
Choice A is incorrect. This choice uses a disagreement transition. But this sentence doesn’t disagree with the previous one—rather, it’s describing
an effect of the phenomenon described in the previous sentence. Choice C is incorrect. This choice uses a disagreement transition. But this
sentence doesn’t disagree with the previous one; it actually expands on the previous sentence by describing an effect of the strengthened
molecules. Choice D is incorrect. This choice uses an exemplification transition, which doesn’t make sense here. The second sentence doesn’t
provide an example or instance of the idea in the previous sentence. Instead, it explores the effects of the previous idea in more depth.$qb$);
select seed_pool_question($qb$CB-4fde4454$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$One poll taken after the first 1960 presidential debate suggested that John Kennedy lost badly: only 21 percent of those who listened on the
radio rated him the winner. ______ the debate was ultimately considered a victory for the telegenic young senator, who rated higher than his
opponent, Vice President Richard Nixon, among those watching on the new medium of television.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "Therefore,"}, {"label": "C", "body": "Likewise,"}, {"label": "D", "body": "Nevertheless,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Nevertheless” logically signals that the claim in this sentence—that the telegenic Kennedy was ultimately
considered the winner of the debate—is true despite the previous information about the poll of radio listeners.
Choice A is incorrect because “in other words” illogically signals that the claim in this sentence is a paraphrase of the previous information about
the poll of radio listeners. Instead, Kennedy was ultimately considered the winner despite what that poll suggested about his performance.
Choice B is incorrect because “therefore” illogically signals that the claim in this sentence is a result of the previous information about the poll of
radio listeners. Instead, Kennedy was ultimately considered the winner despite what that poll suggested about his performance. Choice C is
incorrect because “likewise” illogically signals that the claim in this sentence is similar to the previous information about the poll of radio
listeners. Instead, Kennedy was ultimately considered the winner despite what that poll suggested about his performance.$qb$);
select seed_pool_question($qb$CB-1872cd6d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When printing paper money for the colony of Pennsylvania in the 1730s, Benjamin Franklin—then a Philadelphia shop owner—took steps to
combat the circulation of counterfeit notes, such as weaving blue threads and muscovite (a reflective mineral) into the paper he used. ______ he
stamped the notes with detailed imprints of sage leaves that proved difficult for forgers to replicate.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Specifically,"}, {"label": "B", "body": "That said,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Moreover,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Moreover" logically signals that the information in this sentence—that Franklin stamped imprints on paper money
to make forgery more difficult—adds to the previous information by describing Franklin’s other strategy for combatting forgers: weaving
materials into the paper used for printing money.
Choice A is incorrect because "specifically" illogically signals that the information in this sentence provides specific, precise details elaborating
on the previous information about Franklin’s other strategy for combatting forgers (weaving materials into paper). Instead, this information about
stamping imprints on money adds new information. Choice B is incorrect because "that said" illogically signals that the information in this
sentence is an exception to the previous information about Franklin’s other strategy for combatting forgers (weaving materials into paper).
Instead, this information about stamping imprints on money adds new information. Choice C is incorrect because "for example" illogically
signals that the information in this sentence serves as an example of the previous information about Franklin’s other strategy for combatting
forgers (weaving materials into paper). Instead, this information about stamping imprints on money adds new information.$qb$);
select seed_pool_question($qb$CB-34e1124f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In geology, an Aeolian landform is one that has been created by the wind.
· In Greek mythology, Aeolus is the keeper of the winds.
? Aeolian landforms are created when the wind erodes, transports, or deposits material.
? A mushroom rock is a rock formation in which the top is wider than the base.
? A mushroom rock can be formed when the wind erodes the base and the top at different rates.
The student wants to provide an explanation and an example of Aeolian landforms. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-34e1124f.png$qb$, $qb$[{"label": "A", "body": "Aeolian landforms are created by different wind-based processes; for example, some are created by wind erosion."}, {"label": "B", "body": "Aeolian landforms—landforms created by the wind—include the mushroom rock, a rock formation in which the wind erodes the base of the rock faster than the top."}, {"label": "C", "body": "Erosion, transportation, and deposition are three examples of how the wind can create Aeolian landforms and mushroom rocks."}, {"label": "D", "body": "A mushroom rock is a rock formation that owes its shape to the wind, a natural force associated with Aeolus in Greek mythology."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence provides an explanation and an example of Aeolian landforms, explaining that they are landforms
created by wind and offering the mushroom rock as an example.
Choice A is incorrect. The sentence explains that Aeolian landforms are created by wind but does not provide an example of any specific Aeolian
landforms. Rather, the example it provides is of a wind-based process. Choice C is incorrect. While the sentence provides a partial explanation of
Aeolian landforms, noting that they are created by the wind, it does not effectively provide an example. The sentence seems to indicate that
mushroom rocks, rather than being an example of Aeolian landforms, are distinct from them. Choice D is incorrect. While the sentence provides
an explanation of a mushroom rock, which is a specific example of an Aeolian landform, it doesn’t provide an explanation of Aeolian landforms in
general.$qb$);
select seed_pool_question($qb$CB-7fd39a42$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Circular particle accelerators known as synchrotrons radiate energy in the form of light.
· Synchrotron light is among the brightest light ever produced.
? Synchrotron light is an ideal tool for researchers investigating the structure of matter.
? The first synchrotron created for the purpose of providing synchrotron light was built in 1968.
? It was called Tantalus and was housed near the University of Wisconsin–Madison.
The student wants to emphasize the location of the first synchrotron built to provide synchrotron light. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7fd39a42.png$qb$, $qb$[{"label": "A", "body": "Tantalus, the first synchrotron created for the purpose of providing synchrotron light, was built in 1968."}, {"label": "B", "body": "Circular particle accelerators known as synchrotrons radiate energy in the form of light, and this light is an ideal tool for researchers investigating the structure of matter."}, {"label": "C", "body": "The first synchrotron created for the purpose of providing synchrotron light, Tantalus, was housed near the University of Wisconsin–Madison."}, {"label": "D", "body": "Synchrotron light is among the brightest light ever produced, making it an ideal tool for researchers investigating the structure of matter."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. After identifying Tantalus as the first synchrotron built to provide light, the sentence emphasizes its location.
Choice A is incorrect. While the sentence identifies Tantalus as the first synchrotron built to provide light, it doesn’t emphasize (or mention) its
location. Choice B is incorrect. The sentence describes synchrotrons and how researchers use them; it doesn’t emphasize (or mention) the
location of Tantalus. Choice D is incorrect. The sentence describes synchrotron light and how researchers use it; the sentence doesn’t
emphasize (or mention) the location of Tantalus.$qb$);
select seed_pool_question($qb$CB-96a86bce$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Cambodia’s Angkor Wat was built in the 1100s to honor the Hindu god Vishnu.
· It has been a Buddhist temple since the sixteenth century.
? Decorrelation stretch analysis is a novel digital imaging technique that enhances the contrast between colors in a photograph.
? Archaeologist Noel Hidalgo Tan applied decorrelation stretch analysis to photographs he had taken of Angkor Wat’s plaster walls.
? Tan’s analysis revealed hundreds of images unknown to researchers.
The student wants to present Tan’s research to an audience unfamiliar with Angkor Wat. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-96a86bce.png$qb$, $qb$[{"label": "A", "body": "Tan photographed Angkor Wat’s plaster walls and then applied decorrelation stretch analysis to the photographs."}, {"label": "B", "body": "Decorrelation stretch analysis is a novel digital imaging technique that Tan used to enhance the contrast between colors in a photograph."}, {"label": "C", "body": "Using a novel digital imaging technique, Tan revealed hundreds of images hidden on the walls of Angkor Wat, a Cambodian temple."}, {"label": "D", "body": "Built to honor a Hindu god before becoming a Buddhist temple, Cambodia’s Angkor Wat concealed hundreds of images on its plaster walls."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence effectively presents Tan’s research to an audience unfamiliar with Angkor Wat, explaining the results
of the research and identifying Angkor Wat as a temple in Cambodia.
Choice A is incorrect. While the sentence presents Tan’s research, it fails to explain what Angkor Wat is for an audience unfamiliar with the
temple. Choice B is incorrect. The sentence emphasizes the role that decorrelation stretch analysis played in Tan’s research; it doesn’t present
the research, which would require specifying where it was conducted. Choice D is incorrect. While the sentence explains what Angkor Wat is, it
fails to present Tan’s research.$qb$);
select seed_pool_question($qb$CB-db3ad406$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Stars form in a galaxy when gravity causes a massive cloud of dust and gas to collapse.
· A galaxy in a phase of rapid star formation is called a starburst galaxy.
? Quenching is a process in which a galaxy loses star-forming gas.
? A galaxy that no longer forms stars is called a quenched galaxy.
? A quenched galaxy has entered the poststarburst phase.
The student wants to explain what a quenched galaxy is. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-db3ad406.png$qb$, $qb$[{"label": "A", "body": "Before quenching, a starburst galaxy will form stars at a rapid rate."}, {"label": "B", "body": "When it becomes quenched, a starburst galaxy enters the poststarburst phase."}, {"label": "C", "body": "Having entered the poststarburst phase, a quenched galaxy is one that no longer forms stars."}, {"label": "D", "body": "A starburst galaxy will lose star-forming gas and eventually become quenched."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. This choice defines a quenched galaxy as “one that no longer forms stars.”
Choice A is incorrect. This choice only describes what happens before quenching. Choice B is incorrect. This choice only describes what
happens after quenching. Choice D is incorrect. This choice only describes what causes quenching.$qb$);
select seed_pool_question($qb$CB-0fd4df40$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Alaska Native Language Archive (ANLA) is known for its impressive audio collection. ______ the ANLA has more than 5,000 audio recordings
of Native Alaskan languages dating as far back as 1943.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In fact,"}, {"label": "B", "body": "After,"}, {"label": "C", "body": "Regardless,"}, {"label": "D", "body": "Instead,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "In fact" logically signals that the information in this sentence about the large number of recordings in ANLA’s
collection emphasizes and supports the previous claim that ANLA is known for its impressive audio collection.
Choice B is incorrect because "after" illogically signals that the information in this sentence occurs later in a sequence of events than the
previous claim about ANLA’s impressive audio collection. Instead, the information about the large number of recordings emphasizes and
supports that claim. Choice C is incorrect because "regardless" illogically signals that the information in this sentence is true despite the
previous claim about ANLA’s impressive audio collection. Instead, the information about the large number of recordings emphasizes and
supports that claim. Choice D is incorrect because "instead" illogically signals that the information in this sentence presents an alternative to the
previous claim about ANLA’s impressive audio collection. Rather, the information about the large number of recordings emphasizes and supports
that claim.$qb$);
select seed_pool_question($qb$CB-973632d2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In North America, woodlands have expanded into areas that were once grasslands.
· Thomas Rogers and F. Leland Russell of Wichita State University investigated whether woodland expansion is related to changes in
climate.
? Rogers and Russell analyzed core samples from oak trees on a site that was not wooded in the past and indexed the age of the trees with
historical climate data to see if tree populations and climate were correlated.
? Tree population growth was associated with dry intervals.
· Droughts may have played a role in woodland expansion.
The student wants to emphasize the aim of the research study. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-973632d2.png$qb$, $qb$[{"label": "A", "body": "Thomas Rogers and F. Leland Russell, researchers at Wichita State University, wanted to know if woodland expansion is related to changes in climate."}, {"label": "B", "body": "Thanks to the work done by Thomas Rogers and F. Leland Russell, we now know that droughts may have played a role in woodland expansion."}, {"label": "C", "body": "Wichita State University researchers have determined that tree population growth was associated with dry intervals."}, {"label": "D", "body": "Thomas Rogers and F. Leland Russell analyzed core samples from oak trees on a site that was not wooded in the past, indexing the age of the trees with historical climate data."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence effectively emphasizes the aim, or goal, of the research study (in other words, what the researchers
hoped to learn from the study): Rogers and Russell wanted to know if woodland expansion is related to changes in climate.
Choice B is incorrect. The sentence emphasizes the researchers’ findings; it doesn’t emphasize the aim of the study. Choice C is incorrect. The
sentence emphasizes the results of the study; it doesn’t emphasize the aim. Choice D is incorrect. The sentence emphasizes the methodology of
the study; it doesn’t emphasize the aim.$qb$);
select seed_pool_question($qb$CB-e268c452$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The traditional process of Turkish paper marbling (ebru) generally proceeds like this: First, the artisan fills a shallow tray with a water bath
solution. Next, the artisan adds inks or paints to the solution, which can then be manipulated into intricate designs. ______ the artisan slips paper
in and out of the liquid, transferring the design onto the paper.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Actually,"}, {"label": "B", "body": "Therefore,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Finally,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Finally” logically signals that the information in this sentence—that the artisan slips paper in and out of the liquid to
transfer the design onto paper—is the final step in the process of Turkish paper marbling, which began with what happens “first” (filling a tray
with a solution) and continued with what happens “next” (adding inks or paints to the solution).
Choice A is incorrect because “actually” illogically signals that the information in this sentence about slipping paper in and out of liquid to
transfer a design onto paper is unexpected in light of the previously described steps. Instead, the sentence describes the final step in the process
of Turkish paper marbling. Choice B is incorrect because “therefore” illogically signals that the information in this sentence about slipping paper
in and out of liquid to transfer a design onto paper is a consequence of the previously described steps. Instead, the sentence describes the final
step in the process of Turkish paper marbling. Choice C is incorrect because “nevertheless” illogically signals that the information in this
sentence about slipping paper in and out of liquid to transfer a design onto paper contrasts with the previously described steps. Instead, the
sentence describes the final step in the process of Turkish paper marbling.$qb$);
select seed_pool_question($qb$CB-f114cbf0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A firefly uses specialized muscles to draw oxygen into its lower abdomen through narrow tubes, triggering a chemical reaction whereby the
oxygen combines with chemicals in the firefly’s abdomen to produce a glow. ______ when the firefly stops drawing in oxygen, the reaction—and
the glow—cease.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For instance,"}, {"label": "B", "body": "By contrast,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "In conclusion,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “By contrast” logically signals that the information in this sentence—that a firefly’s glow ceases when it stops
drawing in oxygen—contrasts with the previous sentence’s discussion of the processes that cause a firefly to begin to glow.
Choice A is incorrect because “for instance” illogically signals that the information in the sentence exemplifies the previous sentence’s
discussion of how a firefly begins to glow. Instead, it contrasts with the previous sentence’s discussion. Choice C is incorrect because
“specifically” illogically signals that the information in the sentence provides specific details elaborating on the previous sentence’s discussion of
how a firefly begins to glow. Instead, it contrasts with the previous sentence’s discussion. Choice D is incorrect because “in conclusion” illogically
signals that the information in the sentence sums up the previous sentence’s discussion of how a firefly begins to glow. Instead, it contrasts with
the previous sentence’s discussion.$qb$);
select seed_pool_question($qb$CB-b7c404d1$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$With her room-sized installation The Interstitium, Iranian American artist Laleh Mehran succeeded in creating a space that felt, as intended, both
“familiar and distant.” ______ with a video screen placed at the far end of the coal slag-encrusted room, her installation was reminiscent of a
typical movie theater—albeit one found in a subterranean coal mine.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Next,"}, {"label": "B", "body": "Nevertheless,"}, {"label": "C", "body": "Indeed,"}, {"label": "D", "body": "Instead,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "Indeed" logically signals that the information in this sentence—that Laleh Mehran’s installation resembled both a
typical movie theater and a coal mine—supports the previous sentence’s claim that the space Mehran created felt both "familiar and distant."
Choice A is incorrect because "next" illogically signals that the description of Laleh Mehran’s installation in this sentence is the next step in a
process. Rather, it supports the previous sentence’s claim about Mehran’s installation. Choice B is incorrect because "nevertheless" illogically
signals that the information in this sentence is true despite the claim about Laleh Mehran’s installation in the previous sentence. Rather, it
supports that claim. Choice D is incorrect because "instead" illogically signals that this sentence presents an alternative to the previous
sentence’s claim about Laleh Mehran’s installation. Rather, it supports that claim.$qb$);
select seed_pool_question($qb$CB-d9d314d9$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Pinnipeds, which include seals, sea lions, and walruses, live in and around water.
· Pinnipeds are descended not from sea animals but from four-legged, land-dwelling carnivores.
? Canadian paleobiologist Natalia Rybczynski recently found a fossil with four legs, webbed toes, and the skull and teeth of a seal.
? Rybczynski refers to her rare find as a “transitional fossil.”
? The fossil illustrates an early stage in the evolution of pinnipeds from their land-dwelling ancestors.
The student wants to emphasize the fossil’s significance. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d9d314d9.png$qb$, $qb$[{"label": "A", "body": "Canadian paleobiologist Natalia Rybczynski’s fossil has the skull and teeth of a seal, which, like sea lions and walruses, is a pinniped."}, {"label": "B", "body": "Pinnipeds are descended from four-legged, land-dwelling carnivores; a fossil that resembles both was recently found."}, {"label": "C", "body": "Having four legs but the skull and teeth of a seal, the rare fossil illustrates an early stage in the evolution of pinnipeds from their land-dwelling ancestors."}, {"label": "D", "body": "A “transitional fossil” was recently found by paleobiologist Natalia Rybczynski."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence effectively emphasizes the fossil’s significance, explaining that the fossil is rare and illustrates an
early stage in the evolution of pinnipeds from their land-dwelling ancestors.
Choice A is incorrect. The sentence describes the fossil Rybczynski found; it doesn’t emphasize the fossil’s significance. Choice B is incorrect.
The sentence mentions that a fossil resembling both pinnipeds and their ancestors was found; it doesn’t emphasize the fossil’s
significance. Choice D is incorrect. The sentence notes a term used to describe the fossil Rybczynski found; it doesn’t emphasize the fossil’s
significance.$qb$);
select seed_pool_question($qb$CB-ad729337$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$With its clichéd imagery of suburban lawns and power lines, John Ashbery’s 2004 poem “Ignorance of the Law Is No Excuse” may seem barren
terrain for critical analysis. ______ cultural critic Lauren Berlant finds fertile ground in just its first two stanzas, devoting most of a book chapter to
deciphering the “weight of the default space” Ashbery creates in this poem.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Likewise,"}, {"label": "B", "body": "Nonetheless,"}, {"label": "C", "body": "In turn,"}, {"label": "D", "body": "That is,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Nonetheless” is a transition that indicates disagreement. The first sentence describes the unlikelihood of finding
much for critical analysis in Ashbery’s poem (“barren terrain”), while the second sentence describes how Berlant did in fact find much to analyze
in Ashbery’s poem (“fertile ground”), so the transition “nonetheless” fits perfectly.
Choice A is incorrect. This choice uses a transition that indicates the addition of a new but similar idea, which doesn’t make sense here. The idea
in this sentence directly contradicts the idea in the previous sentence. Choice C is incorrect. This choice uses a cause-and-effect transition,
which doesn’t make sense in this context—a poem seemingly having little opportunity for critical analysis would not cause someone to write an
extensive critical analysis (in fact, we might expect the opposite). Choice D is incorrect. This choice uses a transition that indicates a
restatement of the same idea in other words. But the text isn’t restating the first idea here. Instead, it’s offering a contradiction to the idea
expressed in the first sentence.$qb$);
select seed_pool_question($qb$CB-5e93039f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Roughly once an hour, a torrent of boiling water shoots up 100 feet or more from Yellowstone’s Old Faithful geyser before plunging back to the
surface—a cycle seemingly inhospitable to life. ______ as microbiologist Eric Boyd attests, “the geyser is…almost like a cradle for biodiversity,”
home to numerous bacteria species that thrive in its sulfurous waters.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Thus,"}, {"label": "B", "body": "Specifically,"}, {"label": "C", "body": "Still,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "Still" logically signals that the information in this sentence about Old Faithful’s thriving bacteria species is true
despite the previous claim that conditions at the geyser seem as if they would be inhospitable to life.
Choice A is incorrect because "thus" illogically signals that the information in this sentence is a result or consequence of the previous claim
about Old Faithful’s seemingly inhospitable conditions. Instead, this information about the geyser’s many thriving bacteria species is true despite
the previous claim. Choice B is incorrect because "specifically" illogically signals that the information in this sentence provides specific, precise
details elaborating on the previous claim about Old Faithful’s seemingly inhospitable conditions. Instead, this information about the geyser’s
many thriving bacteria species is true despite the previous claim. Choice D is incorrect because "in other words" illogically signals that the
information in this sentence serves as a paraphrase or restatement of the previous claim about Old Faithful’s seemingly inhospitable conditions.
Instead, this information about the geyser’s many thriving bacteria species is true despite the previous claim.$qb$);
select seed_pool_question($qb$CB-0f9ed134$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 1974, Mexican chemist Mario Molina and US chemist F. Sherwood Rowland discovered that chemicals called CFCs were harmful to the ozone
layer. Their research was extremely influential in the fight against CFCs. ______ it laid the foundation for a 1987 treaty that phased out the use of
CFCs across the globe.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Regardless,"}, {"label": "B", "body": "Specifically,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "Earlier,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Specifically" logically signals that the information in this sentence—that Molina and Rowland’s research laid the
foundation for a later treaty—provides specific, precise details elaborating on the previous sentence’s more general claim about the influence of
the research.
Choice A is incorrect because "regardless" illogically signals that the information in this sentence is true despite the previous sentence’s claim
about the influence of Molina and Rowland’s research. Instead, this information—that the research laid the foundation for a later treaty—provides
specific details elaborating on the previous claim. Choice C is incorrect because "however" illogically signals that the information in this sentence
contrasts with the previous sentence’s claim about the influence of Molina and Rowland’s research. Instead, this information—that the research
laid the foundation for a later treaty—provides specific details elaborating on the previous claim. Choice D is incorrect because "earlier" illogically
signals that the information in this sentence occurred at a time before Molina and Rowland’s research influenced the fight against CFCs. Instead,
this information—that the research laid the foundation for a later treaty—provides specific details elaborating on the previous claim about the
research’s influence.$qb$);
select seed_pool_question($qb$CB-9e3a215b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A 2022 study by researchers Hala Altamimi and Qiaozhen Liu investigated the relationship between nonprofit arts organizations’ spending and
performance. ______ the researchers examined the correlation between how much 22,328 US arts nonprofits spent on overhead—operational
costs such as equipment and fundraising—and how many people attended their events (a measure of overall success).
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Thus,"}, {"label": "B", "body": "In addition,"}, {"label": "C", "body": "By comparison,"}, {"label": "D", "body": "Specifically,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Specifically" logically signals that the information in this sentence—that the researchers examined the overhead
costs and attendance at events of 22,328 nonprofits—provides specific, precise details elaborating on how the researchers investigated the
relationship between nonprofits’ spending and performance.
Choice A is incorrect. "Thus" illogically signals that the information in this sentence is a result or consequence of the researchers’ investigation
of nonprofits’ spending and performance. Instead, it specifies how they examined that correlation. Choice B is incorrect. "In addition" illogically
signals that the information in this sentence is merely an additional fact about the researchers’ investigation of nonprofits’ spending and
performance. Instead, it specifies how they examined that correlation. Choice C is incorrect. "By comparison" illogically signals that the
information in this sentence is being compared to the researchers’ investigation of nonprofits’ spending and performance. Instead, it specifies
how they examined that correlation.$qb$);
select seed_pool_question($qb$CB-70c19cf6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$One proposed boundary between Earth’s atmosphere and outer space is the Kármán line, 100 km above sea level. Based on the work of physicist
Theodore von Kármán, this line marks the theoretical height at which an aircraft no longer remains aloft using the force of lift. ______ an aircraft
sustains flight past this altitude primarily by its velocity, reaching a speed sufficient to maintain an orbit but not to generate enough lift from the
thin air.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For instance,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "Granted,"}, {"label": "D", "body": "Regardless,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Instead” logically signals that the information in this sentence—that an aircraft sustains flight past the Kármán line
primarily by its velocity—is an alternative means of sustaining flight past this line, which the previous sentence indicates is the theoretical height
at which an aircraft no longer remains aloft by using the force of lift.
Choice A is incorrect because “for instance” illogically signals that the information about an aircraft sustaining flight by velocity exemplifies the
previous information about the Kármán line marking the theoretical height at which an aircraft no longer remains aloft using lift. Rather, the
sentence describes an alternative means of sustaining flight past this line. Choice C is incorrect because “granted” illogically signals that the
information about an aircraft sustaining flight by velocity is a concession or acknowledgment that qualifies the previous information about the
Kármán line marking the theoretical height at which an aircraft no longer remains aloft using lift. Rather, the sentence describes an alternative
means of sustaining flight past this line. Choice D is incorrect because “regardless” illogically signals that the information about an aircraft
sustaining flight by velocity is true despite the previous information about the Kármán line marking the theoretical height at which an aircraft no
longer remains aloft using lift. Rather, the sentence describes an alternative means of sustaining flight past this line.$qb$);
select seed_pool_question($qb$CB-ce282575$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? J.R.R. Tolkien’s 1937 novel The Hobbit features two maps.
· The novel opens with a reproduction of the map that the characters use on their quest.
? This map introduces readers to the fictional world they are about to enter.
? The novel closes with a map depicting every stop on the characters’ journey.
? That map allows readers to reconstruct the story they have just read.
The student wants to contrast the purposes of the two maps in The Hobbit. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ce282575.png$qb$, $qb$[{"label": "A", "body": "The Hobbit’s opening map introduces readers to the fictional world they are about to enter, while the closing map allows them to reconstruct the story they have just read."}, {"label": "B", "body": "The Hobbit, a novel published by J.R.R. Tolkien in 1937, features a reproduction of a map that the characters use on their quest, as well as a map that appears at the end of the novel."}, {"label": "C", "body": "The Hobbit’s two maps, one opening and one closing the novel, each serve a purpose for readers."}, {"label": "D", "body": "In 1937, author J.R.R. Tolkien published The Hobbit, a novel featuring both an opening and a closing map."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence contrasts the purposes of the two maps in The Hobbit, noting that the opening map introduces
readers to the book’s fictional world, while the closing map helps readers reconstruct the story. The word “while” helps signal a contrast between
the purposes of the maps.
Choice B is incorrect. While the sentence mentions the two maps, it doesn’t contrast the maps’ purposes. Choice C is incorrect. While the
sentence mentions the two maps and notes that each has a purpose, it doesn’t specify what those purposes are or how they contrast. Choice D
is incorrect. While the sentence mentions the two maps, it doesn’t contrast the maps’ purposes.$qb$);
select seed_pool_question($qb$CB-0ee64efc$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the 1850s, William Still was instrumental in helping nearly 1,000 people escape from slavery, earning him the moniker “the Father of the
Underground Railroad.” ______ despite the fame of his contributions during his lifetime, Still is discussed far less today than other prominent
Black abolitionists from his era, such as Frederick Douglass and Harriet Tubman.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "However,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "Similarly,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “However” logically signals that the information in this sentence—that Still is discussed less frequently today than
other famous Black abolitionists—contrasts with the information in the previous sentence, which indicates that Still was once so prominent that
he was called “the Father of the Underground Railroad.”
Choice A is incorrect because “for example” illogically signals that this sentence provides an example supporting the information about Still’s
accomplishments. Instead, the sentence indicates that Still is discussed less frequently today than other famous Black abolitionists. Choice C is
incorrect because “specifically” illogically signals that this sentence provides a specific example supporting the information about Still’s
accomplishments. Instead, the sentence indicates that Still is discussed less frequently today than other famous Black abolitionists. Choice D is
incorrect because “similarly” illogically signals that this sentence provides similar information to the information about Still’s accomplishments.
Instead, the sentence indicates that Still is discussed less frequently today than other famous Black abolitionists.$qb$);
select seed_pool_question($qb$CB-b8eec031$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Researchers Helena Mihaljević-Brandt, Lucía Santamaría, and Marco Tullney report that while mathematicians may have traditionally worked
alone, evidence points to a shift in the opposite direction. ______ mathematicians are choosing to collaborate with their peers—a trend illustrated
by a rise in the number of mathematics publications credited to multiple authors.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "For this reason,"}, {"label": "C", "body": "Furthermore,"}, {"label": "D", "body": "Increasingly,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Increasingly” logically signals that the claim in this sentence—that mathematicians are collaborating with their
peers—marks a change relative to what was traditionally done. As the previous sentence explains, while mathematicians may have traditionally
worked alone, evidence points to a shift in the opposite direction. The claim describes the shift: a rise in collaboration.
Choice A is incorrect because “similarly” illogically signals that the claim in this sentence is similar to, but separate from, the previous claim
about the shift away from mathematicians working alone. Instead, the claim about the rise in collaboration elaborates on the previous claim,
describing the shift. Choice B is incorrect because “for this reason” illogically signals that the claim in this sentence is caused by the previous
claim about the shift away from mathematicians working alone. Instead, the claim about the rise in collaboration elaborates on the previous
claim, describing the shift. Choice C is incorrect because “furthermore” illogically signals that the claim in this sentence is in addition to the
previous claim about the shift away from mathematicians working alone. Instead, the claim about the rise in collaboration elaborates on the
previous claim, describing the shift.$qb$);
select seed_pool_question($qb$CB-56336696$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When using sumac for dyeing cloth, textile artists first soak it in water to release its color. Then, they add the cloth to the dyebath and simmer it
for hours, perhaps even days. ______ they will remove the cloth, at which point it will have turned a vibrant red color.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Nevertheless,"}, {"label": "B", "body": "Likewise,"}, {"label": "C", "body": "Eventually,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "Eventually" logically signals that the information in this sentence—that textile artists will remove the cloth when it
has turned red—is the final step in the chronological sequence of the dyeing process described in the previous sentences.
Choice A is incorrect because "nevertheless" illogically signals that the information in this sentence is true despite the previous information
about simmering the cloth in the dyebath. Instead, the removal of the cloth is the final step in the dyeing process. Choice B is incorrect because
"likewise" illogically signals that the information in this sentence is similar to the previous information about simmering the cloth in the dyebath.
Instead, the removal of the cloth is the final step in the dyeing process. Choice D is incorrect because "in other words" illogically signals that the
information in this sentence is a paraphrase or restatement of the previous information about simmering the cloth in the dyebath. Instead, the
removal of the cloth is the final step in the dyeing process.$qb$);
select seed_pool_question($qb$CB-273c2f12$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Jeffrey Gibson’s sculptural object KNOW YOUR MAGIC, BABY, an Everlast-brand exercise bag embroidered with multicolored beads and a fringe
associated with the dances of the Ojibwe people, stitches together—literally and figuratively—recognizable symbols from both Native and non-
Native cultures. ______ Gibson’s piece also blurs the distinction between contemporary art and traditional crafts.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Conversely,"}, {"label": "B", "body": "In so doing,"}, {"label": "C", "body": "For instance,"}, {"label": "D", "body": "In particular,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "In so doing" logically signals that the information in this sentence about Gibson’s piece—that it blurs the distinction
between contemporary art and traditional crafts—is a result or consequence of the piece’s blending of particular Native and non-Native cultural
symbols.
Choice A is incorrect. "Conversely" illogically signals that the information in this sentence contrasts with the previous information about the
blending of particular cultural symbols in Gibson’s piece. Instead, it presents a result or consequence of that information. Choice C is incorrect.
"For instance" illogically signals that this sentence provides an example supporting the previous information about the blending of particular
cultural symbols in Gibson’s piece. Instead, it presents a result or consequence of that information. Choice D is incorrect. "In particular" illogically
signals that this sentence provides specific details elaborating on the previous information about the blending of particular cultural symbols in
Gibson’s piece. Instead, it presents a result or consequence of that information.$qb$);
select seed_pool_question($qb$CB-e98b1690$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Bike-share programs provide bicycles for shared use.
· In docked bike sharing, riders rent a bike and return it to designated docking stations.
? Docked programs are orderly and offer consistency to riders but require significant space and money to implement.
? In dockless bike sharing, riders locate a bike and leave it wherever they choose.
? Dockless programs are relatively simple and inexpensive to implement and offer flexibility to riders.
? Dockless programs can be disorganized.
The student wants to compare some disadvantages of docked and dockless bike-share programs. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e98b1690.png$qb$, $qb$[{"label": "A", "body": "Dockless programs can be disorganized; docked programs, on the other hand, offer order and consistency."}, {"label": "B", "body": "Worth noting is that while dockless programs are relatively easy and inexpensive to implement, they are less flexible than docked programs."}, {"label": "C", "body": "Docked programs are more resource-intensive than dockless programs, but they avoid some of the latter’s organizational challenges."}, {"label": "D", "body": "Though dockless programs offer flexibility, docked bike-share programs provide bicycles for shared use."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence compares some disadvantages of docked and dockless bike-share programs, explaining that while
docked programs are more resource-intensive (requiring significant space and money), dockless programs have greater organizational
challenges.
Choice A is incorrect. The sentence compares dockless programs to docked programs, noting an advantage of docked programs: they offer
order and consistency. It doesn’t compare disadvantages of the two types of programs. Choice B is incorrect. The sentence compares dockless
programs to docked programs, noting an advantage of dockless programs: they are easy and inexpensive to implement. However, it
misrepresents information from the notes, stating that dockless programs are less flexible than docked programs. In addition, it doesn’t compare
disadvantages of the two types of programs. Choice D is incorrect. The sentence emphasizes an advantage of dockless programs, then makes a
general statement that applies to both types of programs; it doesn’t compare disadvantages of the two types of programs.$qb$);
select seed_pool_question($qb$CB-9e34720b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Although those who migrated to California in 1849 dreamed of finding gold nuggets in streambeds, the state’s richest deposits were buried
deeply in rock, beyond the reach of individual prospectors. ______ by 1852, many had given up their fortune-hunting dreams and gone to work for
one of the large companies capable of managing California’s complex mining operations.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Furthermore,"}, {"label": "B", "body": "Still,"}, {"label": "C", "body": "Consequently,"}, {"label": "D", "body": "Next,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Consequently” logically signals that the information in this sentence—that many individual gold prospectors gave
up their fortune-hunting dreams and became employees of mining companies—is a result or consequence of the previous information about the
inaccessibility of the state’s gold deposits.
Choice A is incorrect because “furthermore” illogically signals that the information in this sentence merely adds to the previous information
about the inaccessibility of the state’s gold deposits. Instead, it’s a result or consequence of that information. Choice B is incorrect because “still”
illogically signals that the information in this sentence offers a contrast or exception to the previous information about the inaccessibility of the
state’s gold deposits. Instead, it’s a result or consequence of that information. Choice D is incorrect because “next” illogically signals that the
information in this sentence is the next step in a process. Instead, it’s a result or consequence of the previous information about the
inaccessibility of the state’s gold deposits.$qb$);
select seed_pool_question($qb$CB-6036ad0e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 2014, Nestor Gomez won his first-ever storytelling competition, relating a tale about his life as a Guatemalan immigrant living in Chicago.
______ in 2017, Gomez created the show 80 Minutes Around the World as a platform for others to share stories about their immigration
experiences.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Instead,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "Later,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "Later" logically signals that the information in the sentence—that in 2017 Gomez created a platform for others to
share stories about their immigration experiences—occurs later in a chronological series of events than the previous information about Gomez
winning his first storytelling competition in 2014.
Choice A is incorrect because "instead" illogically signals that Gomez created a platform for others to share stories about their immigration
experiences as an alternative to winning his first storytelling competition. Rather, Gomez created the platform later—in a chronological series of
events—than when he won the competition. Choice B is incorrect because "for example" illogically signals that the information about Gomez
creating a platform for others to share stories exemplifies his winning his first storytelling competition. Rather, Gomez created the platform later
—in a chronological series of events—than when he won the competition. Choice D is incorrect because "in other words" illogically signals that
the information about Gomez creating a platform for others to share stories is merely a paraphrase or restatement of the previous information
about Gomez winning his first storytelling competition. Rather, Gomez created the platform later—in a chronological series of events—than when
he won the competition.$qb$);
select seed_pool_question($qb$CB-63c73b50$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 2018, Kurt Luther and Vikram Mohanty created the web-based tool Civil War Photo Sleuth (CWPS). A user uploading an unknown Civil War
soldier’s photograph to CWPS first tags the photo with all known information. ______ CWPS’s facial-recognition software analyzes twenty-seven
different physical features and looks for matches to tagged images already in the database.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Then,"}, {"label": "B", "body": "In fact,"}, {"label": "C", "body": "Likewise,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Then” indicates that the events in this sentence took place after the events in the previous sentence. Only after
users upload images of unknown soldiers can those images be analyzed.
Choice B is incorrect. This transition is used to emphasize the truth of a statement that modifies the previous statement. But this sentence
doesn’t modify the step described in the previous statement: instead, it introduces an entirely new step in the process. So “in fact” wouldn’t make
sense here. Choice C is incorrect. This choice uses a transition that indicates the addition of a new but related idea, which doesn’t make sense
here. Analyzing the physical features in the uploaded photographs isn’t a similar idea, but rather the next step in the process. Choice D is
incorrect. This choice uses an exemplification transition, which doesn’t make sense here. Analyzing physical features is not an example of
uploading and tagging an image.$qb$);
select seed_pool_question($qb$CB-3831f2d7$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Arkansas aviator Louise Thaden was already a record breaker when she won the inaugural National Women’s Air Derby, a race from California to
Ohio, in August of 1929. ______ in December of 1928, Thaden had set an aviation record when she reached an altitude of 20,269 feet in a Travel
Air biplane.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Earlier,"}, {"label": "B", "body": "However,"}, {"label": "C", "body": "Next,"}, {"label": "D", "body": "As a result,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice uses a transition that indicates a shift back in time. Since the first sentence talks about Thaden’s race
win in 1929 and the second shifts back to talking about her record in 1928, this makes the most sense here.
Choice B is incorrect. This choice uses a disagreement transition. But this sentence actually agrees with and expands on the previous sentence
by describing the earlier record that Thaden had "already" held. Choice C is incorrect. This choice uses a transition that indicates a shift forward
in time, which doesn’t make sense here. A record in 1928 didn’t come after Thaden’s race win in 1929. Choice D is incorrect. This choice uses a
cause-and-effect transition, which doesn’t make sense in this context—an event in 1929 can’t cause something in 1928.$qb$);
select seed_pool_question($qb$CB-c4f7f726$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Many butterfly species have bold, brightly colored wings. ______ some butterfly species have wings that are almost completely colorless and
transparent. Glasswing butterflies, for example, have see-through wings that make them nearly invisible.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "Previously,"}, {"label": "C", "body": "In other words,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "However" logically signals that the information in this sentence about butterfly species—that some have colorless,
transparent wings—contrasts with the previous information about butterfly species with bold, colorful wings.
Choice A is incorrect because "similarly" illogically signals that the information in this sentence is similar to the previous information about
butterfly species. Instead, it contrasts with the previous information. Choice B is incorrect because "previously" illogically signals that this
sentence describes an event that occurred before another event. Instead, the sentence provides information about butterfly species that
contrasts with the information in the first sentence. Choice C is incorrect because "in other words" illogically signals that the information in this
sentence is a paraphrase or restatement of the previous information about butterfly species. Instead, it contrasts with the previous information.$qb$);
select seed_pool_question($qb$CB-1469d23a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Etel Adnan was a Lebanese American poet and artist known for making many leporellos.
· A leporello is an artist’s book that is folded accordion style.
? When the book is expanded, the artist’s work is revealed, and its zigzag shape allows it to stand on its own.
? Her leporello December from My Window (1993) features a panoramic landscape.
? It is painted using ink and watercolor.
The student wants to describe Adnan’s December from My Window to an audience already familiar with leporellos. Which choice most effectively
uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1469d23a.png$qb$, $qb$[{"label": "A", "body": "Featuring a panoramic landscape, the 1993 work is one of Adnan’s many leporellos, which are accordion-style folded books that when expanded reveal the artist’s work."}, {"label": "B", "body": "When expanded, Adnan’s 1993 leporello December from My Window reveals a panoramic landscape painted in ink and watercolor."}, {"label": "C", "body": "Known for making many other accordion-style folded books called leporellos, Adnan created December from My Window in 1993."}, {"label": "D", "body": "A leporello, such as Adnan’s December from My Window, is folded accordion style, and due to its zigzag shape it is able to stand on its own when fully expanded."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. This choice describes Adnan’s December from My Window in a way that assumes the audience is already familiar
with leporellos and focuses on the specific features of the work—its content and medium.
Choice A is incorrect. This choice isn’t suited for an audience already familiar with leporellos. A familiar audience wouldn’t need to have the term
defined or explained. Choice C is incorrect. This choice doesn’t describe Adnan’s December from My Window. It mentions the year and the type of
work but not the content or the medium. In addition, it provides a simple definition of leporellos, making this an inappropriate choice for an
audience already familiar with leporellos. Choice D is incorrect. This choice isn’t suited for an audience already familiar with leporellos. A familiar
audience wouldn’t need to have the term defined.$qb$);
select seed_pool_question($qb$CB-1c60119d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Jacob Lawrence was a US painter best known for The Migration Series (1940–41).
? The Migration Series portrays scenes from the Great Migration of African Americans from the rural South to cities in the North and
Midwest.
? The series consists of 60 colorful semiabstract paintings, numbered 1 through 60.
· The odd-numbered paintings are on display at the Phillips Collection in Washington, DC.
? The even-numbered paintings are on display at the Museum of Modern Art in New York City.
? Painting #12 depicts people buying tickets in a crowded train station.
The student wants to indicate where to go to view Painting #12 from Lawrence’s Migration Series. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1c60119d.png$qb$, $qb$[{"label": "A", "body": "Depicting a crowded train station, Painting #12 from The Migration Series is on display at the Museum of Modern Art in New York City."}, {"label": "B", "body": "In Painting #12 and the other works of The Migration Series, Lawrence painted African Americans going from the rural South to cities in the North and Midwest."}, {"label": "C", "body": "To view an even-numbered painting from Lawrence’s Migration Series, such as the one that depicts people buying train tickets, one must go to Washington, DC."}, {"label": "D", "body": "The 60 colorful semiabstract paintings of Lawrence’s series can be viewed in two places: the Phillips Collection in Washington, DC, and the Museum of Modern Art in New York City."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence indicates where to go to view Painting #12 from Lawrence’s Migration Series, noting that this even-
numbered painting is on display at the Museum of Modern Art in New York City.
Choice B is incorrect. The sentence describes the subject matter of The Migration Series; it doesn’t indicate where to go to view Painting #12.
Choice C is incorrect. The sentence misrepresents information from the notes: even-numbered paintings, such as Painting #12, are on display at
the Museum of Modern Art in New York City, not in Washington, DC. Choice D is incorrect. While the sentence mentions both locations where
paintings from the series are displayed, it doesn’t indicate where to go to view Painting #12 specifically.$qb$);
select seed_pool_question($qb$CB-2b5e0731$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$With darkness falling, a mother elephant loses sight of her calf and wants to make sure it is safe. ______ she releases an infrasonic call for the
calf to hear. Infrasonic sound is below the range of human hearing, but many animals can hear these sounds from several miles away.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "For this reason,"}, {"label": "C", "body": "Nowadays,"}, {"label": "D", "body": "Similarly,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "For this reason" is a cause-and-effect transition. The cause in this case is that the mother elephant wants to know
that her calf is safe, so the effect is that she lets out an infrasonic call for the calf to hear. Therefore, "for this reason" fits perfectly in this context.
Choice A is incorrect. This choice uses a transition that introduces an example of a previous idea. But the second sentence doesn’t provide an
example of the events described in the first sentence. Instead, it describes what happens next: the mother elephant calls for her calf. Choice C is
incorrect. This choice uses a transition that indicates a shift from the past to the current time, which doesn’t make sense here. Both sentences
use the present tense, as they’re describing the same time period. Choice D is incorrect. This choice uses a transition that indicates commonality
or agreement between two ideas. But this sentence isn’t similar to the events in the first sentence. Instead, it describes the events that happen
next.$qb$);
select seed_pool_question($qb$CB-19b08ead$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Producing the nutrient-rich cyanobacterium L. maxima at industrial scale requires high-quality samples of L. maxima DNA.
? Yirlis Yadeth Pineda-Rodriguez and a team of researchers at the University of Córdoba, Colombia, evaluated the quantity and purity of L.
maxima DNA extracted using three different DNA extraction kits.
? CTAB 2X (kit 1) had a DNA yield of 2,134 nanograms per microliter (ng/µL) and a purity ratio of 2.2.
· Pbact (kit 2) had a DNA yield of 157 ng/µL and a purity ratio of 1.6.
? Pplant (kit 3) had a DNA yield of 12.5 ng/µL and a purity ratio of 1.5.
? According to the researchers, Pbact was the most effective because it was the only one with both a sufficiently high yield and a purity
rate close to the ideal of 1.8.
The student wants to emphasize the significance of a similarity between two of the kits. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-19b08ead.png$qb$, $qb$[{"label": "A", "body": "Due to their insufficient yield or purity, CTAB 2X and Pplant were deemed by the researchers to be less effective than Pbact."}, {"label": "B", "body": "Compared to CTAB 2X, which had a DNA yield of 2,134 ng/µL, both Pbact and Pplant had insufficient yields; Pplant, in particular, was ineffective due to its low yield."}, {"label": "C", "body": "CTAB 2X and Pplant both had a DNA yield above 10 and a purity ratio above 1.4."}, {"label": "D", "body": "With the ideal purity ratio being 1.8, CTAB 2X and Pbact were equal in purity, according to the researchers."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the significance of a similarity between CTAB 2X and Pplant, noting that both were
deemed less effective than Pbact due to their insufficient yield or purity. According to the notes, the researchers concluded that Pbact was the
most effective kit because it was the only one with both a sufficiently high yield and a purity ratio close to 1.8. Since Pbact was the only kit to
meet both criteria, it follows that CTAB 2X and Pplant each fell short on at least one critical measure.
Choice B is incorrect. The sentence presents a similarity between two of the kits (Pbact and Pplant), but in doing so, it misrepresents information
from the notes. The researchers deemed Pbact the most effective kit overall, not one with an insufficient yield. Choice C is incorrect. While the
sentence identifies a similarity between CTAB 2X and Pplant (that both had a DNA yield above 10 and a purity ratio above 1.4), it doesn’t
emphasize the significance of that similarity. Choice D is incorrect. The sentence presents a similarity between the CTAB 2X and Pbact kits, but
in doing so, it misrepresents information from the notes. CTAB 2X had a purity ratio of 2.2, while Pbact had a purity ratio of 1.6, so they were not
equal in purity.$qb$);
select seed_pool_question($qb$CB-3ea7372e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In the art world, the term biennial traditionally refers to an art exhibition that takes place every two years in a single location.
· Such biennials are held in New York, Berlin, and Venice.
? In 2006, artists Ed Gomez and Luis Hernandez founded the unconventional MexiCali Biennial.
? The MexiCali Biennial hosts exhibitions in different venues on both sides of the US-Mexico border.
? The MexiCali Biennial has taken place on an uneven schedule, with exhibitions in 2006, 2009–10, 2013, and 2018–20.
The student wants to emphasize a difference between the MexiCali Biennial and traditional biennials. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3ea7372e.png$qb$, $qb$[{"label": "A", "body": "In 2006, artists Ed Gomez and Luis Hernandez founded the MexiCali Biennial, which has taken place in 2006, 2009–10, 2013, and 2018–20."}, {"label": "B", "body": "Unlike traditional biennials, the MexiCali Biennial hosts exhibitions in different venues on an uneven schedule."}, {"label": "C", "body": "The term biennial traditionally refers to an art exhibition that takes place every two years in a single location, not to exhibitions hosted at a variety of times and venues."}, {"label": "D", "body": "Biennial exhibitions have been held in New York, Berlin, and Venice but also on both sides of the US-Mexico border."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence effectively emphasizes a difference between the MexiCali Biennial and traditional biennials, stating
that the MexiCali Biennial is unlike traditional biennials because it hosts exhibitions in different venues on an uneven schedule.
Choice A is incorrect. The sentence indicates who founded the MexiCali Biennial and the years this biennial has taken place; it doesn’t emphasize
a difference between the MexiCali Biennial and traditional biennials. Choice C is incorrect. While the sentence clarifies the traditional meaning of
biennial with language that could apply to the MexiCali Biennial, it doesn’t mention the MexiCali Biennial by name. Therefore, the sentence
doesn’t effectively emphasize a difference between the MexiCali Biennial and traditional biennials. Choice D is incorrect. The sentence notes
locations where various biennial exhibitions have been held; it doesn’t emphasize a difference between the MexiCali Biennial and traditional
biennials.$qb$);
select seed_pool_question($qb$CB-1c36e3e1$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The number of dark spots that appear on the Sun, known as sunspots, can vary greatly. For example, there were about 180 sunspots in
November 2001. ______ there were only about 2 sunspots in December 2008.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "Similarly,"}, {"label": "C", "body": "Therefore,"}, {"label": "D", "body": "By comparison,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “By comparison” logically signals that the information in this sentence about the number of sunspots in December
2008 offers a point of comparison with the previous sentence, which indicates the number of sunspots in November 2001. The two sentences
work together to support the claim that the number of these spots “can vary greatly.”
Choice A is incorrect because “in other words” illogically signals that this sentence restates the information in the previous sentence. Instead,
this sentence presents new information, offering a point of comparison to the previous sentence. Choice B is incorrect because “similarly”
illogically signals that the example in this sentence is similar to the example in the previous sentence. In fact, the examples of numbers of
sunspots are very different. Choice C is incorrect because “therefore” illogically signals that this sentence has a cause-and-effect relationship to
the previous sentence. Instead, this sentence presents new information, offering a point of comparison to the previous sentence.$qb$);
select seed_pool_question($qb$CB-0839a4b9$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Coastal Futures Conservatory in Virginia is known for creating aural representations of ecological data. One such effort combines
underwater audio recorded in seagrass beds with data that track rising carbon levels in the seagrass. As carbon levels increase, the audio is
correspondingly distorted; ______ listeners can “hear” the changes in the carbon levels.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "furthermore,"}, {"label": "B", "body": "by comparison,"}, {"label": "C", "body": "for instance,"}, {"label": "D", "body": "thus,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Thus" logically signals that the information in this clause—that listeners can "hear" carbon levels increasing—is a
result of the previous information about the audio distorting as carbon levels increase.
Choice A is incorrect because "furthermore" illogically signals that the information in this clause merely adds to the previous information about
the audio distorting as carbon levels rise. Instead, the listeners’ ability to "hear" carbon levels increasing is a result of that distortion. Choice B is
incorrect because "by comparison" illogically signals that the information in this clause is being compared to the information about the audio
distorting as carbon levels rise. Instead, the listeners’ ability to "hear" carbon levels increasing is a result of that distortion. Choice C is incorrect
because "for instance" illogically signals that the information in this clause is an example of how the audio distorts as carbon levels rise. Instead,
the audio was distorted for the express purpose of representing ecological data; the listeners’ ability to "hear" carbon levels increasing is a direct,
intended result of the distortion, not merely an example of it.$qb$);
select seed_pool_question($qb$CB-ab1f424a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Working together with the Navajo Nation Department of Water Resources, Dr. Lani Tsinnajinnie analyzed data about snowpack levels in the
Chuska Mountains. She found that the snowpack (the amount of snow on the ground) was deepest in early March at lower elevations. At higher
elevations, ______ the snowpack was deepest in mid-March.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in other words,"}, {"label": "B", "body": "for instance,"}, {"label": "C", "body": "on the other hand,"}, {"label": "D", "body": "in summary,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "On the other hand" logically signals that the information in the sentence—that the snowpack at higher elevations in
the Chuska Mountains was deepest in mid-March—contrasts with the previous information about the snowpack at lower elevations being
deepest in early March.
Choice A is incorrect because "in other words" illogically signals that information in the sentence is merely a paraphrase or restatement of the
previous information about the snowpack at lower elevations. Instead, the information about the snowpack at higher elevations contrasts with
that information. Choice B is incorrect because "for instance" illogically signals that the information in the sentence exemplifies the previous
information about the snowpack at lower elevations. Instead, the information about the snowpack at higher elevations contrasts with that
information. Choice D is incorrect because "in summary" illogically signals that the information in the sentence summarizes the previous
information about the snowpack at lower elevations. Instead, the information about the snowpack at higher elevations contrasts with that
information.$qb$);
select seed_pool_question($qb$CB-54f29331$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The green iguana is a species of reptile.
· It can be found in Central America and Brazil.
? The green iguana primarily eats leaves and fruit.
? It has an average length of 4.8 feet.
The student wants to specify the average length of the green iguana. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-54f29331.png$qb$, $qb$[{"label": "A", "body": "The green iguana can be found in Central America."}, {"label": "B", "body": "The green iguana has an average length of 4.8 feet."}, {"label": "C", "body": "One species of reptile found in Brazil primarily eats leaves and fruit."}, {"label": "D", "body": "The green iguana is a reptile that primarily eats leaves and fruit."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence specifies the average length of the green iguana: 4.8 feet.
Choice A is incorrect. While the sentence provides information about the green iguana, it doesn’t specify the green iguana’s average length.
Choice C is incorrect. The sentence describes the diet of a species of reptile in Brazil; it doesn’t specify the green iguana’s average length. Choice
D is incorrect. While the sentence provides information about the green iguana, it doesn’t specify the green iguana’s average length.$qb$);
select seed_pool_question($qb$CB-28a46cb0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The international Slow Food movement was founded in 1989 with the signing of the “Slow Food Manifesto.”
· The movement promotes universal access to healthy, high-quality food.
? It calls for sustainable food production practices that protect local environments, ecosystems, and biodiversity.
? It advocates for fair treatment of and compensation for food production workers.
? The Slow Food USA organization was founded in 2000.
The student wants to introduce the Slow Food movement to a new audience. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-28a46cb0.png$qb$, $qb$[{"label": "A", "body": "The international Slow Food movement, founded in 1989, promotes universal access to healthy, high-quality food that is produced sustainably by workers who are treated and compensated fairly."}, {"label": "B", "body": "The signing of the “Slow Food Manifesto” in 1989 marked the founding of the international Slow Food movement, while the Slow Food USA organization was founded in 2000."}, {"label": "C", "body": "The Slow Food movement advocates for food production workers."}, {"label": "D", "body": "Goals of the movement include universal access to healthy, high-quality food and sustainable food practices."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence effectively introduces the Slow Food movement to a new audience, explaining that the movement,
which was founded in 1989, promotes universal access to high-quality and healthy food that is produced sustainably by workers who are treated
fairly.
Choice B is incorrect. While the sentence indicates when the international Slow Food movement and the Slow Food USA organization were
founded, it doesn’t effectively introduce the movement to a new audience. Choice C is incorrect. While the sentence notes that the Slow Food
movement includes advocacy for food production workers, it doesn’t effectively introduce the movement to a new audience. Choice D is
incorrect. While the sentence describes some of the goals of the Slow Food movement, it doesn’t effectively introduce the movement to a new
audience.$qb$);
select seed_pool_question($qb$CB-259d16ac$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 1859, the novel Adam Bede was published in England.
· According to the novel’s title page, the author’s name was George Eliot.
? George Eliot was widely assumed to be a pseudonym.
? A pseudonym is a fake name used to conceal an author’s identity.
? A woman named Mary Ann Evans later revealed herself as the novel’s real author.
The student wants to identify the real author of Adam Bede. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-259d16ac.png$qb$, $qb$[{"label": "A", "body": "The real author of Adam Bede was Mary Ann Evans, who published the novel using the pseudonym George Eliot."}, {"label": "B", "body": "George Eliot, which Adam Bede’s title page indicated was the name of the novel’s author, was widely assumed to be a pseudonym."}, {"label": "C", "body": "The title page of the novel Adam Bede indicated that the author’s name was George Eliot."}, {"label": "D", "body": "A woman who had used a pseudonym to conceal her identity later revealed herself as the real author of Adam Bede."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence identifies the novel’s real author, explaining that Mary Ann Evans published the novel under the
pseudonym of George Eliot.
Choice B is incorrect. The sentence explains that George Eliot was assumed to be a pseudonym; it doesn’t identify the novel’s real author. Choice
C is incorrect. The sentence specifies the pseudonym used on the novel’s title page; it doesn’t identify the novel’s real author. Choice D is
incorrect. While the sentence indicates that the novel’s real author used a pseudonym, it doesn’t identify that author as Mary Ann Evans.$qb$);
select seed_pool_question($qb$CB-f2f6009b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Little is known about the life of Wong Fei-hung (1847–1925).
· He was born near Foshan, China, and gained local recognition as a physician and Hung Ga (also known as Hung Gar) Kung Fu master.
? He achieved many incredible martial arts feats—some confirmed and some rumored.
? He has become an internationally known folk hero thanks to his depiction in over a hundred films, television shows, and other media.
? In the 1991 film Once Upon a Time in China, actor Jet Li portrays Wong Fei-hung using superhuman kung fu abilities to save his
community.
The student wants to emphasize the effect media had on building Wong Fei-hung’s legacy. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f2f6009b.png$qb$, $qb$[{"label": "A", "body": "Thanks to his depiction in over a hundred pieces of media, Wong Fei-hung was locally known as a successful physician and Hung Ga Kung Fu master."}, {"label": "B", "body": "Though he was known locally during his lifetime, Wong Fei-hung’s later depiction in television, film, and other media has turned him into an internationally known folk hero."}, {"label": "C", "body": "Various media have depicted Wong Fei-hung, the successful physician and kung fu master who became an internationally known folk hero."}, {"label": "D", "body": "Wong Fei-hung’s abilities as a kung fu master are depicted in many media, including the 1991 film Once Upon a Time in China."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence emphasizes the effect media had on building Wong Fei-hung’s legacy, noting that media depictions
after his lifetime turned Wong Fei-hung into an internationally known folk hero.
Choice A is incorrect. While it appears to emphasize the effect of media depictions of Wong Fei-hung, the sentence misrepresents information
from the notes. According to the notes, media depictions resulted in Wong Fei-hung becoming an internationally known folk hero, not a locally
known physician and kung fu master. Choice C is incorrect. The sentence discusses Wong Fei-hung’s legacy, noting that he became an
internationally known folk hero, but it doesn’t emphasize the effect media had on building that legacy. Choice D is incorrect. The sentence
indicates that Wong Fei-hung has been depicted in many media but doesn’t emphasize the effect of these media depictions on building his
legacy.$qb$);
select seed_pool_question($qb$CB-8d1ddd1b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Ducklings expend up to 62.8% less energy when swimming in a line behind their mother than when swimming alone.
· The physics behind this energy savings hasn’t always been well understood.
? Naval architect Zhiming Yuan used computer simulations to study the effect of the mother duck’s wake.
? The study revealed that ducklings are pushed in a forward direction by the wake’s waves.
? Yuan determined this push reduces the effect of wave drag on the ducklings by 158%.
The student wants to present the study and its methodology. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8d1ddd1b.png$qb$, $qb$[{"label": "A", "body": "A study revealed that ducklings, which expend up to 62.8% less energy when swimming in a line behind their mother, also experience 158% less drag."}, {"label": "B", "body": "Seeking to understand how ducklings swimming in a line behind their mother save energy, Zhiming Yuan used computer simulations to study the effect of the mother duck’s wake."}, {"label": "C", "body": "Zhiming Yuan studied the physics behind the fact that by being pushed in a forward direction by waves, ducklings save energy."}, {"label": "D", "body": "Naval architect Zhiming Yuan discovered that ducklings are pushed in a forward direction by the waves of their mother’s wake, reducing the effect of drag by 158%."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence presents both the study and its methodology (that is, the researcher’s approach to the problem),
explaining that Yuan used computer simulations to study the effect of the mother duck’s wake on the ducklings’ energy expenditure.
Choice A is incorrect. The sentence describes the findings of Yuan’s study; it doesn’t present the study and its methodology. Choice C is
incorrect. While the sentence provides general information about Yuan’s study, it doesn’t present the study’s methodology. Choice D is incorrect.
The sentence describes the findings of Yuan’s study; it doesn’t present the study and its methodology.$qb$);
select seed_pool_question($qb$CB-ff1a2e5e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Historians agree that the jazz pianist Jelly Roll Morton was exaggerating when he claimed to have invented jazz music. No one can deny, ______
that Morton’s innovative compositions and remarkable improvisational skills helped shape jazz as a genre during its early years.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "therefore,"}, {"label": "B", "body": "in the second place,"}, {"label": "C", "body": "in other words,"}, {"label": "D", "body": "though,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Though" logically signals that the claim in the sentence—that Morton’s improvisational skills helped shape jazz as a
genre during its early years ("No one can deny" it)—is true despite the previous information about Morton’s exaggerated claim to have invented
jazz.
Choice A is incorrect because "therefore" illogically signals that the claim in the sentence is a result of the previous information about Morton’s
claim to have invented jazz. Instead, the sentence states that Morton helped to shape jazz—even if his claim was an exaggeration. Choice B is
incorrect because "in the second place" illogically signals that the claim in the sentence is a second, separate point in addition to Morton’s claim
to have invented jazz. Instead, the sentence states that Morton helped to shape jazz—even if his claim was an exaggeration. Choice C is
incorrect because "in other words" illogically signals that the claim in the sentence is merely a paraphrase or restatement of the previous
information about Morton’s claim to have invented jazz. Instead, the sentence states that Morton helped to shape jazz—even if his claim was an
exaggeration.$qb$);
select seed_pool_question($qb$CB-b5972710$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Niger ratified the Outer Space Treaty, an international agreement with over 100 signing nations that acts as the foundation for the laws of space,
on February 1, 1967. Jordan, ______ has yet to officially ratify the treaty; it only signed it.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in contrast,"}, {"label": "B", "body": "specifically,"}, {"label": "C", "body": "for example,"}, {"label": "D", "body": "similarly,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "In contrast" logically signals that the information in this sentence—that Jordan has yet to officially ratify the treaty—
contrasts with the previous information about Niger having already ratified the treaty.
Choice B is incorrect because "specifically" illogically signals that the information in this sentence specifies or elaborates on the previous
information about Niger ratifying the treaty. Instead, the sentence changes subjects from Niger to Jordan, presenting contrasting information
about Jordan’s treaty status. Choice C is incorrect because "for example" illogically signals that the information in this sentence exemplifies the
previous information about Niger ratifying the treaty. Instead, the sentence explains that Jordan has yet to ratify the treaty. Choice D is incorrect
because "similarly" illogically signals that the information in this sentence is similar to the previous information about Niger ratifying the treaty.
Instead, the sentence presents contrasting information that Jordan has yet to ratify the treaty.$qb$);
select seed_pool_question($qb$CB-82ec9628$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Archaeologist Sue Brunning explains why the seventh-century ship burial site at Sutton Hoo in England was likely the tomb of a king. First, the
gold artifacts inside the ship suggest that the person buried with them was a wealthy and respected leader. ______ the massive effort required to
bury the ship would likely only have been undertaken for a king.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Instead,"}, {"label": "B", "body": "Still,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "Second,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Second” logically signals that the information in this sentence—that the effort to bury the ship would likely only
have been made for a king—joins the information in the previous sentence (“first…”) in supporting Brunning’s claim that the burial site was likely
the tomb of a king.
Choice A is incorrect because “instead” illogically signals that the information in this sentence presents an alternative or substitute to the
previous information about the gold artifacts inside the ship. Rather, this sentence presents a second piece of information that supports
Brunning’s claim. Choice B is incorrect because “still” illogically signals that the information in this sentence exists in contrast to or despite the
previous information about the gold artifacts inside the ship. Instead, this sentence presents a second piece of information that supports
Brunning’s claim. Choice C is incorrect because “specifically” illogically signals that the information in this sentence specifies or elaborates on
the previous information about the gold artifacts inside the ship. Instead, this sentence presents a second piece of information that supports
Brunning’s claim.$qb$);
select seed_pool_question($qb$CB-7c3f0145$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In a 2022 analysis of 200 terms, researchers found a broad pattern of valence-dependent mutation for which negative words saw a faster rate of
cognate replacement—______ the rate at which a word will be replaced over time with a noncognate form. Adjectives (e.g., “afraid”) saw the
largest effect; nouns (e.g., “attack”), meanwhile, saw the smallest.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "for example,"}, {"label": "B", "body": "likewise,"}, {"label": "C", "body": "in addition,"}, {"label": "D", "body": "that is,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "That is" logically signals that the information that follows in the sentence clarifies a term used in the previous
discussion of the researchers’ findings: cognate replacement.
Choice A is incorrect because "for example" illogically signals that the information that follows in the sentence provides a specific example of
the research findings described earlier. Instead, it clarifies a term introduced earlier in the sentence. Choice B is incorrect because "likewise"
illogically signals that the information that follows in the sentence is similar to the previous information about the researchers’ findings. Instead,
it clarifies a term introduced earlier in the sentence. Choice C is incorrect because "in addition" illogically signals that the information that follows
in the sentence merely adds to the previous information about the researchers’ findings. Instead, it clarifies a term introduced earlier in the
sentence.$qb$);
select seed_pool_question($qb$CB-ba263620$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 1897, African American inventor Andrew Beard invented an automatic coupler.
· It improved on the existing design of train car couplers.
? It made the job of connecting train cars safer.
? In 1938, African American inventor Frederick Jones invented a mobile refrigeration system.
? It improved on the existing design of food transport trucks.
? It enabled trucks to carry perishable foods farther.
The student wants to emphasize a similarity between Beard’s invention and Jones’s invention. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ba263620.png$qb$, $qb$[{"label": "A", "body": "Beard’s automatic coupler and Jones’s mobile refrigeration system both improved on existing designs."}, {"label": "B", "body": "In 1897, Beard invented an automatic coupler, which made the job of connecting train cars safer."}, {"label": "C", "body": "Beard’s invention made the job of connecting train cars safer, whereas Jones’s invention enabled food transport trucks to carry perishables farther."}, {"label": "D", "body": "Jones’s mobile refrigeration system, which he invented in 1938, made it possible for food transport trucks to carry perishable foods farther."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. It compares Beard’s and Jones’s inventions to one another, and emphasizes what they have in common.
Choice B is incorrect. This choice doesn’t emphasize a similarity. It only mentions Beard’s invention. It doesn’t compare it to Jones’s invention.
Choice C is incorrect. This choice doesn’t emphasize a similarity between the two inventions. Instead, it emphasizes a difference. Choice D is
incorrect. This choice doesn’t emphasize a similarity. It only mentions Jones’s invention. It doesn’t compare it to Beard’s invention.$qb$);
select seed_pool_question($qb$CB-4f2710ab$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Organisms have evolved a number of surprising adaptations to ensure their survival in adverse conditions. Tadpole shrimp (Triops longicaudatus)
embryos, ______ can pause development for over ten years during extended periods of drought.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in contrast,"}, {"label": "B", "body": "for example,"}, {"label": "C", "body": "meanwhile,"}, {"label": "D", "body": "consequently,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “For example” logically signals that the information in this sentence—that tadpole shrimp embryos can pause
development during extended periods of drought—exemplifies the previous sentence’s claim that organisms have evolved surprising adaptations
to survive in adverse conditions.
Choice A is incorrect because “in contrast” illogically signals that the information in this sentence contrasts with the claim about organisms in
the previous sentence. Instead, it exemplifies this claim. Choice C is incorrect because “meanwhile” illogically signals that the information in this
sentence is separate from (while occurring simultaneously with) the claim about organisms in the previous sentence. Instead, it exemplifies this
claim. Choice D is incorrect because “consequently” illogically signals that the information in this sentence is a consequence, or result, of the
claim about organisms in the previous sentence. Instead, it exemplifies this claim.$qb$);
select seed_pool_question($qb$CB-480ade7e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In response to adverse environmental conditions, many plants produce abscisic acid (ABA), a stress hormone. ABA triggers a slowdown in the
biological processes of most plants. ______ when the mustard plant Schrenkiella parvula produces ABA in response to an environmental stressor,
the hormone triggers accelerated growth.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Moreover,"}, {"label": "B", "body": "In contrast,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Thus,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “In contrast” logically signals that the information in this sentence—that ABA triggers accelerated growth in the
mustard plant Schrenkiella parvula—contrasts with the previous information about ABA triggering a slowdown in most plants’ biological
processes.
Choice A is incorrect because “moreover” illogically signals that the information in this sentence about the mustard plant merely adds to the
previous information about the effects of ABA. Instead, it contrasts with that information. Choice C is incorrect because “for example” illogically
signals that the information in this sentence about the mustard plant provides an example consistent with the previous information about the
effects of ABA. Instead, it contrasts with that information. Choice D is incorrect because “thus” illogically signals that the information in this
sentence about the mustard plant is a consequence, or result, of the previous information about the effects of ABA. Instead, it contrasts with that
information.$qb$);
select seed_pool_question($qb$CB-c61fb134$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$As Iestyn Barr and his team of researchers discovered when establishing the glacial timeline of Antarctica, the Transantarctic Mountains—a
3,500-km mountain range spanning the continent—are home to glaciers of at least 60 million years in age. ______ the researchers concluded,
Antarctica had glaciers long before the formation of its continent-wide ice sheet 34 million years ago.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "By contrast,"}, {"label": "B", "body": "Thus,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Even so,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Thus” logically signals that the information in this sentence—that the researchers concluded that Antarctica had
glaciers long before the formation of its continent-wide ice sheet—is a result of the previous information about the discovery that Antarctica’s
glaciers are at least 60 million years old, whereas its continent-wide ice sheet formed just 34 million years ago.
Choice A is incorrect because “by contrast” illogically signals that the researchers’ conclusion about Antarctica having glaciers before its ice
sheet formed contrasts with the previous finding about the age of Antarctica’s glaciers. Instead, the conclusion is a result of that finding. Choice
C is incorrect because “nevertheless” illogically signals that the researchers’ conclusion about Antarctica having glaciers before its ice sheet
formed is true despite the previous finding about the age of Antarctica’s glaciers. Instead, the conclusion is a result of that finding. Choice D is
incorrect because “even so” illogically signals that the researchers’ conclusion about Antarctica having glaciers before its ice sheet formed is
true despite the previous finding about the age of Antarctica’s glaciers. Instead, the conclusion is a result of that finding.$qb$);
select seed_pool_question($qb$CB-34a5ba1c$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$By 1936, Spanish Romani dancer Carmen Amaya was known all over Spain for her powerful style of flamenco dancing. However, in July of that
year, the outbreak of the Spanish Civil War made it difficult for her to perform in her home country. ______ Amaya left Spain to perform abroad,
dancing for audiences across North and South America.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In comparison,"}, {"label": "B", "body": "As a result,"}, {"label": "C", "body": "First of all,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “As a result” logically signals that the information in this sentence about Amaya leaving Spain to perform abroad is a
result of the previous information about the Spanish Civil War.
Choice A is incorrect because “in comparison” illogically signals that the information in this sentence is being compared to the previous
information about the Spanish Civil War. Instead, Amaya leaving Spain is a result of that war. Choice C is incorrect because “first of all” illogically
signals that the information in this sentence is the beginning of a sequence of events. Instead, Amaya leaving Spain is a result of the event (the
outbreak of war) described in the previous sentence. Choice D is incorrect because “for example” illogically signals that the information in this
sentence is an example supporting the previous statement about the Spanish Civil War. Instead, Amaya leaving Spain is a result of that war.$qb$);
select seed_pool_question($qb$CB-b44141cf$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Researchers in a 2021 study wanted to determine the rate at which 17 languages conveyed both information and syllables.
· They calculated the bits of information conveyed per second (the IR, or information rate).
? The IR was found to be approximately consistent across the 17 languages (an average of 39 bits per second).
? They calculated the number of syllables spoken per second (the SR, or syllable rate).
? Spanish had the second-fastest SR (7.7 syllables per second).
? Vietnamese had the sixteenth-fastest SR (5.3 syllables per second).
The student wants to present an overview of the study’s findings. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b44141cf.png$qb$, $qb$[{"label": "A", "body": "The 2021 study determined the information rate (IR) of 17 languages in bits of information conveyed per second."}, {"label": "B", "body": "Researchers found that information was conveyed more quickly in Spanish, at 7.7 syllables per second, than in Vietnamese, at 5.3 syllables per second."}, {"label": "C", "body": "Vietnamese had the sixteenth-fastest syllable rate, lower than that of Spanish, which had the second-fastest; however, Spanish had the lower information rate of the two."}, {"label": "D", "body": "Though some of the languages differed in number of syllables spoken per second, all 17 conveyed information at roughly the same rate."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence presents an overview of the study’s findings, noting that, for some of the languages (the examples of
Spanish and Vietnamese are given in the notes), the number of syllables spoken per second varied, while the amount of information conveyed
per second remained roughly constant across all 17 languages.
Choice A is incorrect. While the sentence describes one of the metrics the study assessed, it doesn’t present any of the study’s findings. Choice
B is incorrect. While the sentence compares specific findings about two of the languages studied, it doesn’t provide an overview of the study’s
findings across all 17 languages. Choice C is incorrect. The sentence compares specific findings about two of the languages studied; it doesn’t
provide an overview of the study’s findings across all 17 languages. It also misrepresents the information from the notes about Spanish’s
information rate.$qb$);
select seed_pool_question($qb$CB-c34d6bff$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? African American women played prominent roles in the Civil Rights Movement, including at the famous 1963 March on Washington.
· Civil rights activist Anna Hedgeman, one of the march’s organizers, was a political adviser who had worked for President Truman.
? Civil rights activist Daisy Bates was a well-known journalist and advocate for school desegregation.
? Hedgeman worked behind the scenes to make sure a woman was included in the lineup of speakers at the march.
? Bates was the sole woman to speak, delivering a brief but memorable address to the cheering crowd.
The student wants to compare the two women’s contributions to the March on Washington. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c34d6bff.png$qb$, $qb$[{"label": "A", "body": "Hedgeman and Bates contributed to the march in different ways; Bates, for example, delivered a brief but memorable address."}, {"label": "B", "body": "Hedgeman worked in politics and helped organize the march, while Bates was a journalist and school desegregation advocate."}, {"label": "C", "body": "Although Hedgeman worked behind the scenes to make sure a woman speaker was included, Bates was the sole woman to speak at the march."}, {"label": "D", "body": "Many African American women, including Bates and Hedgeman, fought for civil rights, but only one spoke at the march."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence compares the two women’s contributions to the march: Hedgeman worked behind the scenes to
make sure a woman speaker was included, whereas Bates actually spoke at the event.
Choice A is incorrect. While it acknowledges that the two women both contributed to the march, it doesn’t indicate what Hedgeman did, so no
comparison is made. Choice B is incorrect. While the sentence provides information about the two women, it doesn’t mention anything about
Bates’s contribution to the march. Choice D is incorrect. While the sentence indicates that the two women both fought for civil rights, it doesn’t
compare their individual contributions to the march.$qb$);
select seed_pool_question($qb$CB-ac8eb085$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$“O2 Arena,” an award-winning science fiction story by Nigerian author Oghenechovwe Donald Ekpeki, takes place in an alternate version of
Nigeria where breathable air is a rare commodity that is owned and sold by companies. ______ people must purchase it with currency called O2
credits.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "As a result,"}, {"label": "B", "body": "In any case,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Earlier,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The second sentence describes a consequence of the system laid out in the first sentence: because air is owned
and sold by companies in this world, people have to buy it.
Choice B is incorrect. This choice uses a transition that means “no matter what happens” or “whatever the situation is,” which doesn’t make
sense here. There’s only one situation described in the text: a fictional world in which companies own all the breathable air, forcing people to buy
it. Choice C is incorrect. This choice uses a disagreement transition. But this sentence doesn’t disagree with the previous sentence. They both
describe the same fictional situation. Choice D is incorrect. This choice uses a transition that indicates a shift back in time, which doesn’t make
sense here. Both sentences use the present tense, as they’re describing the same fictional time period.$qb$);
select seed_pool_question($qb$CB-37957752$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$As biologist Terrie Williams has documented, deep dives present a challenge for seals and other marine mammals. A seal must exert enough
energy to propel itself hundreds of meters downward, while keeping its heart rate low enough that it doesn’t run out of oxygen while underwater.
______ a seal moves its flippers as little as possible on a deep dive, gliding to conserve energy.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In the first place,"}, {"label": "B", "body": "On the other hand,"}, {"label": "C", "body": "For this reason,"}, {"label": "D", "body": "In comparison,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “For this reason” logically signals that the behavior described in this sentence is a consequence of the information
about seals in the previous sentence. That is, a seal moves its flippers as little as possible during a deep dive because it needs to keep its heart
rate low enough that it does not run out of oxygen.
Choice A is incorrect because “in the first place” illogically signals that this sentence is the first point in a discussion. Instead, the sentence
describes a behavior that is a consequence of the previous information about seals. Choice B is incorrect because “on the other hand” illogically
signals that the behavior described in this sentence contrasts with the previous information about seals. Instead, it is a consequence of that
information. Choice D is incorrect because “in comparison” illogically signals that the behavior described in this sentence is being compared to
the previous information about seals. Instead, it is a consequence of that information.$qb$);
select seed_pool_question($qb$CB-2b5f4bdc$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the early 1900s, Jovita Idár fought injustice on both sides of the Mexico–United States border. As a reporter for the Texas newspaper La
Crónica, she voiced support for the Mexican people’s revolt against authoritarian rule. ______ she founded the League of Mexican Women, a
group that advocated for the rights of Mexican Americans.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Additionally,"}, {"label": "B", "body": "In conclusion,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Rather,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because “additionally” logically signals that the information in this sentence—that Idár founded the League of
Mexican Women—is another instance of Idár fighting injustice, this time advocating for the rights of Mexican Americans.
Choice B is incorrect because “in conclusion” illogically signals that the information in this sentence sums up or concludes the discussion of
Idár’s support for the Mexican people’s revolt. Instead, the founding of the League of Mexican Women is a separate instance of Idár fighting
injustice. Choice C is incorrect because “for example” illogically signals that the information in this sentence is an example of how, as a
newspaper reporter, Idár voiced support for the Mexican people’s revolt. Instead, the founding of the League of Mexican Women is a separate
instance of Idár fighting injustice, this time in support of Mexican Americans. Choice D is incorrect because “rather” illogically signals that the
information in this sentence offers a contrast or exception to the previous information about Idár’s support for the Mexican people’s revolt.
Instead, the founding of the League of Mexican Women is a separate instance of Idár fighting injustice.$qb$);
select seed_pool_question($qb$CB-90117366$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$To explore how blinking affects social interactions, Dutch researchers observed interactions between human speakers and “listeners” (animated
human faces on a screen). The researchers found that when the listeners blinked slowly, the speakers tended to talk for less time. ______ quicker
blinks were associated with longer talking times.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "Specifically,"}, {"label": "C", "body": "Firstly,"}, {"label": "D", "body": "By contrast,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “By contrast” logically signals that the finding described in this sentence contrasts with the finding described in the
previous sentence. That is, quicker blinks were associated with longer talking times, whereas slower blinks were associated with shorter talking
times.
Choice A is incorrect because “for example” illogically signals that the finding described in this sentence is an example of the finding described
in the previous sentence. Instead, it contrasts with that finding. Choice B is incorrect because “specifically” illogically signals that this sentence
provides specific, precise details about the finding described in the previous sentence. Instead, it presents information that contrasts with that
finding. Choice C is incorrect because “firstly” illogically signals that the finding described in this sentence is a first point or occurs first in a
chronological sequence of events. Instead, it contrasts with the finding described in the previous sentence.$qb$);
select seed_pool_question($qb$CB-a204d618$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1949, Frank Zamboni developed an ice rink resurfacing machine. As Zamboni’s machine moved along the rink’s surface, it first scraped off the
top layer of ice. ______ it sprayed water into the deep grooves left behind by customers’ skates. Lastly, it smoothed over the newly formed ice.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "Next,"}, {"label": "C", "body": "Similarly,"}, {"label": "D", "body": "In contrast,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Next" logically signals that the action in this sentence—the water spraying—is the next step in the resurfacing
process, following the ice scraping mentioned in the previous sentence.
Choice A is incorrect because "for example" illogically signals that the action in this sentence is an example of the action in the previous
sentence. Instead, the water spraying is the next step in a process that begins with the ice scraping. Choice C is incorrect because "similarly"
illogically signals that the action in this sentence is similar to the action in the previous sentence. Instead, the water spraying is the next step in a
process that begins with the ice scraping. Choice D is incorrect because "in contrast" illogically signals that the action in this sentence contrasts
with the action in the previous sentence. Instead, the water spraying is the next step in a process that begins with the ice scraping.$qb$);
select seed_pool_question($qb$CB-ed80971c$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Pueblo of Zuni is located about 150 miles west of Albuquerque, New Mexico.
· It is the traditional home of the A:shiwi (Zuni) people.
? The A:shiwi A:wan Museum and Heritage Center was established by tribal members in 1992.
? Its mission is stated on its website: “As a tribal museum and heritage center for the Zuni people and by the Zuni people we work to
provide learning experiences that emphasize A:shiwi ways of knowing, as well as exploring modern concepts of knowledge and the
transfer of knowledge.”
The student wants to emphasize how long the museum has existed. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ed80971c.png$qb$, $qb$[{"label": "A", "body": "The Pueblo of Zuni is home to the A:shiwi A:wan Museum and Heritage Center, which was founded by tribal members."}, {"label": "B", "body": "The A:shiwi A:wan Museum and Heritage Center has served the Pueblo of Zuni since 1992."}, {"label": "C", "body": "According to its website, the A:shiwi A:wan Museum and Heritage Center (founded in the 1990s) works to “emphasize A:shiwi ways of knowing.”"}, {"label": "D", "body": "Knowledge has been one of the central themes of the A:shiwi A:wan Museum and Heritage Center from its founding."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. This choice effectively uses information from the notes to emphasize how long the museum has existed. It says
that the museum has existed since 1992.
Choice A is incorrect. This choice doesn’t emphasize how long the museum has existed. It doesn’t say when the museum was founded. Choice C
is incorrect. This choice doesn’t emphasize how long the museum has existed. It doesn’t say the exact date of the museum’s founding. Rather, it
emphasizes the museum’s mission. Choice D is incorrect. This choice doesn’t emphasize how long the museum has existed. It doesn’t say when
the museum was founded.$qb$);
select seed_pool_question($qb$CB-8fbf206d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In Color Charts: A History (2024), anthropologist Anne Varichon uses vivid prose to describe various systems and tools that have been used over
the past few centuries for categorizing colors. ______ Varichon’s book features many high-quality images of these color presentation tools—from
fanlike arrangements of hued fabric swatches to clusters of dyed feathers.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Consequently,"}, {"label": "B", "body": "Additionally,"}, {"label": "C", "body": "That said,"}, {"label": "D", "body": "Specifically,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Additionally” logically signals that the information in this sentence—that Varichon’s book features many high-quality
images of color presentation tools—is an additional feature of the book, supplementing the vivid prose descriptions of these tools mentioned in
the previous sentence.
Choice A is incorrect because “consequently” illogically signals that the information about the book’s high-quality images is a result or
consequence of the previous statement about Varichon’s vivid prose descriptions. Instead, the images are an additional feature of the book.
Choice C is incorrect because “that said” illogically signals that the information about the book’s high-quality images is an exception to or
qualification of the previous statement about Varichon’s vivid prose descriptions. Instead, the images are an additional feature of the book.
Choice D is incorrect because “specifically” illogically signals that the information about the book’s high-quality images provides specific, precise
details about the vivid prose descriptions mentioned in the previous sentence. Instead, the images are an additional feature of the book.$qb$);
select seed_pool_question($qb$CB-114bbce6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Earthquakes start at a point called a “focus” and spread out from there as seismic waves.
· The two types of seismic waves that travel beneath Earth’s surface are primary waves (P waves) and secondary waves (S waves).
? P waves travel more quickly beneath Earth’s surface than do S waves.
? P waves compress and expand the ground, causing it to move backward and forward.
? S waves cause the ground to move from side to side.
The student wants to emphasize a similarity between P waves and S waves. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-114bbce6.png$qb$, $qb$[{"label": "A", "body": "P waves and S waves both travel beneath Earth’s surface, causing the ground to move."}, {"label": "B", "body": "P waves travel away from an earthquake’s starting point at a higher rate of speed than do S waves."}, {"label": "C", "body": "Spreading out from the focus of an earthquake, P waves move the ground backward and forward."}, {"label": "D", "body": "Although P waves and S waves start at the same point, they behave very differently."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes a similarity between P waves and S waves, noting that they both travel beneath Earth’s
surface, thereby causing the ground to move.
Choice B is incorrect. The sentence emphasizes a difference between P waves and S waves, noting that P waves travel faster than S waves; it
doesn’t emphasize a similarity between the two types of waves. Choice C is incorrect. The sentence emphasizes how P waves move; it doesn’t
emphasize a similarity between P waves and S waves. Choice D is incorrect. While the sentence acknowledges that P waves and S waves start
at the same point, it doesn’t emphasize a similarity; instead, the sentence emphasizes a difference between the two types of waves, noting that
they behave very differently.$qb$);
select seed_pool_question($qb$CB-b6ebadf6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are three basic steps you should follow when planning a scientific inquiry. First, thoroughly research the question you wish to answer.
______ come up with a prediction (also called a hypothesis) about the answer to your question. Third, develop an experiment that can test the
accuracy of your hypothesis.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Therefore,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Second,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Second" logically signals that the activity described in this sentence—coming up with a prediction—is the next step
in the three-part sequence of steps described in the text.
Choice A is incorrect because "therefore" illogically signals that coming up with a prediction is a result or consequence of the activity described
in the previous sentence: researching a question. While a prediction may be influenced by prior research, these activities are distinct steps in
planning a scientific inquiry. Coming up with a prediction is the next step in the three-part sequence of steps described in the text. Choice B is
incorrect because "instead" illogically signals that coming up with a prediction is an alternative to the activity described in the previous sentence:
researching a question. Rather, coming up with a prediction is the next step in the three-part sequence of steps described in the text. Choice C is
incorrect because "for example" illogically signals that coming up with a prediction is an example of the activity described in the previous
sentence: researching a question. Instead, coming up with a prediction is the next step in the three-part sequence of steps described in the text.$qb$);
select seed_pool_question($qb$CB-13f36b03$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Jon Ching is a Los Angeles-based painter.
· He uses the term “flauna” to describe the plant-animal hybrids that he depicts in his surreal paintings.
? “Flauna” is a combination of the words “flora” and “fauna.”
? His painting Nectar depicts a parrot with leaves for feathers.
? His painting Primaveral depicts a snow leopard whose fur sprouts flowers.
The student wants to provide an explanation and example of “flauna.” Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-13f36b03.png$qb$, $qb$[{"label": "A", "body": "The term “flauna,” used by Los Angeles-based painter Jon Ching, is a combination of the words “flora” and “fauna.”"}, {"label": "B", "body": "Jon Ching uses the term “flauna,” a combination of the words “flora” and “fauna,” to describe the subjects of his surreal paintings: plant-animal hybrids such as a parrot with leaves for feathers."}, {"label": "C", "body": "Jon Ching, who created Nectar, refers to the subjects of his paintings as “flauna.”"}, {"label": "D", "body": "The subjects of Nectar and Primaveral are types of “flauna,” a term that the paintings’ creator, Jon Ching, uses when describing his surreal artworks."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it provides both an explanation and an example of “flauna.” The sentence explains that flauna, a
combination of the words “flora” and “fauna,” is a term used by Jon Ching to describe the plant-animal hybrids in his paintings. The sentence also
mentions an example of Ching’s flauna: a parrot with leaves for feathers.
Choice A is incorrect. While the sentence partially explains what “flauna” is, it doesn’t provide a full explanation or specific example of Ching’s
flauna. Choice C is incorrect. While the sentence partially explains what “flauna” is and includes a title of a Ching painting, it doesn’t provide a full
explanation or specific example of Ching’s flauna. Choice D is incorrect. While the sentence partially explains what “flauna” is and includes the
titles of two Ching paintings, it doesn’t provide a full explanation of Ching’s flauna.$qb$);
select seed_pool_question($qb$CB-ec03f090$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? A sestina is a thirty-nine-line poetic form.
· Each line of the poem ends with one of six end words, which alternate according to a set pattern.
? “Forage Sestina” is a sestina by Marilyn Hacker.
? Its end words are words, structure, wire, beam, wall, and room.
? “Towards Autumn” is a sestina by Marilyn Hacker.
? Its end words are daughter, friend, bread, mother, lover, and myself.
The student wants to use one of the poems to illustrate the sestina form. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ec03f090.png$qb$, $qb$[{"label": "A", "body": "Hacker employs the sestina, a poetic form with thirty-nine lines and six end words, in both “Forage Sestina” and “Towards Autumn.”"}, {"label": "B", "body": "As a sestina, “Towards Autumn” contains thirty-nine lines and six end words—in this case, daughter, friend, bread, mother, lover, and myself— that alternate in a set pattern."}, {"label": "C", "body": "The thirty-nine-line sestina form uses the words daughter, friend, bread, mother, lover, and myself, which are found in the poem “Forage Sestina.”"}, {"label": "D", "body": "Hacker has used the sestina form multiple times, as in “Towards Autumn,” which contains these six words: words, structure, wire, beam, wall, and room."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence uses the poem "Towards Autumn" to illustrate the form of a sestina, explaining that a sestina’s thirty-
nine lines all end in one of six alternating words and showcasing that poem’s specific end words.
Choice A is incorrect. The sentence identifies both of Hacker’s poems as sestinas; it doesn’t use one of the poems to illustrate the form of a
sestina. Choice C is incorrect. While the sentence appears to use the poem "Forage Sestina" to illustrate a feature of the sestina form, it
misrepresents the information in the notes. According to the notes, "Forage Sestina" doesn’t use these six end words; it uses six other words
instead. Choice D is incorrect. While the sentence uses the poem "Towards Autumn" as an example of one of Hacker’s sestinas, it misrepresents
the information in the notes. According to the notes, "Towards Autumn" doesn’t use these six end words; it uses six other words instead.$qb$);
select seed_pool_question($qb$CB-52b31d7b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In November 1934, Amrita Sher-Gil was living in what must have seemed like the ideal city for a young artist: Paris. She was studying firsthand
the color-saturated style of France’s modernist masters and beginning to make a name for herself as a painter. ______ Sher-Gil longed to return to
her childhood home of India; only there, she believed, could her art truly flourish.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Still,"}, {"label": "B", "body": "Therefore,"}, {"label": "C", "body": "Indeed,"}, {"label": "D", "body": "Furthermore,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Still” logically signals that the information about Sher-Gil in this sentence—that she longed to leave Paris and return
to India—contrasts with what one would expect after reading about Sher-Gil’s experiences in Paris in the previous sentences.
Choice B is incorrect because “therefore” illogically signals that the information about Sher-Gil in this sentence is a result or consequence of the
descriptions in the previous sentences. Instead, this information contrasts with what one would expect after reading about Sher-Gil’s experiences
in Paris. Choice C is incorrect because “indeed” illogically signals that the information about Sher-Gil in this sentence offers additional emphasis
in support of the descriptions in the previous sentences. Instead, this information contrasts with what one would expect after reading about
Sher-Gil’s experiences in Paris. Choice D is incorrect because “furthermore” illogically signals that the information about Sher-Gil in this sentence
offers additional support for or confirmation of the descriptions in the previous sentences. Instead, this information contrasts with what one
would expect after reading about Sher-Gil’s experiences in Paris.$qb$);
select seed_pool_question($qb$CB-a86c0b1b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Ancient Native American and Australian Aboriginal cultures described the Pleiades star cluster as having seven stars.
· It was referred to as the Seven Sisters in the mythology of ancient Greece.
? Today, the cluster appears to have only six stars.
? Two of the stars have moved so close together that they now appear as one.
The student wants to specify the reason the Pleiades’ appearance changed. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a86c0b1b.png$qb$, $qb$[{"label": "A", "body": "Ancient Native American and Australian Aboriginal cultures described the Pleiades, which was referred to in Greek mythology as the Seven Sisters, as having seven stars."}, {"label": "B", "body": "Although once referred to as the Seven Sisters, the Pleiades appears to have only six stars today."}, {"label": "C", "body": "In the time since ancient cultures described the Pleiades as having seven stars, two of the cluster’s stars have moved so close together that they now appear as one."}, {"label": "D", "body": "The Pleiades has seven stars, but two are so close together that they appear to be a single star."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence specifies the reason the Pleiades’ appearance changed, noting that two of the cluster’s stars have
moved so close together that they now appear as one star.
Choice A is incorrect. The sentence specifies how ancient Native American and Australian Aboriginal cultures described the Pleiades; it doesn’t
specify the reason the Pleiades’ appearance changed. Choice B is incorrect. The sentence describes the appearance of the Pleiades today; it
doesn’t specify the reason the Pleiades’ appearance changed. Choice D is incorrect. The sentence explains why two of the Pleiades’ stars appear
to be a single star; it doesn’t specify the reason the Pleiades’ appearance changed.$qb$);
select seed_pool_question($qb$CB-eaded344$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The painter Frida Kahlo is one of the most influential artists of the twentieth century.
· She was born in Coyoacán, Mexico, in 1907.
? She is best known for her vivid and richly symbolic self-portraits.
? The Two Fridas (1939) features two versions of Kahlo sitting together.
? One version wears a European-style dress and the other a traditional Tehuana dress.
The student wants to introduce Kahlo to an audience unfamiliar with the artist. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-eaded344.png$qb$, $qb$[{"label": "A", "body": "Known for being vivid and richly symbolic, Frida Kahlo’s self-portraits include The Two Fridas (1939)."}, {"label": "B", "body": "The 1939 painting The Two Fridas is one example of a self-portrait by Frida Kahlo."}, {"label": "C", "body": "One painting by Frida Kahlo features two versions of herself, with one version wearing a European-style dress and the other a traditional Tehuana dress."}, {"label": "D", "body": "One of the most influential artists of the twentieth century, Mexican painter Frida Kahlo is best known for her self-portraits, which are vivid and richly symbolic."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. By identifying Kahlo as an influential artist from Mexico, and by describing the work she’s best known for, this choice
provides the background information necessary to introduce Kahlo to an unfamiliar audience.
Choice A is incorrect. This choice doesn’t effectively introduce Kahlo. It doesn’t include any background information about who Kahlo is or where
she’s from. It simply identifies one of her paintings. Choice B is incorrect. This choice doesn’t effectively introduce Kahlo. It doesn’t include any
background information about who Kahlo is or where she’s from. It simply identifies one of her paintings. Choice C is incorrect. This choice
doesn’t effectively introduce Kahlo. It doesn’t include any background information about who Kahlo is or where she’s from. Instead, it describes
one of her paintings in detail.$qb$);
select seed_pool_question($qb$CB-e2eb70b9$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Traditionally, manufacturers have dyed denim jeans blue by dipping them in a solution containing indigo powder.
· Indigo doesn’t dissolve in just water, so manufacturers must mix hazardous chemicals with water to dissolve the powder.
? Textile researcher Smriti Rai discovered a process for dyeing blue jeans without chemicals.
? Rai added indigo powder to a hydrogel containing nanocellulose and produced a dye that could be spread directly onto the denim.
? Nanocellulose is a natural, plant-based substance that separates the molecules of indigo powder.
The student wants to emphasize a difference between the two approaches to dyeing blue jeans. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e2eb70b9.png$qb$, $qb$[{"label": "A", "body": "Though created using a different process, Rai’s dye contains the same ingredient as the dye produced by blue jean manufacturers."}, {"label": "B", "body": "Nanocellulose is a natural, plant-based substance that separates the molecules of indigo powder, which doesn’t dissolve in water."}, {"label": "C", "body": "The traditional approach to dyeing blue jeans is to dip them in a solution containing hazardous chemicals."}, {"label": "D", "body": "Rai’s approach substitutes a natural, plant-based substance for the hazardous chemicals that manufacturers have traditionally used."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence emphasizes a difference between the two approaches to dyeing blue jeans, noting that Rai’s approach
uses a natural, plant-based substance in place of hazardous chemicals.
Choice A is incorrect. The sentence emphasizes a similarity between the dyes used in the two approaches, noting that the dyes contain the same
ingredient; it doesn’t emphasize a difference between the two approaches to dyeing blue jeans. Choice B is incorrect. The sentence explains
what nanocellulose is; it doesn’t emphasize a difference between the two approaches to dyeing blue jeans. Choice C is incorrect. The sentence
explains the traditional approach to dyeing blue jeans; it doesn’t emphasize a difference between the traditional approach and Rai’s approach.$qb$);
select seed_pool_question($qb$CB-c40a1964$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Leigh Torres is a marine ecologist.
· She conducted a study of blue whales in New Zealand’s South Taranaki Bight region.
? She wanted to know how ocean temperature affects where the whales forage for krill in that region.
? She found that during a marine heat wave, the whales foraged farther offshore than they had during cooler periods.
? The offshore waters, which were colder than areas closer to shore, had a higher relative abundance of krill.
The student wants to emphasize the aim of the research study. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c40a1964.png$qb$, $qb$[{"label": "A", "body": "Analyzing ocean temperature data, Torres found that during a marine heat wave, blue whales foraged farther offshore than they had during cooler periods."}, {"label": "B", "body": "In her study, Torres sought to determine how ocean temperature affects where blue whales forage for krill in the South Taranaki Bight region."}, {"label": "C", "body": "Torres’s study revealed that blue whales were attracted to offshore waters with a relatively high abundance of krill."}, {"label": "D", "body": "Torres, a marine ecologist, studied blue whales in the South Taranaki Bight region, where the whales forage."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence emphasizes the aim, or goal, of the research study, noting that Torres sought to determine how ocean
temperature affects where blue whales forage for krill.
Choice A is incorrect. The sentence emphasizes the results of the study, noting what Torres found at the end; it doesn’t emphasize the aim, or
goal, of the study, which is what Torres sought at the beginning. Choice C is incorrect. The sentence makes a claim about the study’s results; it
doesn’t emphasize the aim, or goal, of the study. Choice D is incorrect. The sentence indicates the location of Torres’s study; it doesn’t
emphasize the aim, or goal, of the study.$qb$);
select seed_pool_question($qb$CB-bfab730e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Paleontologists Jordan C. Mallon and David W.E. Hone used computer models to produce detailed Tyrannosaurus rex size estimates,
incorporating factors such as growth rate, lifespan, and the size of available fossils. ______ the researchers determined that the largest T. rex
possible could have been 70% heavier than the current largest-known specimens.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In addition to these factors,"}, {"label": "B", "body": "Despite these estimates,"}, {"label": "C", "body": "Further complicating these issues,"}, {"label": "D", "body": "Based on these models,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Based on these models” logically signals that the research finding described in this sentence—that the largest T.
rex could have been 70% heavier than the current largest-known specimens—is derived from the computer models described in the previous
sentence.
Choice A is incorrect because “in addition to these factors” illogically signals that the research finding about T. rex size presented in this
sentence introduces factors beyond those noted in the previous sentence (growth rate, lifespan, and the size of available fossils). Instead, the
finding is derived from the researchers’ models, which incorporated those factors. Choice B is incorrect because “despite these estimates”
illogically signals that the research finding about T. rex size presented in this sentence is true despite the previous information about the
researchers’ model-generated size estimates. Instead, the finding is derived from the researchers’ models. Choice C is incorrect because “further
complicating these issues” illogically signals that the previous information about the researchers’ computer models presents difficulties and that
the research finding about T. rex size presented in this sentence adds to those difficulties. Instead, the finding is simply derived from the
researchers’ use of the models.$qb$);
select seed_pool_question($qb$CB-86b78078$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Samuel Selvon was a Trinidadian author.
· The Lonely Londoners is one of his most celebrated novels.
? Selvon published the novel in 1956.
? It is about a group of men who emigrate from the Caribbean to Great Britain after World War II.
? Some of The Lonely Londoners’ characters also appear in Selvon’s later novel Moses Ascending.
The student wants to introduce Samuel Selvon and his novel The Lonely Londoners to a new audience. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-86b78078.png$qb$, $qb$[{"label": "A", "body": "In 1956, Trinidadian author Samuel Selvon published one of his most celebrated novels, The Lonely Londoners, which is about a group of men who emigrate from the Caribbean to Great Britain after World War II."}, {"label": "B", "body": "Samuel Selvon wrote the novel Moses Ascending after he wrote The Lonely Londoners."}, {"label": "C", "body": "The Lonely Londoners, a celebrated novel that was published in 1956, depicts post–World War II Caribbean migration from the perspective of a Trinidadian author."}, {"label": "D", "body": "Some of the characters who appear in Samuel Selvon’s Moses Ascending also appear in The Lonely Londoners."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. By noting that Selvon is a Trinidadian author and indicating that The Lonely Londoners, published in 1956, is about a
group of men who emigrate from the Caribbean to Great Britain after World War II, the sentence effectively introduces Samuel Selvon and his
novel to a new audience.
Choice B is incorrect. The sentence indicates the order in which two of Selvon’s novels were written; it doesn’t introduce Samuel Selvon and The
Lonely Londoners to a new audience. Choice C is incorrect. While the sentence describes the novel The Lonely Londoners, it doesn’t mention its
author, Samuel Selvon, by name and thus doesn’t effectively introduce him to a new audience. Choice D is incorrect. The sentence indicates that
two of Selvon’s novels include the same characters; it doesn’t introduce Samuel Selvon and The Lonely Londoners to a new audience.$qb$);
select seed_pool_question($qb$CB-4f9ee1dc$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Seven species of sea turtle exist today.
· Five sea turtle species can be found in the Atlantic Ocean.
? One of those species is the Kemp’s ridley sea turtle.
? Its scientific name is Lepidochelys kempii.
? Another of those species is the olive ridley sea turtle.
? Its scientific name is Lepidochelys olivacea.
The student wants to emphasize a similarity between the two sea turtle species. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4f9ee1dc.png$qb$, $qb$[{"label": "A", "body": "Among the seven species of sea turtle is the olive ridley sea turtle, which can be found in the Atlantic Ocean."}, {"label": "B", "body": "The Kemp’s ridley sea turtle is referred to as Lepidochelys kempii, while the olive ridley sea turtle is referred to as Lepidochelys olivacea."}, {"label": "C", "body": "Both the Kemp’s ridley sea turtle and the olive ridley sea turtle can be found in the Atlantic Ocean."}, {"label": "D", "body": "The Kemp’s ridley sea turtle (Lepidochelys kempii) and the olive ridley sea turtle (Lepidochelys olivacea) are different species."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes a similarity between the two sea turtle species: both can be found in the Atlantic Ocean.
Choice A is incorrect. The sentence indicates that the olive ridley sea turtle is one of seven species of sea turtle; it fails to mention the Kemp’s
ridley sea turtle. Choice B is incorrect. The sentence emphasizes a difference between the two sea turtle species rather than a similarity. Choice
D is incorrect. The sentence emphasizes a difference between the two sea turtle species rather than a similarity.$qb$);
select seed_pool_question($qb$CB-1996c104$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The liquid metals in Earth’s core circulate constantly, and this circulation generates electrical currents that flow between Earth’s North and South
magnetic poles. These electrical currents, ______ create a barrier around Earth that protects us from radiation and charged particles coming from
space.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in turn,"}, {"label": "B", "body": "likewise,"}, {"label": "C", "body": "nevertheless,"}, {"label": "D", "body": "in reality,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "In turn" logically signals that the information in the sentence—that the electrical currents create a protective barrier
around Earth—is a result or consequence of the previous information about the circulation of liquid metals generating electrical currents that
flow between Earth’s magnetic poles.
Choice B is incorrect because "likewise" illogically signals that the information in the sentence is similar to the previous information about the
circulation of liquid metals generating electrical currents that flow between Earth’s magnetic poles. Instead, the new information about the
electrical currents is a direct result or consequence of the previous information. Choice C is incorrect because "nevertheless" illogically signals
that the information in the sentence is true despite the previous information about the circulation of liquid metals generating electrical currents
that flow between Earth’s magnetic poles. Instead, the new information about the electrical currents is a direct result or consequence of the
previous information. Choice D is incorrect because "in reality" illogically signals that the information in the sentence contradicts the previous
information about the circulation of liquid metals generating electrical currents that flow between Earth’s magnetic poles. Instead, the new
information about the electrical currents is a direct result or consequence of the previous information.$qb$);
select seed_pool_question($qb$CB-bfb4e85e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Ballet dancer Misty Copeland has accomplished a lot. She has appeared on Broadway, toured with Prince, and even served on the President’s
Council on Sports, Fitness & Nutrition. ______ according to Copeland, nothing in her career matches the honor of being the first African American
woman named principal dancer at the prestigious American Ballet Theatre.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Thus,"}, {"label": "B", "body": "However,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Second of all,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "However" logically signals that the information in this sentence—that nothing in Copeland’s career matches her
accomplishment of being the first African American woman named principal dancer at the American Ballet Theatre—offers a contrast or
exception to the previous information about Copeland’s accomplishments.
Choice A is incorrect because "thus" illogically signals that the information that follows is a result of the previous information about Copeland’s
accomplishments. Instead, the statement that nothing in Copeland’s career matches this accomplishment offers a contrast or exception to that
information. Choice C is incorrect because "for example" illogically signals that Copeland’s statement about her greatest accomplishment
exemplifies the claim about her accomplishments in the previous sentence. Instead, it offers a contrast or exception to that information. Choice
D is incorrect because "second of all" illogically signals that the information in this sentence is a second, separate claim from the previous
sentence’s information about her accomplishments. Instead, the statement that nothing in Copeland’s career matches this accomplishment
offers a contrast or exception to that information.$qb$);
select seed_pool_question($qb$CB-f5a00eff$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If the formation of Earth’s mantle had been purely a product of core differentiation—whereby heavier elements sink toward the core and lighter
elements rise—the upper mantle would be depleted of heavy siderophile elements. Siderophiles are much more abundant in the mantle than
predicted in that model, however. ______ extraterrestrial material containing siderophiles, likely from asteroid or comet impacts, almost certainly
accreted to Earth following core differentiation.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "That said,"}, {"label": "B", "body": "Hence,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Likewise,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Hence" correctly signals that the claim in this sentence regarding extraterrestrial material follows logically from the
information in the previous sentences. The previous sentences establish that siderophile elements in the mantle are more abundant than
predicted in the core-differentiation model. This sentence claims, logically, that these elements came from extraterrestrial material that accreted
to Earth after core differentiation.
Choice A is incorrect because "that said" illogically signals that the information in this sentence regarding extraterrestrial material is an exception
to the previous information about siderophiles’ abundance in the mantle. Instead, it is a new claim that follows logically from the previous
information. Choice C is incorrect because "for example" illogically signals that the information in this sentence regarding extraterrestrial
material exemplifies the previous information about siderophiles’ abundance in the mantle. Instead, it is a new claim that follows logically from
the previous information. Choice D is incorrect because "likewise" illogically signals that the information in this sentence regarding
extraterrestrial material is merely similar to the previous information about siderophiles’ abundance in the mantle. Instead, it is a new claim that
follows logically from the previous information.$qb$);
select seed_pool_question($qb$CB-2bda9edb$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1885, Chinese-born California resident Mary Tape became a hero of the Asian American civil rights movement. In January of that year, she won
an antidiscrimination case in the California Supreme Court. ______ in April, she wrote an open letter criticizing her local board of education for
discrimination. Both actions are remembered today as historic stands against racism.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Later,"}, {"label": "B", "body": "For instance,"}, {"label": "C", "body": "In other words,"}, {"label": "D", "body": "Rather,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Later” logically signals that the letter-writing discussed in this sentence occurred later in a chronological sequence
of events than did the antidiscrimination case discussed in the previous sentence.
Choice B is incorrect because “for instance” illogically signals that the letter-writing discussed in this sentence is an example of the
antidiscrimination case discussed in the previous sentence. Instead, the letter-writing is an event that occurred after the court case. Choice C is
incorrect because “in other words” illogically signals that the letter-writing discussed in this sentence is a paraphrase or restatement of the
antidiscrimination case discussed in the previous sentence. Instead, the letter-writing is an event that occurred after the court case. Choice D is
incorrect because “rather” illogically signals that the letter-writing discussed in this sentence is an alternative to the antidiscrimination case
discussed in the previous sentence. Instead, the letter-writing is an event that occurred after the court case.$qb$);
select seed_pool_question($qb$CB-332e75bf$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In Annie Dillard’s Pilgrim at Tinker Creek—where, early on, the author marvels at a single goldfish’s delicate fins but later winces when imagining a
horde of goldfish laying and eating their own eggs—Dillard struggles to reconcile the complicated juxtapositions of the natural world. ______
nature’s mesmerizing intricacy and pitiless harshness prove inextricably linked for Dillard, like “two branches of the same creek.”
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "To that end,"}, {"label": "B", "body": "Ultimately,"}, {"label": "C", "body": "Moreover,"}, {"label": "D", "body": "Hence,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Ultimately” logically signals that the information in this sentence—that, for Dillard, nature’s mesmerizing intricacy
and pitiless harshness are inextricably linked—is the final conclusion or realization reached after her struggle to reconcile the juxtapositions of
the natural world mentioned in the previous sentence.
Choice A is incorrect because “to that end” illogically signals that linking nature’s intricacy and harshness was Dillard’s deliberate goal or purpose
in struggling to reconcile nature’s juxtapositions. Instead, the sentence presents her final realization after that struggle. Choice C is incorrect
because “moreover” illogically signals that the information in this sentence merely adds to Dillard’s struggle to reconcile nature’s juxtapositions
mentioned in the previous sentence. Instead, the sentence presents her final realization after that struggle. Choice D is incorrect because
“hence” illogically signals that nature’s intricacy and harshness being linked is a direct consequence of Dillard’s struggle to reconcile the
juxtapositions mentioned in the previous sentence. Instead, the sentence presents her final realization after that struggle.$qb$);
select seed_pool_question($qb$CB-bb43fc3c$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Pedestrian malls are outdoor streets in a city or town where vehicle traffic is prohibited.
? Many pedestrian malls were built in the 19th and 20th centuries in Europe and Asia.
· Qianmen Dajie is a famous pedestrian mall in Beijing.
? It has existed since the Ming dynasty (1368–1644 CE).
· Rue Mouffetard is a famous pedestrian mall in Paris.
? It has existed since the mid-Roman Empire (117–235 CE).
The student wants to emphasize a similarity between the ages of the malls. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bb43fc3c.png$qb$, $qb$[{"label": "A", "body": "The Qianmen Dajie pedestrian mall has roots as far back as the Ming dynasty; likewise, Rue Mouffetard has existed for centuries."}, {"label": "B", "body": "Both Qianmen Dajie and Rue Mouffetard are famous pedestrian malls, the former in Beijing and the latter in Paris."}, {"label": "C", "body": "Qianmen Dajie and Rue Mouffetard are pedestrian malls, outdoor streets closed to vehicle traffic."}, {"label": "D", "body": "Qianmen Dajie and Rue Mouffetard are examples of pedestrian malls, which proliferated in Europe in the 19th and 20th centuries."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes a similarity between the ages of the two pedestrian malls, noting that both are relatively
old—Qianmen Dajie has roots that go back hundreds of years and Rue Mouffetard has existed for centuries.
Choice B is incorrect. The sentence emphasizes that both locations are famous pedestrian malls and notes that they are in different locations; it
doesn’t emphasize a similarity in their ages. Choice C is incorrect. While the sentence emphasizes that both locations are pedestrian malls, it
doesn’t emphasize a similarity in their ages. Choice D is incorrect. The sentence explains that Qianmen Dajie and Rue Mouffetard are examples
of pedestrian malls and gives information about pedestrian malls in general; it doesn’t emphasize a similarity in the ages of these two malls
specifically.$qb$);
select seed_pool_question($qb$CB-2c7dced2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Sister Rosetta Tharpe (1915–1973) was a gospel musician.
· She was known for her passionate vocals and electric guitar performances.
? In 2018, Tharpe was inducted into the Rock and Roll Hall of Fame for her major impact on the genre.
? According to songwriter Roxie Moore, “[Tharpe] would sing until you cried and then she would sing until you danced for joy.”
? According to guitarist Celisse Henderson, “Tharpe is the unquestioned founding mother of rock ’n’ roll.”
The student wants to use a quotation to support a claim about Tharpe’s contribution to rock ’n’ roll. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2c7dced2.png$qb$, $qb$[{"label": "A", "body": "Gospel musician Sister Rosetta Tharpe had a major impact on rock ’n’ roll, and she was known for her passionate electric guitar performances."}, {"label": "B", "body": "Celisse Henderson believes that Sister Rosetta Tharpe had a major impact on the development of rock ’n’ roll."}, {"label": "C", "body": "Sister Rosetta Tharpe had such a major impact on rock ’n’ roll that Celisse Henderson called her “the unquestioned founding mother” of the genre."}, {"label": "D", "body": "A gospel musician, Sister Rosetta Tharpe had the ability to “sing until you cried” and also “until you danced for joy,” according to Roxie Moore."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence uses the quotation from Henderson to support a claim about Tharpe’s contribution to rock ’n’ roll,
noting that the impact Tharpe had on the genre led Henderson to call her "the unquestioned founding mother of rock ’n’ roll."
Choice A is incorrect. While the sentence makes the claim that Tharpe had a major impact on rock ’n’ roll, it doesn’t use a quotation to support
this claim. Choice B is incorrect. The sentence presents Henderson’s opinion that Tharpe had a major impact on rock ’n’ roll, but it doesn’t use a
quotation to support this claim. Choice D is incorrect. While the sentence includes a quotation about audience reactions to Tharpe’s music, the
sentence describes Tharpe as a gospel musician; it doesn’t support a claim about her contribution to rock ’n’ roll.$qb$);
select seed_pool_question($qb$CB-b0620764$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Phobetor, a name drawn from Greek mythology, is an exoplanet that orbits the star PSR B1257+12, also known as Lich.
· Phobetor’s mass is 0.01 times that of Jupiter, or 0.01 Jupiter masses.
? Mastika, which means “gem” or “jewel” in Malay, is an exoplanet that orbits the star HD 179949, also known as Gumala.
? Mastika’s mass is 0.92 Jupiter masses.
The student wants to make and support a generalization about exoplanets. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b0620764.png$qb$, $qb$[{"label": "A", "body": "Exoplanets that are named Phobetor orbit Lich, and those that are named Mastika orbit Gumala."}, {"label": "B", "body": "Even though Phobetor and Mastika are both exoplanets, their masses are different: Phobetor’s mass is 0.01 Jupiter masses, and Mastika’s is 0.92 Jupiter masses."}, {"label": "C", "body": "Many stars have both a designation and a proper name; for instance, PSR B1257+12 is also known as Lich, and HD 179949 is also known as Gumala."}, {"label": "D", "body": "Exoplanet names have diverse origins, a fact that can be seen in the cases of Phobetor, a name drawn from Greek mythology, and Mastika, which means “gem” or “jewel” in Malay."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence makes and supports a generalization about exoplanets, noting that the names of exoplanets have
diverse origins and supporting this with the examples of the origins of "Phobetor" and "Mastika."
Choice A is incorrect. The sentence misrepresents information from the notes, implying that there are multiple exoplanets with the same names.
Additionally, the sentence provides no support for its generalization. Choice B is incorrect. The sentence contrasts the masses of two specific
exoplanets; it doesn’t make and support a generalization about exoplanets. Choice C is incorrect. The sentence makes and supports a
generalization about stars, not exoplanets.$qb$);
select seed_pool_question($qb$CB-e3484c07$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Bioluminescence is the emission of light by living organisms.
· This light is produced by chemical reactions in organisms’ cells.
? Jellyfish emit flashes of blue light.
? This behavior serves to startle predators.
? Black dragonfish emit a steady red light.
? This behavior helps them locate prey in deep waters.
The student wants to emphasize a difference between the behavior of jellyfish and that of black dragonfish. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e3484c07.png$qb$, $qb$[{"label": "A", "body": "Both jellyfish and black dragonfish are organisms that emit light, which is produced by chemical reactions in these organisms’ cells."}, {"label": "B", "body": "Black dragonfish emit a steady red light, which helps them locate prey in deep waters."}, {"label": "C", "body": "Bioluminescence, the emission of light by living organisms, results from chemical reactions in organisms’ cells."}, {"label": "D", "body": "Jellyfish emit light to startle predators, whereas black dragonfish do so to locate prey."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence emphasizes a difference between the behavior of jellyfish and that of black dragonfish, noting that
jellyfish and black dragonfish emit light as part of different behaviors (protection and predation, respectively).
Choice A is incorrect. The sentence emphasizes a similarity between jellyfish and black dragonfish; it doesn’t emphasize a difference between
the behavior of the two animals. Choice B is incorrect. The sentence emphasizes the type of bioluminescence exhibited by black dragonfish,
noting that it’s used in predation; it doesn’t emphasize a difference between the behavior of the two animals. Choice C is incorrect. The sentence
defines bioluminescence and explains how it works; the sentence doesn’t mention either animal or emphasize a difference between them.$qb$);
select seed_pool_question($qb$CB-fc95a352$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When designing costumes for film, American artist Suttirat Larlarb typically custom fits the garments to each actor. ______ for the film Sunshine,
in which astronauts must reignite a dying Sun, she designed a golden spacesuit and had a factory reproduce it in a few standard sizes; lacking a
tailor-made quality, the final creations reflected the ungainliness of actual spacesuits.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Nevertheless,"}, {"label": "B", "body": "Thus,"}, {"label": "C", "body": "Likewise,"}, {"label": "D", "body": "Moreover,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Nevertheless” logically signals that the information in this sentence—that the spacesuits Suttirat Larlarb designed
for the film Sunshine were made in standard sizes in a factory—presents a notable exception to Larlarb’s typical approach of custom-fitting
garments to actors, which is described in the previous sentence.
Choice B is incorrect because “thus” illogically signals that the information in this sentence is a result or consequence of the previous
information about Larlarb’s typical approach of custom-fitting garments to actors. Instead, it presents a notable exception to Larlarb’s typical
approach. Choice C is incorrect because “likewise” illogically signals that the information in this sentence is similar to the previous information
about Larlarb’s typical approach of custom-fitting garments to actors. Instead, it presents a notable exception to Larlarb’s typical approach.
Choice D is incorrect because “moreover” illogically signals that the information in this sentence merely adds to the previous information about
Larlarb’s typical approach of custom-fitting garments to actors. Instead, it presents a notable exception to Larlarb’s typical approach.$qb$);
select seed_pool_question($qb$CB-e887dab1$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? “Organ2/ASLSP (As Slow as Possible)” is a musical piece by avant-garde composer John Cage.
? A specially designed automated organ in St. Burchardi Church in Halberstadt, Germany, began playing the piece in 2001.
· It is scheduled to stop playing the piece in 2640.
? The performance will last 639 years.
? It will be the longest continuous musical performance in history.
The student wants to indicate how long John Cage’s musical piece will last. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e887dab1.png$qb$, $qb$[{"label": "A", "body": "John Cage is the composer of the musical piece “Organ2/ASLSP (As Slow as Possible).”"}, {"label": "B", "body": "“Organ2/ASLSP (As Slow as Possible)” is a musical piece currently being played in St. Burchardi Church in Halberstadt, Germany."}, {"label": "C", "body": "Lasting 639 years, John Cage’s musical piece will be the longest continuous musical performance in history."}, {"label": "D", "body": "An organ in St. Burchardi Church in Halberstadt, Germany, began playing a musical piece by avant-garde composer John Cage."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence indicates how long John Cage’s musical piece will last, noting that it will last 639 years and be the
longest continuous musical performance in history.
Choice A is incorrect. The sentence identifies John Cage as the composer and provides the name of the musical piece; it doesn’t indicate how
long the piece will last. Choice B is incorrect. The sentence provides the name of the musical piece and where it is currently being played; it
doesn’t indicate how long the piece will last. Choice D is incorrect. The sentence mentions where the musical piece is being played and identifies
John Cage as the composer; it doesn’t indicate how long the piece will last.$qb$);
select seed_pool_question($qb$CB-5a5e22b5$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Gravitational waves are powerful ripples that originate in deep space and eventually pass through Earth.
· The Laser Interferometer Gravitational Wave Observatory (LIGO) is a physics study that began in 2002.
? LIGO’s goal is to detect and analyze gravitational waves.
? LIGO uses a pair of massive gravitational wave detectors called interferometers that are thousands of miles apart.
? In 2015, for the first time in history, LIGO researchers detected a gravitational wave passing through Earth.
The student wants to present LIGO’s aim and methodology. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5a5e22b5.png$qb$, $qb$[{"label": "A", "body": "In 2015, LIGO’s massive interferometers detected a powerful ripple that originated in deep space and eventually passed through Earth."}, {"label": "B", "body": "Though the physics study LIGO began in 2002, its massive interferometers didn’t detect a gravitational wave until 2015."}, {"label": "C", "body": "To achieve its aims, LIGO uses a pair of massive interferometers that are thousands of miles apart."}, {"label": "D", "body": "A physics study designed to detect and analyze gravitational waves, LIGO uses a pair of massive interferometers that are thousands of miles apart."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence effectively presents the LIGO study’s aim, noting that it is designed to detect and analyze gravitational
waves, and its methodology (it uses two interferometers to detect the waves).
Choice A is incorrect. The sentence describes a finding from the LIGO study; it doesn’t effectively present the study’s aim or its methodology.
Choice B is incorrect. The sentence provides background information about the LIGO study’s timeline; it doesn’t effectively present the study’s
aim or its methodology. Choice C is incorrect. The sentence touches on LIGO’s methodology, noting that it uses two interferometers, but doesn’t
indicate what the study’s aims are.$qb$);
select seed_pool_question($qb$CB-bc56170b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Most, but not all, of the Moon’s oxygen comes from the Sun, via solar wind.
· Cosmochemist Kentaro Terada from Osaka University wondered if some of the unaccounted-for oxygen could be coming from Earth.
? In 2008, he analyzed data from the Japanese satellite Kaguya.
? Kaguya gathered data about gases and particles it encountered while orbiting the Moon.
? Based on the Kaguya data, Terada confirmed his suspicion that Earth is sending oxygen to the Moon.
The student wants to emphasize the aim of the research study. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bc56170b.png$qb$, $qb$[{"label": "A", "body": "As it orbited the Moon, the Kaguya satellite collected data that was later analyzed by cosmochemist Kentaro Terada."}, {"label": "B", "body": "Before 2008, Kentaro Terada wondered if the Moon was receiving some of its oxygen from Earth."}, {"label": "C", "body": "Cosmochemist Kentaro Terada set out to determine whether some of the Moon’s oxygen was coming from Earth."}, {"label": "D", "body": "Kentaro Terada’s study determined that Earth is sending a small amount of oxygen to the Moon."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes the aim, or goal, of the research study, noting what Terada set out to do: determine
whether some of the Moon’s oxygen was coming from Earth.
Choice A is incorrect. The sentence focuses on how the Kaguya satellite collected data; it doesn’t emphasize the aim of the research study.
Choice B is incorrect. While the sentence mentions what Terada was curious about before conducting the research study, it doesn’t emphasize
his study’s aim. Choice D is incorrect. The sentence presents the research study’s conclusion; it doesn’t emphasize the study’s aim.$qb$);
select seed_pool_question($qb$CB-d7f31e68$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Annie Wu is a prominent American flutist who graduated from the New England Conservatory.
· She has won multiple national flute competitions.
? She is best known for a 2011 YouTube video that has been viewed over two million times.
? The video shows her performing Three Beats for Beatbox Flute, an original work by composer Greg Pattillo.
? Wu combines flute playing and beatboxing in the video.
The student wants to emphasize Wu’s most well-known achievement. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d7f31e68.png$qb$, $qb$[{"label": "A", "body": "Annie Wu, who has won multiple national flute competitions, has also combined flute playing and beatboxing."}, {"label": "B", "body": "Among her many achievements, prominent American flutist Annie Wu graduated from the New England Conservatory and has won multiple national flute competitions."}, {"label": "C", "body": "Annie Wu is best known for a 2011 YouTube video performance of Three Beats for Beatbox Flute that has been viewed over two million times."}, {"label": "D", "body": "Composer Greg Pattillo’s original work Three Beats for Beatbox Flute combines flute playing and beatboxing."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. This describes the achievement for which Wu is best known.
Choice A is incorrect. This choice doesn’t emphasize Wu’s most well-known achievement. It mentions some of her general achievements, but not
the one for which she is “best known.” Choice B is incorrect. This choice doesn’t emphasize Wu’s most well-known achievement—it describes
several of her achievements equally. Choice D is incorrect. This choice doesn’t emphasize Wu’s most well-known achievement. It describes a
piece of music featured in her most well-known achievement.$qb$);
select seed_pool_question($qb$CB-6351062d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In the late 1890s, over 14,000 unique varieties of apples were grown in the US.
· The rise of industrial agriculture in the mid-1900s narrowed the range of commercially grown crops.
? Thousands of apple varieties considered less suitable for commercial growth were lost.
? Today, only 15 apple varieties dominate the market, making up 90% of apples purchased in the US.
? The Lost Apple Project, based in Washington State, attempts to find and grow lost apple varieties.
The student wants to emphasize the decline in unique apple varieties in the US and specify why this decline occurred. Which choice most
effectively uses relevant information from the notes to accomplish these goals?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6351062d.png$qb$, $qb$[{"label": "A", "body": "The Lost Apple Project is dedicated to finding some of the apple varieties lost following a shift in agricultural practices in the mid-1900s."}, {"label": "B", "body": "While over 14,000 apple varieties were grown in the US in the late 1890s, only 15 unique varieties make up most of the apples sold today."}, {"label": "C", "body": "Since the rise of industrial agriculture, US farmers have mainly grown the same few unique apple varieties, resulting in the loss of thousands of varieties less suitable for commercial growth."}, {"label": "D", "body": "As industrial agriculture rose to prominence in the mid-1900s, the number of crops selected for cultivation decreased dramatically."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes the decline in unique apple varieties in the US and specifies why this decline occurred,
noting that thousands of apple varieties were lost because US farmers started mainly growing the same few unique varieties.
Choice A is incorrect. The sentence introduces the Lost Apple Project; it doesn’t emphasize the decline in unique apple varieties in the US and
specify why this decline occurred. Choice B is incorrect. While the sentence emphasizes the decline in unique apple varieties in the US, it doesn’t
explain why this decline occurred. Choice D is incorrect. The sentence emphasizes the general decline of crop varieties in the mid-1900s; it
doesn’t emphasize the specific decline in unique apple varieties in the US.$qb$);
select seed_pool_question($qb$CB-5bb7dc03$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Started in 1925, the Scripps National Spelling Bee is a US-based spelling competition.
· The words used in the competition have diverse linguistic origins.
? In 2008, Sameer Mishra won by correctly spelling the word “guerdon.”
? “Guerdon” derives from the Anglo-French word “guerdun.”
? In 2009, Kavya Shivashankar won by correctly spelling the word “Laodicean.”
? “Laodicean” derives from the ancient Greek word “Laodíkeia.”
The student wants to emphasize a difference in the origins of the two words. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5bb7dc03.png$qb$, $qb$[{"label": "A", "body": "“Guerdon,” the final word of the 2008 Scripps National Spelling Bee, is of Anglo-French origin, while the following year’s final word, “Laodicean,” derives from ancient Greek."}, {"label": "B", "body": "In 2008, Sameer Mishra won the Scripps National Spelling Bee by correctly spelling the word “guerdon”; however, the following year, Kavya Shivashankar won based on spelling the word “Laodicean.”"}, {"label": "C", "body": "Kavya Shivashankar won the 2009 Scripps National Spelling Bee by correctly spelling “Laodicean,” which derives from the ancient Greek word “Laodíkeia.”"}, {"label": "D", "body": "The Scripps National Spelling Bee uses words from diverse linguistic origins, such as “guerdon” and “Laodicean.”"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. Noting that “guerdon” is of Anglo-French origin and “Laodicean” is of ancient Greek origin, the sentence uses “while”
to emphasize a difference in the origins of the two words.
Choice B is incorrect. While the sentence emphasizes two words used in the Scripps National Spelling Bee, it doesn’t emphasize (or mention) the
words’ linguistic origins. Choice C is incorrect. While the sentence specifies the linguistic origin of one word used in the Scripps National Spelling
Bee, it doesn’t mention the other word or emphasize a difference in the two words’ origins. Choice D is incorrect. While the sentence makes a
generalization about words used in the Scripps National Spelling Bee, it doesn’t emphasize a difference in the words’ origins.$qb$);
select seed_pool_question($qb$CB-e6b57c9b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Iranian scholar Abu Rayhan al-Biruni studied Earth’s physical features.
· He theorized that a large landmass existed west of Europe and east of Asia.
? Al-Biruni published his landmass theory in 1037 CE.
The student wants to specify when al-Biruni published his landmass theory. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e6b57c9b.png$qb$, $qb$[{"label": "A", "body": "In 1037 CE, al-Biruni published his theory that a large landmass existed west of Europe and east of Asia."}, {"label": "B", "body": "Al-Biruni, who studied Earth’s physical features, published a theory about a large landmass."}, {"label": "C", "body": "Al-Biruni was an Iranian scholar who studied Earth’s physical features."}, {"label": "D", "body": "An Iranian scholar who studied Earth’s physical features, al-Biruni theorized that a large landmass existed west of Europe and east of Asia."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence specifies when al-Biruni published his landmass theory, indicating that it was published in the year
1037 CE.
Choice B is incorrect. While the sentence notes that al-Biruni published a landmass theory, it doesn’t specify when the theory was published.
Choice C is incorrect. The sentence identifies al-Biruni as a scholar of Earth’s physical features; it doesn’t specify when he published his
landmass theory. Choice D is incorrect. The sentence describes al-Biruni’s landmass theory; it doesn’t specify when the theory was published.$qb$);
select seed_pool_question($qb$CB-9e2d4ef7$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Abdulrazak Gurnah was awarded the 2021 Nobel Prize in Literature.
· Gurnah was born in Zanzibar in East Africa and currently lives in the United Kingdom.
? Many readers have singled out Gurnah’s 1994 book Paradise for praise.
? Paradise is a historical novel about events that occurred in colonial East Africa.
The student wants to introduce Paradise to an audience unfamiliar with the novel and its author. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9e2d4ef7.png$qb$, $qb$[{"label": "A", "body": "Abdulrazak Gurnah, who wrote Paradise and later was awarded the Nobel Prize in Literature, was born in Zanzibar in East Africa and currently lives in the United Kingdom."}, {"label": "B", "body": "Many readers have singled out Abdulrazak Gurnah’s 1994 book Paradise, a historical novel about colonial East Africa, for praise."}, {"label": "C", "body": "A much-praised historical novel about colonial East Africa, Paradise (1994) was written by Abdulrazak Gurnah, winner of the 2021 Nobel Prize in Literature."}, {"label": "D", "body": "Paradise is a historical novel about events that occurred in colonial East Africa, Abdulrazak Gurnah’s homeland."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence effectively introduces Paradise to an audience unfamiliar with the novel and its author, describing
Paradise as a historical novel about colonial East Africa and its author as the winner of the 2021 Nobel Prize in Literature.
Choice A is incorrect. While the sentence introduces Abdulrazak Gurnah to an audience unfamiliar with the author, it doesn’t effectively introduce
Paradise. Choice B is incorrect. While the sentence provides background information about Paradise, it doesn’t effectively introduce the novel to
an audience unfamiliar with its author. Choice D is incorrect. While the sentence provides background information about Paradise, it doesn’t
effectively introduce the novel to an audience unfamiliar with its author.$qb$);
select seed_pool_question($qb$CB-42d92dea$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Before it unveiled a massive new gallery in 2009, the Art Institute of Chicago was only able to display about 5% of its art collection. ______ the
museum is able to display close to 30% of its collection.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Additionally,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Today,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Today" logically signals that the information in the sentence—that the museum is able to display close to 30% of its
collection—is true of the Art Institute of Chicago as it exists in the present day after the previously mentioned unveiling of the massive new
gallery in 2009.
Choice A is incorrect because "additionally" illogically signals that the information in the sentence is merely an additional fact related to the
information about the museum before the new gallery opened. Instead, the sentence is about the museum in the present day after the new
gallery opened. Choice B is incorrect because "for example" illogically signals that the information in the sentence exemplifies the previous
information about the museum before the new gallery opened. Instead, the sentence is about the museum in the present day after the new
gallery opened. Choice C is incorrect because "nevertheless" illogically signals that the information in the sentence is true despite the previous
information about the museum before the new gallery opened. Instead, the sentence is about the museum in the present day after the new
gallery opened.$qb$);
select seed_pool_question($qb$CB-5803befc$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Resins play several important roles in maintaining the health of conifers and many other kinds of trees. ______ resins quickly seal wounds, which
helps prevent harmful insects and fungi from entering trees. These sticky substances also help trees retain water that is needed for them to
survive.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "Regardless,"}, {"label": "C", "body": "Next,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “For example” logically signals that the information in this sentence—that resins quickly seal wounds to help prevent
harmful insects and fungi from entering trees—provides a specific example to support the previous sentence’s claim about resins playing several
important roles in maintaining tree health.
Choice A is incorrect because “however” illogically signals that the information in this sentence contrasts with the previous claim about resins
playing several important roles in maintaining tree health. Instead, the sentence provides a specific example of one such role. Choice B is
incorrect because “regardless” illogically signals that the information in this sentence is true despite the previous claim about resins playing
several important roles in maintaining tree health. Instead, the sentence provides a specific example of one such role. Choice C is incorrect
because “next” illogically signals that the information in this sentence is the next step in a process. Instead, the sentence provides a specific
example to support the previous claim that resins play several important roles in maintaining tree health.$qb$);
select seed_pool_question($qb$CB-87d8a2ff$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$During a 2021 launch, Rocket Labs’ Electron rocket experienced an unexpected failure: its second-stage booster shut down suddenly after
ignition. ______ instead of downplaying the incident, Rocket Labs’ CEO publicly acknowledged what happened and apologized for the loss of the
rocket’s payload, which had consisted of two satellites.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Afterward,"}, {"label": "B", "body": "Additionally,"}, {"label": "C", "body": "Indeed,"}, {"label": "D", "body": "Similarly,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Afterward” logically signals that the events described in this sentence—the CEO’s public acknowledgment and
apology—occurred after the rocket booster’s failure and are part of a chronological sequence of events.
Choice B is incorrect because “additionally” illogically signals that the events described in this sentence merely occurred in addition to the rocket
booster’s failure. Instead, they occurred after the rocket booster’s failure and are part of a chronological sequence of events. Choice C is
incorrect because “indeed” illogically signals that the events described in this sentence emphasize or strengthen a statement made in the
previous sentence. Instead, they occurred after the rocket booster’s failure and are part of a chronological sequence of events. Choice D is
incorrect because “similarly” illogically signals that the events described in this sentence are similar to the rocket booster’s failure. Instead, they
occurred after the rocket booster’s failure and are part of a chronological sequence of events.$qb$);
select seed_pool_question($qb$CB-855247c7$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Mary Ellen Pleasant, a successful entrepreneur during the gold rush era, earned the moniker “Mother of Human Rights in California” after
successfully challenging discrimination in the state. ______ in 1866, she sued a streetcar company for denying her and other Black riders service,
a suit she eventually won when the California Supreme Court declared it illegal for carriers to exclude passengers based on race.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For this reason,"}, {"label": "B", "body": "Then,"}, {"label": "C", "body": "In addition,"}, {"label": "D", "body": "Specifically,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Specifically" logically signals that the information about Pleasant’s 1866 lawsuit provides specific, precise details
elaborating on the previous point that Pleasant successfully challenged discrimination in California.
Choice A is incorrect because "for this reason" illogically signals that Pleasant’s 1866 lawsuit was a result of her successful challenge to
discrimination in California. Instead, this sentence provides specific details elaborating on her challenge to discrimination in the state. Choice B
is incorrect because "then" illogically signals that Pleasant’s 1866 lawsuit was subsequent to or resulted from her successful challenge to
discrimination in California. Instead, this sentence provides specific, precise details elaborating on how she challenged discrimination in the
state. Choice C is incorrect because "in addition" illogically signals that the information about Pleasant’s 1866 lawsuit is merely additional to the
previous point that Pleasant successfully challenged discrimination in California. Instead, this sentence provides specific details elaborating on
how she did so.$qb$);
select seed_pool_question($qb$CB-94f4eecb$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Las sergas de Esplandián was a novel popular in sixteenth-century Spain.
· The novel featured a fictional island inhabited solely by Black women and known as California.
? That same century, Spanish explorers learned of an “island” off the west coast of Mexico.
? They called it California after the island in the novel.
? The “island” was actually the peninsula now known as Baja California (“Lower California”), which lies to the south of the US state of
California.
The student wants to emphasize the role a misconception played in the naming of a place. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-94f4eecb.png$qb$, $qb$[{"label": "A", "body": "The novel Las sergas de Esplandián featured a fictional island known as California."}, {"label": "B", "body": "To the south of the US state of California lies Baja California (“Lower California”), originally called California after a fictional place."}, {"label": "C", "body": "In the sixteenth century, Spanish explorers learned of a peninsula off the west coast of Mexico and called it California."}, {"label": "D", "body": "Thinking it was an island, Spanish explorers called a peninsula California after an island in a popular novel."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence emphasizes the role a misconception played in the naming of a place, explaining that Spanish
explorers mistook a peninsula for an island and, as a result, named the peninsula after a fictional island, California.
Choice A is incorrect. The sentence mentions a novel that featured a fictional island, California; it doesn’t emphasize the role a misconception
played in the naming of a place. Choice B is incorrect. The sentence notes that Baja California was originally named after a fictional place; it
doesn’t emphasize the role a misconception—specifically, the Spanish explorers’ mistaken belief that the peninsula was an island—played in the
naming of a place. Choice C is incorrect. The sentence indicates when Spanish explorers learned of the peninsula they called California; it
doesn’t emphasize the role a misconception played in the naming of a place.$qb$);
select seed_pool_question($qb$CB-7f5715e4$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The farm-size transition hypothesis predicts that economic pressures associated with modernization result in smaller farms
amalgamating into larger-scale commercial farms.
· Masters et al. (2013): The average farm size in Asia “already has or will soon begin to rise.”
? Promkhambut et al. (2023) argue that small rice farms in Thailand have adopted modern farming methods without a significant scaling-
up of farm size.
? Promkhambut et al.: “The persistence of [small] rice farms [in Thailand] does not represent a ‘failure’ to modernize...or a ‘truncated’
transition—it is a response to modernization.”
The student wants to make and support a claim regarding the applicability of the farm-size transition hypothesis to Thailand. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7f5715e4.png$qb$, $qb$[{"label": "A", "body": "Taken together, the studies by Masters et al. and Promkhambut et al. suggest that rice farms in Thailand have responded to the economic pressures associated with modernization by expanding in size."}, {"label": "B", "body": "Masters et al. report that the average farm size “already has or will soon begin to rise” in Asia, a finding that is consistent with the farm-size transition hypothesis."}, {"label": "C", "body": "The predicted shift to large-scale commercial farming may not hold true for rice farms in Thailand, where, according to Promkhambut et al., rice farms have remained small as they’ve modernized."}, {"label": "D", "body": "Although the farm-size transition hypothesis may be applicable to some countries in Asia, it is inconsistent with the development of rice farming in Thailand."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence makes a claim about the applicability of the farm-size transition hypothesis—the prediction that
smaller farms will amalgamate into larger-scale commercial farms as a response to the economic pressures of modernization—to Thailand,
noting that the hypothesis may not hold true for Thailand. It supports the claim with the argument from Promkhambut et al. that Thailand’s rice
farms have remained small despite modernizing.
Choice A is incorrect. While the sentence makes a claim about the applicability of the farm-size transition hypothesis to Thailand, it
mischaracterizes information from the notes: Promkhambut et al. argue that, despite modernizing in response to economic pressures, rice farms
in Thailand have not expanded in size. Choice B is incorrect. The sentence connects a claim from Masters et al. to the farm-size transition
hypothesis; it doesn’t make and support a claim about the applicability of the hypothesis to Thailand, specifically. Choice D is incorrect. While the
sentence makes a claim about the applicability of the farm-size transition hypothesis to Thailand, it doesn’t support the claim.$qb$);
select seed_pool_question($qb$CB-00bb356a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Miguel Luciano is a multimedia visual artist.
· One of his sculptures is Double Phantom/EntroP.R. (2017).
? The work consists of two red Schwinn Phantom bicycles that he fused together.
? The bicycles face opposite directions.
? The bicycles share the same rear wheel.
The student wants to describe how the bicycles in Double Phantom/EntroP.R. are fused together. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-00bb356a.png$qb$, $qb$[{"label": "A", "body": "To create the sculpture Double Phantom/EntroP.R., Miguel Luciano fused together two Schwinn Phantom bicycles."}, {"label": "B", "body": "There are two red Schwinn Phantom bicycles in the sculpture Double Phantom/EntroP.R."}, {"label": "C", "body": "The two red bicycles in Double Phantom/EntroP.R. are fused together so that they share the same rear wheel while facing opposite directions."}, {"label": "D", "body": "Double Phantom/EntroP.R. is a sculpture created by multimedia visual artist Miguel Luciano."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence correctly describes how the bicycles in the sculpture are fused together: they share the same rear
wheel while facing opposite directions.
Choice A is incorrect. The sentence states that the bicycles are fused together but doesn’t describe how they are fused. Choice B is incorrect.
The sentence states that there are two bicycles in the sculpture without indicating that they are fused together or describing how they are fused.
Choice D is incorrect. It identifies the artist who created the sculpture but doesn’t describe how the bicycles are fused together.$qb$);
select seed_pool_question($qb$CB-a3bf0a9d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 2021, a model developed by astrophysicist Catherine Zucker and her research team revealed that the same supernovas responsible for the
creation and ongoing expansion of the Local Bubble—a 14-million-year-old cavity in the Milky Way—are likely responsible for the formation of new
stars. ______ this model detailed how the bubble’s expansion trapped interstellar clouds of gas and dust that became stars upon their eventual
collapse.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Hence,"}, {"label": "B", "body": "However,"}, {"label": "C", "body": "Admittedly,"}, {"label": "D", "body": "Specifically,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Specifically" logically signals that the information in this sentence—that the Local Bubble’s expansion trapped
clouds of gas and dust that formed new stars—provides specific, precise details elaborating on the more general information in the previous
sentence about the relationship between the Local Bubble’s expansion and the formation of new stars.
Choice A is incorrect because "hence" illogically signals that the information in this sentence is a result of the information in the previous
sentence about the relationship between the Local Bubble’s expansion and the formation of new stars. Instead, this sentence provides specific,
precise details elaborating on that information. Choice B is incorrect because "however" illogically signals that the information in this sentence
contrasts with the information in the previous sentence about the relationship between the Local Bubble’s expansion and the formation of new
stars. Instead, this sentence provides specific, precise details elaborating on that information. Choice C is incorrect because "admittedly"
illogically signals that the information in this sentence provides an exception or caveat to the previous information about the relationship
between the Local Bubble’s expansion and the formation of new stars. Instead, this sentence provides specific, precise details elaborating on
that information.$qb$);
select seed_pool_question($qb$CB-99183985$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Some sandstone arches in Utah’s Arches National Park have been defaced by tourists’ carvings.
· Park rangers can smooth away some carvings using power grinders.
? For deep carvings, power grinding is not always feasible because it can greatly alter or damage the rock.
? Park rangers can use an infilling technique, which involves filling in carvings with ground sandstone and a bonding agent.
? This technique is minimally invasive.
The student wants to explain an advantage of the infilling technique. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-99183985.png$qb$, $qb$[{"label": "A", "body": "To remove carvings from sandstone arches in Utah’s Arches National Park, power grinding is not always feasible."}, {"label": "B", "body": "Filling in carvings with ground sandstone and a bonding agent is less invasive than smoothing them away with a power grinder, which can greatly alter or damage the sandstone arches."}, {"label": "C", "body": "Park rangers can use a power grinding technique to smooth away carvings or fill them in with ground sandstone and a bonding agent."}, {"label": "D", "body": "As methods for removing carvings from sandstone, power grinding and infilling differ in their level of invasiveness."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence effectively explains an advantage of infilling: it’s less invasive than using a power grinder.
Choice A is incorrect. The sentence identifies a disadvantage of power grinding; it doesn’t explain an advantage of infilling. Choice C is incorrect.
The sentence identifies the two techniques park rangers use; it doesn’t explain an advantage of infilling. Choice D is incorrect. The sentence
indicates that power grinding and infilling are different in one aspect; it fails to explain an advantage of infilling.$qb$);
select seed_pool_question($qb$CB-70538b9a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In the 1930s, the Imperial Sugar Cane Institute in India sought to limit the country’s dependence on imported sugarcane.
· The institute enlisted botanist Janaki Ammal to breed a local variety of sugarcane.
? She crossbred the imported sugarcane species Saccharum officinarum with grasses native to India.
? She succeeded in creating sugarcane hybrids well suited to India’s climate.
The student wants to emphasize Janaki Ammal’s achievement. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-70538b9a.png$qb$, $qb$[{"label": "A", "body": "By crossbreeding the imported sugarcane species Saccharum officinarum with grasses native to India, Ammal succeeded in creating sugarcane hybrids well suited to India’s climate."}, {"label": "B", "body": "In the 1930s, the Imperial Sugar Cane Institute, which enlisted Ammal, sought to limit dependence on imported sugarcane."}, {"label": "C", "body": "Ammal was enlisted by the Imperial Sugar Cane Institute at a time when a local variety of sugarcane needed to be produced."}, {"label": "D", "body": "As part of efforts to breed a local variety of sugarcane, an imported sugarcane species called Saccharum officinarum was crossbred with grasses native to India."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes Janaki Ammal’s achievement, explaining that she successfully created sugarcane
hybrids that are well suited to India’s climate by crossbreeding an imported sugarcane species with grasses native to India.
Choice B is incorrect. The sentence emphasizes the goal of the Imperial Sugar Cane Institute in the 1930s; it doesn’t emphasize Janaki Ammal’s
achievement. Choice C is incorrect. While the sentence mentions Ammal, it doesn’t emphasize her achievement of successfully creating
sugarcane hybrids. Choice D is incorrect. While the sentence mentions the achievement of crossbreeding imported sugarcane species with
grasses native to India, it doesn’t emphasize the achievement as belonging to Janaki Ammal.$qb$);
select seed_pool_question($qb$CB-4154a7a3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1891, dancer and choreographer Loie Fuller first performed her celebrated Serpentine Dance, artfully twirling her long, flowing skirt to create
striking visual effects. ______ in 1896, cinema pioneers Auguste and Louis Lumière made a groundbreaking short film of Fuller’s dance.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "In conclusion,"}, {"label": "C", "body": "Later,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Later” logically signals that the event discussed in this sentence—the creation of the short film featuring Fuller’s
dance—is a related event that occurred after the event discussed in the previous sentence (the 1891 debut of the dance).
Choice A is incorrect because “however” illogically signals that the information in this sentence contrasts with the information in the previous
sentence. Instead, the creation of the short film is a related event that followed the event discussed in the previous sentence. Choice B is
incorrect because “in conclusion” illogically signals that the information in this sentence concludes or summarizes the information in the
previous sentence. Instead, the creation of the short film is a related event that followed the event discussed in the previous sentence. Choice D
is incorrect because “in other words” illogically signals that the information in this sentence is a paraphrase or restatement of the information in
the previous sentence. Instead, the creation of the short film is a related event that followed the event discussed in the previous sentence.$qb$);
select seed_pool_question($qb$CB-4703eafb$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Following the American Revolutionary War, North American foodways underwent a radical transformation, fueled in large part by spiking
consumer demand for certain grains. The cultivation, trade, and transportation of maize and wheat, ______ reconfigured the continent’s existing
regional foodways into a globally oriented food system.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in particular,"}, {"label": "B", "body": "alternatively,"}, {"label": "C", "body": "by comparison,"}, {"label": "D", "body": "second of all,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "In particular" logically signals that the information in this sentence—that maize and wheat supply chains
transformed North American foodways into a global food system—provides specific, precise details elaborating on the more general information
in the previous sentence about the transformation of North American foodways (with maize and wheat the "certain grains" at the center of it).
Choice B is incorrect because "alternatively" illogically signals that the information in this sentence is an alternative option to the previous
information about the transformation of North American foodways. Instead, the roles of maize and wheat in creating a global food system are
specific, precise details elaborating on that information. Choice C is incorrect because "by comparison" illogically signals that the information in
this sentence is being compared to the previous information about the transformation of North American foodways. Instead, the roles of maize
and wheat in creating a global food system are specific, precise details elaborating on that information. Choice D is incorrect because "second of
all" illogically signals that the information in this sentence is a second, separate claim from the previous claim that North American foodways
were transformed. Instead, the roles of maize and wheat in creating a global food system are specific, precise details elaborating on that
information, rather than a separate claim.$qb$);
select seed_pool_question($qb$CB-b5a399f1$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Following the Mata Ortiz pottery technique, Mexican sculptor Juan Quezada Celado starts by creating the base of the pot with a slab of clay.
______ he builds the pot walls by layering coils of clay around the perimeter of the base. Celado then smooths out the pot’s walls with a hacksaw
blade. At last, the pot is ready to be painted.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "However,"}, {"label": "C", "body": "By contrast,"}, {"label": "D", "body": "Next,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Next" logically signals that the information in this sentence—which explains how Celado builds the pot’s walls—is
the next step in Celado’s pot creation process. The sentences that follow further signal this information by completing the process.
Choice A is incorrect because "for example" illogically signals that the information about Celado building pot walls in this sentence exemplifies
the information in the previous sentence about how Celado’s pot creation process begins. Instead, it is the next step in this process. Choice B is
incorrect because "however" illogically signals that the information in this sentence contrasts with the information in the previous sentence
about how Celado’s pot creation process begins. Instead, it is the next step in this process. Choice C is incorrect because "by contrast" illogically
signals that the information in this sentence contrasts with the information in the previous sentence about how Celado’s pot creation process
begins. Instead, it is the next step in this process.$qb$);
select seed_pool_question($qb$CB-9c78f702$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Phytoplankton play a crucial role in the ocean’s uptake of carbon from the atmosphere. When alive, these tiny marine organisms absorb
atmospheric carbon via photosynthesis. ______ after they die, the phytoplankton sink to the seafloor, where the carbon in their cells gets stored in
sediment, preventing it from cycling back into the atmosphere.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Specifically,"}, {"label": "B", "body": "By contrast,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Then,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Then” logically signals that the event described in this sentence—carbon in phytoplankton cells being trapped in
sediment after the organisms have died—occurs later in a chronological sequence than the event described in the previous sentence
(phytoplankton absorbing carbon while alive).
Choice A is incorrect because “specifically” illogically signals that the information that follows provides specific, precise details elaborating on
the previous information about what phytoplankton do when alive. Instead, this sentence explains what happens after phytoplankton die—a later
step in the chronological sequence of events. Choice B is incorrect because “by contrast” illogically signals that the information that follows
contrasts with the previous information about what phytoplankton do when alive. Instead, this sentence explains what happens after
phytoplankton die—a later step in the chronological sequence of events. There is no contrast: in both life and death, phytoplankton contribute to
the ocean’s carbon uptake. Choice C is incorrect because “nevertheless” illogically signals that the information that follows is in spite of the
previous information about what phytoplankton do when alive. Instead, this sentence explains what happens after phytoplankton die—a later
step in the chronological sequence of events. There is no contrast: in both life and death, phytoplankton contribute to the ocean’s carbon uptake.$qb$);
select seed_pool_question($qb$CB-2ba97187$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Upon first approaching artist Kurt Wenner’s Dies Irae, a colorful scene painted on the surface of a cobblestone street in Mantua, Italy, one might
assume a deep hole filled with life-sized, classically styled sculptures had opened up in the street. ______ by expertly applying the principles of
perspective, Wenner created merely the illusion of depth.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Additionally,"}, {"label": "B", "body": "On the contrary,"}, {"label": "C", "body": "As a result,"}, {"label": "D", "body": "Next,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "On the contrary" logically signals that the information in this sentence—that Dies Irae’s appearance of depth is
merely an illusion—contrasts with the previous statement about a viewer’s possible assumption regarding the street painting.
Choice A is incorrect because "additionally" illogically signals that this sentence is simply additional information about a viewer’s possible
assumption regarding the street painting. Instead, the information about how Wenner achieved the illusion of depth contrasts with the previous
sentence’s description of the illusion. Choice C is incorrect because "as a result" illogically signals that the information in this sentence is a result
of, or caused by, a viewer’s possible assumption regarding the street painting. Instead, the information about how Wenner achieved the illusion of
depth contrasts with the previous sentence’s description of the illusion. Choice D is incorrect because "next" illogically signals that the
information in this sentence is the next step in a process. Instead, the information about how Wenner achieved the illusion of depth contrasts
with the previous sentence’s description of the illusion.$qb$);
select seed_pool_question($qb$CB-25adba4e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 1897, twenty Black US Army infantrymen rode bicycles from Montana to Missouri.
· The 1,900-mile journey took forty-one days.
? The goal was to test the idea of forming a military bicycle corps.
? In 2022, Erick Cedeño, a Black long-distance cyclist, reenacted the journey.
? Cedeño wanted to honor the infantrymen on the journey’s 125th anniversary.
The student wants to emphasize how far the infantrymen traveled. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-25adba4e.png$qb$, $qb$[{"label": "A", "body": "The US infantrymen rode their bicycles from Montana to Missouri—traveling a total of 1,900 miles."}, {"label": "B", "body": "The 125th anniversary of the infantrymen’s journey was in 2022."}, {"label": "C", "body": "The goal of the 1897 journey was to test the idea of forming a military bicycle corps."}, {"label": "D", "body": "Over a century later, Erick Cedeño honored the infantrymen by reenacting their 1897 journey."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes how far the infantrymen traveled, indicating that they rode their bicycles from Montana to
Missouri, a total of 1,900 miles.
Choice B is incorrect because the sentence mentions when the anniversary of the journey occurred; it doesn’t emphasize how far the infantrymen
traveled. Choice C is incorrect because the sentence discusses the goal of the journey; it doesn’t emphasize how far the infantrymen traveled.
Choice D is incorrect because the sentence notes that Cedeño honored the infantrymen by reenacting their journey; it doesn’t emphasize how far
the infantrymen traveled.$qb$);
select seed_pool_question($qb$CB-b6d9068e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$On a chilly spring morning in a Virginia park, as sunlight crested the treetops, Kathrin Swoboda raised her Nikon D500 camera and captured an
image that would win the Grand Prize in the 2019 Audubon Photography Awards: a red-winged blackbird, exhaling what appeared to be rings of
smoke. ______ the “smoke” was actually the blackbird’s breath hitting the cold morning air as the bird sang.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Furthermore,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "Therefore,"}, {"label": "D", "body": "Of course,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Of course” logically signals that the information in this sentence—that the smokelike effect in the image was
actually the blackbird’s breath hitting the cold morning air—is an expected or self-evident clarification of the previous description of the bird
appearing to exhale rings of smoke.
Choice A is incorrect because “furthermore” illogically signals that the information in this sentence about the smokelike effect merely adds to the
previous description of the image. Instead, the sentence clarifies what produced the smokelike effect in the image. Choice B is incorrect because
“for example” illogically signals that the information in this sentence about the smokelike effect provides a specific example of the previous
description of the image. Instead, the sentence clarifies what produced the smokelike effect in the image. Choice C is incorrect because
“therefore” illogically signals that the information in this sentence about the smokelike effect is a result or consequence of the previous
description of the image. Instead, the sentence clarifies what produced the smokelike effect in the image.$qb$);
select seed_pool_question($qb$CB-d3898d32$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Riley Black—the author of critically acclaimed books such as My Beloved Brontosaurus (2013)—is best known for writing about dinosaurs, but she
has also conducted hands-on fieldwork. ______ her fieldwork has included paleontological digs in Utah, Montana, and Wyoming, and her dinosaur
fossil discoveries can be seen at places such as the Carnegie Museum of Natural History.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Regardless,"}, {"label": "B", "body": "Subsequently,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "Conversely,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The second sentence provides more specific information about the fieldwork mentioned in the first sentence—that
the paleontological digs took place in Utah, Montana, and Wyoming. Therefore, “specifically” fits perfectly in this context.
Choice A is incorrect. This choice uses a disagreement transition. But this sentence doesn’t disagree with the previous sentence. Rather, this
sentence agrees with and elaborates on the last sentence by providing more specifics about the fieldwork Black does. Choice B is incorrect. This
choice uses a transition that indicates that an event took place after another event. But the two sentences are not describing different events—
instead, this sentence gives more details about the fieldwork discussed in the first sentence. Choice D is incorrect. This choice uses a
disagreement transition. But this sentence doesn’t disagree with the previous sentence. Rather, this sentence agrees with and elaborates on the
last sentence by providing more specifics about the fieldwork Black does.$qb$);
select seed_pool_question($qb$CB-0f64ded3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Albert Einstein’s theory of general relativity allows for potential shortcuts through spacetime.
? These hypothetical spacetime tunnels are known as wormholes.
· For matter to travel through a wormhole, it would need to have negative energy density.
? Negative energy density means that the matter would have less energy than empty space.
· Such matter has not been shown to exist.
The student wants to acknowledge a complication affecting travel through wormholes. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0f64ded3.png$qb$, $qb$[{"label": "A", "body": "Einstein’s theory of general relativity allows for potential spacetime shortcuts called wormholes but does not explain how matter with negative energy density could travel through them."}, {"label": "B", "body": "For matter to travel through a wormhole, the matter would need to have less energy than empty space; such matter has not been shown to exist."}, {"label": "C", "body": "The hypothetical tunnels known as wormholes would be potential shortcuts through spacetime were it not for one complication: they have less energy than empty space."}, {"label": "D", "body": "For wormholes to be possible, according to Einstein’s theory of general relativity, they would have to allow for potential shortcuts through spacetime."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence acknowledges a complication affecting travel through wormholes, noting that the matter traveling
through a wormhole would need to have less energy than empty space and that such matter has not been shown to exist.
Choice A is incorrect. The sentence notes that Einstein’s theory doesn’t explain how matter with negative energy density can travel through
wormholes; it doesn’t acknowledge a complication affecting travel through wormholes. Choice C is incorrect. While the sentence acknowledges
a complication affecting travel through wormholes, it misrepresents information from the notes; matter traveling through wormholes, not the
wormholes themselves, would need to have negative energy density. Choice D is incorrect. The sentence presents a misleading interpretation of
Einstein’s theory (confusing the definition of a wormhole with a condition a wormhole must fulfill); it doesn’t acknowledge a complication
affecting travel through wormholes.$qb$);
select seed_pool_question($qb$CB-fb3abe38$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In a 2020 study, researchers in California investigated how many potential nesting sites female wood ducks visited during the nesting
season.
· The researchers placed nest boxes throughout the survey area and tagged 138 female wood ducks with radio frequency ID trackers.
? These trackers recorded how many nest boxes each duck visited.
· 67 ducks (48.5%) visited only one nest box.
? 18 ducks (13.0%) visited 10 or more nest boxes.
? Younger ducks were more likely to visit multiple nest boxes.
The student wants to present the methods used in the 2020 study. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fb3abe38.png$qb$, $qb$[{"label": "A", "body": "By recording how many nest boxes each duck visited, the researchers discovered that only a relatively small percentage (13.0%) of the ducks visited 10 or more nest boxes."}, {"label": "B", "body": "After tracking how many nest boxes the 138 wood ducks visited, the researchers found that the younger ducks tended to visit more nest boxes than the older ducks."}, {"label": "C", "body": "The researchers tagged 138 female wood ducks with radio frequency ID trackers and recorded how many nest boxes each duck visited during the nesting season."}, {"label": "D", "body": "The researchers investigated each nesting site for signs that it had been visited by the female wood ducks."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence presents the methods used in the study, noting that researchers tagged 138 female wood ducks with
radio frequency ID trackers and recorded the number of nest boxes each duck visited.
Choice A is incorrect. While the sentence mentions an aspect of the study’s design (that the researchers recorded the number of nest boxes the
wood ducks visited), it primarily focuses on a finding of the study rather than the methods the researchers used. Choice B is incorrect. While the
sentence mentions an aspect of the study’s design (that the researchers tracked the number of nest boxes the wood ducks visited), it primarily
focuses on a finding of the study rather than the methods the researchers used. Choice D is incorrect. The sentence misrepresents information
from the notes. The researchers used radio frequency ID trackers to record the ducks’ visits; they didn’t investigate each site to look for evidence
that it had been visited.$qb$);
select seed_pool_question($qb$CB-de0bcf4f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Spanish surrealist Oscar Dominguez, like many of his contemporaries, wanted to incorporate elements of chance and randomness in his artistic
process. ______ he employed techniques that produced random, unpredictable results, such as decalcomania, which involved pressing a blank
canvas onto a paint-covered surface to generate abstract patterns.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "With this in mind,"}, {"label": "B", "body": "On the contrary,"}, {"label": "C", "body": "In conclusion,"}, {"label": "D", "body": "Regardless,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "With this in mind" logically signals that the activity described in this sentence—Dominguez’s use of techniques like
decalcomania to produce unpredictable abstract patterns—is a result of his desire to include random elements in his art.
Choice B is incorrect. "On the contrary" illogically signals that the activity in this sentence opposes or is contrary to Dominguez’s desire to use
random elements in his art. Instead, his use of decalcomania is a result of that desire. Choice C is incorrect. "In conclusion" illogically signals that
the activity in this sentence is a conclusion or summary of Dominguez’s desire to use random elements in his art. Instead, his use of
decalcomania is a result of that desire. Choice D is incorrect. "Regardless" illogically signals that the activity in this sentence occurs despite
Dominguez’s desire to use random elements in his art. Instead, his use of decalcomania is a result of that desire.$qb$);
select seed_pool_question($qb$CB-ecb31049$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Sun and other stars are powered by nuclear fusion reactions, in which two atoms collide to form a single heavier atom, releasing energy.
Scientists have long believed that fusion has the potential to meet humanity’s clean energy needs. ______ prior to December 2022, no fusion
reaction in a laboratory setting had ever generated a net energy gain.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For this reason,"}, {"label": "B", "body": "Moreover,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "That said,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. Scientists believe in fusion’s potential as an energy source, but have struggled to actually make it work—in other
words, there is a contradiction between scientists’ beliefs and their reality. “That said” is a disagreement transition that works perfectly in this
context.
Choice A is incorrect. This choice uses a cause-and-effect transition, which doesn’t make sense here. Scientists not being able to generate extra
energy from lab fusion reactions isn’t an effect of them believing in fusion’s potential. Choice B is incorrect. This transition indicates the addition
of another supporting point. But this sentence is not adding a supporting point to the previous sentence—scientists not being able to
successfully generate energy from fusion isn’t another point in favor of fusion meeting humanity’s clean energy needs. Choice C is incorrect. This
choice uses a transition that introduces or elaborates on a particular example. But this sentence doesn’t give an example of scientists’ belief in
fusion’s potential to meet humanity’s clean energy needs—in fact, it contrasts that optimistic belief with the reality of past failures to successfully
employ fusion for energy production.$qb$);
select seed_pool_question($qb$CB-d4b07ce6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Shanawdithit (1801–1829) was a Beothuk cartographer (mapmaker).
? Her maps of Newfoundland’s Beothuk Lake outline both the lake and various points around the lake where encounters between the
Indigenous Beothuk people and British colonists occurred.
? Her maps are notable for depicting the experiences the Beothuk had within the landscape.
· Contemporary Potawatomi cartographer Margaret Pearce: Indigenous cartography emphasizes “experienced space, or place, as opposed
to the Western convention of depicting space as universal, homogenized, and devoid of human experience.”
? Pearce: “Indigenous cartographies are as diverse as Indigenous cultures, from Hawaiian performative cartographies to Navajo verbal
maps and sand paintings.”
The student wants to describe Shanawdithit’s approach and explain its significance. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d4b07ce6.png$qb$, $qb$[{"label": "A", "body": "Shanawdithit’s maps are part of a broader tradition of Indigenous cartography that, according to Pearce, ranges from “Hawaiian performative cartographies to Navajo verbal maps and sand paintings.”"}, {"label": "B", "body": "Shanawdithit mapped Beothuk Lake through significant encounters that occurred there, an approach described as “depicting space as universal [and] homogenized.”"}, {"label": "C", "body": "According to Pearce, Indigenous cartography, such as Shanawdithit’s maps of Beothuk Lake, emphasizes “experienced space, or place,” with a variety of approaches that reflect the diversity of Indigenous cultures."}, {"label": "D", "body": "By depicting experiences of the Beothuk that occurred around Beothuk Lake, Shanawdithit’s maps reflect Indigenous cartography’s emphasis on “experienced space, or place” rather than the landscape alone."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence accomplishes both parts of the goal. It describes Shanawdithit’s approach by noting that she depicted
experiences of the Beothuk that occurred around Beothuk Lake, and it explains the significance of that approach by connecting it to Indigenous
cartography’s emphasis on “experienced space, or place.”
Choice A is incorrect. While the sentence places Shanawdithit’s maps within the broader tradition of Indigenous cartography, it doesn’t describe
her specific approach to mapmaking or explain its significance. Choice B is incorrect. While the sentence does describe Shanawdithit’s approach
to mapmaking, it misrepresents information in the notes when explaining the significance of that approach. “Depicting space as universal [and]
homogenized” is described as a Western convention, not a convention of Indigenous cartography. Choice C is incorrect. While the sentence
mentions Shanawdithit’s maps as an example of Indigenous cartography, it focuses primarily on the broader tradition rather than describing
Shanawdithit’s specific approach and explaining its significance.$qb$);
select seed_pool_question($qb$CB-578ca79a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Charles Demuth’s 1931 painting Chimney and Water Tower is a classic Precisionist work. The Precisionists strove for cold, machine-like
perfection, with crisp lines, geometric shapes, and smooth, brushstroke-free surfaces. ______ Precisionist works often feature skyscrapers,
bridges, and factories, highlighting these angular structures’ engineered symmetry.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Accordingly,"}, {"label": "B", "body": "In the end,"}, {"label": "C", "body": "That said,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Accordingly” logically signals that the information in this sentence—that Precisionist works often feature angular,
symmetrical structures, such as skyscrapers, bridges, and factories—is in accordance with the previous claim about the Precisionist style of
“cold, machine-like perfection, with crisp lines, geometric shapes, and smooth, brushstroke-free surfaces.”
Choice B is incorrect because “in the end” illogically signals that the information in this sentence is a final conclusion or summary of the previous
claim about the Precisionist style. Instead, the sentence describes features in Precisionist works that are in accordance with that style. Choice C
is incorrect because “that said” illogically signals that the information in this sentence is an exception to or qualification of the previous claim
about the Precisionist style. Instead, the sentence describes features in Precisionist works that are in accordance with that style. Choice D is
incorrect because “however” illogically signals that the information in this sentence contrasts with the previous claim about the Precisionist
style. Instead, the sentence describes features in Precisionist works that are in accordance with that style.$qb$);
select seed_pool_question($qb$CB-7f2781fd$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Certhidea olivacea is a perching bird that can be found on the Galápagos Island of Pinzón.
· Creagrus furcatus is a seabird that can be found on the Galápagos Island of Darwin.
? Conservation organizations evaluate the risk that species will become extinct in the near future.
? C. olivacea faces a high risk of extinction.
? C. furcatus faces little risk of becoming extinct in the near future.
The student wants to compare the extinction risk faced by C. olivacea with that faced by C. furcatus. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7f2781fd.png$qb$, $qb$[{"label": "A", "body": "According to conservation organizations, C. olivacea has a higher risk of becoming extinct in the near future than C. furcatus."}, {"label": "B", "body": "C. furcatus faces a high risk of extinction, while C. olivacea faces little risk of becoming extinct in the near future."}, {"label": "C", "body": "Conservation organizations have evaluated both C. furcatus’s and C. olivacea’s risk of becoming extinct in the near future."}, {"label": "D", "body": "C. olivacea is a perching bird that faces a high risk of extinction."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence compares the extinction risks of the two species, noting that C. olivacea has a higher risk of becoming
extinct in the near future than C. furcatus.
Choice B is incorrect. While the sentence does compare the extinction risks of the two species, it misrepresents information from the notes; C.
olivacea faces a higher risk of becoming extinct in the near future than C. furcatus, not the other way around. Choice C is incorrect. While the
sentence mentions that conservation organizations have evaluated both species for extinction risk, it doesn’t compare the extinction risks of the
two species. Choice D is incorrect. While the sentence states that C. olivacea faces a high risk of extinction, it doesn’t mention C. furcatus or
compare the extinction risks of the two species.$qb$);
select seed_pool_question($qb$CB-eea351c4$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$“Wishcycling”—putting nonrecyclable items into recycling bins under the mistaken belief that those items can be recycled—ultimately does more
harm than good. Nonrecyclable items, such as greasy pizza boxes, can contaminate recyclable materials, rendering entire batches unusable.
______ nonrecyclable products can damage recycling plants’ machinery.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Fittingly,"}, {"label": "B", "body": "On the contrary,"}, {"label": "C", "body": "Moreover,"}, {"label": "D", "body": "Nevertheless,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Moreover” logically signals that the information in this sentence—that nonrecyclable products can damage
machinery—adds to the information in the previous sentence to support the claim in the first sentence of the text. The first sentence indicates
that “wishcycling” is harmful, the second sentence gives an example, and this sentence gives another example.
Choice A is incorrect because “fittingly,” which means “appropriately,” illogically signals that it is fitting or appropriate that nonrecyclable products
can damage machinery, which doesn’t make sense in this context. Instead, this sentence adds another example of the potential harm caused by
“wishcycling.” Choice B is incorrect because “on the contrary” illogically signals that this sentence provides information contrary to the
information in the previous sentence. Instead, this sentence adds another example of the potential harm caused by “wishcycling.” Choice D is
incorrect because “nevertheless” illogically signals that this sentence provides information that is true in spite of the information in the previous
sentence. Instead, this sentence adds another example of the potential harm caused by “wishcycling.”$qb$);
select seed_pool_question($qb$CB-570dd854$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Here I Have Returned is a sculpture by Egyptian American artist Sherin Guirguis.
· It is a large, curved strip of wood inspired by the shape of a sistrum.
? A sistrum is a curved musical instrument played by ancient Egyptian priestesses in ceremonies.
? Guirguis says that the sculpture symbolizes “women who have lifted and supported Egyptian society and culture.”
? Overall, Guirguis wants her works to “engage audiences in a dialogue about power, agency, and social transformation.”
The student wants to use a quotation from Guirguis to explain what the sculpture represents. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-570dd854.png$qb$, $qb$[{"label": "A", "body": "Guirguis, whose works include a sculpture that is a large, curved strip of wood, has explained that she wants her work to create a dialogue with audiences."}, {"label": "B", "body": "Inspired by the sistrum played by Egyptian priestesses, Here I Have Returned symbolizes “women who have lifted and supported Egyptian society and culture,” according to Guirguis."}, {"label": "C", "body": "According to Guirguis, the curved strip of wood used in Here I Have Returned was inspired by the sistrum, a musical instrument played by ancient Egyptian priestesses in ceremonies."}, {"label": "D", "body": "Guirguis, the sculptor of Here I Have Returned, wants her works to “engage audiences in a dialogue about power, agency, and social transformation.”"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence uses a quotation from Guirguis to explain what Here I Have Returned represents, noting that Guirguis
said the sculpture symbolizes "women who have lifted and supported Egyptian society and culture."
Choice A is incorrect. The sentence explains what Guirguis says she wants her work to achieve and provides an example of her work; it doesn’t
use a quotation to explain what the sculpture represents. Choice C is incorrect. The sentence mentions the instrument whose shape inspired the
sculpture but doesn’t use a quotation to explain what the sculpture represents. Choice D is incorrect. While the sentence does use a quotation
from Guirguis, the quotation explains what she hopes her works in general achieve, not what the sculpture in particular represents.$qb$);
select seed_pool_question($qb$CB-3150021d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Royal Alcázar of Seville is a historic royal palace in Andalucía, Spain.
· The palace is famous for its intricate tilework.
? The palace features majolica and arista tiles.
? In the majolica style, designs are painted directly on the ceramic tiles.
? In the arista style, designs are stamped into the ceramic tiles.
The student wants to contrast the two styles of tiles. Which choice most effectively uses relevant information from the notes to accomplish this
goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3150021d.png$qb$, $qb$[{"label": "A", "body": "Tiles in the majolica and arista styles can be found in the Royal Alcázar of Seville in Andalucía, Spain."}, {"label": "B", "body": "Featuring tiles in the majolica and arista styles, the Royal Alcázar of Seville in Spain is famous for its intricate tilework."}, {"label": "C", "body": "In the arista style, designs are stamped into the ceramic tiles, whereas in the majolica style, the designs are painted directly on them."}, {"label": "D", "body": "Among the famous tilework of the Royal Alcázar of Seville are majolica style tiles, made by painting designs directly on the ceramic tiles."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence contrasts the two styles of tiles, noting that tiles in the arista style have designs stamped into them,
whereas tiles in the majolica style have designs painted directly on them.
Choice A is incorrect because the sentence indicates that the two styles of tile can be found in the same location; it doesn’t contrast the two
styles of tile. Choice B is incorrect because the sentence indicates that the Royal Alcázar of Seville features tiles in both the majolica and arista
styles; it doesn’t contrast the two styles of tile. Choice D is incorrect because the sentence indicates that the tilework of the Royal Alcázar of
Seville includes tiles in the majolica style; it doesn’t contrast tiles in the majolica style with tiles in the arista style.$qb$);
select seed_pool_question($qb$CB-0205e563$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$At two weeks old, the time their critical socialization period begins, wolves can smell but cannot yet see or hear. Domesticated dogs, ______ can
see, hear, and smell by the end of two weeks. This relative lack of sensory input may help explain why wolves behave so differently around
humans than dogs do: from a very young age, wolves are more wary and less exploratory.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in other words,"}, {"label": "B", "body": "for instance,"}, {"label": "C", "body": "by contrast,"}, {"label": "D", "body": "accordingly,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “By contrast” logically signals that the information in this sentence—that dogs can see, hear, and smell by the end of
two weeks—contrasts with the preceding information (that wolves can smell but not see or hear at the same age).
Choice A is incorrect because “in other words” illogically signals that the information about domesticated dogs in this sentence paraphrases the
information about wolves in the previous sentence. Instead, the information about dogs contrasts with what came before. Choice B is incorrect
because “for instance” illogically signals that the information about domesticated dogs in this sentence exemplifies the information about
wolves in the previous sentence. Instead, the information about dogs contrasts with what came before. Choice D is incorrect because
“accordingly” illogically signals that the information about domesticated dogs in this sentence is in accordance with, or results from, the
information about wolves in the previous sentence. Instead, the information about dogs contrasts with what came before.$qb$);
select seed_pool_question($qb$CB-02527f43$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? “Raymond’s Run” is a short story.
· It was written by African American author Toni Cade Bambara.
? It was first published in her book Gorilla, My Love in 1972.
? It is told from a first person perspective.
? It takes place in Harlem.
The student wants to indicate where the short story takes place. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-02527f43.png$qb$, $qb$[{"label": "A", "body": "“Raymond’s Run” takes place in Harlem."}, {"label": "B", "body": "“Raymond’s Run” was published in Gorilla, My Love."}, {"label": "C", "body": "“Raymond’s Run” is told from a first person perspective."}, {"label": "D", "body": "“Raymond’s Run” was written by Toni Cade Bambara."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence indicates where "Raymond’s Run" takes place, stating that it takes place in Harlem.
Choice B is incorrect. The sentence identifies the book in which the story "Raymond’s Run" was published; it doesn’t indicate where the story
takes place. Choice C is incorrect. The sentence indicates the point of view used in "Raymond’s Run"; it doesn’t indicate where the story takes
place. Choice D is incorrect. The sentence identifies the author of "Raymond’s Run"; it doesn’t indicate where the story takes place.$qb$);
select seed_pool_question($qb$CB-e8494245$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Political scientist Graham Allison is known for his Thucydides trap theory.
· Allison’s theory states that whenever “a rising power is threatening to displace a ruling power,” conflict is likely.
? The theory is based on Thucydides’s explanation of the conflict between Athens and Sparta.
? Thucydides wrote that “the rise of Athens and the fear this instilled in Sparta” made conflict “inevitable.”
? History professor Edmund Stewart recently challenged the historical basis of the theory.
? Stewart claimed that Athens was not a rising power and that the rivals experienced a “clash of cultures” instead.
The student wants to use a quotation to challenge Thucydides’s explanation of the conflict between Athens and Sparta. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e8494245.png$qb$, $qb$[{"label": "A", "body": "According to Allison’s Thucydides trap theory, whenever “a rising power is threatening to displace a ruling power,” conflict is likely."}, {"label": "B", "body": "Thucydides wrote that conflict between the two powers was “inevitable,” although Stewart later challenged the historical basis of this claim."}, {"label": "C", "body": "According to Stewart, a “clash of cultures” between Athens and Sparta caused the conflict, not Athens’s rise."}, {"label": "D", "body": "Thucydides explained that conflict was caused by “the rise of Athens and the fear this instilled in Sparta,” but Allison disagreed, seeing the conflict as an example of the Thucydides trap."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. Using a quotation from Stewart, the sentence challenges Thucydides’s explanation that the rise of Athens caused
the conflict, suggesting that it was instead caused by a "clash of cultures."
Choice A is incorrect. While the sentence uses a quotation, the quotation doesn’t challenge Thucydides’s explanation of the conflict. Choice B is
incorrect. While the sentence mentions that Stewart challenged Thucydides’s explanation of the conflict, it doesn’t use a quotation to challenge
Thucydides’s explanation: the quoted word "inevitable" is from Thucydides. Choice D is incorrect. While the sentence appears to refute
Thucydides’s explanation, it does so in a way that misrepresents the information in the notes; Allison’s Thucydides trap theory is based on
Thucydides’s explanation of the conflict. Thus, Allison’s theory affirms, rather than challenges, Thucydides’s explanation.$qb$);
select seed_pool_question($qb$CB-efc19153$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Just like states have state flags, some cities have city flags.
· Over one hundred US cities have redesigned their flags since 2015.
? The city of Pocatello, Idaho, redesigned its flag after it was named the most poorly designed flag in North America.
? Pocatello’s new flag better represents the city’s mountainous geography and civic priorities.
? Residents consider the new flag to be a meaningful symbol of civic pride.
The student wants to make and support a generalization about the effect of redesigning a city flag. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-efc19153.png$qb$, $qb$[{"label": "A", "body": "Over one hundred US cities have redesigned their flags, including Pocatello, whose flag had been named the most poorly designed flag in North America."}, {"label": "B", "body": "Pocatello is just one of over one hundred US cities that have redesigned their flags."}, {"label": "C", "body": "After it was named the most poorly designed flag in North America, the flag of Pocatello was redesigned to better represent the city’s geography and civic priorities."}, {"label": "D", "body": "Redesigning a poorly designed city flag can create a meaningful symbol of civic pride, as was the case when Pocatello redesigned its original flag to better represent its geography and civic priorities."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence makes and supports a generalization about the effect of redesigning a city flag, noting that
redesigning a city flag can create a meaningful symbol of civic pride, as was the case when the city of Pocatello redesigned its flag.
Choice A is incorrect because the sentence explains that many US cities have redesigned their flags and provides an example; it doesn’t make
and support a generalization about the effect of redesigning a city flag. Choice B is incorrect because the sentence provides an example of a city
that redesigned its flag; it doesn’t make and support a generalization about the effect of redesigning a city flag. Choice C is incorrect because the
sentence emphasizes why the flag of Pocatello was redesigned; it doesn’t make and support a generalization about the effect of redesigning a
city flag.$qb$);
select seed_pool_question($qb$CB-eae29760$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The calendar used by most of the world (the Gregorian calendar) has 365 days.
· Because 365 days can’t be divided evenly by 7 (the number of days in a week), calendar dates fall on a different day of the week each
year.
? The Hanke-Henry permanent calendar, developed as an alternative to the Gregorian calendar, has 364 days.
? Because 364 can be divided evenly by 7, calendar dates fall on the same day of the week each year, which supports more predictable
scheduling.
The student wants to explain an advantage of the Hanke-Henry calendar. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-eae29760.png$qb$, $qb$[{"label": "A", "body": "The Gregorian calendar has 365 days, which is one day longer than the Hanke-Henry permanent calendar."}, {"label": "B", "body": "Adopting the Hanke-Henry permanent calendar would help solve a problem with the Gregorian calendar."}, {"label": "C", "body": "Designed so calendar dates would occur on the same day of the week each year, the Hanke-Henry calendar supports more predictable scheduling than does the Gregorian calendar."}, {"label": "D", "body": "The Hanke-Henry permanent calendar was developed as an alternative to the Gregorian calendar, which is currently the most-used calendar in the world."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence explains an advantage of the Hanke-Henry calendar, noting that it supports more predictable
scheduling than does the Gregorian calendar and describing how it does so (by having calendar dates occur on the same day each year).
Choice A is incorrect. The sentence compares the number of days in the Gregorian and Hanke-Henry calendars; it doesn’t explain an advantage
of the Hanke-Henry calendar. Choice B is incorrect. While the sentence refers to a possible reason to adopt the Hanke-Henry calendar—that
doing so would help solve a problem with the Gregorian calendar—it doesn’t identify the problem or the solution and thus doesn’t explain the
advantage of the Hanke-Henry calendar. Choice D is incorrect. The sentence describes the origins of the Hanke-Henry calendar; it doesn’t explain
an advantage of it.$qb$);
select seed_pool_question($qb$CB-835b101b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Minnesota defines a lake as an inland body of water of at least 10 acres.
· Wisconsin’s definition of a lake doesn’t take size into account.
? By its own definition, Wisconsin has over 15,000 lakes, many smaller than 10 acres.
? By Minnesota’s definition, Wisconsin has only about 6,000 lakes.
The student wants to contrast Minnesota’s definition of a lake with Wisconsin’s. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-835b101b.png$qb$, $qb$[{"label": "A", "body": "Wisconsin, which doesn’t take size into account in defining a lake, claims that it has over 15,000 lakes."}, {"label": "B", "body": "Because its definition of a lake is different from Minnesota’s, it is unclear how many lakes Wisconsin really has."}, {"label": "C", "body": "According to Minnesota’s definition of a lake—an inland body of water of at least 10 acres—Wisconsin has about 6,000 lakes."}, {"label": "D", "body": "Minnesota’s definition of a lake—an inland body of water of at least 10 acres—is more restrictive than Wisconsin’s, which doesn’t take size into account."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence contrasts Minnesota’s definition of a lake with Wisconsin’s, explaining that Minnesota’s definition
(which takes size into account) is more restrictive than Wisconsin’s definition (which doesn’t).
Choice A is incorrect. While the sentence notes that Wisconsin’s definition of a lake doesn’t take size into account, it doesn’t contrast
Minnesota’s definition with Wisconsin’s. Choice B is incorrect. The sentence states that Wisconsin’s definition of a lake is different from
Minnesota’s, but it doesn’t clarify how they differ. In other words, it doesn’t contrast Minnesota’s definition with Wisconsin’s. Choice C is incorrect.
The sentence indicates how many lakes Wisconsin has according to Minnesota’s definition of a lake, but it doesn’t clarify how the states’
definitions differ. In other words, it doesn’t contrast Minnesota’s definition with Wisconsin’s.$qb$);
select seed_pool_question($qb$CB-39d1a519$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$To discover which fruit varieties were grown in Italy’s Umbria region before the introduction of industrial farming, botanist Isabella Dalla Ragione
often turns to centuries-old lists of cooking ingredients. ______ she analyzes Renaissance paintings of Umbria, as they can provide accurate
representations of fruits that were grown there long ago.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In sum,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "Thus,"}, {"label": "D", "body": "Additionally,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Additionally” logically signals that the painting analysis discussed in this sentence is an additional part of the
botany research discussed in the previous sentence. That is, to research which fruits Umbrians grew in the past, the botanist analyzes old
paintings in addition to looking at old lists of ingredients.
Choice A is incorrect because “in sum” illogically signals that the painting analysis discussed in this sentence is a concluding summary of the
botany research discussed in the previous sentence. Instead, the painting analysis is an additional part of that research. Choice B is incorrect
because “instead” illogically signals that the painting analysis discussed in this sentence is an alternative to the botany research discussed in the
previous sentence. Rather, the painting analysis is an additional part of that research. Choice C is incorrect because “thus” illogically signals that
the painting analysis discussed in this sentence is a result of the botany research discussed in the previous sentence. Instead, the painting
analysis is an additional part of that research.$qb$);
select seed_pool_question($qb$CB-420dea42$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A blend of gabardine and wool, the material for Elvis Presley’s Gold Vine jumpsuit was flexible enough to allow the singer to perform his
signature dance moves. ______ the added weight of the suit’s swirling vines made of gold rhinestones likely limited Elvis’s mobility to some
degree.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For this reason,"}, {"label": "B", "body": "Firstly,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "However" logically signals that the claim in this sentence—that the weight of the gold rhinestones likely limited
Elvis’s mobility—contrasts with the previous information about the material being flexible enough for Elvis’s dance moves.
Choice A is incorrect because "for this reason" illogically signals that the claim in this sentence is caused by the previous information about the
material being flexible enough for Elvis’s dance moves. Instead, the claim that the weight of the suit’s rhinestones limited movement contrasts
with the previous information about the jumpsuit’s flexibility. Choice B is incorrect because "firstly" illogically signals that the claim in this
sentence is the first in a series of claims about the jumpsuit being flexible enough for Elvis’s dance moves. Instead, the claim that the weight of
the suit’s rhinestones limited movement contrasts with the previous information about the jumpsuit’s flexibility. Choice D is incorrect because "in
other words" illogically signals that the claim in this sentence is a paraphrase or restatement of the previous information about the material
being flexible enough for Elvis’s dance moves. Instead, the claim that the weight of the suit’s rhinestones limited movement contrasts with the
previous information about the jumpsuit’s flexibility.$qb$);
select seed_pool_question($qb$CB-aec8d3e8$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Chemical leavening agents cause carbon dioxide to be released within a liquid batter, making the batter rise as it bakes.
· Baking soda and baking powder are chemical leavening agents.
? Baking soda is pure sodium bicarbonate.
? To produce carbon dioxide, baking soda needs to be mixed with liquid and an acidic ingredient such as honey.
? Baking powder is a mixture of sodium bicarbonate and an acid.
? To produce carbon dioxide, baking powder needs to be mixed with liquid but not with an acidic ingredient.
The student wants to emphasize a difference between baking soda and baking powder. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-aec8d3e8.png$qb$, $qb$[{"label": "A", "body": "To make batters rise, bakers use chemical leavening agents such as baking soda and baking powder."}, {"label": "B", "body": "Baking soda and baking powder are chemical leavening agents that, when mixed with other ingredients, cause carbon dioxide to be released within a batter."}, {"label": "C", "body": "Baking soda is pure sodium bicarbonate, and honey is a type of acidic ingredient."}, {"label": "D", "body": "To produce carbon dioxide within a liquid batter, baking soda needs to be mixed with an acidic ingredient, whereas baking powder does not."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence emphasizes a difference between baking soda and baking powder, noting that baking soda needs to
be mixed with an acidic ingredient to produce carbon dioxide but baking powder doesn’t.
Choice A is incorrect. The sentence focuses on what bakers use to make batters rise; it doesn’t emphasize a difference between baking soda
and baking powder. Choice B is incorrect. The sentence provides a general description of baking soda and baking powder; it doesn’t emphasize a
difference between them. Choice C is incorrect. The sentence explains what baking soda and honey are; it doesn’t emphasize a difference
between baking soda and baking powder.$qb$);
select seed_pool_question($qb$CB-6916c8e5$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Laetitia Ky’s hair is her art. Inspired by hairstyles from various African tribes, the Ivorian artist uses wire and thread to sculpt her hair into all kinds
of shapes. ______ she once made her hair into the shape of the continent of Africa—including the island of Madagascar!
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Soon,"}, {"label": "B", "body": "Elsewhere,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “For example” logically signals that the following information about Ky—that she once shaped her hair to look like
Africa—is an example supporting the previous statement that she makes different shapes with her hair.
Choice A is incorrect because “soon” illogically signals that the event described in this sentence occurred soon after the statement about Ky
making different shapes with her hair. Instead, the sentence provides an example of one of these shapes. Choice B is incorrect because
“elsewhere” illogically signals that the event described in this sentence occurred in a different place than the statement about Ky making
different shapes with her hair. Instead, the sentence provides an example of one of these shapes. Choice D is incorrect because “however”
illogically signals that the information in this sentence contrasts with the statement that Ky makes different shapes with her hair. Instead, the
sentence provides an example of one of these shapes.$qb$);
select seed_pool_question($qb$CB-61c0f7b3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$? In 2017, a research team led by Mary Caswell Stoddard determined the average lengths of eggs produced by various bird species.
? Gygis alba is a species of bird in the order Charadriiformes.
· Gygis alba eggs had an average length of 4.46 cm.
? Gavia stellata is a species of bird in the order Gaviiformes.
? Gavia stellata eggs had an average length of 7.22 cm.
Which choice most effectively uses information from the given sentences to emphasize a difference between the eggs of the two species?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-61c0f7b3.png$qb$, $qb$[{"label": "A", "body": "A 2017 study compared the lengths of eggs produced by an array of different bird species, such as Gygis alba and Gavia stellata."}, {"label": "B", "body": "A 2017 study found that Gygis alba eggs had an average length of 4.46 cm, whereas Gavia stellata eggs were longer, with an average length of 7.22 cm."}, {"label": "C", "body": "The bird species Gygis alba, which belongs to the order Charadriiformes, and Gavia stellata, of the order Gaviiformes, were included in a 2017 study that compared the average lengths of their eggs."}, {"label": "D", "body": "Mary Caswell Stoddard led a research study that determined the average lengths of eggs, including those of Gygis alba birds (4.46 cm) and Gavia stellata birds (7.22 cm)."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence emphasizes a difference between the eggs of the two species, directly contrasting the shorter
average length of Gygis alba eggs (4.46 cm) with the longer average length of Gavia stellata eggs (7.22 cm).
Choice A is incorrect. While the sentence mentions both bird species, it doesn’t emphasize a difference between their eggs. Choice C is incorrect.
While the sentence provides information about the two bird species, it doesn’t emphasize a difference between their eggs. Choice D is incorrect.
While the sentence provides the average lengths of both species’ eggs, it doesn’t explicitly emphasize the difference between them.$qb$);
select seed_pool_question($qb$CB-77e3b3b3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? 2024: Spain and Portugal sponsored a workshop to address recent encounters between Iberian orcas and marine vessels off the Iberian
Peninsula.
· Many of the 637 documented incidents involved pods of orcas damaging vessels by ramming, nudging, or biting the rudders.
? Studies of Iberian orcas suggest recent increases in tuna populations have reduced the time the orcas spend hunting by 99%.
· Researchers believe this shift has increased the number of interactions between marine vessels and understimulated orcas.
? The workshop advised mariners to avoid orcas pending further testing of the efficacy of TAST, a harmless acoustic deterrent.
The student wants to make and support a claim about Iberian orca behavior. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-77e3b3b3.png$qb$, $qb$[{"label": "A", "body": "The recent destructive behavior of Iberian orcas may be the result of understimulation, given that orcas’ interactions with marine vessels have increased as the orcas have spent less time hunting."}, {"label": "B", "body": "As supported by the workshop’s analysis of 637 encounters between vessels and Iberian orcas, TAST is a harmless and effective acoustic deterrent."}, {"label": "C", "body": "In 2024, Spain and Portugal sponsored a workshop that addressed incidents where pods of Iberian orcas were ramming, nudging, or biting the rudders of vessels."}, {"label": "D", "body": "Tuna populations have increased by approximately 99% off the Iberian Peninsula due to changes in the hunting behavior of Iberian orcas."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence makes and supports a claim about Iberian orca behavior, claiming that the orcas’ destructive behavior
may be the result of understimulation and citing as support the fact that as orcas have spent less time hunting (a stimulating activity),
encounters with vessels have increased.
Choice B is incorrect. While the sentence makes a claim about an orca deterrent, it misrepresents information from the notes. The workshop
advised avoiding orcas pending further testing of TAST’s efficacy; it didn’t claim that TAST was effective. Choice C is incorrect. The sentence
describes a workshop that addressed the orcas’ behavior; it doesn’t make or support a claim about their behavior. Choice D is incorrect. While
the sentence does make a claim about orcas’ hunting behavior, it misrepresents information from the notes; the notes state that increased tuna
populations have reduced orcas’ hunting time by 99%, not that tuna populations have increased by 99% because of the orcas’ behavior.$qb$);
select seed_pool_question($qb$CB-7fa2b1ee$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In meteorology, an air mass is a large body of air with generally uniform humidity and temperature.
· Air masses are commonly classified by two-letter names.
? The first letter indicates the humidity of the air mass, while the second letter indicates the temperature.
? cA (continental arctic) means dry and cold, for example.
? mT (maritime tropical) means moist and warm.
? This classification system is based on the work of a Swedish meteorologist named Tor Bergeron (1891–1977).
The student wants to provide an example of an air mass. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7fa2b1ee.png$qb$, $qb$[{"label": "A", "body": "Air masses are large bodies of air with generally uniform humidity and temperature."}, {"label": "B", "body": "The air mass classification system uses two-letter names and is based on the work of Tor Bergeron, a Swedish meteorologist."}, {"label": "C", "body": "Air masses are commonly classified by a two-letter name that indicates humidity and temperature."}, {"label": "D", "body": "One type of air mass is known as a cA, or continental arctic, air mass because it is dry and cold."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence provides an example of an air mass: the cA, or continental arctic, air mass.
Choice A is incorrect. The sentence provides a general definition of air masses; it doesn’t provide an example of a specific air mass. Choice B is
incorrect. The sentence describes the system used to classify air masses; it doesn’t provide an example of a specific air mass. Choice C is
incorrect. The sentence explains how air masses are classified; it doesn’t provide an example of a specific air mass.$qb$);
select seed_pool_question($qb$CB-56b000d0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The factors that affect clutch size (the number of eggs laid at one time) have been well studied in birds but not in lizards.
· A team led by Shai Meiri of Tel Aviv University investigated which factors influence lizard clutch size.
? Meiri’s team obtained clutch-size and habitat data for over 3,900 lizard species and analyzed the data with statistical models.
? Larger clutch size was associated with environments in higher latitudes that have more seasonal change.
? Lizards in higher-latitude environments may lay larger clutches to take advantage of shorter windows of favorable conditions.
The student wants to emphasize the aim of the research study. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-56b000d0.png$qb$, $qb$[{"label": "A", "body": "Researchers wanted to know which factors influence lizard egg clutch size because such factors have been well studied in birds but not in lizards."}, {"label": "B", "body": "After they obtained data for over 3,900 lizard species, researchers determined that larger clutch size was associated with environments in higher latitudes that have more seasonal change."}, {"label": "C", "body": "We now know that lizards in higher-latitude environments may lay larger clutches to take advantage of shorter windows of favorable conditions."}, {"label": "D", "body": "Researchers obtained clutch-size and habitat data for over 3,900 lizard species and analyzed the data with statistical models."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the aim of the research study by highlighting what the researchers conducting the study
wanted to know—specifically, which factors influence clutch size among lizards.
Choice B is incorrect because the sentence emphasizes what researchers determined at the end of the study, not what the study’s aim was.
Choice C is incorrect because the sentence emphasizes a finding from the research study, not the aim of the study. Choice D is incorrect
because the sentence emphasizes the research study’s methodology, not its aim.$qb$);
select seed_pool_question($qb$CB-f6d454c1$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? If a moon orbiting a planet comes close enough to that planet, tidal forces can cause the moon to break apart.
· In a 2022 study, researchers proposed that Saturn was once orbited by a large moon they named Chrysalis.
? Their simulations indicated that Chrysalis would likely have come very close to Saturn around 160 million years ago.
? At that distance, Chrysalis would have been broken apart by tidal forces.
? The researchers hypothesized that the resulting debris formed Saturn’s rings.
The student wants to recount the sequence of events proposed by the researchers. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f6d454c1.png$qb$, $qb$[{"label": "A", "body": "According to researchers’ simulations, two events likely occurred around 160 million years ago: first, Chrysalis came very close to Saturn, and second, debris from Saturn’s rings caused the moon to break apart."}, {"label": "B", "body": "If a moon orbiting a planet (like Saturn) comes close enough to that planet, tidal forces can cause the moon to break apart."}, {"label": "C", "body": "Around 160 million years ago, a large moon (Chrysalis) came close enough to Saturn that tidal forces broke the moon apart; its debris then formed the planet’s rings."}, {"label": "D", "body": "First, researchers proposed that Saturn was orbited by a large moon (Chrysalis); next, they conducted simulations; and, finally, they formed a hypothesis."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence recounts the sequence of events proposed by the researchers: a large moon orbiting Saturn came
close enough to the planet that it was broken apart by tidal forces, and the resulting debris formed Saturn’s rings.
Choice A is incorrect because the sentence misrepresents information from the notes; according to the notes, tidal forces, not debris, caused the
moon to break apart. Choice B is incorrect. The sentence offers information relevant to the 2022 study but doesn’t recount the sequence of
events proposed by the researchers. Choice D is incorrect. The sentence recounts a sequence, but it’s a sequence of the researchers’ activities,
not the sequence of events proposed by the researchers.$qb$);
select seed_pool_question($qb$CB-92dec236$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Maika’i Tubbs is a Native Hawaiian sculptor and installation artist.
· His work has been shown in the United States, Canada, Japan, and Germany, among other places.
? Many of his sculptures feature discarded objects.
? His work Erasure (2008) includes discarded audiocassette tapes and magnets.
? His work Home Grown (2009) includes discarded pushpins, plastic plates and forks, and wood.
The student wants to emphasize a similarity between the two works. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-92dec236.png$qb$, $qb$[{"label": "A", "body": "Erasure (2008) uses discarded objects such as audiocassette tapes and magnets; Home Grown (2009), however, includes pushpins, plastic plates and forks, and wood."}, {"label": "B", "body": "Tubbs’s work, which often features discarded objects, has been shown both within the United States and abroad."}, {"label": "C", "body": "Like many of Tubbs’s sculptures, both Erasure and Home Grown include discarded objects: Erasure uses audiocassette tapes, and Home Grown uses plastic forks."}, {"label": "D", "body": "Tubbs completed Erasure in 2008 and Home Grown in 2009."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. This choice most effectively emphasizes "a similarity" by identifying a trait the works share: "both Erasure and Home
Grown include discarded objects."
Choice A is incorrect. This choice doesn’t "emphasize a similarity." Instead, this choice shows how the materials used in the two works are
different. Notice the use of the contrast word "however." Choice B is incorrect. This choice doesn’t "emphasize a similarity between the two
works." While it says that Tubbs’s work "often features discarded objects," it doesn’t provide details about the two works in question. Choice D is
incorrect. This choice doesn’t "emphasize a similarity." Instead, this choice shows how the works were produced at different times.$qb$);
select seed_pool_question($qb$CB-e1453c88$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? 1914: British explorer Ernest Shackleton and a small crew embarked on an expedition to Antarctica.
? 1915: Shackleton’s ship Endurance became stuck in ice before eventually breaking apart and sinking.
· 1916: After more harrowing sea-ice adventures, the entire crew was rescued.
? 1959: Historian Alfred Lansing wrote a book called Endurance: Shackleton’s Incredible Voyage.
· 2001: Filmmaker George Butler released a documentary called The Endurance: Shackleton’s Legendary Antarctic Expedition.
? 2022: The wreckage of Endurance was discovered at the bottom of Antarctica’s Weddell Sea.
The student wants to provide a historical overview of the Shackleton expedition. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e1453c88.png$qb$, $qb$[{"label": "A", "body": "Leaving in 1914 for Antarctica, Shackleton and his crew underwent many harrowing sea-ice adventures, including losing their ship in 1915, before being rescued in 1916."}, {"label": "B", "body": "In 1914, the Shackleton expedition sailed to Antarctica, where, in 1916, they rescued the crew of a ship that had sunk, Endurance (the wreckage of which was discovered in 2022)."}, {"label": "C", "body": "Shackleton’s expedition has inspired a 1959 book, a 2001 film, and a 2022 discovery."}, {"label": "D", "body": "Alfred Lansing wrote about the history of Shackleton’s 1914–16 expedition in the book Endurance: Shackleton’s Incredible Voyage (1959); years later, in 2001, George Butler released a documentary about the expedition."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence provides a historical overview of the Shackleton expedition, noting that the explorers left for
Antarctica in 1914, lost their ship in 1915, and were rescued in 1916.
Choice B is incorrect. The sentence misrepresents information from the notes; Shackleton and his crew were themselves rescued in 1916—they
weren’t rescuing others. Choice C is incorrect. The sentence provides examples of works and discoveries inspired by the expedition; it doesn’t
provide an overview of the expedition itself. Choice D is incorrect. The sentence provides examples of works made about the expedition; it
doesn’t provide an overview of the expedition itself.$qb$);
select seed_pool_question($qb$CB-bfad4508$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Brass is a metal alloy composed primarily of zinc and copper.
? Alpha brass contains less than 35% zinc.
· It is more malleable than beta brass and can be manipulated at room temperature.
? Beta brass contains more than 45% zinc.
· It is harder and stronger than alpha brass but is more difficult to work with because it requires heat to manipulate.
The student wants to specify an advantage of alpha brass. Which choice most effectively uses information from the notes to accomplish this
goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bfad4508.png$qb$, $qb$[{"label": "A", "body": "As a metal alloy composed primarily of zinc and copper, alpha brass has a notable advantage over beta brass."}, {"label": "B", "body": "Unlike beta brass, which requires heat to manipulate, alpha brass can be shaped at room temperature."}, {"label": "C", "body": "Alpha brass contains less than 35% zinc, whereas beta brass contains more than 45% zinc."}, {"label": "D", "body": "With its higher zinc content, alpha brass is a stronger material than beta brass."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence specifies an advantage of alpha brass, noting that unlike beta brass, which requires heat to
manipulate, alpha brass can be shaped at room temperature.
Choice A is incorrect. While the sentence indicates that alpha brass has an advantage over beta brass, it doesn’t specify what that advantage is.
Both alpha brass and beta brass are metal alloys composed primarily of zinc and copper. Choice C is incorrect. The sentence contrasts the zinc
content of alpha and beta brass; it doesn’t specify an advantage of alpha brass. Choice D is incorrect. While the sentence does specify an
advantage, it misrepresents information from the notes: beta brass, not alpha brass, has the higher zinc content and is the stronger material.$qb$);
select seed_pool_question($qb$CB-87d34a39$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The National Congress of American Indians (NCAI) was founded in 1944 by representatives of fifty tribal governments.
· The NCAI was created to protect the sovereignty of Indigenous tribes.
? Napoleon B. Johnson (Cherokee) was the NCAI’s first president.
? In 1975, the US Congress passed the Indian Self-Determination and Education Assistance Act (Public Law 96-638).
? This legislation formally acknowledged tribes’ right to self-governance.
? The advocacy of the NCAI was a key factor in the law’s passing.
The student wants to identify an accomplishment of the NCAI. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-87d34a39.png$qb$, $qb$[{"label": "A", "body": "The NCAI, founded by representatives of fifty tribal governments, had Napoleon B. Johnson (Cherokee) as its first president."}, {"label": "B", "body": "Founded in 1944, the NCAI was created by representatives of tribal governments from fifty sovereign Indigenous tribes."}, {"label": "C", "body": "The NCAI’s advocacy was key to the passing of Public Law 96-638, legislation formally acknowledging Indigenous tribes’ right to self- governance."}, {"label": "D", "body": "In 1975, the NCAI passed the Indian Self-Determination and Education Assistance Act, which was created to protect the sovereignty of Indigenous tribes."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence directly identifies an accomplishment of the NCAI: that its advocacy was key to the passing of Public
Law 96-638, which formally acknowledged Indigenous tribes’ right to self-governance.
Choice A is incorrect. The sentence provides information about the NCAI’s founding and its first president, but it doesn’t identify an
accomplishment of the organization. Choice B is incorrect. The sentence describes the NCAI’s founding, but it doesn’t identify an
accomplishment of the organization. Choice D is incorrect. The sentence misrepresents the information in the notes: the US Congress, not the
NCAI, passed the Indian Self-Determination and Education Assistance Act.$qb$);
select seed_pool_question($qb$CB-de55ec71$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Generations of mystery and horror ______ have been influenced by the dark, gothic stories of celebrated American author Edgar Allan Poe (1809–
1849).
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "writers"}, {"label": "B", "body": "writers,"}, {"label": "C", "body": "writers—"}, {"label": "D", "body": "writers;"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation between a subject and a verb. When, as in this case, a subject
(“Generations of mystery and horror writers”) is immediately followed by a verb (“have been influenced”), no punctuation is needed.
Choice B is incorrect because no punctuation is needed between the subject and the verb. Choice C is incorrect because no punctuation is
needed between the subject and the verb. Choice D is incorrect because no punctuation is needed between the subject and the verb.$qb$);
select seed_pool_question($qb$CB-c3397d25$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Since the nineteenth century, Egyptologists have commonly divided ancient Egyptian history into three primary ______ Old Kingdom (2700–2200
BCE), the Middle Kingdom (2050–1800 BCE), and the New Kingdom (1550–1100 BCE). Some historians, however, criticize the names of these
periods for revealing more about the culture of the mainly European Egyptologists than that of ancient Egypt itself.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "periods. The"}, {"label": "B", "body": "periods: the"}, {"label": "C", "body": "periods; the"}, {"label": "D", "body": "periods, the"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between a main clause and an enumerated series. In this choice, a
colon is correctly used after the main clause (“Since...periods”) to introduce the series identifying the three primary periods of ancient Egyptian
history.
Choice A is incorrect because placing a period after “periods” results in a rhetorically unacceptable sentence fragment beginning with “the Old
Kingdom.” Choice C is incorrect because a semicolon can’t be used in this way to introduce a series. A semicolon is conventionally used to join
two main clauses or to separate items in a complex series, neither of which is the case here. Choice D is incorrect because a comma is not
conventionally used to mark the boundary between the main clause (“Since...periods”) and an enumerated series (“the Old Kingdom...(1550–
1100 BCE)”) that contains internal commas. Using a comma in this way creates ambiguity about which commas separate elements in the series
and which mark other boundaries in the sentence, making the colon the best choice.$qb$);
select seed_pool_question($qb$CB-e38b3e4f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The radiation that ______ during the decay of radioactive atomic nuclei is known as gamma radiation.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "occurs"}, {"label": "B", "body": "have occurred"}, {"label": "C", "body": "occur"}, {"label": "D", "body": "are occurring"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb "occurs" agrees in number with the
singular subject "radiation."
Choice B is incorrect because the plural verb "have occurred" doesn’t agree in number with the singular subject "radiation." Choice C is incorrect
because the plural verb "occur" doesn’t agree in number with the singular subject "radiation." Choice D is incorrect because the plural verb "are
occurring" doesn’t agree in number with the singular subject "radiation."$qb$);
select seed_pool_question($qb$CB-89fbc3eb$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Mission 66 initiative, which was approved by Congress in 1956, represented a major investment in the infrastructure of overburdened
national ______ it prioritized physical improvements to the parks’ roads, utilities, employee housing, and visitor facilities while also establishing
educational programming for the public.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "parks and"}, {"label": "B", "body": "parks"}, {"label": "C", "body": "parks;"}, {"label": "D", "body": "parks,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice uses a semicolon to
correctly join the first main clause (“The Mission…parks”) and the second main clause that begins with “it.”
Choice A is incorrect. When coordinating two longer main clauses such as these, it’s conventional to use a comma before the coordinating
conjunction. Choice B is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or a
conjunction. Choice D is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to
join two main clauses.$qb$);
select seed_pool_question($qb$CB-960dec02$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A recent study tracked the number of bee species present in twenty-seven New York apple orchards over a ten-year period. ______ found that
when wild growth near an orchard was cleared, the number of different bee species visiting the orchard decreased.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Entomologist Heather Grab:"}, {"label": "B", "body": "Entomologist, Heather Grab,"}, {"label": "C", "body": "Entomologist Heather Grab"}, {"label": "D", "body": "Entomologist Heather Grab,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between a name and title and between a subject and a verb. No
punctuation is needed between the proper noun “Heather Grab” and “entomologist,” the title that describes Grab. Additionally, no punctuation is
needed between the sentence’s subject (“Entomologist Heather Grab”) and the main verb (“found”) that indicates what Grab did.
Choice A is incorrect because no punctuation is needed between the subject and the verb. Choice B is incorrect because no punctuation is
needed. Setting the entomologist’s name off with commas suggests that it could be removed without affecting the coherence of the sentence,
which isn’t the case. Choice D is incorrect because no punctuation is needed between the subject and the verb.$qb$);
select seed_pool_question($qb$CB-37e5c794$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Despite being cheap, versatile, and easy to produce, ______ they are made from nonrenewable petroleum, and most do not biodegrade in landfills.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "there are two problems associated with commercial plastics:"}, {"label": "B", "body": "two problems are associated with commercial plastics:"}, {"label": "C", "body": "commercial plastics’ two associated problems are that"}, {"label": "D", "body": "commercial plastics have two associated problems:"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-modifier placement. This choice ensures that the modifying phrase “despite
being cheap, versatile, and easy to produce” appears immediately before the noun it modifies, “commercial plastics,” clearly establishing that the
commercial plastics—and not another noun in the sentence—are being described as cheap, versatile, and easy to produce.
Choice A is incorrect because it results in a dangling modifier. The placement of the function word “there” immediately after the modifying
phrase illogically and confusingly suggests that “there” is cheap, versatile, and easy to produce. Choice B is incorrect because it results in a
dangling modifier. The placement of the noun “two problems” immediately after the modifying phrase illogically suggests that the “problems” are
cheap, versatile, and easy to produce. Choice C is incorrect because it results in a dangling modifier. The placement of the noun phrase
“commercial plastics’ two associated problems” immediately after the modifying phrase illogically suggests that the “problems” are cheap,
versatile, and easy to produce.$qb$);
select seed_pool_question($qb$CB-4b0c7b62$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The algaita is a double reed wind instrument from West Africa. The reed of a wind instrument is the mouthpiece ______ A double reed contains
two pieces of cane that vibrate and produce sound as air passes between them.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "where sound is made?"}, {"label": "B", "body": "where is sound made."}, {"label": "C", "body": "where sound is made."}, {"label": "D", "body": "where is sound made?"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a period to punctuate a
declarative sentence ("the reed of a wind instrument is the mouthpiece") that ends with a prepositional phrase ("where sound is made").
Choice A is incorrect. It’s unconventional to use a question mark to punctuate a declarative sentence. Choice B is incorrect. The structure
requires that the sentence continue as a declarative clause, not end with an interrogative clause. Choice D is incorrect. The structure requires
that the sentence continue as a declarative clause and end with a period, not end with an interrogative clause and a question mark.$qb$);
select seed_pool_question($qb$CB-6f08641e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$On April 5, 1977, Kitty Cone and 150 other disability rights activists entered a San Francisco federal building. After pleading for years—to no
effect—for the passage of key antidiscrimination legislation, ______ until their demands were addressed. Finally, on April 28, the legislation was
signed.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "pressure on lawmakers increased when the activists staged a sit-in protest"}, {"label": "B", "body": "a sit-in protest staged by the activists increased pressure on lawmakers"}, {"label": "C", "body": "lawmakers came under increased pressure when the activists staged a sit-in protest"}, {"label": "D", "body": "the activists increased pressure on lawmakers by staging a sit-in protest"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “the activists” the
subject of the sentence and places it immediately after the modifying phrase “after...legislation.” In doing so, this choice clearly establishes that
the activists—and not another noun in the sentence—were pleading for the passage of antidiscrimination legislation.
Choice A is incorrect because it results in a dangling modifier. The placement of the noun phrase “pressure on lawmakers” immediately after the
modifying phrase illogically suggests that the “pressure” was pleading for the passage of antidiscrimination legislation. Choice B is incorrect
because it results in a dangling modifier. The placement of the noun phrase “a sit-in protest” immediately after the modifying phrase illogically
suggests that the “protest” was pleading for the passage of antidiscrimination legislation. Choice C is incorrect because it results in a dangling
modifier. The placement of the noun phrase “lawmakers” immediately after the modifying phrase suggests that “lawmakers” were pleading for
the passage of antidiscrimination legislation. While it’s possible for lawmakers to plead for the passage of legislation, the context strongly
suggests that it’s the activists who pleaded for years for the passage of antidiscrimination legislation.$qb$);
select seed_pool_question($qb$CB-3a1239d2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If an animal can recognize itself in a reflective surface (“the mirror test”), it is considered to have self-awareness. In a recent study, scientists
______ for evidence of self-awareness in snakes, species that rely primarily on olfactory rather than visual processing, adapted the test to
foreground smell, modifying the scent trails of North American eastern garter snakes and African ball pythons.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "searched"}, {"label": "B", "body": "searching"}, {"label": "C", "body": "were searching"}, {"label": "D", "body": "have searched"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite present participle “searching”
is correctly used to form a supplementary element that modifies the subject “scientists,” indicating that the scientists who adapted the test were
looking for evidence of self-awareness in snakes.
Choice A is incorrect because it results in an ungrammatical sentence. The finite past tense verb “searched” can’t be used in this way to form a
supplementary element that indicates what evidence the scientists who adapted the test were looking for. Choice C is incorrect because it
results in an ungrammatical sentence. The finite past progressive verb “were searching” can’t be used in this way to form a supplementary
element that indicates what evidence the scientists who adapted the test were looking for. Choice D is incorrect because it results in an
ungrammatical sentence. The finite present perfect verb “have searched” can’t be used in this way to form a supplementary element that
indicates what evidence the scientists who adapted the test were looking for.$qb$);
select seed_pool_question($qb$CB-3580533b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In recent years, economists around the world have created new tools that quantify the overall well-being of a country’s citizens. Economists in
India, for example, use an Ease of Living Index. This tool ______ economic potential, sustainability, and citizens’ quality of life.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "measures"}, {"label": "B", "body": "had measured"}, {"label": "C", "body": "would have measured"}, {"label": "D", "body": "will have been measuring"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The previous sentence tells us how economists in India "use" a certain tool, while this sentence describes general
facts about that tool. To express general facts (and also to match the simple present tense of "use"), we should use the simple present tense
form "measures."
Choice B is incorrect. This choice uses the past perfect tense, but the previous sentence tells us that the tool is currently used to measure things,
so the past tense doesn’t make sense for this verb. Choice C is incorrect. This choice uses the future perfect conditional tense, but the previous
sentence tells us that the tool is currently used to measure things, so the future tense doesn’t make sense for this verb. Choice D is incorrect.
This choice uses the future perfect continuous tense, but the previous sentence tells us that the tool is currently used to measure things, so the
future tense doesn’t make sense for this verb.$qb$);
select seed_pool_question($qb$CB-2c49940e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$French philosopher René Descartes doubted whether he could prove his own existence. Eventually, he found proof in his famous phrase “I think,
therefore I am.” The ______ complexity: only those who exist would be able to ponder their existence.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "phrases’ simplicity masks its"}, {"label": "B", "body": "phrases simplicity masks their"}, {"label": "C", "body": "phrase’s simplicity masks their"}, {"label": "D", "body": "phrase’s simplicity masks its"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The conventions being tested are the use of possessive nouns and the use of possessive determiners. The singular
possessive noun "phrase’s" correctly indicates that there is only one simple phrase. The singular possessive determiner "its" agrees in number
with the singular possessive noun "phrase’s," reinforcing the idea that there is only one simple yet complex phrase.
Choice A is incorrect because the context requires the singular possessive noun "phrase’s," not the plural possessive noun "phrases’." Choice B is
incorrect because the context requires the singular possessive noun "phrase’s" and the corresponding singular possessive determiner "its," not
the plural noun "phrases" and the corresponding plural possessive determiner "their." Choice C is incorrect because the context requires the
singular possessive determiner "its," not the plural possessive determiner "their."$qb$);
select seed_pool_question($qb$CB-e62241b7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the correct pronunciation of Kiribati? In the Gilbertese language spoken by residents of the island nation, the letter combination -ti makes
the -s sound; as a result, the country’s name ______ pronounced “Kiribas.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are"}, {"label": "B", "body": "have been"}, {"label": "C", "body": "are being"}, {"label": "D", "body": "is"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The singular verb "is" agrees in number with the singular
subject "the country’s name."
Choice A is incorrect because the plural verb "are" doesn’t agree in number with the singular subject "the country’s name." Choice B is incorrect
because the plural verb "have been" doesn’t agree in number with the singular subject "the country’s name." Choice C is incorrect because the
plural verb "are being" doesn’t agree in number with the singular subject "the country’s name."$qb$);
select seed_pool_question($qb$CB-7f226b4b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In a 2023 study, researchers documented a fascinating behavior in the aquatic plant Elodea densa. When exposed to low levels of light, the
plant’s ______ the cellular organs that generate energy from light—reshuffled to form a tightly packed, glass-like surface ideal for collecting more
light.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "chloroplasts"}, {"label": "B", "body": "chloroplasts;"}, {"label": "C", "body": "chloroplasts,"}, {"label": "D", "body": "chloroplasts—"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The dash after
"chloroplasts" pairs with the dash after "from light" to separate the supplementary element "the cellular organs that generate energy from light"
from the rest of the sentence. This supplementary element functions to define the term "chloroplasts," and the pair of dashes indicates that this
element could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the sentence.
Choice B is incorrect because a semicolon can’t be paired with a dash in this way to separate the supplementary element from the rest of the
sentence. Choice C is incorrect because a comma can’t be paired with a dash in this way to separate the supplementary element from the rest of
the sentence.$qb$);
select seed_pool_question($qb$CB-74ce2f05$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A study led by scientist Rebecca Kirby at the University of Wisconsin–Madison found that black bears that eat human food before hibernation
have increased levels of a rare carbon isotope, ______ due to the higher 13C levels in corn and cane sugar. Bears with these elevated levels were
also found to have much shorter hibernation periods on average.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "carbon-13, (13C)"}, {"label": "B", "body": "carbon-13 (13C)"}, {"label": "C", "body": "carbon-13, (13C),"}, {"label": "D", "body": "carbon-13 (13C),"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The comma after
“(13C)” pairs with the comma after “isotope” to separate the supplementary element “carbon-13 (13C)” from the rest of the sentence. This
supplementary element defines the “rare carbon isotope,” and the pair of commas indicates that this element could be removed without affecting
the grammatical coherence of the sentence.
Choice A is incorrect because it fails to use appropriate punctuation to separate the supplementary element “carbon-13 (13C)” from the rest of
the sentence. Choice B is incorrect because it fails to use appropriate punctuation to separate the supplementary element “carbon-13 (13C)”
from the rest of the sentence. Choice C is incorrect because it fails to use appropriate punctuation to separate the supplementary element
“carbon-13 (13C)” from the rest of the sentence. The comma after “carbon-13” isn’t necessary because the parentheses around “13C” already
separate this element from the rest of the sentence.$qb$);
select seed_pool_question($qb$CB-a2816c7f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$American abstract artist Richard ______ his installations to make passersby keenly aware of how one’s movements are affected by the physical
features of one’s environment, assembles large-scale steel plates into sculptures that dominate the outdoor spaces they occupy.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Serra is intending"}, {"label": "B", "body": "Serra, intends"}, {"label": "C", "body": "Serra, intending"}, {"label": "D", "body": "Serra intends"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verb forms within a sentence. This choice pairs the comma after "Serra"
with the comma after "environment" and uses the nonfinite present participle "intending" to correctly form a supplementary phrase describing the
reaction Serra intends his sculptures to provoke. This supplementary phrase appears between the noun phrase that it modifies ("American
abstract artist Richard Serra") and the finite present tense verb ("assembles"), which functions as the sentence’s main verb and describes what
Serra does.
Choice A is incorrect because it results in an ungrammatical sentence. The finite present continuous tense verb "is intending" can’t be used in
this way in conjunction with the finite present tense verb "assembles," which already functions as the main verb in the sentence. Choice B is
incorrect because it results in an ungrammatical sentence. The finite present tense verb "intends" can’t be used in this way to supplement the
noun phrase "American abstract artist Richard Serra." Choice D is incorrect because it results in an ungrammatical sentence. The finite present
tense verb "intends" can’t be used in this way in conjunction with the finite present tense verb "assembles," which already functions as the main
verb in the sentence.$qb$);
select seed_pool_question($qb$CB-a7c85001$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Researchers Amit Kumar and Nicholas Epley investigated how ______ In a series of experiments conducted in 2022, they found that people
performing small acts of kindness underestimated the positive effect their actions had on others.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "do people perceive acts of kindness."}, {"label": "B", "body": "do people perceive acts of kindness?"}, {"label": "C", "body": "people perceive acts of kindness?"}, {"label": "D", "body": "people perceive acts of kindness."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a period to punctuate a
declarative sentence that asks an indirect question ("Researchers Amit Kumar and Nicholas Epley investigated how people perceive acts of
kindness").
Choice A is incorrect. The structure of the sentence requires a declarative clause at the end of the sentence that states what Kumar and Epley
did, not an interrogative clause that asks a direct question, such as "how do people perceive acts of kindness." Choice B is incorrect. The
structure of the sentence requires a declarative clause at the end of the sentence that states what Kumar and Epley did, not an interrogative
clause that asks a direct question, such as "how do people perceive acts of kindness?" Choice C is incorrect. It’s unconventional to use a
question mark in this way to punctuate a declarative sentence that asks an indirect question, such as "Researchers…kindness."$qb$);
select seed_pool_question($qb$CB-eb95235b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Limón technique, developed by Mexican-born dancer and choreographer Jose Limón, is known for its emphasis on breath control and its
interplay of weight and ______ dancers may explore, for example, the moment of mid-air suspension at the top of a jump.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "weightlessness"}, {"label": "B", "body": "weightlessness which"}, {"label": "C", "body": "weightlessness,"}, {"label": "D", "body": "weightlessness;"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. This choice uses a semicolon in a
conventional way to join the first main clause ("The Limón…weightlessness") and the second main clause ("dancers…jump").
Choice A is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction. Choice
B is incorrect. The relative pronoun "which" can’t be used in this way to join two main clauses. Choice C is incorrect because it results in a
comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main clauses.$qb$);
select seed_pool_question($qb$CB-adf210e7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The haiku-like poems of Tomas Tranströmer, which present nature- and dream-influenced images in crisp, spare language, have earned the
Swedish poet praise from leading contemporary ______ them Nigerian American essayist and novelist Teju Cole, who has written that
Tranströmer’s works “contain a luminous simplicity.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "writers. Among"}, {"label": "B", "body": "writers among"}, {"label": "C", "body": "writers; among"}, {"label": "D", "body": "writers, among"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between a main clause and a supplementary phrase. This choice
correctly uses a comma to mark the boundary between the main clause (“The haiku-like…writers”) and the supplementary phrase (“among…
Cole”) that specifies a contemporary writer who has praised Tomas Tranströmer’s haiku-like poems.
Choice A is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with “among.” Choice B is incorrect because
it fails to mark the boundary between the main clause and the supplementary phrase with appropriate punctuation. Choice C is incorrect
because a semicolon can’t be used in this way to join the main clause (“The haiku-like…writers”) and the supplementary phrase (“among…Cole”).$qb$);
select seed_pool_question($qb$CB-b7363ba2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Mathematician and meteorologist Edward Lorenz used the metaphor of the “butterfly effect” to explain how seemingly minor events can have
major impacts on future weather. According to Lorenz’s metaphor, the wind from a butterfly flapping ______ in Brazil might eventually grow into a
storm elsewhere across the globe.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "its wings"}, {"label": "B", "body": "its wings’"}, {"label": "C", "body": "it’s wing’s"}, {"label": "D", "body": "it’s wings’"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The conventions being tested are the use of possessive determiners and plural nouns. The singular possessive
determiner "its" and the plural noun "wings" correctly indicate that the butterfly has multiple wings.
Choice B is incorrect because the context requires the plural noun "wings," not the plural possessive noun "wings’." Choice C is incorrect because
the context requires the singular possessive determiner "its" and the plural noun "wings," not the contraction "it’s" and the singular possessive
noun "wing’s." Choice D is incorrect because the context requires the singular possessive determiner "its" and the plural noun "wings," not the
contraction "it’s" and the plural possessive noun "wings’."$qb$);
select seed_pool_question($qb$CB-908a76b8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When a given industry—water and electricity are two well-known examples—carries high infrastructural start-up costs and other barriers that
discourage competition, ______ of just one or two suppliers per municipality. Such industries are known as natural monopolies.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "these often consist"}, {"label": "B", "body": "they often consist"}, {"label": "C", "body": "it often consists"}, {"label": "D", "body": "this often consists"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is pronoun-antecedent agreement. The singular pronoun "it" agrees in number with the
singular antecedent "industry" and clearly indicates that the industry consists of just one or two suppliers per municipality.
Choice A is incorrect. The plural pronoun "these" neither agrees in number with the singular antecedent "industry" nor clearly indicates that the
industry—not another plural noun in the sentence, such as "start-up costs" or "barriers"—consists of just one or two suppliers per municipality.
Choice B is incorrect because the plural pronoun "they" doesn’t agree in number with the singular antecedent "industry." Choice D is incorrect
because the singular pronoun "this" is ambiguous in this context; the resulting sentence leaves unclear what consists of just one or two suppliers
per municipality.$qb$);
select seed_pool_question($qb$CB-707461d8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 2021, Mexican biologist Martha Lydia Macías-Rubalcava led a review of the scientific literature related to endophytic fungi (i.e., fungi that live
inside a host ______ researching 120 endophytic fungi–produced compounds, she found that their phytotoxicity can make them viable
alternatives to chemical herbicides for controlling weeds.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "plant). By"}, {"label": "B", "body": "plant), by"}, {"label": "C", "body": "plant) and by"}, {"label": "D", "body": "plant) by"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence ("In…plant") and another ("By…weeds"). The prepositional phrase beginning with "by" modifies the
subject of the next sentence, "she," which refers to Macías-Rubalcava.
Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way to join two sentences. Choice C is incorrect.
Without a comma preceding it, the conjunction "and" can’t be used in this way to join two sentences. Choice D is incorrect because it results in a
run-on sentence. The two sentences are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-1ee7b429$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Bonnie Buratti of NASA’s Jet Propulsion Laboratory ______ data about Saturn’s rings collected by the Cassini spacecraft when she made an
interesting discovery: the tiny moons embedded between and within Saturn’s rings are shaped by the buildup of ring material on the moons’
surfaces.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "studies"}, {"label": "B", "body": "has been studying"}, {"label": "C", "body": "will study"}, {"label": "D", "body": "was studying"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the past progressive
tense verb “was studying” is consistent with the other past tense verbs (e.g., “made” and “collected”) used to describe Buratti’s discovery. Further,
the past progressive tense correctly indicates that an ongoing action in the past was occurring (she was studying) at the same time that another
event occurred in the past (she made an interesting discovery).
Choice A is incorrect because the present tense verb “studies” isn’t consistent with the past tense verbs used to describe Buratti’s discovery.
Choice B is incorrect because the present perfect progressive tense verb “has been studying” isn’t consistent with the past tense verbs used to
describe Buratti’s discovery. Choice C is incorrect because the future tense verb “will study” isn’t consistent with the past tense verbs used to
describe Buratti’s discovery.$qb$);
select seed_pool_question($qb$CB-13fcf575$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Roughly 300 nights a year, when the cold air descending from the Andes Mountains meets the warm air rising from Venezuela’s coastal Lake
Maracaibo, the result is a spectacular lightning storm, its strikes so bright, so localized, and so ______ that it has become known as “Maracaibo’s
Lighthouse.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "dependable:"}, {"label": "B", "body": "dependable;"}, {"label": "C", "body": "dependable"}, {"label": "D", "body": "dependable,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of an integrated relative clause. No punctuation is needed before the
relative clause beginning with "that" because the content of the relative clause ("that...Lighthouse") is integral to the meaning of the coordinated
adjectival phrase ("so bright, so localized, and so dependable") that it modifies.
Choice A is incorrect because no punctuation is needed between the coordinated adjectival phrase ("so bright...dependable") and the integrated
relative clause that modifies it. Choice B is incorrect because no punctuation is needed between the coordinated adjectival phrase ("so
bright...dependable") and the integrated relative clause that modifies it. Choice D is incorrect because no punctuation is needed between the
coordinated adjectival phrase ("so bright...dependable") and the integrated relative clause that modifies it.$qb$);
select seed_pool_question($qb$CB-940ff6f7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Jamaican British artist Willard Wigan is known for his remarkable ______ so small that they are best viewed through a microscope, Wigan’s
sculptures are made from tiny natural materials, such as spiderweb strands.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "microsculptures creations"}, {"label": "B", "body": "microsculptures, creations"}, {"label": "C", "body": "microsculptures. Creations"}, {"label": "D", "body": "microsculptures and creations"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation between sentences. In this choice, the period is used to correctly mark
the boundary between one sentence ("Jamaican…microsculptures") and another ("Creations…strands"). The noun phrase beginning with
"creations" modifies the subject of the next sentence, "Wigan’s sculptures."
Choice A is incorrect because it results in a run-on sentence. The sentences ("Jamaican…microsculptures" and "Creations…strands") are fused
without punctuation and/or a conjunction. Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way to mark
the boundary between sentences. Choice D is incorrect. Without a comma preceding it, the conjunction "and" can’t be used in this way to join
sentences.$qb$);
select seed_pool_question($qb$CB-333b2b65$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While one requires oxygen and one does ______ and anaerobic respiration are both forms of cellular respiration—that is, they are processes by
which cells break down glucose to use as energy.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "not aerobic"}, {"label": "B", "body": "not. Aerobic"}, {"label": "C", "body": "not, aerobic"}, {"label": "D", "body": "not; aerobic"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. A comma is the appropriate way to link the dependent clause “While...not” and the independent clause that follows.
Choice A is incorrect. This choice creates a run-on sentence error. “While...not” is a dependent clause, which must be separated from the
independent clause that follows with some sort of punctuation. Choice B is incorrect. This choice creates a sentence fragment. “While one
requires oxygen and one does not” isn’t an independent clause, so it can’t stand alone as a complete sentence. Choice D is incorrect. This choice
creates a punctuation error. “While one requires oxygen and one does not” isn’t an independent clause, so it can’t be linked to the clause that
follows with a semicolon.$qb$);
select seed_pool_question($qb$CB-81f43b85$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For the past 20 million years, Earth’s magnetic poles in the far north and far south have remained roughly where they are today. This has not
always been the ______ throughout geologic history, Earth’s magnetic poles have swapped places several times through a process called polar
wandering.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "case, though"}, {"label": "B", "body": "case, though,"}, {"label": "C", "body": "case; though,"}, {"label": "D", "body": "case, though;"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. Placing the semicolon after the
supplementary adverb “though” correctly indicates that the contrast in the text is between the information in the first sentence (that Earth’s
magnetic poles have remained fixed for the past 20 million years) and the initial clause of the second sentence (“This has not always been the
case”), rather than between the two clauses of the second sentence.
Choice A is incorrect. Using the adverb “though” as the head of a subordinate clause illogically indicates that the information in the previous main
clause (“This…case”) is contrary to the information in the subordinate clause. Instead, the information in the second clause (that Earth’s
magnetic poles have swapped places several times) elaborates on the statement made in the previous clause (that Earth’s magnetic poles are
not as fixed as they may seem). Choice B is incorrect because it results in a comma splice. Commas can’t be used in this way to punctuate a
supplementary word or phrase between two main clauses. Choice C is incorrect. Using a semicolon after “case” places the adverb “though”
inside the second main clause (“throughout…wandering”), illogically indicating that the information in the previous main clause is contrary to the
information in the second one. Instead, the information in the second main clause (that Earth’s magnetic poles have swapped places several
times) elaborates on the statement made in the previous clause (that Earth’s magnetic poles are not as fixed as they may seem).$qb$);
select seed_pool_question($qb$CB-4c335aea$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In a recent analysis of lyrical trends in 350,000 songs, researchers cite increases in certain measures, such as the ratio of choruses to verses, as
evidence music lyrics are becoming more repetitive. For instance, from 1970 to 2020, ______ chorus-to-verse ratios trended similarly, with each
genre’s data indicating that relative to the number of unique verses, the number of repeated choruses in songs increased.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "rocks and raps"}, {"label": "B", "body": "rock’s and rap’s"}, {"label": "C", "body": "rocks and rap’s"}, {"label": "D", "body": "rock and rap’s"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of possessive nouns. The singular possessive nouns "rock’s" and "rap’s"
correctly indicate that the chorus-to-verse ratios belong to the genres of rock and rap.
Choice A is incorrect because the context requires the singular possessive nouns "rock’s" and "rap’s," not the plural nouns "rocks" and "raps."
Choice C is incorrect because the context requires the singular possessive noun "rock’s," not the plural noun "rocks." Choice D is incorrect
because the context requires the singular possessive noun "rock’s," not the singular noun "rock." This choice incorrectly suggests that there was
a single chorus-to-verse ratio for rock and rap together, whereas the ratio was calculated for each genre individually.$qb$);
select seed_pool_question($qb$CB-8b017d4e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Supported by biochemical analyses of over 2,000 skeletons from the Middle Ages, ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "vegetables and grains were, a 2022 study found, the primary components of early medieval rulers’ diets."}, {"label": "B", "body": "early medieval rulers’ diets were found, in a 2022 study, to have primarily consisted of vegetables and grains."}, {"label": "C", "body": "the primary components of early medieval rulers’ diets were vegetables and grains, according to a 2022 study."}, {"label": "D", "body": "findings from a 2022 study suggested that vegetables and grains were the primary components of early medieval rulers’ diets."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase "findings from a
2022 study" the subject of the sentence and places it immediately after the modifying phrase "supported...Ages." In doing so, this choice clearly
establishes that the findings—and not another noun in the sentence—are supported by the biochemical analyses.
Choice A is incorrect because it results in a dangling modifier. The placement of "vegetables and grains" immediately after the modifying phrase
illogically suggests that vegetables and grains are supported by biochemical analyses. Choice B is incorrect because it results in a dangling
modifier. The placement of "early medieval rulers’ diets" immediately after the modifying phrase illogically suggests that the rulers’ diets are
supported by biochemical analyses. Choice C is incorrect because it results in a dangling modifier. The placement of "the primary components"
immediately after the modifying phrase illogically suggests that the primary components are supported by biochemical analyses.$qb$);
select seed_pool_question($qb$CB-9127635a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Star actress Kiki Omeili, who has appeared in 47 Nollywood films, is one of numerous luminaries to be pictured in Nigerian portraitist Iké Udé’s
exhibition Nollywood Portraits. ______ referred to Nollywood—Nigeria’s $3 billion film industry—as “Africa’s vivid mirror par excellence,” honors its
legacy with his vivid classical portraits of Omeili and her peers.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Udé, has"}, {"label": "B", "body": "Udé has"}, {"label": "C", "body": "Udé"}, {"label": "D", "body": "Udé, having"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms and punctuation within a sentence. The sentence’s subject is
“Udé,” and its finite main verb is “honors.” This choice correctly uses the nonfinite participle “having referred” to form a supplementary element
(“having...excellence”) describing Udé. The comma after “Udé” appropriately marks the boundary before that supplementary element.
Choice A is incorrect because using the finite verb “has referred” creates an ungrammatical sentence. The sentence already has the finite main
verb “honors,” so “has referred” can’t also function as a second main verb here without additional punctuation or conjunctions. Moreover, no
punctuation is needed when a subject (“Udé”) is immediately followed by a finite verb (“has referred”). Choice B is incorrect because using the
finite verb “has referred” creates an ungrammatical sentence. The sentence already has the finite main verb “honors,” so “has referred” can’t also
function as a second main verb here without additional punctuation or conjunctions. Choice C is incorrect because using the finite verb “referred”
creates an ungrammatical sentence. The sentence already has the finite main verb “honors,” so “referred” can’t also function as a second main
verb here without additional punctuation or conjunctions.$qb$);
select seed_pool_question($qb$CB-aaa1907f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To serve local families during the Great Depression, innovative New York City librarian Pura Belpré offered storytelling in both English and
Spanish, an uncommon ______ celebrated el Día de los Tres Reyes Magos, an important community holiday; and put on puppet shows dramatizing
Puerto Rican folktales.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "practice, at the time"}, {"label": "B", "body": "practice at the time;"}, {"label": "C", "body": "practice, at the time,"}, {"label": "D", "body": "practice at the time,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the punctuation of elements in a complex series. It’s conventional to use a
semicolon to separate items in a complex series with internal punctuation, and in this choice, the semicolon after "time" is conventionally used to
separate the first item ("offered…time") and the second ("celebrated…holiday") in the series of activities that librarian Pura Belpré offered.
Moreover, the semicolon after "time" matches the semicolon used later to separate the second item ("celebrated...holiday") and the third
("and...folktales") in the series.
Choice A is incorrect because it fails to use appropriate punctuation to separate the first item and the second item in the complex series.
Furthermore, a comma isn’t needed between the noun "practice" and the prepositional phrase "at the time" because the prepositional phrase is
essential to the full meaning of the phrase "an uncommon practice at the time." Choice C is incorrect because a comma after "time" doesn’t
match the semicolon used later to separate the second ("celebrated...holiday") and third ("and...folktales") items in the series. Furthermore, a
comma isn’t needed between the noun "practice" and the prepositional phrase "at the time" because the prepositional phrase is essential to the
full meaning of the phrase "an uncommon practice at the time." Choice D is incorrect because a comma after "time" doesn’t match the semicolon
used later to separate the second ("celebrated...holiday") and third ("and...folktales") items in the series.$qb$);
select seed_pool_question($qb$CB-7f48b098$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Photosynthesis, the mechanism by which plants use sunlight to turn carbon dioxide and water into ______ is fueled in part by an enzyme called
Photosystem II that harvests energy-giving electrons from water molecules.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "nutrients"}, {"label": "B", "body": "nutrients and"}, {"label": "C", "body": "nutrients,"}, {"label": "D", "body": "nutrients—"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The comma after
“nutrients” pairs with the comma after “photosynthesis” to separate the supplementary element “the mechanism by which plants use sunlight to
turn carbon dioxide and water into nutrients” from the rest of the sentence. This supplementary element functions to define the term
“photosynthesis,” and the pair of commas indicates that this element could be removed without affecting the grammatical coherence of the
sentence.
Choice A is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the sentence.
Choice B is incorrect because a conjunction can’t be paired with a comma in this way to separate the supplementary element from the rest of the
sentence. Choice D is incorrect because a dash can’t be paired with a comma in this way to separate the supplementary element from the rest of
the sentence.$qb$);
select seed_pool_question($qb$CB-626a1642$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$As a behavioral economist, Katy Milkman of the University of Pennsylvania recognizes that people sometimes make irrational economic
decisions. Milkman’s research can thus address anomalies that neoclassical economic ______ assume that people are consistently rational
decision-makers—cannot explain.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "models—which"}, {"label": "B", "body": "models, which"}, {"label": "C", "body": "models which"}, {"label": "D", "body": "models which—"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation within a sentence. The dashes after "models" and "decision-
makers" correctly separate the supplementary element "which assume that people are consistently rational decision-makers" from the rest of the
sentence. This punctuation indicates that this element could be removed without affecting the grammatical coherence of the sentence.
Choice B is incorrect because a comma can’t be paired with a dash in this way to separate the supplementary element from the rest of the
sentence. Choice C is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the
sentence. Choice D is incorrect because it interrupts the sentence at an illogical and grammatically incoherent point. The dash should be placed
before "which," not after it, to mark the beginning of the supplementary element.$qb$);
select seed_pool_question($qb$CB-36e89f74$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An imposing spire of igneous rock rising high above the Belle Fourche River in eastern Wyoming, Devils Tower (also known as Bear Lodge) is one
of the most prominent examples of columnar jointing, a pattern of fracturing in rocks that ______ in parallel arrays of long polygonal prisms.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "resulting"}, {"label": "B", "body": "were resulting"}, {"label": "C", "body": "results"}, {"label": "D", "body": "to result"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verb forms within a sentence. Relative clauses, such as the one beginning
with “that,” require a finite (tensed) verb, a verb that can function as the main verb of a clause. This choice correctly supplies the clause with the
finite present tense verb “results.” Furthermore, the simple present tense verb “results” correctly indicates that the formation of parallel arrays of
long polygonal prisms is an enduring property of this fracturing pattern.
Choice A is incorrect because it results in an ungrammatical sentence. The nonfinite participle “resulting” doesn’t supply the clause with a finite
verb. Choice B is incorrect because the past progressive tense verb “were resulting” doesn’t indicate that the formation of parallel arrays of long
polygonal prisms is an enduring property of this fracturing pattern. Choice D is incorrect because it results in an ungrammatical sentence. The
nonfinite to-infinitive “to result” doesn’t supply the clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-035fd57e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The rough frog is a species of amphibian native to Australia. Currently, the frog’s range ______ parts of northern New South Wales and
southeastern Queensland.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "includes"}, {"label": "B", "body": "included"}, {"label": "C", "body": "will have included"}, {"label": "D", "body": "had included"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the present tense verb
“includes,” used in conjunction with the word “currently,” correctly indicates that the frog’s current range includes parts of northern New South
Wales and southeastern Queensland.
Choice B is incorrect because the past tense verb “included” doesn’t indicate that the frog’s range currently includes parts of northern New South
Wales and southeastern Queensland. Choice C is incorrect because the future perfect tense “will have included” doesn’t indicate that the frog’s
range currently includes parts of northern New South Wales and southeastern Queensland. Choice D is incorrect because the past perfect tense
“had included” doesn’t indicate that the frog’s range currently includes parts of northern New South Wales and southeastern Queensland.$qb$);
select seed_pool_question($qb$CB-148be4da$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Human-made (synthetic) fibers used in clothes and many other consumer products are more durable than most natural plant ______ the
manufacture of synthetic fibers requires toxic chemical solvents that can pollute air and water.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "fibers,"}, {"label": "B", "body": "fibers but"}, {"label": "C", "body": "fibers"}, {"label": "D", "body": "fibers, but"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and the coordinating conjunction “but” to join the first main clause (“Human-made...fibers”) and the second main clause (“the
manufacture...water”).
Choice A is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. Choice B is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction. Choice C is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation
and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-9df6da04$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Entomologists Yash Sondhi and Samuel Fabian have tried to explain why moths fly erratically around light sources at night. Knowing that flying
insects keep their backs pointed toward sunlight during the day, ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "the researchers theorize that moths, mistaking nighttime lights for the Sun, continually try to reorient their bodies while flying near such lights."}, {"label": "B", "body": "the researchers’ theory is that moths mistake nighttime lights for the Sun, continually trying to reorient their bodies while flying near such lights."}, {"label": "C", "body": "moths mistake nighttime lights for the Sun and continually try to reorient their bodies while flying near such lights, the researchers theorize."}, {"label": "D", "body": "moths continually try to reorient their bodies while flying near nighttime lights, the researchers theorize, mistaking such lights for the Sun."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase "the researchers"
the subject of the sentence and places it immediately after the modifying phrase "knowing…day." In doing so, this choice clearly establishes that
the researchers—and not another noun in the sentence—know that flying insects keep their backs pointed toward sunlight during the day.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase "the researchers’ theory" immediately after the
modifying phrase illogically suggests that the researchers’ theory knows that flying insects keep their backs pointed toward sunlight during the
day. Choice C is incorrect because it results in a dangling modifier. The placement of the noun "moths" immediately after the modifying phrase
illogically suggests that moths know that flying insects keep their backs pointed toward sunlight during the day. Choice D is incorrect because it
results in a dangling modifier. The placement of the noun "moths" immediately after the modifying phrase illogically suggests that moths know
that flying insects keep their backs pointed toward sunlight during the day.$qb$);
select seed_pool_question($qb$CB-0f39b19c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$After a spate of illnesses as a child, Wilma Rudolph was told she might never walk again. Defying all odds, Rudolph didn’t just walk, she ______
the 1960 Summer Olympics in Rome, she won both the 100- and 200-meter dashes and clinched first place for her team in the 4x100-meter relay,
becoming the first US woman to win three gold medals in a single Olympics.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "ran—fast—during"}, {"label": "B", "body": "ran—fast during"}, {"label": "C", "body": "ran—fast, during"}, {"label": "D", "body": "ran—fast. During"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence (“Defying…fast”) and another sentence that begins with a supplementary phrase (“During…Olympics”).
Choice A is incorrect. When a dash is present in a sentence (“ran—fast”), it’s not conventional to use another dash (“fast—during”) to mark the
boundary between sentences because it creates a potentially confusing sentence. In this context, a period, semicolon, or colon would be clear
and more conventional. Choice B is incorrect because it results in a run-on sentence. The sentences (“Defying…fast”) and (“during…Olympics”)
are fused without punctuation and/or a conjunction. Choice C is incorrect because it results in a comma splice. A comma can’t be used in this
way to mark the boundary between sentences.$qb$);
select seed_pool_question($qb$CB-ae439895$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In her 1983 book The Managed Heart: Commercialization of Human Feeling, sociologist Arlie Russell Hochschild first explored at length her
conception of a “sociology of emotions”—the idea that the various cultural and ideological frameworks a person has internalized (class, gender,
political affiliation, etc.) ______ each emotional reaction that person has within a situation.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "underlies"}, {"label": "B", "body": "is underlying"}, {"label": "C", "body": "underlie"}, {"label": "D", "body": "has been underlying"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is subject-verb agreement. The plural verb "underlie" agrees in number with the plural
subject "frameworks."
Choice A is incorrect because the singular verb "underlies" doesn’t agree in number with the plural subject "frameworks." Choice B is incorrect
because the singular verb "is underlying" doesn’t agree in number with the plural subject "frameworks." Choice D is incorrect because the singular
verb "has been underlying" doesn’t agree in number with the plural subject "frameworks."$qb$);
select seed_pool_question($qb$CB-83617355$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Each night in Gijón, Spain, a section of the city’s marina is bathed in a soft green glow. The source of the glow is the Árbol de la Sidra, a large
sculpture made up of 3,200 recycled glass bottles. A lamp inside the tree-shaped structure ______ the green glass.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "will be illuminating"}, {"label": "B", "body": "illuminates"}, {"label": "C", "body": "would illuminate"}, {"label": "D", "body": "illuminated"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the present tense verb "illuminates"
is consistent with the other present tense verb ("is") used to describe the sculpture, correctly indicating that the sculpture habitually glows ("each
night") and that the lamp inside is the source of its illumination.
Choice A is incorrect because the future progressive tense verb "will be illuminating" isn’t consistent with the other present tense verb used to
describe the sculpture and the source of its glow. Choice C is incorrect because the modal "would," which is used to indicate a typical behavior in
the past, isn’t consistent with the other present tense verb used to describe the sculpture and the source of its glow. Choice D is incorrect
because the past tense verb "illuminated" isn’t consistent with the other present tense verb used to describe the sculpture and the source of its
glow.$qb$);
select seed_pool_question($qb$CB-16740ab4$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$At the Chicxulub asteroid impact crater in Mexico, the presence of many fossilized microbacteria, which seem to have thrived there despite the
extreme heat that persisted after the Chicxulub impact, ______ claims that bacteria are among the planet’s most resilient organisms.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "have reinforced"}, {"label": "B", "body": "reinforces"}, {"label": "C", "body": "are reinforcing"}, {"label": "D", "body": "reinforce"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-verb agreement. The singular verb “reinforces” agrees in number with the
singular subject “the presence.”
Choice A is incorrect because the plural verb “have reinforced” doesn’t agree in number with the singular subject “the presence.” Choice C is
incorrect because the plural verb “are reinforcing” doesn’t agree in number with the singular subject “the presence.” Choice D is incorrect because
the plural verb “reinforce” doesn’t agree in number with the singular subject “the presence.”$qb$);
select seed_pool_question($qb$CB-f78997cf$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Recent analysis of 32532 Thereus—an outer solar system object orbiting the Sun between Jupiter and Saturn—has determined its color to be
gray, suggesting an icy composition. Such interpretations are ultimately ______ the object’s gray coloration may be an incidental effect of
radiation, solar wind, or collisions with other objects rather than evidence of its physical makeup.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "speculative, though"}, {"label": "B", "body": "speculative, though;"}, {"label": "C", "body": "speculative; though"}, {"label": "D", "body": "speculative, though,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation in a sentence. This choice correctly uses a comma to
separate the supplementary adverb "though" from the preceding main clause ("Such interpretations are ultimately speculative") and uses a
semicolon to join the next main clause ("the object’s...makeup") to the rest of the sentence. Further, placing the semicolon after "though"
indicates that the information in the preceding main clause (interpretations of an outer solar system object’s composition based on its color are
ultimately speculative) is a qualification of the information in the previous sentence (the composition of an outer solar system object is
suggested by its color).
Choice A is incorrect because it fails to mark the boundary between the two main clauses with appropriate punctuation. Choice C is incorrect
because placing the semicolon after "speculative" illogically indicates that the information in the next main clause ("the object’s...makeup") is a
qualification of the information in the previous clause ("Such...speculative"). Choice D is incorrect because it results in a comma splice. Commas
can’t be used in this way to punctuate a supplementary word or phrase between two main clauses.$qb$);
select seed_pool_question($qb$CB-f0864217$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Rabinal Achí is a precolonial Maya dance drama performed annually in Rabinal, a town in the Guatemalan highlands. Based on events that
occurred when Rabinal was a city-state ruled by a king, ______ had once been an ally of the king but was later captured while leading an invading
force against him.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Rabinal Achí tells the story of K’iche’ Achí, a military leader who"}, {"label": "B", "body": "K’iche’ Achí, the military leader in the story of Rabinal Achí,"}, {"label": "C", "body": "the military leader whose story is told in Rabinal Achí, K’iche’ Achí,"}, {"label": "D", "body": "there was a military leader, K’iche’ Achí, who in Rabinal Achí"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The modifier “Based on events…by a king,” is describing the drama “Rabinal Achí.” Modifiers need to be next to the
subjects they describe, so “Rabinal Achí” needs to be the first word after the comma.
Choice B is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. The modifier “Based on
events…by a king,” is describing the drama “Rabinal Achí.” Modifiers need to be next to the subjects they describe, so “Rabinal Achí” needs to be
the first word after the comma. Choice C is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard
English. The modifier “Based on events…by a king,” is describing the drama “Rabinal Achí.” Modifiers need to be next to the subjects they
describe, so “Rabinal Achí” needs to be the first word after the comma. Choice D is incorrect. This doesn’t complete the text in a way that
conforms to the conventions of Standard English. The modifier “Based on events…by a king,” is describing the drama “Rabinal Achí.” Modifiers
need to be next to the subjects they describe, so “Rabinal Achí” needs to be the first word after the comma.$qb$);
select seed_pool_question($qb$CB-c91ef0f0$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$During the American Civil War, Thomas Morris Chester braved the front lines as a war correspondent for the Philadelphia Press. Amplifying the
voices and experiences of Black soldiers ______ of particular importance to Chester, who later became an activist and lawyer during the postwar
Reconstruction period.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "were"}, {"label": "B", "body": "have been"}, {"label": "C", "body": "are"}, {"label": "D", "body": "was"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The singular verb "was" agrees in number with the singular
subject "amplifying." Gerunds such as "amplifying" are always singular.
Choice A is incorrect because the plural verb "were" doesn’t agree in number with the singular subject "amplifying." Choice B is incorrect because
the plural verb "have been" doesn’t agree in number with the singular subject "amplifying." Choice C is incorrect because the plural verb "are"
doesn’t agree in number with the singular subject "amplifying."$qb$);
select seed_pool_question($qb$CB-7b419faf$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1903, environmentalist John Muir guided President Theodore Roosevelt on a scenic, sprawling trip through California’s Yosemite Valley. Upon
returning from the three-day excursion, Roosevelt ______ to conserve the nation’s wilderness areas, a vow he upheld for his remaining six years in
office.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is vowing"}, {"label": "B", "body": "vowed"}, {"label": "C", "body": "will vow"}, {"label": "D", "body": "vows"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the past tense verb
“vowed” is consistent with the other past tense verbs (“guided” and “upheld”) used to narrate the events surrounding President Roosevelt’s
decision to conserve the nation’s wilderness areas.
Choice A is incorrect because the present progressive tense verb “is vowing” isn’t consistent with the past tense verbs used to narrate the events
surrounding President Roosevelt’s decision to conserve the nation’s wilderness areas. Choice C is incorrect because the future tense verb “will
vow” isn’t consistent with the past tense verbs used to narrate the events surrounding President Roosevelt’s decision to conserve the nation’s
wilderness areas. Choice D is incorrect because the simple present tense verb “vows” isn’t consistent with the past tense verbs used to
narrate the events surrounding President Roosevelt’s decision to conserve the nation’s wilderness areas.$qb$);
select seed_pool_question($qb$CB-29c9be28$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$To survive when water is scarce, embryos inside African turquoise killifish eggs ______ a dormant state known as diapause. In this state,
embryonic development is paused for as long as two years—longer than the life span of an adult killifish.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "enter"}, {"label": "B", "body": "to enter"}, {"label": "C", "body": "having entered"}, {"label": "D", "body": "entering"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is finite and nonfinite verb forms within a sentence. A main clause requires a finite verb
to perform the action of the subject (in this case, “embryos”), and this choice supplies the clause with the finite present tense verb “enter” to
indicate how the embryos achieve diapause.
Choice B is incorrect because the nonfinite to-infinitive “to enter” doesn’t supply the main clause with a finite verb. Choice C is incorrect because
the nonfinite participle “having entered” doesn’t supply the main clause with a finite verb. Choice D is incorrect because the nonfinite participle
“entering” doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-983d33fa$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1637, the price of tulips skyrocketed in Amsterdam, with single bulbs of rare varieties selling for up to the equivalent of $200,000 in today’s US
dollars. Some historians ______ that this “tulip mania” was the first historical instance of an asset bubble, which occurs when investors drive
prices to highs not supported by actual demand.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "claiming"}, {"label": "B", "body": "claim"}, {"label": "C", "body": "having claimed"}, {"label": "D", "body": "to claim"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of finite and nonfinite verb forms within a sentence. A main clause requires a
finite verb to perform the action of the subject (in this case, “some historians”), and this choice supplies the finite present tense verb “claim” to
indicate what some historians do.
Choice A is incorrect because the nonfinite participle “claiming” doesn’t supply the main clause with a finite verb. Choice C is incorrect because
the nonfinite participle “having claimed” doesn’t supply the main clause with a finite verb. Choice D is incorrect because the nonfinite to-infinitive
“to claim” doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-6e193b19$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Professional American football player Fred Cox invented one of the world’s most popular toys. In the 1970s, he came up with the idea for the Nerf
football, which ______ of the harder and heavier regulation football.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "were a smaller, foam version"}, {"label": "B", "body": "are smaller, foam versions"}, {"label": "C", "body": "were smaller, foam versions"}, {"label": "D", "body": "is a smaller, foam version"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement and agreement between nouns. The singular verb “is” and
the singular noun “version” both agree in number with the relative pronoun “which.” In this context, “which” functions as a singular subject
because it refers to the singular noun “the Nerf football.”
Choice A is incorrect because the plural verb “were” doesn’t agree in number with the singular noun phrase “the Nerf football” that it’s modifying.
Choice B is incorrect because the plural verb “are” and the plural noun “versions” don’t agree in number with the singular noun phrase “the Nerf
football” that they’re modifying. Choice C is incorrect because the plural verb “were” and the plural noun “versions” don’t agree in number with the
singular noun phrase “the Nerf football” that they’re modifying.$qb$);
select seed_pool_question($qb$CB-fced396a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Herfindahl-Hirschman Index (HHI), a commonly used measure of competition between companies in a particular market, ranges from a
score of zero to 10,000 points. Compared with that of a highly concentrated market—that is, a market controlled by very few companies—______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "a market that is less concentrated will have a much lower HHI score."}, {"label": "B", "body": "the HHI score of a less concentrated market will be much lower."}, {"label": "C", "body": "when a market is less concentrated, its HHI score will be much lower."}, {"label": "D", "body": "a less concentrated market will have an HHI score that is much lower."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase "the HHI...market"
the subject of the sentence and places it immediately after the modifying phrase "compared...market." In doing so, this choice clearly establishes
that the HHI score of a less concentrated market—and not another noun in the sentence—is being compared with the HHI score of a highly
concentrated market.
Choice A is incorrect because it results in a dangling modifier. The placement of "a market that is less concentrated" immediately after the
modifying phrase illogically suggests that a market is being compared with an HHI score. Choice C is incorrect because it results in a confusing,
illogical sentence. The placement of the modifier "when a market is less concentrated" after "a highly concentrated market" is contradictory.
Furthermore, it’s ambiguous what "its" is referring to in "its HHI score," resulting in an illogical comparison. Choice D is incorrect because it
results in a dangling modifier. The placement of "a less concentrated market" immediately after the modifying phrase illogically suggests that a
market is being compared with an HHI score.$qb$);
select seed_pool_question($qb$CB-e6f2dba6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$According to the traditional RYB (red-yellow-blue) color model, yellow is a complementary color to purple. However, yellow ______ considered
complementary to blue in modern color theory.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is"}, {"label": "B", "body": "having been"}, {"label": "C", "body": "to be"}, {"label": "D", "body": "being"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject (in this case, "yellow"), and this choice supplies the present tense verb "is considered" to indicate that yellow
is considered a complementary color to blue in modern color theory.
Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite participle "having been considered" doesn’t supply the main
clause with a finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive "to be considered"
doesn’t supply the main clause with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite participle
"being considered" doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-52b61716$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Formed in 1967 to foster political and economic stability within the Asia-Pacific region, the Association of Southeast Asian Nations was
originally made up of five members: Thailand, the Philippines, Singapore, Malaysia, and Indonesia. By the end of the 1990s, the organization
______ its initial membership.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has doubled"}, {"label": "B", "body": "had doubled"}, {"label": "C", "body": "doubles"}, {"label": "D", "body": "will double"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the past perfect verb “had doubled”
properly indicates that the doubling of the organization’s initial membership occurred during a specific period before the present (between the
organization’s founding in 1967 and the end of the 1990s).
Choice A is incorrect because the present perfect verb “has doubled” doesn’t indicate that the organization’s doubling of its initial membership
occurred during a specific period in the past. Choice C is incorrect because the present tense verb “doubles” doesn’t indicate that the
organization’s doubling of its initial membership occurred during a specific period in the past. Choice D is incorrect because the future tense verb
“will double” doesn’t indicate that the organization’s doubling of its initial membership occurred during a specific period in the past.$qb$);
select seed_pool_question($qb$CB-4dcedc31$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For scientists to produce new iron nanoparticles of a specific size or strength, they must first be able to monitor reactions between oxygen and
existing iron nanoparticles at a near-atomic level of detail. Fortunately, chemistry ______ and his colleagues at Temple University recently
developed a new approach that does just that.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "professor Yugang Sun"}, {"label": "B", "body": "professor Yugang Sun,"}, {"label": "C", "body": "professor, Yugang Sun,"}, {"label": "D", "body": "professor, Yugang Sun"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation between titles and proper nouns. No punctuation is needed
between the proper noun “Yugang Sun” and the title that describes Sun, “chemistry professor.” Furthermore, no punctuation is needed after “Sun”
because “chemistry professor Yugang Sun and his colleagues at Temple University” functions as the coordinated subject of the sentence, and
together Sun and colleagues performed the action of developing a new approach to producing iron nanoparticles.
Choice B is incorrect because no punctuation is needed between the proper noun “Yugang Sun” and the coordinated noun phrase “and his
colleagues at Temple University.” Choice C is incorrect because no punctuation is needed before or after the proper noun “Yugang Sun.” Setting
off the professor’s name with commas suggests that it could be removed without affecting the coherence of the sentence, which isn’t the case.
Choice D is incorrect because no punctuation is needed between the title “chemistry professor” and the proper noun “Yugang Sun.”$qb$);
select seed_pool_question($qb$CB-96c720af$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Atoms in a synchrotron, a type of circular particle accelerator, travel faster and faster until they ______ a desired energy level, at which point they
are diverted to collide with a target, smashing the atoms.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "will reach"}, {"label": "B", "body": "reach"}, {"label": "C", "body": "had reached"}, {"label": "D", "body": "are reaching"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the present tense verb
“reach” is consistent with the present tense verbs “travel” and “are diverted” used to describe how atoms move through the synchrotron.
Choice A is incorrect because the future tense verb “will reach” is inconsistent with the present tense verbs used to describe how atoms move
through the synchrotron. Though the atoms’ movement is a recurring action and “will reach” can also be used to indicate a habitual or recurring
action, it creates a logical inconsistency in this sentence when paired with the present tense verbs “travel” and “are diverted.” Choice C is
incorrect because the past perfect tense verb “had reached” is inconsistent with the present tense verbs used to describe how atoms move
through the synchrotron. Choice D is incorrect because the present progressive tense verb “are reaching” is inconsistent with the present tense
verbs used to describe how atoms move through the synchrotron. While both verbs occur in the present, the present progressive tense suggests
that the action is currently in progress. This creates a logical inconsistency when paired with the present tense verbs “travel” and “are diverted,”
which offer a general description of the tendencies of the atoms’ movement, rather than a description of an action that is currently in progress.$qb$);
select seed_pool_question($qb$CB-dbd78791$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Led by Syrian American astronomer Shadia Habbal, the Solar Wind Sherpas are an intrepid team of scientists who travel the globe to study solar
winds, the streams of particles emanating from the Sun that are only visible from certain locations during a total solar eclipse. When such an
eclipse is imminent, the Sherpas pack up their telescopes and ______ ready.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "get"}, {"label": "B", "body": "had gotten"}, {"label": "C", "body": "got"}, {"label": "D", "body": "were getting"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the present tense verb
“get” is consistent with the other present tense verbs (“are,” “travel,” and “pack”) used to describe the Sherpas and their activities.
Choice B is incorrect. The past perfect verb “had gotten” isn’t consistent with the other present tense verbs used to describe the Sherpas and
their activities. Choice C is incorrect. The past tense verb “got” isn’t consistent with the other present tense verbs used to describe the Sherpas
and their activities. Choice D is incorrect. The past progressive verb “were getting” isn’t consistent with the other present tense verbs used to
describe the Sherpas and their activities.$qb$);
select seed_pool_question($qb$CB-819c443d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In January 1776, Thomas Paine published Common Sense, an appeal for freedom from the British monarchy that famously helped ignite the
desire for independence among the American colonists. After the colonies achieved their independence, Paine moved to Paris, where the
provocative ______ would contribute to another revolution—the French Revolution.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "authors political writings"}, {"label": "B", "body": "author’s political writings"}, {"label": "C", "body": "author’s political writing’s"}, {"label": "D", "body": "authors’ political writings’"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The conventions being tested are the use of plural and possessive nouns. The singular possessive noun "author’s"
correctly indicates that the political writings are those of Thomas Paine, and the plural noun "writings" correctly indicates that multiple works by
Paine are being discussed.
Choice A is incorrect because the context requires the singular possessive noun "author’s," not the plural noun "authors." Choice C is incorrect
because the context requires the plural noun "writings," not the singular possessive noun "writing’s." Choice D is incorrect because the context
requires the singular possessive noun "author’s" and the plural noun "writings," not the plural possessive nouns "authors’" and "writings’."$qb$);
select seed_pool_question($qb$CB-100269ad$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Zydeco music originated in the French Creole community of southwest Louisiana. One instrument that gives zydeco its unique sound is the vest
frottoir. The vest frottoir ______ a wearable washboard that is played by rubbing spoons or bottle openers against it.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "have been"}, {"label": "B", "body": "is"}, {"label": "C", "body": "were"}, {"label": "D", "body": "are"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-verb agreement. The singular verb "is" agrees in number with the singular
subject "vest frottoir."
Choice A is incorrect because the plural verb "have been" doesn’t agree in number with the singular subject "vest frottoir." Choice C is incorrect
because the plural verb "were" doesn’t agree in number with the singular subject "vest frottoir." Choice D is incorrect because the plural verb "are"
doesn’t agree in number with the singular subject "vest frottoir."$qb$);
select seed_pool_question($qb$CB-674e59a3$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Following her debut album release in 2002, Mexican singer-songwriter Natalia Lafourcade quickly shot to fame. By 2023, she ______ one of the
most celebrated musicians in Latin America, having released twelve albums and won seventeen Latin Grammy awards—more than any other
female artist in history.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "will become"}, {"label": "B", "body": "becomes"}, {"label": "C", "body": "will have become"}, {"label": "D", "body": "had become"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verbs to express tense in a sentence. The past perfect tense indicates an
action that was completed before another past action. In this choice, the past perfect verb “had become,” together with the supplemental phrase
“by 2023,” indicates that Lafourcade earned her status as one of the most celebrated musicians in Latin America before 2023.
Choice A is incorrect because the future tense “will become” doesn’t indicate that Lafourcade earned her celebrated status before 2023. Choice
B is incorrect because the present tense “becomes” doesn’t indicate that Lafourcade earned her celebrated status before 2023. Choice C is
incorrect because the future perfect tense “will have become” doesn’t indicate that Lafourcade earned her celebrated status by 2023.$qb$);
select seed_pool_question($qb$CB-0aebdf5f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$According to linguist Martin Joos, speakers of the English language ______ five main registers—frozen, formal, consultative, casual, and intimate
—which they rotate between depending on the situation.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "use"}, {"label": "B", "body": "is using"}, {"label": "C", "body": "uses"}, {"label": "D", "body": "has used"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The plural verb "use" agrees in number with the plural
subject "speakers."
Choice B is incorrect because the singular verb "is using" doesn’t agree in number with the plural subject "speakers." Choice C is incorrect
because the singular verb "uses" doesn’t agree in number with the plural subject "speakers." Choice D is incorrect because the singular verb "has
used" doesn’t agree in number with the plural subject "speakers."$qb$);
select seed_pool_question($qb$CB-f10b7ce4$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the list “Adorable Things” from Sei Shōnagon’s Pillow Book, the author delights in baby sparrows, a face drawn on a melon, and a young
courtier in ceremonial garb. So shrewd an observer is Shōnagon, a lady-in-waiting to Empress Teishi, that her book’s musings on tenth-century
Japanese courtly life ______ readers a thousand years later.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "fascinate"}, {"label": "B", "body": "has fascinated"}, {"label": "C", "body": "fascinates"}, {"label": "D", "body": "is fascinating"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The plural verb "fascinate" agrees in number with the plural
subject "musings."
Choice B is incorrect because the singular verb "has fascinated" doesn’t agree in number with the plural subject "musings." Choice C is incorrect
because the singular verb "fascinates" doesn’t agree in number with the plural subject "musings." Choice D is incorrect because the singular verb
"is fascinating" doesn’t agree in number with the plural subject "musings."$qb$);
select seed_pool_question($qb$CB-155239cf$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$By analyzing ice cores from Greenland and Antarctica, a research team at Sweden’s Lund University discovered evidence of a solar storm that
occurred 9,200 years ago. Scientists had previously thought the Sun to be in a relatively “quiet” phase at that ______ the Lund team’s finding
suggests otherwise.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "time but"}, {"label": "B", "body": "time, but"}, {"label": "C", "body": "time,"}, {"label": "D", "body": "time"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and the coordinating conjunction "but" to join the first main clause ("Scientists...time") and the second main clause ("the
Lund...otherwise").
Choice A is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction. Choice C is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used
in this way to join two main clauses. Choice D is incorrect because it results in a run-on sentence. The two main clauses are fused without
punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-82a76537$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Key-value pairs are an important aspect of JavaScript Object Notation (JSON), an electronic file format for storing and transmitting data. Keys
function as labels, while values contain the actual information. In a JSON file storing data about fire belly ______ instance, you could encounter a
key such as “species” with the associated value of “Cynops orientalis.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "newts. For"}, {"label": "B", "body": "newts, for"}, {"label": "C", "body": "newts: for"}, {"label": "D", "body": "newts; for"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation within a sentence. The comma after “newts” pairs with the
comma after “instance” to separate the supplementary element “for instance” from the rest of the sentence. The supplementary element
appears between the prepositional phrase (“In…newts”) and the main clause of the sentence (“you…orientalis”) and signals that the sentence is
presenting an example of how keys and values function in JSON files.
Choice A is incorrect because it results in a sentence fragment (“In a JSON file storing data about fire belly newts”). Choice C is incorrect
because a colon can’t be paired with a comma in this way to separate the supplementary element “for instance” from the rest of the sentence.
Choice D is incorrect because a semicolon can’t be paired with a comma in this way to separate the supplementary element “for instance” from
the rest of the sentence.$qb$);
select seed_pool_question($qb$CB-e2f77ae7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$That Chaucer’s Canterbury Tales inspired imitators is evident from the existence of three near-contemporary “continuations” of the collection: The
Siege of Thebes, which purports to be a new tale told during the pilgrims’ ______ The Tale of Beryn, which depicts the pilgrims as tourists; and The
Ploughman’s Tale, which features a minor character from the original work.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "return."}, {"label": "B", "body": "return"}, {"label": "C", "body": "return;"}, {"label": "D", "body": "return,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of elements in a complex series. It’s conventional to use a
semicolon to separate items in a complex series with internal punctuation, and in this choice, the semicolon after “return” is conventionally used
to separate the first item (“The Siege of Thebes...return”) and the second item (“The Tale of Beryn...tourists”) in the series of tales. Moreover, the
semicolon after “return” matches the semicolon used later to separate the second item and the third item (“and The Ploughman’s Tale...work”) in
the series.
Choice A is incorrect because placing a period after “return” results in a rhetorically unacceptable sentence fragment beginning with “The Tale of
Beryn.” Choice B is incorrect because it fails to use appropriate punctuation to separate the first item and the second item in the complex series.
Choice D is incorrect because a comma after “return” doesn’t match the semicolon used later to separate the second and third items in the
series.$qb$);
select seed_pool_question($qb$CB-9091458d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Emperor penguins don’t waddle out of the ocean. They launch themselves at such a high speed that they travel up to two meters before landing.
How ______ A layer of microbubbles on their plumage reduces friction as the penguins speed to the surface.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "they are able to move so fast!"}, {"label": "B", "body": "are they able to move so fast."}, {"label": "C", "body": "they are able to move so fast."}, {"label": "D", "body": "are they able to move so fast?"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a question mark to
punctuate the interrogative sentence “how are they able to move so fast?” The interrogative sentence asks a direct question, and the next
sentence answers it.
Choice A is incorrect because the context requires an interrogative sentence. The exclamative sentence “how they are able to move so fast!”
emphasizes the penguin’s high rate of speed, but it doesn’t set up the next sentence’s explanation of how the penguins achieve such speeds.
Choice B is incorrect because a period can’t be used in this way to punctuate an interrogative sentence. Choice C is incorrect because the
context requires an interrogative sentence. The exclamative sentence “how they are able to move so fast” emphasizes the penguin’s high rate of
speed, but it doesn’t set up the next sentence’s explanation of how the penguins achieve such speeds.$qb$);
select seed_pool_question($qb$CB-ac5536c1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Beatrix Potter is perhaps best known for writing and illustrating children’s books such as The Tale of Peter Rabbit (1902), but she also dedicated
herself to mycology, the study of ______ more than 350 paintings of the fungal species she observed in nature and submitting her research on
spore germination to the Linnean Society of London.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "fungi; producing"}, {"label": "B", "body": "fungi. Producing"}, {"label": "C", "body": "fungi producing"}, {"label": "D", "body": "fungi, producing"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between two supplementary phrases following the coordinate
clause (“but she…mycology”). This choice correctly uses a comma to mark the boundary between the supplementary noun phrase (“the study of
fungi”) that defines the term “mycology” and the supplementary participial phrase (“producing...London”) that provides additional information
about the extent to which Potter dedicated herself to mycology.
Choice A is incorrect because a semicolon can’t be used in this way to join two supplementary phrases following a coordinate clause. Choice B
is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with “producing.” Choice C is incorrect. The lack of
punctuation results in a sentence that illogically suggests that the study of fungi is producing more than 350 paintings.$qb$);
select seed_pool_question($qb$CB-5bed774c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Philosopher Peter Kivy was a leading figure in musical ______ evidenced by his belief that instead of evoking particular emotions, such as
sadness or joy, compositions elicit a listener’s emotional response to the structure and artistry of the music itself, Kivy’s approach to the study of
music was decidedly formalist.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "aesthetics as"}, {"label": "B", "body": "aesthetics and as"}, {"label": "C", "body": "aesthetics, as"}, {"label": "D", "body": "aesthetics. As"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence ("Philosopher...aesthetics") and another ("As...formalist"). The long adverbial element "as
evidenced...itself" modifies the content in the following clause to support the claim that Kivy’s approach was formalist.
Choice A is incorrect because it results in a run-on sentence. The sentences ("Philosopher...aesthetics" and "As…formalist") are fused without
punctuation and/or a conjunction. Choice B is incorrect. Without a comma preceding it, the conjunction "and" can’t be used in this way to join
sentences. Choice C is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between
sentences.$qb$);
select seed_pool_question($qb$CB-4aa28ac3$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Nowadays, tug-of-war is usually seen as an informal game one might play at a picnic or in gym class. Surprisingly, the Olympic committee once
decided ______ tug-of-war as an official Olympic event! Nations competed in the event at the Olympic Games from 1900 to 1920.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "included"}, {"label": "B", "body": "including"}, {"label": "C", "body": "include"}, {"label": "D", "body": "to include"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite to-infinitive verb "to include" is
correctly used to form a subordinate clause that indicates what the Olympic committee decided (to include tug-of-war as an Olympic event).
Choice A is incorrect because it results in an ungrammatical sentence. The finite verb "included" can’t be used in this way to form a subordinate
clause that indicates what the Olympic committee decided. Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite
participle "including" can’t be used in this way to form a subordinate clause that indicates what the Olympic committee decided. Choice C is
incorrect because it results in an ungrammatical sentence. The finite verb "include" can’t be used in this way to form a subordinate clause that
indicates what the Olympic committee decided.$qb$);
select seed_pool_question($qb$CB-9c3630b9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Using natural debris, such as dried ______ such as plastic bags; and more traditional art supplies, such as tree glue, Ghanaian artist Ed Franklin
Gavua creates his striking Yiiiiikakaii African masks, which he hopes can help viewers rethink how waste is used in their communities.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "leaves, man-made trash:"}, {"label": "B", "body": "leaves; man-made trash,"}, {"label": "C", "body": "leaves, man-made trash,"}, {"label": "D", "body": "leaves; man-made trash;"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the punctuation of elements in a complex series. It’s conventional to use a
semicolon to separate items in a complex series with internal punctuation, and in this choice, the semicolon after "leaves" is conventionally used
to separate the first item ("natural debris, such as dried leaves") and the second item ("man-made trash, such as plastic bags") in the series of
materials used by Gavua. Further, the comma after "trash" correctly separates the noun phrase "man-made trash" from the supplementary phrase
("such as plastic bags") that describes it.
Choice A is incorrect because a comma after "leaves" doesn’t match the semicolon used later to separate the second and third items in the
series ("man-made...bags" and "and...glue"). Additionally, it’s not conventional to use a colon in this way to separate a supplementary phrase
("such as plastic bags") from the noun phrase it modifies ("man-made trash"). Choice C is incorrect because a comma after "leaves" doesn’t
match the semicolon used later to separate the second and third items in the series ("man-made...bags" and "and...glue"). Choice D is incorrect
because it’s not conventional to use a semicolon in this way to separate a supplementary phrase ("such as plastic bags") from the noun phrase it
modifies ("man-made trash").$qb$);
select seed_pool_question($qb$CB-8df848c1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When they were first introduced to western Europe from Byzantium in the eleventh century, table forks were met with much resistance. The
Bishop of Ostia, St. Peter Damian, condemned the eating utensils because he considered ______ dangerous and unnecessary luxury items.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "them"}, {"label": "B", "body": "this"}, {"label": "C", "body": "that"}, {"label": "D", "body": "it"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is pronoun-antecedent agreement. The plural pronoun "them" agrees in number with
the plural antecedent "utensils."
Choice B is incorrect because the singular pronoun "this" doesn’t agree in number with the plural antecedent "utensils." Choice C is incorrect
because the singular pronoun "that" doesn’t agree in number with the plural antecedent "utensils." Choice D is incorrect because the singular
pronoun "it" doesn’t agree in number with the plural antecedent "utensils."$qb$);
select seed_pool_question($qb$CB-77bf77cd$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Farouk El-Baz, a geologist and space scientist, ______ part of the team that selected the lunar landing sites for the Apollo program during the
1960s and 1970s.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are"}, {"label": "B", "body": "was"}, {"label": "C", "body": "have been"}, {"label": "D", "body": "were"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-verb agreement. The singular verb "was" agrees in number with the singular
subject "Farouk El-Baz."
Choice A is incorrect because the plural verb "are" doesn’t agree in number with the singular subject "Farouk El-Baz." Choice C is incorrect
because the plural verb "have been" doesn’t agree in number with the singular subject "Farouk El-Baz." Choice D is incorrect because the plural
verb "were" doesn’t agree in number with the singular subject "Farouk El-Baz."$qb$);
select seed_pool_question($qb$CB-74253458$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Cycads are palmlike plants with cones. ______ plants were abundant throughout the Mesozoic Era (66 to 252 million years ago).
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "These"}, {"label": "B", "body": "That"}, {"label": "C", "body": "Each"}, {"label": "D", "body": "This"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of determiners. The plural demonstrative determiner “these” agrees in
number with the plural noun “plants” that it modifies. This choice clearly indicates that the plants, referring to cycads from the previous sentence,
were abundant throughout the Mesozoic Era.
Choice B is incorrect because the singular demonstrative determiner “that” doesn’t agree in number with the plural noun “plants.” Choice C is
incorrect because the singular determiner “each” doesn’t agree in number with the plural noun “plants.” Choice D is incorrect because the
singular demonstrative determiner “this” doesn’t agree in number with the plural noun “plants.”$qb$);
select seed_pool_question($qb$CB-3a2d77d7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the 1950s, novel audio technologies allowed the addition of another instrument to jazz and swing ______ relatively quiet instrument, its full
range of sound was finally audible alongside the blaring brass instruments of the time, allowing flautists like Bennie Maupin and Bobbi
Humphrey to perform with other jazz greats.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "music, the flute, a"}, {"label": "B", "body": "music. The flute, a"}, {"label": "C", "body": "music; the flute, a"}, {"label": "D", "body": "music: the flute. A"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within and between sentences. In this choice, the colon
correctly introduces the name of the instrument (the flute) that novel audio technologies allowed to be added to jazz and swing. In addition, the
period is used to correctly mark the boundary between one sentence ("In…flute") and another ("A relatively…greats").
Choice A is incorrect because it results in a comma splice. A comma can’t be used in this way to join two main clauses ("In…quiet instrument"
and "its…greats"). Choice B is incorrect. In standard English, it’s unconventional to form a sentence in this way with two uncoordinated subjects
("the flute" and "its full range of sound"), and the lack of a clear main subject results in an awkwardly constructed and confusing sentence.
Choice C is incorrect. In standard English, it’s unconventional to form an independent clause in this way with two uncoordinated subjects ("the
flute" and "its full range of sound"), and the lack of a clear main subject results in an awkwardly constructed and confusing clause.$qb$);
select seed_pool_question($qb$CB-435809d8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$On March 23, 2021, a gust of wind wreaked havoc on global trade. Ever Given, an international shipping container vessel, became lodged in
Egypt’s Suez Canal, a major shipping route between Europe and Asia. The vessel took six days to ______ it’s as heavy as two thousand blue
whales when fully loaded.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "dislodge in part due to its sheer size,"}, {"label": "B", "body": "dislodge, in part due to its sheer size:"}, {"label": "C", "body": "dislodge, in part due to its sheer size,"}, {"label": "D", "body": "dislodge, in part, due to its sheer size"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation between main clauses and a supplementary element. This choice
correctly uses a comma to mark the boundary between the main clause ("The vessel took six days to dislodge") and the supplementary element
("in part due to its sheer size") that provides additional information on why the vessel was difficult to dislodge. Additionally, this choice correctly
uses a colon to introduce another main clause that describes the vessel’s size ("it’s as heavy as two thousand blue whales when fully loaded").
Choice A is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between two main clauses
("The vessel…size" and "it’s…loaded"). Additionally, it fails to mark the boundary between the main clause ("The vessel took six days to dislodge")
and the supplementary element ("in part due to its sheer size"). Choice C is incorrect because it results in a comma splice. A comma can’t be
used in this way to mark the boundary between two main clauses ("The vessel…size" and "it’s…loaded"). Choice D is incorrect because it results
in a run-on sentence. The two main clauses ("The vessel…size" and "it’s…loaded") are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-ea0aa676$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the 1970s, Janaki Ammal, a prominent botanist, emerged as a powerful voice in India’s environmental conservation movement. Her exhaustive
chromosomal survey of plants in Silent Valley, a pristine tropical forest in Kerala, India, that is home to nearly 1,000 species of native flora (many
of which are endangered), ______ instrumental in the government’s decision to preserve the forest.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are"}, {"label": "B", "body": "were"}, {"label": "C", "body": "have been"}, {"label": "D", "body": "was"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The subject "survey" is singular, and so is the verb "was."
Choice A is incorrect. The subject "survey" is singular, but the verb "are" is plural. Choice B is incorrect. The subject "survey" is singular, but the
verb "were" is plural. Choice C is incorrect. The subject "survey" is singular, but the verb "have been" is plural.$qb$);
select seed_pool_question($qb$CB-353890a1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Water is constantly moving and changing forms on Earth and in the atmosphere. This process is called the water cycle, and it is typically thought
to consist of evaporation, condensation, and precipitation. However, the National Oceanic and Atmospheric Administration seeks ______
understanding of the water cycle to include transpiration, sublimation, and other types of water movement.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is expanding"}, {"label": "B", "body": "to expand"}, {"label": "C", "body": "has expanded"}, {"label": "D", "body": "expands"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite to-infinitive verb “to expand” is
correctly used to form a subordinate clause that indicates what the National Oceanic and Atmospheric Administration seeks to do.
Choice A is incorrect because it results in an ungrammatical sentence. The finite verb “is expanding” can’t be used in this way to form a
subordinate clause that indicates what the National Oceanic and Atmospheric Administration seeks to do. Choice C is incorrect because it
results in an ungrammatical sentence. The finite verb “has expanded” can’t be used in this way to form a subordinate clause that indicates what
the National Oceanic and Atmospheric Administration seeks to do. Choice D is incorrect because it results in an ungrammatical sentence. The
finite verb “expands” can’t be used in this way to form a subordinate clause that indicates what the National Oceanic and Atmospheric
Administration seeks to do.$qb$);
select seed_pool_question($qb$CB-b0115ef6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Technologies such as microphones and inkjet printers are made using piezoelectric materials, which generate an internal electric field when
pressure is applied to them. The toxic nature of some of these materials recently led a team from the University of Sheffield to investigate how
______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "could their use be better regulated?"}, {"label": "B", "body": "their use could be better regulated."}, {"label": "C", "body": "their use could be better regulated?"}, {"label": "D", "body": "could their use be better regulated."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a period to punctuate a
declarative sentence that asks an indirect question ("The toxic nature of some of these materials recently led a team from the University of
Sheffield to investigate how their use could be better regulated").
Choice A is incorrect because the structure requires a period and a declarative clause at the end of the sentence that states what the team
investigated, not an interrogative clause that asks a direct question, such as "how could their use be better regulated?" Choice C is incorrect
because it’s unconventional to use a question mark in this way to punctuate a declarative sentence. Choice D is incorrect because the structure
requires a declarative clause at the end of the sentence that states what the team investigated, not an interrogative clause that asks a direct
question, such as "how could their use be better regulated?"$qb$);
select seed_pool_question($qb$CB-ee4aa2aa$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$During a 2022 expedition led by research zoologist Andrea Quattrini, scientists discovered a new species of black coral off the coast of Puerto
Rico. Like other black corals, the newly discovered species, which they named Aphanipathes puertoricoensis, has coiled branching structures that
______ it survive in the deep sea.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has helped"}, {"label": "B", "body": "helps"}, {"label": "C", "body": "helping"}, {"label": "D", "body": "help"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms within a sentence. The plural verb “help” provides the relative
clause beginning with “that” with a finite verb and agrees in number with the plural subject “coiled branching structures.”
Choice A is incorrect because the singular verb “has helped” doesn’t agree in number with the plural subject “coiled branching structures.” Choice
B is incorrect because the singular verb “helps” doesn’t agree in number with the plural subject “coiled branching structures.” Choice C is
incorrect because it results in an ungrammatical sentence. The nonfinite participle “helping” doesn’t supply a finite verb to the relative clause
beginning with “that.”$qb$);
select seed_pool_question($qb$CB-83898524$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In addition to advocating for South America’s independence in two political treatises, the Cartagena Manifesto and the Letter from Jamaica,
Simón Bolívar personally led armies against the Spanish, liberating three South American territories—New Granada (present-day Colombia and
Panama), Venezuela, and Quito (present-day ______ from colonial rule.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Ecuador,)"}, {"label": "B", "body": "Ecuador)"}, {"label": "C", "body": "Ecuador),"}, {"label": "D", "body": "Ecuador)—"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The dash after
“Ecuador” and the closing parenthesis pairs with the dash after “territories” to separate the supplementary element (“New…Ecuador”) from the
rest of the sentence. The supplementary element specifies the three South American territories that Simón Bolívar liberated, and the pair of
dashes indicates that this element could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the sentence.
Furthermore, punctuation isn’t needed between “Ecuador” and the closing parenthesis. Choice B is incorrect because it fails to use appropriate
punctuation to separate the supplementary element from the rest of the sentence. Choice C is incorrect because a comma can’t be paired with a
dash to separate the supplementary element from the rest of the sentence.$qb$);
select seed_pool_question($qb$CB-fba5d8d1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In a 2016 study, Eastern Washington University psychologist Amani El-Alayli found that, among the study participants who experienced frisson (a
physiological response akin to goosebumps or getting the chills) while listening to music, there was one personality trait that they scored
particularly ______ openness to experience.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "high. On"}, {"label": "B", "body": "high on;"}, {"label": "C", "body": "high on"}, {"label": "D", "body": "high on:"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between a main clause and a supplementary phrase. In this choice,
a colon is correctly used to mark the boundary between the main clause ("there...on") and the supplementary phrase ("openness to experience")
and to introduce the information that identifies which personality trait participants scored especially high on.
Choice A is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with "on" and separates a necessary
preposition from the clause beginning with "there." Choice B is incorrect because a semicolon can’t be used in this way to join the main clause
("there...on") and the supplementary phrase ("openness to experience"). A semicolon is conventionally used to join two main clauses, whereas a
colon is conventionally used to introduce an element that explains or amplifies the information in the preceding clause, making the colon the
better choice in this context. Choice C is incorrect because it fails to mark the boundary between the main clause ("there...on") and the
supplementary phrase ("openness to experience").$qb$);
select seed_pool_question($qb$CB-57998dd3$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Obsidian is a kind of volcanic glass formed when lava cools so quickly that the atoms inside it cannot arrange themselves in a crystalline
structure. You ______ more about obsidian’s structure, which is classified as amorphous, in a later chapter.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "had learned"}, {"label": "B", "body": "had been learning"}, {"label": "C", "body": "will learn"}, {"label": "D", "body": "have learned"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the future tense verb
“will learn,” used in conjunction with the phrase “in a later chapter,” correctly indicates that “you” (the reader) are going to learn about obsidian’s
structure at some point in the future.
Choice A is incorrect because the past perfect verb “had learned” doesn’t indicate that the subject is going to learn about obsidian’s structure in
the future. Choice B is incorrect because the past perfect progressive verb “had been learning” doesn’t indicate that the subject is going to learn
about obsidian’s structure in the future. Choice D is incorrect because the present perfect verb “have learned” doesn’t indicate that the subject is
going to learn about obsidian’s structure in the future.$qb$);
select seed_pool_question($qb$CB-dc645172$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The artistic talents of Barbara Chase-Riboud, most known for her 1979 historical novel Sally Hemings and the conversation it inspired, ______
limited to the realm of prose: she first excelled in sculpture, where her affinity for bronze—a material she described as “timeless” due to its use
across eras and cultures—became part of her artistic identity.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "hasn’t been"}, {"label": "B", "body": "wasn’t"}, {"label": "C", "body": "isn’t"}, {"label": "D", "body": "aren’t"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The subject "talents" is plural, and so is the verb "aren’t": "the artistic talents…aren’t limited."
Choice A is incorrect. The subject "talents" is plural, but the verb "hasn’t been" is singular. Choice B is incorrect. The subject "talents" is plural, but
the verb "wasn’t" is singular. Choice C is incorrect. The subject "talents" is plural, but the verb "isn’t" is singular.$qb$);
select seed_pool_question($qb$CB-6fece68e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Emperor Ashoka ruled the Maurya Empire in South Asia from roughly 270 to 232 BCE. He is known for enforcing a moral code called the Law of
Piety, which established the sanctity of animal ______ the just treatment of the elderly, and the abolition of the slave trade.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "life"}, {"label": "B", "body": "life;"}, {"label": "C", "body": "life:"}, {"label": "D", "body": "life,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. Notice that "the sanctity of animal life" is the first item in a list of three things. We must use a comma to separate
the first two items in the list, just as a comma is used to separate "the just treatment of the elderly" and "the abolition of the slave trade."
Choice A is incorrect. This choice creates a punctuation error. Notice that "the sanctity of animal life" is the first item in a list of three things. To
appropriately format the list, we need punctuation to separate each item. Choice B is incorrect. This choice creates a punctuation error. Notice
that "the sanctity of animal life" is the first item in a list of three things. While semicolons are sometimes used to separate list items, this list uses
commas to separate the other list items, and lists must use the same punctuation throughout. Choice C is incorrect. This choice creates a
punctuation error. Notice that "the sanctity of animal life" is the first item in a list of three things. While colons can be used to introduce lists, they
can’t be used to separate items within a list.$qb$);
select seed_pool_question($qb$CB-886dc9f9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$On July 23, 1854, a clipper ship called the Flying Cloud entered San Francisco ______ left New York Harbor under the guidance of Captain Josiah
Perkins Creesy and his wife, navigator Eleanor Creesy, a mere 89 days and 8 hours earlier, the celebrated ship set a record that would stand for
135 years.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Bay and having"}, {"label": "B", "body": "Bay. Having"}, {"label": "C", "body": "Bay, having"}, {"label": "D", "body": "Bay having"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period after “Bay” is used
correctly to mark the boundary between one sentence (“On…Bay”) and another sentence that begins with a supplementary phrase (“Having…
years”). Here, the supplementary phrase beginning with “having” modifies the subject of the second sentence, “the celebrated ship.”
Choice A is incorrect. Without a comma preceding it, the conjunction “and” can’t be used in this way to join sentences. Choice C is incorrect
because it results in a comma splice. A comma can’t be used in this way to join two sentences. Choice D is incorrect because it results in a run-
on sentence. The sentences (“On…Bay” and “having…years”) are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-166efaa2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Public-awareness campaigns about the need to reduce single-use plastics can be successful, says researcher Kim Borg of Monash University in
Australia, when these campaigns give consumers a choice: for example, Japan achieved a 40 percent reduction in plastic-bag use after cashiers
were instructed to ask customers whether ______ wanted a bag.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "they"}, {"label": "B", "body": "one"}, {"label": "C", "body": "you"}, {"label": "D", "body": "it"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is pronoun–antecedent agreement. The plural pronoun “they” agrees in number with
the plural antecedent “customers.”
Choice B is incorrect because the singular pronoun “one” doesn’t agree in number with the plural antecedent “customers.” Choice C is incorrect
because the second person pronoun “you” isn’t conventional as a substitute for “customers.” It suggests that the audience (“you”) is the
customer. Choice D is incorrect because the singular pronoun “it” doesn’t agree in number with the plural antecedent “customers.”$qb$);
select seed_pool_question($qb$CB-59a246dc$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When external forces are applied to common glass made from silicates, energy builds up around minuscule defects in the material, resulting in
fractures. Recently, engineer Erkka Frankberg of Tampere University in Finland used the chemical ______ to make a glassy solid that can
withstand higher strain than silicate glass can before fracturing.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "compound, aluminum oxide"}, {"label": "B", "body": "compound aluminum oxide,"}, {"label": "C", "body": "compound, aluminum oxide,"}, {"label": "D", "body": "compound aluminum oxide"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation around noun phrases. No punctuation is needed because the
noun phrase “aluminum oxide” is a restrictive appositive, meaning that it provides essential identifying information about the noun phrase before
it, “the chemical compound,” and thus doesn’t require punctuation around it.
Choice A is incorrect because no punctuation is needed. Choice B is incorrect because no punctuation is needed. Choice C is incorrect
because the noun phrase “aluminum oxide” is a restrictive appositive. Setting the phrase off with punctuation suggests that it could be removed
without affecting the coherence of the sentence, which isn’t the case.$qb$);
select seed_pool_question($qb$CB-a153ad6a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While light is known as one of the fastest-moving substances, it slows down when passing through some types of matter. One such type of
matter is a form of cooled, condensed gas called a Bose-Einstein condensate ______ Dutch physicist Lene Hau famously used a BEC to slow a
beam of light to a complete halt.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "(BEC),"}, {"label": "B", "body": "(BEC) and"}, {"label": "C", "body": "(BEC);"}, {"label": "D", "body": "(BEC)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
semicolon to join the first main clause ("One…(BEC)") and the second main clause ("Dutch…halt").
Choice A is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. Choice B is incorrect because it results in a run-on sentence. Without a comma preceding it, a conjunction can’t be used in this way to
join two main clauses. Choice D is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or
a conjunction.$qb$);
select seed_pool_question($qb$CB-e060dd6b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Recordings of electrical activity in the brain, ______ increased activity in brain areas associated with suppressing motor functions.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "electrograms show that while responding to hypothetical match scenarios, the most highly skilled soccer players have"}, {"label": "B", "body": "the most highly skilled soccer players responding to hypothetical match scenarios have electrograms that show"}, {"label": "C", "body": "responses to hypothetical match scenarios show that the most highly skilled soccer players have electrograms with"}, {"label": "D", "body": "hypothetical match scenario responses show that the most highly skilled soccer players captured in electrograms have"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun “electrograms” the subject
of the sentence and places it immediately after the modifying phrase “recordings of electrical activity in the brain.” In doing so, this choice clearly
establishes that electrograms—and not other nouns or noun phrases in the sentence—are recordings of electrical activity in the brain.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase “the most highly skilled soccer players”
immediately after the modifying phrase illogically suggests that the players are recordings of electrical activity in the brain. Choice C is incorrect
because it results in a dangling modifier. The placement of the noun phrase “responses to hypothetical match scenarios” immediately after the
modifying phrase illogically suggests that these responses are recordings of electrical activity in the brain. Choice D is incorrect because it
results in a dangling modifier. The placement of the noun phrase “hypothetical match scenario responses” immediately after the opening phrase
illogically suggests that these responses are recordings of electrical activity in the brain.$qb$);
select seed_pool_question($qb$CB-35ae047d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1929, Edwin Herbert Land invented a polarizing filter that was featured in a number of products, from sunglasses to 3D movies. A decade later,
Land ______ his technology to invent the world’s first instant camera, the Polaroid Land camera.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "used"}, {"label": "B", "body": "to have used"}, {"label": "C", "body": "to use"}, {"label": "D", "body": "using"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject (in this case, Land), and this choice supplies the finite past tense verb "used" to indicate what Land did with
the technology he had invented.
Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite perfect infinitive "to have used" doesn’t supply the main
clause with a finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive "to use" doesn’t supply
the main clause with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite participle "using" doesn’t
supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-9eb43963$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Water in the North Atlantic Ocean is pushed eastward by powerful winds, but the rotation of Earth and interference from nearby landmasses
together cause ______ to swirl into a massive, churning whirlpool—also called the North Atlantic Gyre—that spins clockwise.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "these"}, {"label": "B", "body": "those"}, {"label": "C", "body": "them"}, {"label": "D", "body": "it"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is pronoun-antecedent agreement. The singular pronoun "it" agrees in number with the
singular antecedent "water" and clearly indicates that the water swirls into a whirlpool.
Choice A is incorrect. The plural pronoun "these" neither agrees in number with the singular antecedent "water" nor clearly indicates that the
water—not another plural noun in the sentence, such as "landmasses" or "winds"—swirls into a whirlpool. Choice B is incorrect. The plural
pronoun "those" neither agrees in number with the singular antecedent "water" nor clearly indicates that the water—not another plural noun in the
sentence, such as "landmasses" or "winds"—swirls into a whirlpool. Choice C is incorrect. The plural pronoun "them" neither agrees in number
with the singular antecedent "water" nor clearly indicates that the water—not another plural noun in the sentence, such as "landmasses" or
"winds"—swirls into a whirlpool.$qb$);
select seed_pool_question($qb$CB-5ef9fc48$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In biology, many initially disordered systems will naturally move toward greater order according to the principle of self-organization, a conceptual
framework for pattern ______ biologists believe can be used to explain a range of organic phenomena, from population dynamics to the sociality
of bees and ants.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "formation, that some"}, {"label": "B", "body": "formation. Some"}, {"label": "C", "body": "formation that some"}, {"label": "D", "body": "formation; some"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use and punctuation of an integrated relative clause. In this choice, the relative
pronoun “that” is used to create an integrated relative clause that modifies the preceding noun phrase “a conceptual framework for pattern
formation.” No punctuation is necessary between the noun phrase and the relative clause because the relative clause is supplying essential
information about the framework.
Choice A is incorrect because no punctuation is needed between the noun phrase (“a conceptual…formation”) and the integrated relative clause
beginning with “that.” Choice B is incorrect because it results in a confusing and ungrammatical sentence. Choice D is incorrect because it
results in an ungrammatical sentence. A semicolon is used to join two main clauses or items in a complex series, and what follows “formation”
is neither of these.$qb$);
select seed_pool_question($qb$CB-eeb14722$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The soundtrack to Mira Nair’s 1991 film Mississippi Masala expressively captures the clashing of cultures that happens when ______ (a young
Indian woman from Uganda and a young African American man from Mississippi) meet. Featured throughout the film are songs from Uganda’s
Afrigo Band, the Indian composer L. Subramaniam, and the Mississippi blues musician Sam Chatmon.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "it’s two protagonists"}, {"label": "B", "body": "its two protagonist’s"}, {"label": "C", "body": "it’s two protagonist’s"}, {"label": "D", "body": "its two protagonists"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The conventions being tested are the use of possessive determiners and the use of plural nouns. The singular
possessive determiner "its"—which agrees in number with the singular noun phrase "Mira Nair’s 1991 film Mississippi Masala"—and the plural
noun "protagonists" correctly indicate that Nair’s film has multiple protagonists.
Choice A is incorrect because "it’s" is the contraction for "it is," not a possessive determiner. Choice B is incorrect because the context requires
the plural noun "protagonists," not the singular possessive noun "protagonist’s." Choice C is incorrect because the context requires the
possessive determiner "its" and the plural noun "protagonists," not the contraction "it’s" or the singular possessive noun "protagonist’s."$qb$);
select seed_pool_question($qb$CB-6e071432$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 1986, conceptual artist Sophie Calle asked twenty-three people, all of whom had been born without sight, to describe “their image of beauty” in
rich detail. Calle paired excerpts of these conversations with photographs—both of interviewees and the items they ______ to powerful effect in
her exhibition The Blind.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "described, from hair to grass to sculptures"}, {"label": "B", "body": "described, from hair to grass to sculptures—"}, {"label": "C", "body": "described—from hair to grass to sculptures,"}, {"label": "D", "body": "described: from hair to grass to sculptures"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the punctuation of supplementary elements within a sentence. The comma after
"described" separates the first supplementary element ("both of interviewees and the items they described") from the second supplementary
element ("from hair to grass to sculptures"). Furthermore, the dash after "sculptures" pairs with the dash after "photographs" to separate these
two supplementary elements from the rest of the sentence. The pair of dashes, which operate at a higher organizing level than the comma,
indicates that the elements between the dashes function together—in this case, the second supplement ("from…sculptures") describes the range
of items mentioned in the first supplement—and could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because it fails to appropriately punctuate the supplementary elements in the sentence. A dash is needed after "sculptures"
to separate the supplementary elements ("both…sculptures") from the rest of the sentence. Choice C is incorrect because it fails to appropriately
punctuate the supplementary elements in the sentence. The two supplementary elements "both…described" and "from…sculptures" function
together to describe the photographs, and placing a dash between them would make this relationship less clear, suggesting that the supplement
"both...described" is a standalone element that could be removed without affecting the grammatical coherence of the sentence, which isn’t the
case. Choice D is incorrect because it fails to appropriately punctuate the supplementary elements in the sentence. A colon isn’t conventionally
used in this way to separate a supplementary element ("from hair to grass to sculptures") from the noun phrase it is modifying ("items they
described"). Additionally, a dash is needed after "sculptures" to separate the supplementary elements ("both…sculptures") from the rest of the
sentence.$qb$);
select seed_pool_question($qb$CB-db4e3819$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Midway through her 1968 jazz album A Monastic Trio, Alice Coltrane switches instruments, swapping the piano for the harp. With the same fluid
style that Coltrane was famous for on piano, she ______ her fingers across the harp strings and creates a radiant sound.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "sweep"}, {"label": "B", "body": "are sweeping"}, {"label": "C", "body": "were sweeping"}, {"label": "D", "body": "sweeps"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The singular verb "sweeps" agrees in number with the
singular subject "she," which refers to Alice Coltrane.
Choice A is incorrect because the plural verb "sweep" doesn’t agree in number with the singular subject "she." Choice B is incorrect because the
plural verb "are sweeping" doesn’t agree in number with the singular subject "she." Choice C is incorrect because the plural verb "were sweeping"
doesn’t agree in number with the singular subject "she."$qb$);
select seed_pool_question($qb$CB-20ea68b7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$It can take time for proposed amendments to the US Constitution to become law. For example, the Twenty-Second Amendment, which limits the
number of ______ can serve, was first proposed in 1947 but wasn’t approved by the required three-fourths majority of state legislatures until
1951.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "terms presidents"}, {"label": "B", "body": "term’s presidents"}, {"label": "C", "body": "term’s president’s"}, {"label": "D", "body": "terms president’s"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of plural nouns. The plural nouns "terms" and "presidents" correctly indicate
that the amendment involves multiple terms and applies to presidents in general.
Choice B is incorrect because the context requires the plural noun "terms," not the singular possessive noun "term’s." Choice C is incorrect
because the context requires the plural nouns "terms" and "presidents," not the singular possessive nouns "term’s" and "president’s." Choice D is
incorrect because the context requires the plural noun "presidents," not the singular possessive noun "president’s."$qb$);
select seed_pool_question($qb$CB-77e06a09$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Between 322 and 184 BCE, the Maurya Empire established a complex economic system that, through trade and centralized ______ funded major
infrastructure projects throughout the Indian subcontinent. This included the building of many roads, canals, and hospitals.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "taxation:"}, {"label": "B", "body": "taxation,"}, {"label": "C", "body": "taxation—"}, {"label": "D", "body": "taxation"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation within a sentence. The comma after "taxation" pairs with the
comma after "that" to separate the supplementary element "through trade and centralized taxation" from the rest of the sentence. This
supplementary element functions to identify the funding source of the Mauryan economy, and the pair of commas indicates that this element
could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because a colon can’t be paired with a comma in this way to separate the supplementary element from the rest of the
sentence. Choice C is incorrect because a dash can’t be paired with a comma in this way to separate the supplementary element from the rest of
the sentence. Choice D is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the
sentence.$qb$);
select seed_pool_question($qb$CB-6ea8c23f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 2018, a team of researchers led by Dr. Caitlin Whalen compiled every available measurement of ocean mixing rates from the past two
decades. With this novel data set, the team was able to determine how current-driven mixing varies across ______ and what impact it has on the
distribution of heat and nutrients in the ocean.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "regions,"}, {"label": "B", "body": "regions:"}, {"label": "C", "body": "regions;"}, {"label": "D", "body": "regions"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation between coordinates in a sentence. The two elements "how…regions"
and "what…ocean" work together as coordinates to complete the description of what the team was able to determine. Because there are only two
coordinates in this case (as opposed to a series of three or more), no punctuation is needed between them.
Choice A is incorrect because no punctuation is needed between the coordinates "how…regions" and "what…ocean." Choice B is incorrect
because no punctuation is needed between the coordinates "how…regions" and "what…ocean." Choice C is incorrect because no punctuation is
needed between the coordinates "how…regions" and "what…ocean."$qb$);
select seed_pool_question($qb$CB-aab74a3b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Researcher Lin Zhi developed a process for increasing the tensile strength—measured in gigapascals, or GPa—of silkworm ______ dissolving and
reweaving the silk in a solution of iron metal ions, zinc, and sugar, Zhi increased the amount of force required to stretch it from approximately 0.5
GPa to 2 GPa.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "silk, by"}, {"label": "B", "body": "silk by"}, {"label": "C", "body": "silk and by"}, {"label": "D", "body": "silk. By"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The independent clauses "researcher Lin Zhi…silk" and "by dissolving…2 GPa" can be grammatically separated by a
period. They can stand alone as sentences, and this is the only choice that lets them do that.
Choice A is incorrect. This choice results in a grammar error called a comma splice. "Researcher Lin Zhi…silk" and "by dissolving…2 GPa" are both
independent clauses. They need to either be separated with punctuation like a period or a semicolon, or they need to be connected by a comma
and a coordinating conjunction like "and." A comma alone isn’t enough. Choice B is incorrect. This choice results in a grammar error called a run-
on sentence. "Researcher Lin Zhi…silk" and "by dissolving…2 GPa" are both independent clauses. They need to either be separated with
punctuation like a period or a semicolon, or they need to be connected by a comma and a coordinating conjunction like "and." Choice C is
incorrect. This choice results in a grammar error called a run-on sentence. "Researcher Lin Zhi…silk" and "by dissolving…2 GPa" are both
independent clauses. The coordinating conjunction "and" isn’t enough to link them by itself. We need a comma, too.$qb$);
select seed_pool_question($qb$CB-1724dac2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A subseasonal weather forecast attempts to predict weather conditions three to four weeks in ______ its predictions are therefore more short-
term than those of the seasonal forecast, which attempts to predict the weather more than a month in advance.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "advance,"}, {"label": "B", "body": "advance"}, {"label": "C", "body": "advance;"}, {"label": "D", "body": "advance and"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The clause “A subseasonal…advance” and the clause “its predictions…forecast” are both independent clauses, so
using a semicolon to separate them is grammatically correct.
Choice A is incorrect. This choice creates a run-on sentence error. The clause “A subseasonal…advance” and the clause “its predictions…
forecast” are both independent clauses, so a comma is not enough to separate them. Choice B is incorrect. This choice creates a run-on
sentence error. The clause “A subseasonal…advance” and the clause “its predictions…forecast” are both independent clauses, so they need to be
separated with specific punctuation (a period, a semi-colon, a colon, a dash, or a comma + a coordinating conjunction). Choice D is incorrect.
This choice creates a run-on sentence error. The clause “A subseasonal…advance” and the clause “its predictions…forecast” are both
independent clauses, so the word “and” by itself is not enough to separate them. There would need to be a comma before “and” for this choice to
work.$qb$);
select seed_pool_question($qb$CB-512f0ac9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Working from an earlier discovery of Charpentier’s, chemists Emmanuelle Charpentier and Jennifer Doudna—winners of the 2020 Nobel Prize in
Chemistry—re-created and then reprogrammed the so-called “genetic scissors” of a species of DNA-cleaving bacteria ______ a tool that is
revolutionizing the field of gene technology.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "to forge"}, {"label": "B", "body": "forging"}, {"label": "C", "body": "forged"}, {"label": "D", "body": "and forging"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of finite and nonfinite verb forms within a sentence. The nonfinite to-infinitive
“to forge” is correctly used to form a nonfinite (infinitive) clause that explains why the chemists re-created and reprogrammed the DNA-cleaving
bacteria.
Choice B is incorrect. Without a comma separating the main clause (“chemists...bacteria”) from the participle “forging,” this choice illogically
suggests that the bacteria are forging a tool, which doesn’t make sense. Choice C is incorrect. Without a coordinating conjunction such as “and”
placed before it, the finite past tense verb “forged” can’t be used in this way to describe the chemists’ actions. Choice D is incorrect. If read as a
finite verb, the present progressive verb “forging” isn’t consistent with the past tense verbs used in this sentence to describe the actions of the
chemists. If read as a nonfinite verb, the participle “forging” can’t be used in this way because there is no following main clause for it to modify.$qb$);
select seed_pool_question($qb$CB-4320b4ad$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For decades after World War II, the women who had worked for the US military as wartime codebreakers ______ their vital efforts a secret.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "to keep"}, {"label": "B", "body": "having kept"}, {"label": "C", "body": "keeping"}, {"label": "D", "body": "kept"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject (in this case, “the women”), and this choice supplies the finite past tense verb “kept” to indicate what the
women did.
Choice A is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive “to keep” doesn’t supply the main clause with a
finite verb. Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite perfect participle “having kept” doesn’t supply
the main clause with a finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The nonfinite present participle
“keeping” doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-e67f9967$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For her film I Am Somebody (1970), a documentary about a successful months-long strike held by Black female hospital workers in Charleston,
South Carolina, director Madeline Anderson chose a narrator who had participated in the ______ by allowing the narrative to be shaped by one of
their own, amplified the agency and power the workers possessed.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "protest. A decision that"}, {"label": "B", "body": "protest; a decision that,"}, {"label": "C", "body": "protest, a decision that,"}, {"label": "D", "body": "protest a decision that,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma after
“protest” to mark the boundary between the main clause (“For...protest”) and the supplementary appositive (“a decision...possessed”) that
provides additional information about Anderson’s choice of narrator. Furthermore, the comma after “that” pairs with the comma after “own” to
separate the supplementary adverbial phrase “by allowing...own” from the rest of the appositive. This adverbial phrase functions to explain how
Anderson’s choice of a narrator amplified the agency and power the hospital workers possessed, and the pair of commas indicates that this
element could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with “a decision.” Choice B is incorrect
because a semicolon can’t be used in this way to join the main clause (“For...protest”) and the supplementary appositive (“a
decision...possessed”). A semicolon is conventionally used to join two main clauses, and “a decision...possessed” isn’t a main clause. Choice D
is incorrect because it fails to mark the boundary between the main clause (“For...protest”) and the supplementary appositive (“a
decision...possessed”) with appropriate punctuation.$qb$);
select seed_pool_question($qb$CB-1aa3f174$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Mesoamerican city of Teotihuacan featured a uniquely egalitarian urban housing infrastructure. Built between the first and seventh centuries
CE, Teotihuacan housed its residents (as many as 200,000, by some ______ in a complex of comfortable apartments of comparable size.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "estimates)"}, {"label": "B", "body": "estimates),"}, {"label": "C", "body": "estimates—"}, {"label": "D", "body": "estimates"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly completes the
parenthetical element "as many as 200,000, by some estimates" with a closing parenthesis, pairing with the opening parenthesis that appears
earlier in the sentence. This parenthetical element functions to specify the number of residents, and the use of parentheses indicates that this
element could be removed without affecting the grammatical coherence of the sentence.
Choice B is incorrect. While this choice completes the parenthetical element with a closing parenthesis, no comma is needed before the
prepositional phrases ("in...size") that provide essential information about where the residents were housed. Choice C is incorrect because a
dash can’t be paired with an opening parenthesis in this way to separate the parenthetical element from the rest of the sentence. Choice D is
incorrect because it doesn’t close the parenthetical element that was opened earlier in the sentence.$qb$);
select seed_pool_question($qb$CB-a9e5b788$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In discussing Mary Shelley’s 1818 epistolary novel Frankenstein, literary theorist Gayatri Spivak directs the reader’s attention to the character of
Margaret Saville. As Spivak points out, Saville is not the protagonist of Shelley’s ______ as the recipient of the letters that frame the book’s
narrative, she’s the “occasion” of it.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "novel"}, {"label": "B", "body": "novel,"}, {"label": "C", "body": "novel; rather,"}, {"label": "D", "body": "novel, rather,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
semicolon to join a main clause (“Saville...novel”) and a second main clause (“she’s...it”) preceded by supplementary elements
(“rather...narrative”).
Choice A is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction. Choice
B is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. Choice D is incorrect because it results in a comma splice. Without a conjunction following it, the comma after “novel” can’t be used in
this way to join the two main clauses.$qb$);
select seed_pool_question($qb$CB-cdbbbf94$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$As British scientist Peter Whibberley has observed, “the Earth is not a very good timekeeper.” Earth’s slightly irregular rotation rate means that
measurements of time must be periodically adjusted. Specifically, an extra “leap second” (the 86,401st second of the day) is ______ time based
on the planet’s rotation lags a full nine-tenths of a second behind time kept by precise atomic clocks.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "added, whenever"}, {"label": "B", "body": "added; whenever"}, {"label": "C", "body": "added. Whenever"}, {"label": "D", "body": "added whenever"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation between a verb and a preposition. When, as in this case, a verb (“is
added”) is immediately followed by a preposition (“whenever”), no punctuation is needed.
Choice A is incorrect because no punctuation is needed between the verb and the preposition. Choice B is incorrect because no punctuation is
needed between the verb and the preposition. Choice C is incorrect because no punctuation is needed between the verb and the preposition.$qb$);
select seed_pool_question($qb$CB-a3e87535$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Julia Alvarez’s 1994 novel In the Time of the Butterflies, a fictionalized account of the lives of the Mirabal ______ can serve as a starting point for
those wanting to explore how the rule of dictator Rafael Trujillo has been represented in Dominican American literature.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "sisters, and"}, {"label": "B", "body": "sisters and"}, {"label": "C", "body": "sisters,"}, {"label": "D", "body": "sisters"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The comma after
"sisters" pairs with the comma after "Butterflies" to separate the supplementary element "a fictionalized account of the lives of the Mirabal
sisters" from the rest of the sentence. This supplementary element functions to describe the novel In the Time of the Butterflies, and the pair of
commas indicates that this element could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because a comma and conjunction can’t be used in this way to separate the supplementary element from the rest of the
sentence. Choice B is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the
sentence. Choice D is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the
sentence.$qb$);
select seed_pool_question($qb$CB-d47bb0a4$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Objects ranging from the Kikkoman soy sauce bottle to the Yamaha VMAX motorcycle to the Komachi bullet train ______ designed by twentieth-
century industrial designer Kenji Ekuan.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "was"}, {"label": "B", "body": "is"}, {"label": "C", "body": "has been"}, {"label": "D", "body": "were"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The plural verb "were" agrees in number with the plural
subject "objects."
Choice A is incorrect because the singular verb "was" doesn’t agree in number with the plural subject "objects." Choice B is incorrect because the
singular verb "is" doesn’t agree in number with the plural subject "objects." Choice C is incorrect because the singular verb "has been" doesn’t
agree in number with the plural subject "objects."$qb$);
select seed_pool_question($qb$CB-e3b72630$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the historical novel The Surrender Tree, Cuban American author Margarita Engle uses poetry rather than prose ______ the true story of Cuban
folk hero Rosa La Bayamesa.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "tells"}, {"label": "B", "body": "told"}, {"label": "C", "body": "is telling"}, {"label": "D", "body": "to tell"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of finite and nonfinite verb forms within a sentence. The nonfinite to-infinitive
“to tell” is correctly used to form a nonfinite (infinitive) clause that explains the reason Engle uses poetry in her novel.
Choice A is incorrect because the finite present tense verb “tells” can’t be used in this way to explain the reason that Engle uses poetry in her
novel. Choice B is incorrect because the finite past tense verb “told” can’t be used in this way to explain the reason that Engle uses poetry in her
novel. Choice C is incorrect because the finite present progressive tense verb “is telling” can’t be used in this way to explain the reason that Engle
uses poetry in her novel.$qb$);
select seed_pool_question($qb$CB-0560b2b8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$“What stories like this do for us is make the world just a smidge bigger,” writes Stephen Graham Jones in the foreword to Never Whistle at Night:
An Indigenous Dark Fiction Anthology. For Jones, dark fiction does more than entertain readers: ______ horror tropes to challenge familiar ways of
knowing, blurring the “borders of the real.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "one uses"}, {"label": "B", "body": "we use"}, {"label": "C", "body": "they use"}, {"label": "D", "body": "it uses"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is pronoun-antecedent agreement. The singular pronoun “it” agrees in number with the
singular antecedent “dark fiction” and clearly indicates that dark fiction uses horror tropes to challenge familiar ways of knowing.
Choice A is incorrect because the singular pronoun “one” is ambiguous in this context; the resulting sentence leaves unclear who or what uses
horror tropes to challenge familiar ways of knowing. Choice B is incorrect because the first person plural pronoun “we” isn’t conventional as a
substitute for “dark fiction.” It suggests that the readers, rather than dark fiction, use horror tropes to challenge familiar ways of knowing. Choice
C is incorrect because the plural pronoun “they” doesn’t agree in number with the singular antecedent “dark fiction.”$qb$);
select seed_pool_question($qb$CB-d2b81427$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In assessing the films of Japanese director Akira Kurosawa, ______ have missed his equally deep engagement with Japanese artistic traditions
such as Noh theater.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "many critics have focused on Kurosawa’s use of Western literary sources but"}, {"label": "B", "body": "Kurosawa’s use of Western literary sources has been the focus of many critics, who"}, {"label": "C", "body": "there are many critics who have focused on Kurosawa’s use of Western literary sources, but they"}, {"label": "D", "body": "the focus of many critics has been on Kurosawa’s use of Western literary sources; they"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “many critics” the
subject of the sentence and places it immediately after the modifying phrase “in assessing…Kurosawa.” In doing so, this choice clearly
establishes that it is the critics—and not another noun in the sentence—who assess Kurosawa’s films.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase “Kurosawa’s…sources” immediately after the
modifying phrase illogically suggests that his use of Western literary sources is what assesses Kurosawa’s films. Choice C is incorrect because it
results in a dangling modifier. The placement of the function word “there” immediately after the modifying phrase illogically suggests that “there”
is what assesses Kurosawa’s films. Choice D is incorrect because it results in a dangling modifier. The placement of the noun phrase “the focus…
critics” immediately after the modifying phrase illogically suggests that the critics’ focus is what assesses Kurosawa’s films.$qb$);
select seed_pool_question($qb$CB-56315bd0$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Solarpunk is an art movement that imagines renewable energy–powered technology infused complementarily into nature. In Paolo Bacigalupi’s
solarpunk short story “Efficiency,” an artificial intelligence that absorbs sustainable energies, redistributing them through intricate networks of
weights and generators, ______ Chicago’s energy grid.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "have been powering"}, {"label": "B", "body": "power"}, {"label": "C", "body": "powers"}, {"label": "D", "body": "are powering"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is subject-verb agreement. The singular verb "powers" agrees in number with the
singular subject "an artificial intelligence."
Choice A is incorrect because the plural verb "have been powering" doesn’t agree in number with the singular subject "an artificial intelligence."
Choice B is incorrect because the plural verb "power" doesn’t agree in number with the singular subject "an artificial intelligence." Choice D is
incorrect because the plural verb "are powering" doesn’t agree in number with the singular subject "an artificial intelligence."$qb$);
select seed_pool_question($qb$CB-ffea47e1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Kaiparowits Formation is a fossil-rich layer of sedimentary rock in the Grand Staircase, a colossal sequence of rock layers stretching from
Utah’s Bryce Canyon to Arizona’s Grand Canyon. The sandstones and mudstones of the Kaiparowits Formation were deposited ______ the Late
Cretaceous, preserving many species from that time.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "during:"}, {"label": "B", "body": "during;"}, {"label": "C", "body": "during,"}, {"label": "D", "body": "during"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between a preposition and its complement. No punctuation is
needed between the preposition “during” and its complement “the Late Cretaceous.” The complement completes the meaning of the preposition
in the phrase “deposited during the Late Cretaceous,” and any punctuation between the two results in an ungrammatical sentence.
Choice A is incorrect because no punctuation is needed between the preposition and its complement. Choice B is incorrect because no
punctuation is needed between the preposition and its complement. Choice C is incorrect because no punctuation is needed between the
preposition and its complement.$qb$);
select seed_pool_question($qb$CB-a1e0c981$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In her book The Woman Warrior: Memoirs of a Girlhood Among Ghosts, author Maxine Hong Kingston examines themes ______ childhood,
womanhood, and Chinese American identity by intertwining autobiography and mythology.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "of:"}, {"label": "B", "body": "of"}, {"label": "C", "body": "of—"}, {"label": "D", "body": "of,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Themes of childhood” is one noun phrase, with “themes of” implicitly carrying over to the other items on the list
(“themes of childhood, [themes of] womanhood, and [themes of] Chinese American identity”).
Choice A is incorrect. This choice inappropriately breaks up the introduction of a list. Also, “In her book…themes of” is not an independent clause,
thanks to the dangling “of” at the end, so it can’t precede a colon. Choice C is incorrect. This choice inappropriately breaks up the introduction of
a list. Also, “In her book…themes of” is not an independent clause, thanks to the dangling “of” at the end, so it can’t precede a single dash. Choice
D is incorrect. This choice inappropriately breaks up the introduction of a list. “Themes of” implicitly carries over to each item on the list (“themes
of childhood, [themes of] womanhood, and [themes of] Chinese American identity”), so we don’t want to use a comma to separate it.$qb$);
select seed_pool_question($qb$CB-b35cefb7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The fine, powdery substance that covers the Moon’s surface is called regolith. Because regolith is both readily available and high in oxygen
______ scientists have wondered whether it could be used as a potential source of oxygen for future lunar settlements.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "content and"}, {"label": "B", "body": "content,"}, {"label": "C", "body": "content"}, {"label": "D", "body": "content, and"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation between a subordinate clause and a main clause. This choice correctly
uses a comma to mark the boundary between the subordinate clause (“Because...content”) and the main clause (“scientists...settlements”).
Choice A is incorrect. Joining the subordinate clause (“Because...content”) and the clause that follows (“scientists...settlements”) with the
conjunction “and” results in an ungrammatical sentence that lacks a main clause. Choice C is incorrect because it fails to mark the boundary
between the subordinate clause and the main clause with appropriate punctuation. Choice D is incorrect. Joining the subordinate clause
(“Because...content”) and the clause that follows (“scientists...settlements”) with a comma and the conjunction “and” results in an
ungrammatical sentence that lacks a main clause.$qb$);
select seed_pool_question($qb$CB-e76e74e8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Over twenty years ago, in a landmark experiment in the psychology of choice, professor Sheena Iyengar set up a jam-tasting booth at a grocery
store. The number of jams available for tasting ______ some shoppers had twenty-four different options, others only six. Interestingly, the
shoppers with fewer jams to choose from purchased more jam.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "varied:"}, {"label": "B", "body": "varied,"}, {"label": "C", "body": "varied, while"}, {"label": "D", "body": "varied while"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of a colon within a sentence. In this choice, the colon is used in a
conventional way to introduce the following description of how the number of jams available varied.
Choice B is incorrect because it creates a comma splice. A comma can’t be used in this way to join two main clauses (“the number…varied” and
“some…six”). Choice C is incorrect because it results in an illogical and confusing sentence. Using the conjunction “while” to join the main clause
(“the number…varied”) with the following clause’s description of the number of jams available suggests that the variation in the number of jams
is in contrast to some shoppers having twenty-four options. Choice D is incorrect because it results in an illogical and confusing sentence. Using
“while” in this way suggests that the number of jams available varied during the time in which some shoppers had twenty-four options and others
had six. The sentence makes clear, however, that what follows “varied” is a description of the variation, not a separate, simultaneous occurrence.$qb$);
select seed_pool_question($qb$CB-b74f676f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Classical composer Florence Price’s 1927 move to Chicago marked a turning point in her career. It was there that Price premiered her First
Symphony—a piece that was praised for blending traditional Romantic motifs with aspects of Black folk music—and ______ supportive
relationships with other Black artists.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "developing"}, {"label": "B", "body": "developed"}, {"label": "C", "body": "to develop"}, {"label": "D", "body": "having developed"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The missing verb is part of the same clause as the verb "premiered," and "Price" is the subject of both. So we need
the past-tense form "developed" in order to match "premiered."
Choice A is incorrect. This choice creates a verb form error. The missing verb is part of the same clause as the verb "premiered," and "Price" is the
subject of both. So we need the past-tense form "developed" in order to match "premiered." Choice C is incorrect. This choice creates a verb form
error. The missing verb is part of the same clause as the verb "premiered," and "Price" is the subject of both. So we need the past-tense form
"developed" in order to match "premiered." Choice D is incorrect. This choice creates a verb form error. The missing verb is part of the same
clause as the verb "premiered," and "Price" is the subject of both. So we need the past-tense form "developed" in order to match "premiered."$qb$);
select seed_pool_question($qb$CB-1a61e2ae$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$English poet and Shakespeare contemporary John Donne’s ______ much admired during his lifetime (1572–1631) and in the decades that
followed, had, at the time of their enthusiastic rediscovery by the early twentieth-century modernists, been essentially gathering dust for the
intervening 250 years.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "works were"}, {"label": "B", "body": "works, were"}, {"label": "C", "body": "works,"}, {"label": "D", "body": "works had been"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation and verb forms within a sentence. This choice leaves the verb
"admired" in its nonfinite past participle form to function within a supplementary element ("much…followed"). Offset by commas after "works"
and "followed," this supplementary element interrupts the main clause ("English poet and Shakespeare contemporary John Donne’s works…had…
been essentially gathering dust…") with additional information about the works’ reception during Donne’s lifetime.
Choice A is incorrect because it fails to offset the supplementary element ("much…followed") with appropriate punctuation, and using the finite
verb "were much admired" results in an ungrammatical sentence. Choice B is incorrect because using the finite verb "were much admired" results
in an ungrammatical sentence. Choice D is incorrect because it fails to offset the supplementary element ("much…followed") with appropriate
punctuation, and using the finite verb "had been much admired" results in an ungrammatical sentence.$qb$);
select seed_pool_question($qb$CB-2d6f8304$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 2019, New Zealand produced 88,465 hectograms per hectare (hg/ha) of wheat, and Portugal produced 23,298 hg/ha. This is the type of
information on global food production that the United Nations’ Food and Agriculture Organization ______ since 1945.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is collecting"}, {"label": "B", "body": "has collected"}, {"label": "C", "body": "will collect"}, {"label": "D", "body": "collects"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the present perfect
tense verb “has collected,” used in conjunction with the phrase “since 1945,” correctly indicates that the Food and Agriculture Organization has
collected this type of information in the past and continues to do so in the present.
Choice A is incorrect because the present progressive tense verb “is collecting” is inconsistent with the phrase “since 1945,” which indicates that
the action occurred in the past and continues into the present. Choice C is incorrect because the future tense verb “will collect” is inconsistent
with the phrase “since 1945,” which indicates that the action occurred in the past and continues into the present. Choice D is incorrect because
the present tense verb “collects” is inconsistent with the phrase “since 1945,” which indicates that the action occurred in the past and continues
into the present.$qb$);
select seed_pool_question($qb$CB-3a35ddd1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Like other amphibians, the wood frog (Rana sylvatica) is unable to generate its own heat, so during periods of subfreezing temperatures, it ______
by producing large amounts of glucose, a sugar that helps prevent damaging ice from forming inside its cells.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "had survived"}, {"label": "B", "body": "survived"}, {"label": "C", "body": "would survive"}, {"label": "D", "body": "survives"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the present tense verb “survives”
correctly indicates that the wood frog regularly survives subfreezing temperatures by producing large amounts of glucose.
Choice A is incorrect because the past perfect verb “had survived” doesn’t indicate that the wood frog regularly survives subfreezing
temperatures by producing large amounts of glucose. Choice B is incorrect because the past tense verb “survived” doesn’t indicate that the wood
frog regularly survives subfreezing temperatures by producing large amounts of glucose. Choice C is incorrect because the conditional verb
“would survive” doesn’t indicate that the wood frog regularly survives subfreezing temperatures by producing large amounts of glucose.$qb$);
select seed_pool_question($qb$CB-69f031ab$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While exploring Nevada’s Gypsum Cave in 1930, Seneca and Abenaki archaeologist Bertha Parker made her most famous discovery: the skull of
a now-extinct ground sloth (Nothrotheriops shastensis) alongside human-made tools. Parker’s crucial finding was the first ______ humans in
North America as far back as 10,000 years ago.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "places"}, {"label": "B", "body": "placed"}, {"label": "C", "body": "place"}, {"label": "D", "body": "to place"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The object for the verb "was" is "first," and "to place" is acting as a modifier for "first." What was the finding? It was
"the first." The first to do what? The first "to place humans in North America" 10,000 years ago. When a verb serves as a modifier within a noun
phrase, it must be nonfinite (i.e., not conjugated to a specific subject). The infinitive form "to place" is the only nonfinite option among the
choices that makes sense in context.
Choice A is incorrect. The object for the verb "was" is "first," and "places" is acting as a modifier for "first." What was the thing that Parker’s finding
did? What was it the first to do? Place humans in North America 10,000 years ago. When a verb acts as a modifier, it must be nonfinite (i.e., not
conjugated to a specific subject), but "places" is a finite form of the verb. Choice B is incorrect. The object for the verb "was" is "first," and
"placed" is acting to modify "first." What was it that Parker’s finding was the first to do? Place humans in North America 10,000 years ago. When
a verb acts as a modifier, it must be nonfinite (i.e., not conjugated to a specific subject), but "placed" is a finite form. "Placed" can also be a past
participle, but that wouldn’t make sense here because the meaning of "the first placed humans" would be unclear. Choice C is incorrect. The
object for the verb "was" is "first," and "place" is modifying "first." What was the thing that Parker’s finding did? What was it the first to do? Place
humans in North America. When a verb acts as a modifier, it must be nonfinite (i.e., not conjugated to a specific subject), but "place" is a finite
form of the verb. Additionally, "place" can’t serve as a noun here, because it results in an illogical sentence (the "finding" wasn’t "the first place").$qb$);
select seed_pool_question($qb$CB-083a35dc$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Po’Pay was a Tewa leader from Ohkay Owingeh, a pueblo located about twenty-five miles north of present-day Santa Fe, New Mexico. He was
instrumental in organizing the Pueblo Revolt of ______ as a result of his leadership, the Spanish colonizers were expelled from the region for a
time.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "1680"}, {"label": "B", "body": "1680 and"}, {"label": "C", "body": "1680,"}, {"label": "D", "body": "1680, and"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and the coordinating conjunction “and” to join the first main clause (“He…1680”) and the second main clause (“as…time”).
Choice A is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction. Choice
B is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the coordinating
conjunction. Choice C is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to
join two main clauses.$qb$);
select seed_pool_question($qb$CB-486f03da$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The short story “Rogue Enchantments” by Isabel Ibañez appears in Reclaim the ______ anthology of fantasy and science fiction written by authors
of Latin American descent.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Stars. An"}, {"label": "B", "body": "Stars, while an"}, {"label": "C", "body": "Stars an"}, {"label": "D", "body": "Stars, an"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
mark the boundary between the main clause ("The short...Stars") and the supplementary element ("an anthology...descent") that provides
additional information about what Reclaim the Stars is.
Choice A is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with "an anthology." Choice B is incorrect.
Joining the main clause and the following supplementary element with the conjunction "while" results in a confusing and ungrammatical
sentence. Choice C is incorrect because it fails to mark the boundary between the main clause and the supplementary element with appropriate
punctuation.$qb$);
select seed_pool_question($qb$CB-003f22c8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Every last second of space shuttle mission STS-79, which lasted ten days and three hours, ______ carefully monitored by a team of experts.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "have been"}, {"label": "B", "body": "are"}, {"label": "C", "body": "was"}, {"label": "D", "body": "were"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is subject-verb agreement. The singular verb "was" agrees in number with the singular
subject "every last second."
Choice A is incorrect because the plural verb "have been" doesn’t agree in number with the singular subject "every last second." Choice B is
incorrect because the plural verb "are" doesn’t agree in number with the singular subject "every last second." Choice D is incorrect because the
plural verb "were" doesn’t agree in number with the singular subject "every last second."$qb$);
select seed_pool_question($qb$CB-aab78b25$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Psychophysicist Howard Moskowitz was hired by a soda company to determine how much artificial sweetener ______ After conducting
consumer taste tests, he found that no such ideal existed: participants expressed a wide range of preferences for different blends of sweetener,
carbonization, and flavoring.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "do most people prefer in a diet drink?"}, {"label": "B", "body": "do most people prefer in a diet drink."}, {"label": "C", "body": "most people prefer in a diet drink?"}, {"label": "D", "body": "most people prefer in a diet drink."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This sentence is a statement: “Moskowitz was hired by a soda company to determine how much artificial sweetener
most people prefer in a diet drink.” So a period is the most appropriate punctuation mark.
Choice A is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. This sentence is not a
question—it’s a statement. So a question mark is not the appropriate punctuation. Choice B is incorrect. This doesn’t complete the text in a way
that conforms to the conventions of Standard English. We already have the verbs “was hired…to determine” in this sentence. The verb “do” is not
needed and results in a confusing, ungrammatical sentence. Choice C is incorrect. This doesn’t complete the text in a way that conforms to the
conventions of Standard English. This sentence is not a question—it’s a statement. So a question mark is not the appropriate punctuation.$qb$);
select seed_pool_question($qb$CB-8b002b08$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Many Samoans enjoy a sport called kilikiti. This bat-and-ball game was derived from ______ kilikiti differs from cricket in a few key ways.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "cricket but:"}, {"label": "B", "body": "cricket but,"}, {"label": "C", "body": "cricket, but"}, {"label": "D", "body": "cricket, but,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma before the coordinating conjunction "but" to join the first main clause ("This bat-and-ball game was derived from cricket") and the second
main clause ("kilikiti differs from cricket in a few key ways").
Choice A is incorrect. When coordinating two main clauses such as these, it’s not conventional to use a colon in this way after the coordinating
conjunction. Choice B is incorrect. When coordinating two main clauses such as these, it’s not conventional to use a comma in this way after the
coordinating conjunction. Choice D is incorrect. When coordinating two main clauses such as these, it’s not conventional to use a comma in this
way after the coordinating conjunction.$qb$);
select seed_pool_question($qb$CB-145d5ca7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Gathering accurate data on water flow in the United States is challenging because of the country’s millions of miles of ______ the volume and
speed of water at any given location can vary drastically over time.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "waterways and the fact that,"}, {"label": "B", "body": "waterways, and the fact that,"}, {"label": "C", "body": "waterways, and, the fact that"}, {"label": "D", "body": "waterways and the fact that"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation within two coordinated noun phrases. When, as in this case, a noun
phrase (“the country’s millions of miles of waterways”) is coordinated with another noun phrase (“the fact”) followed by an integrated relative
clause (“that the volume...time”), no punctuation is needed.
Choice A is incorrect because no punctuation is needed. Choice B is incorrect because no punctuation is needed. Choice C is incorrect because
no punctuation is needed.$qb$);
select seed_pool_question($qb$CB-843f92af$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The sun never sets during the Arctic summer in the Far North. In response, reindeer in this region must change their sleep habits. Instead of
resting when it gets dark, they rest when they need ______ their food.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "digest"}, {"label": "B", "body": "will digest"}, {"label": "C", "body": "to digest"}, {"label": "D", "body": "digesting"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of nonfinite verb forms within a sentence. Working together with the finite
verb "need," the nonfinite to-infinitive verb "to digest" is correctly used to form a subordinate clause that describes what the reindeer need.
Choice A is incorrect because the verb "digest" (in either its finite or nonfinite form) can’t be used in this way with the finite verb "need." Choice B
is incorrect because the finite verb "will digest" can’t be used in this way with the finite verb "need." Choice D is incorrect because the nonfinite
participle "digesting" can’t be used in this way with the finite verb "need."$qb$);
select seed_pool_question($qb$CB-430d929a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$British scientists James Watson and Francis Crick won the Nobel Prize in part for their 1953 paper announcing the double helix structure of DNA,
but it is misleading to say that Watson and Crick discovered the double helix. ______ findings were based on a famous X-ray image of DNA fibers,
“Photo 51,” developed by X-ray crystallographer Rosalind Franklin and her graduate student Raymond Gosling.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "They’re"}, {"label": "B", "body": "It’s"}, {"label": "C", "body": "Their"}, {"label": "D", "body": "Its"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of possessive determiners. The plural possessive determiner “their” agrees
in number with the plural conjoined noun phrase “Watson and Crick” and thus indicates that the findings were those of Watson and Crick.
Choice A is incorrect because “they’re” is the contraction for “they are,” not a possessive determiner. Choice B is incorrect because “it’s” is the
contraction for “it is” or “it has,” not a possessive determiner. Choice D is incorrect because the singular possessive determiner “its” doesn’t
agree in number with the plural conjoined noun phrase “Watson and Crick.”$qb$);
select seed_pool_question($qb$CB-1684b237$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$One of the few African American global explorers during the turn of the 20th century, ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Matthew Henson made several treks across Greenland between 1891 and 1909."}, {"label": "B", "body": "1891 and 1909 were the years between which Matthew Henson made several treks across Greenland."}, {"label": "C", "body": "Greenland was where Matthew Henson made several treks between 1891 and 1909."}, {"label": "D", "body": "several treks across Greenland were made by Matthew Henson between 1891 and 1909."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-modifier placement. This choice makes the proper noun "Matthew Henson"
the subject of the sentence and places it immediately after the modifying phrase "one…century." In doing so, this choice clearly establishes that
Matthew Henson—and not another noun in the sentence—is being described as one of the few African American global explorers during the turn
of the 20th century.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase "1891 and 1909" immediately after the
modifying phrase illogically suggests that those years were one of the few African American global explorers during the turn of the 20th century.
Choice C is incorrect because it results in a dangling modifier. The placement of the proper noun "Greenland" immediately after the modifying
phrase illogically suggests that Greenland was one of the few African American global explorers during the turn of the 20th century. Choice D is
incorrect because it results in a dangling modifier. The placement of the noun phrase "several treks across Greenland" immediately after the
modifying phrase illogically suggests that the treks were one of the few African American global explorers during the turn of the 20th century.$qb$);
select seed_pool_question($qb$CB-be34a3df$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 2008, two years after the death of science fiction writer Octavia Butler, the Huntington Library in ______ received a collection of more than
8,000 items, including Butler’s private notes, research materials, manuscripts, photos, and drawings. Today, the Octavia E. Butler Collection is one
of the most researched archives at the library.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "California,"}, {"label": "B", "body": "California:"}, {"label": "C", "body": "California—"}, {"label": "D", "body": "California"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. No punctuation should separate the subject of the sentence (“the Huntington Library in California”) from its verb
(“received”).
Choice A is incorrect. No punctuation should separate the subject of the sentence (“the Huntington Library in California”) from its verb
(“received”). Choice B is incorrect. No punctuation should separate the subject of the sentence (“the Huntington Library in California”) from its
verb (“received”). Choice C is incorrect. No punctuation should separate the subject of the sentence (“the Huntington Library in California”) from
its verb (“received”).$qb$);
select seed_pool_question($qb$CB-1f8cd95f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the 1950s, a man named Joseph McVicker was struggling to keep his business afloat when his sister-in-law Kay Zufall advised him to
repurpose the company’s product, a nontoxic, clay-like substance for removing soot from wallpaper, as a modeling putty for kids. In addition,
Zufall ______ selling the product under a child-friendly name: Play-Doh.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "suggested"}, {"label": "B", "body": "suggests"}, {"label": "C", "body": "had suggested"}, {"label": "D", "body": "was suggesting"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the simple past tense verb
“suggested” properly indicates that Zufall offered her suggestion for the product’s name in the past. This verb tense is consistent with the
previous sentence’s use of a simple past tense verb (“advised”) to describe Zufall’s advice to McVicker in the 1950s.
Choice B is incorrect because the present tense verb “suggests” doesn’t indicate that Zufall offered her suggestion in the past. Choice C is
incorrect because the past perfect verb “had suggested” isn’t consistent with the previous sentence’s use of the simple past tense verb “advised”
to describe Zufall’s advice to McVicker. Choice D is incorrect because the past progressive verb “was suggesting” isn’t consistent with the
previous sentence’s use of the simple past tense verb “advised” to describe Zufall’s advice to McVicker.$qb$);
select seed_pool_question($qb$CB-73a6603c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$On sunny days, dark rooftops absorb solar energy and convert it to unwanted heat, raising the surrounding air ______ a light-colored covering to
an existing dark roof, either by attaching prefabricated reflective sheets or spraying on a paint-like coating, helps combat this effect.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "temperature; by adding"}, {"label": "B", "body": "temperature, adding"}, {"label": "C", "body": "temperature. Adding"}, {"label": "D", "body": "temperature by adding"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between the first sentence (“On…temperature”) and the second sentence (“Adding…effect”). The gerund phrase beginning
with “adding” is the subject of the second sentence, and the verb phrase “helps combat this effect” describes what adding a light-colored
covering can do.
Choice A is incorrect because a semicolon can’t be used in this way to join the sentence “On...temperature” and the supplementary phrases that
follow. Doing so leaves the verb phrase “helps combat” without a subject and thus results in a grammatically unconventional sentence. Choice B
is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice D is
incorrect. This choice results in a confusing and illogical sentence that suggests that adding a light-colored covering to an existing dark roof
raises the temperature of the surrounding air. Furthermore, it creates ambiguity by leaving the verb phrase “helps combat” without a subject (so it
isn’t clear what helps combat the effect).$qb$);
select seed_pool_question($qb$CB-70ced8dc$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Typically, underlines, scribbles, and notes left in the margins by a former owner lower a book’s ______ when the former owner is a famous poet
like Walt Whitman, such markings, known as marginalia, can be a gold mine to literary scholars.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "value, but"}, {"label": "B", "body": "value"}, {"label": "C", "body": "value,"}, {"label": "D", "body": "value but"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the coordination of independent clauses within a sentence. An independent clause is
a phrase containing a subject and a verb that can stand on its own as a sentence. This choice uses a comma and the coordinating conjunction
“but” to join the first independent clause (“underlines…lower a book’s value”) and the second independent clause (“such markings…can be a gold
mine to scholars”) to create a compound sentence.
Choice B is incorrect because it results in a run-on sentence. The two independent clauses are fused without punctuation and/or a conjunction.
Choice C is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between two independent
clauses. Choice D is incorrect because a comma is needed to mark the boundary between two coordinated independent clauses.$qb$);
select seed_pool_question($qb$CB-3bceeb93$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When they were first discovered in Australia in 1798, duck-billed, beaver-tailed platypuses so defied categorization that one scientist assigned
them the name Ornithorhynchus paradoxus: “paradoxical bird-snout.” The animal, which lays eggs but also nurses ______ young with milk, has
since been classified as belonging to the monotremes group.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "they’re"}, {"label": "B", "body": "their"}, {"label": "C", "body": "its"}, {"label": "D", "body": "it’s"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The singular possessive pronoun "its" agrees with the singular antecedent "the animal" and indicates that the
"young" belong to it.
Choice A is incorrect. This choice creates a pronoun-antecedent agreement error. "They’re" is a contraction of "they are," a plural pronoun and
verb, but the antecedent "the animal" is singular. Also, we don’t need the extra verb "are" — we already have a main verb in this clause, so adding
"are" would be confusing and ungrammatical. Choice B is incorrect. This choice creates a pronoun-antecedent agreement error. "Their" is a plural
pronoun, but the subject of the sentence is "the animal," a singular noun. Choice D is incorrect. This choice creates a confusing and
ungrammatical sentence. "It’s" is a contraction for "it is." We already have the verb "nurses" in this clause, so we shouldn’t add the verb "is."$qb$);
select seed_pool_question($qb$CB-6fac7f45$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Butterfly is a 1988 painting by the Japanese artist Ay-O. Like many of Ay-O’s paintings, Butterfly, which portrays a swimmer performing the
butterfly stroke, attempts to make use of the entire visual light ______ sporting rainbow-striped goggles, the rainbow-hued swimmer splashes
through a wavy rainbow of water.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "spectrum"}, {"label": "B", "body": "spectrum:"}, {"label": "C", "body": "spectrum while"}, {"label": "D", "body": "spectrum, while"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of a colon within a sentence. In this choice, the colon correctly introduces
the following description of how the painting makes use of the entire visual light spectrum by depicting a rainbow-hued swimmer.
Choice A is incorrect because it results in a run-on sentence. The main clauses ("Like…spectrum" and "sporting…water") are fused without
punctuation and/or a conjunction. Choice C is incorrect because it results in a run-on sentence. The main clauses ("Like…spectrum" and "while…
water") are fused without punctuation. Furthermore, the conjunction "while" fails to indicate that what follows is a description of how the painting
makes use of the entire visual light spectrum. Choice D is incorrect because it results in a logically confusing sentence. The conjunction "while,"
which suggests that what follows is occurring at the same time as or despite what came before, fails to indicate that what follows is a
description of how the painting makes use of the entire visual light spectrum.$qb$);
select seed_pool_question($qb$CB-aecdb820$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Featuring works by the photographers Lola Álvarez Bravo and Else “Yva” Neuländer-Simon, the 2021 exhibition The New Woman Behind the
Camera set out to provide a wide-ranging overview of photography by women in the 1920s through the ______ given the collection’s breadth of
more than 120 photos, its efforts were largely successful.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "1950s, and"}, {"label": "B", "body": "1950s and"}, {"label": "C", "body": "1950s"}, {"label": "D", "body": "1950s,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and the coordinating conjunction "and" to join the first main clause ("Featuring...1950s") and the second main clause
("given...successful").
Choice B is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction. Choice C is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation
and/or a conjunction. Choice D is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in
this way to join two main clauses.$qb$);
select seed_pool_question($qb$CB-2c9c6ca9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The term “retroflex” derives from Latin and means “bent back,” an apt descriptor for the branch of consonants—retroflex consonants—
pronounced with the tongue curling up and back in the mouth. In many languages, including English, these consonants are ______ in some
dialects of Mandarin, however, four such consonants (“ch,” “sh,” “zh,” and “r”) are relatively common.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "rare and"}, {"label": "B", "body": "rare,"}, {"label": "C", "body": "rare"}, {"label": "D", "body": "rare;"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. This choice uses a semicolon in a
conventional way to join the first main clause ("In many…rare") and the second main clause ("in some…common") in this sentence.
Choice A is incorrect. Joining the first main clause ("In many…rare") and the second main clause ("in some...common") with the conjunction "and"
conflicts with the use of "however" later in the sentence, resulting in a confusing and illogical sentence. Choice B is incorrect because it results in
a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main clauses. Choice C is incorrect because it
results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-8a3998f1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$After the United Kingdom began rolling out taxes equivalent to a few cents on single-use plastic grocery bags in 2011, plastic-bag consumption
decreased by up to ninety ______ taxes are subject to what economists call the “rebound effect”: as the change became normalized, plastic-bag
use started to creep back up.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "percent, such"}, {"label": "B", "body": "percent and such"}, {"label": "C", "body": "percent. Such"}, {"label": "D", "body": "percent such"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period after “percent” is used
correctly to mark the boundary between one sentence (“After…percent”) and another (“Such…up”).
Choice A is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice
B is incorrect. Without a comma preceding it, the conjunction “and” can’t be used in this way to join sentences. Choice D is incorrect because it
results in a run-on sentence. The sentences (“After…percent” and “Such…up”) are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-dab8b8ee$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Known as Earth’s “living skin,” biocrusts are thin layers of soil held together by surface-dwelling microorganisms such as fungi, lichens, and
cyanobacteria. Fortifying soil in arid ecosystems against erosion, ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "a recent study’s estimate is that these crusts reduce global dust emissions by 60 percent each year."}, {"label": "B", "body": "an estimated 60 percent reduction in global dust emissions each year is due to these crusts, according to a recent study."}, {"label": "C", "body": "these crusts reduce global dust emissions by an estimated 60 percent each year, according to a recent study."}, {"label": "D", "body": "a recent study has estimated that these crusts reduce global dust emissions by 60 percent each year."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The subject of the modifier "fortifying soil in arid ecosystems against erosion" is "biocrusts." Subject-modifier
placement requires a modifier and its subject to be next to each other, so "biocrusts" or some variant meaning "biocrusts" (in this case, "these
crusts") must begin the missing clause.
Choice A is incorrect. Modifiers and their subjects must go next to each other. The subject of the modifier "fortifying soil in arid ecosystems
against erosion" is "biocrusts," not "a recent study’s estimate." Choice B is incorrect. Modifiers and their subjects must go next to each other. The
subject of the modifier "fortifying soil in arid ecosystems against erosion" is "biocrusts," not "an estimated 60 percent reduction." Choice D is
incorrect. Modifiers and their subjects must go next to each other. The subject of the modifier "fortifying soil in arid ecosystems against erosion"
is "biocrusts," not "a recent study."$qb$);
select seed_pool_question($qb$CB-4bed4658$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In order to prevent nonnative fish species from moving freely between the Mediterranean and Red Seas, marine biologist Bella Galil has proposed
that a saline lock system be installed along the Suez Canal in Egypt’s Great Bitter Lakes. The lock would increase the salinity of the lakes and
______ a natural barrier of water most marine creatures would be unable to cross.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "creates"}, {"label": "B", "body": "create"}, {"label": "C", "body": "creating"}, {"label": "D", "body": "created"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of non-finite (untensed) verb forms in a sentence. The modal “would,” which
indicates the future from a perspective in the past, should be accompanied by a non-finite plain form verb. In this choice, the non-finite plain form
verb “create” is used correctly in conjunction with the non-finite plain form verb “increase” to describe what the lock would do.
Choice A is incorrect because the finite present tense verb “creates” can’t be used in this way with the modal “would” to describe what the lock
would do. Choice C is incorrect because the present participle “creating” can’t be used in this way with the modal “would” to describe what the
lock would do. Choice D is incorrect because the finite past tense verb “created” can’t be used in this way with the modal “would” to describe
what the lock would do.$qb$);
select seed_pool_question($qb$CB-96953201$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In her two major series “Memory Test” and “Autobiography,” painter Howardena Pindell explored themes ______ healing, self-discovery, and
memory by cutting and sewing back together pieces of canvas and inserting personal artifacts, such as postcards, into some of the paintings.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "of"}, {"label": "B", "body": "of,"}, {"label": "C", "body": "of—"}, {"label": "D", "body": "of:"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation between a preposition and its complement. No punctuation is needed
between the preposition “of” and its complement, the noun phrase “healing, self-discovery, and memory.”
Choice B is incorrect because no punctuation is needed between a preposition and its complement. Choice C is incorrect because no
punctuation is needed between a preposition and its complement. Choice D is incorrect because no punctuation is needed between a
preposition and its complement.$qb$);
select seed_pool_question($qb$CB-acf454af$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An online content creator who uses copyrighted songs without permission risks being demonetized (prohibited from including paid
advertisements in content). The best way to avoid demonetization is to choose music from the public domain. Using one of these
noncopyrighted songs ______ a creator won’t lose advertising revenue.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are ensuring"}, {"label": "B", "body": "have ensured"}, {"label": "C", "body": "ensure"}, {"label": "D", "body": "ensures"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The singular verb "ensures" agrees in number with the
singular subject "using."
Choice A is incorrect because the plural verb "are ensuring" doesn’t agree in number with the singular subject "using." Choice B is incorrect
because the plural verb "have ensured" doesn’t agree in number with the singular subject "using." Choice C is incorrect because the plural verb
"ensure" doesn’t agree in number with the singular subject "using."$qb$);
select seed_pool_question($qb$CB-6fdddabf$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The part of a compound that determines the compound’s color is ______ the chromophore. One example of a chromophore is hemoglobin, which
gives human blood its red color.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "called,"}, {"label": "B", "body": "called"}, {"label": "C", "body": "called—"}, {"label": "D", "body": "called;"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between a verb and its complement. No punctuation is needed
between the verb “is called” and its complement “the chromophore.” The complement helps complete the idea of the verb—in this case, it
explains what the part of a compound that determines the compound’s color is called—and any punctuation between the two results in an
ungrammatical sentence.
Choice A is incorrect because no punctuation is needed between the verb and its complement. Choice C is incorrect because no punctuation is
needed between the verb and its complement. Choice D is incorrect because no punctuation is needed between the verb and its complement.$qb$);
select seed_pool_question($qb$CB-8f6d6ae6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Archaeologists have estimated that the pre-Columbian Native American city of Cahokia, located across the Mississippi River from modern-day
St. Louis, Missouri, had as many as 20,000 inhabitants in the year 1150 ______ it one of the largest cities in North America at the time.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "CE making"}, {"label": "B", "body": "CE. Making"}, {"label": "C", "body": "CE, making"}, {"label": "D", "body": "CE; making"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The phrase “making…at the time” provides additional information about Cahokia that’s not required for the sentence
to make sense or function grammatically. As a nonessential supplement, this phrase should be separated from the rest of the sentence with a
comma.
Choice A is incorrect. This choice results in a run-on sentence. The nonessential descriptive aside “making…at the time” needs to be separated
from the rest of the sentence with a comma. Choice B is incorrect. This choice results in a sentence fragment. “Making…at the time” doesn’t have
a subject and can’t stand on its own as a sentence. Thus, it can’t be separated from the rest of the sentence with a period. Choice D is incorrect.
This choice results in a punctuation error. “Making…at the time” doesn’t have a subject and can’t stand on its own as an independent clause.
Since a semicolon can only link two independent clauses, using one here creates an error.$qb$);
select seed_pool_question($qb$CB-26c8c88c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$About 70,000 meteorites have been found on Earth. Although most meteorites are fragments of ______ hundred have been identified as being
from the Moon or Mars.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "asteroids. Several"}, {"label": "B", "body": "asteroids, several"}, {"label": "C", "body": "asteroids; several"}, {"label": "D", "body": "asteroids: several"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. This choice uses a comma to correctly separate the dependent clause "although…asteroids" from the independent
clause "several hundred have been…Mars."
Choice A is incorrect. This choice results in a sentence fragment. "Although…asteroids" is a dependent clause. It can’t stand on its own as a
sentence, which means it can’t end in a period. Choice C is incorrect. This choice results in a punctuation error. "Although…asteroids" is a
dependent clause and can’t be joined to the independent clause "several hundred have been…Mars" with a semicolon. A semicolon can only join
two independent clauses. Choice D is incorrect. This choice creates a punctuation error. A colon can only come after an independent clause, but
"although…asteroids" is a dependent clause.$qb$);
select seed_pool_question($qb$CB-c06af4d8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Sociologist Alton Okinaka sits on the review board tasked with adding new sites to the Hawai‘i Register of Historic Places, which includes
Pi‘ilanihale Heiau and the ‘Ōpaeka‘a Road Bridge. Okinaka doesn’t make such decisions ______ all historical designations must be approved by a
group of nine other experts from the fields of architecture, archaeology, history, and Hawaiian culture.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "single-handedly, however;"}, {"label": "B", "body": "single-handedly; however,"}, {"label": "C", "body": "single-handedly, however,"}, {"label": "D", "body": "single-handedly however"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the punctuation of a supplementary word or phrase between two main clauses. This
choice correctly uses a comma to separate the supplementary adverb “however” from the preceding main clause (“Okinaka doesn’t…single-
handedly”) and a semicolon to join the next main clause (“all…culture”) to the rest of the sentence. Further, placing the semicolon after “however”
correctly indicates that the information in the preceding main clause (Okinaka doesn’t make such decisions single-handedly) is contrary to what
might be assumed from the information in the previous sentence (Okinaka sits on the review board that adds new sites to the Hawaii Register of
Historic Places).
Choice B is incorrect because placing the semicolon after “single-handedly” and the comma after “however” illogically indicates that the
information in the next main clause (all historical designations must be approved by a group of experts) is contrary to the information in the
previous clause (Okinaka doesn’t make such decisions single-handedly). Choice C is incorrect because it results in a comma splice. Commas
can’t be used in this way to punctuate a supplementary word or phrase between two main clauses. Choice D is incorrect because it results in a
run-on sentence. The two main clauses are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-f4fd123c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The African Games Co-production Market, one of over 180 annual international conferences supporting video game development, ______ the
growth of the African gaming industry by helping start-up studios in Africa find partners.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "promote"}, {"label": "B", "body": "are promoting"}, {"label": "C", "body": "promotes"}, {"label": "D", "body": "have promoted"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The subject of the sentence is “The African Games Co-production Market.” That’s one market, so it’s a singular noun,
which means it needs a singular verb. “Promotes” is the only singular verb among the choices.
Choice A is incorrect. This choice creates a subject-verb agreement error. The subject “The African Games Co-production Market” is singular, but
the verb “promote” is plural. Choice B is incorrect. This choice creates a subject-verb agreement error. The subject “The African Games Co-
production Market” is singular, but the verb “are promoting” is plural. Choice D is incorrect. This choice creates a subject-verb agreement error.
The subject “The African Games Co-production Market” is singular, but the verb “have promoted” is plural.$qb$);
select seed_pool_question($qb$CB-e8926747$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Eighteen letters written by Louisa May Alcott, author of the popular novel Little Women (1868), can be found at the New York Historical Society.
______ letters demonstrate Alcott’s keen business sense in her interactions with publishers.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "One"}, {"label": "B", "body": "That"}, {"label": "C", "body": "This"}, {"label": "D", "body": "These"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of determiners in a sentence. The plural determiner "these" agrees in number
with the plural noun "letters" that it modifies. This choice clearly indicates that the letters demonstrate Alcott’s business sense.
Choice A is incorrect because the singular determiner "one" doesn’t agree in number with the plural noun "letters." Choice B is incorrect because
the singular determiner "that" doesn’t agree in number with the plural noun "letters." Choice C is incorrect because the singular determiner "this"
doesn’t agree in number with the plural noun "letters."$qb$);
select seed_pool_question($qb$CB-e9aee0d8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$On November 2, 1772, amid rising tensions with Great Britain, Boston colonists formed the Boston Committee of Correspondence. By 1774, what
had started as a local means of mobilizing support for the Patriot cause had grown into something far more ______ network of such committees
that, facilitating communication among the colonies, helped lay the groundwork for the Continental Congress.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "extensive: a"}, {"label": "B", "body": "extensive; a"}, {"label": "C", "body": "extensive, it was a"}, {"label": "D", "body": "extensive. A"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of a colon within a sentence. In this choice, the colon is correctly used to
introduce the following explanation of what the Patriot cause had grown into by 1774.
Choice B is incorrect because a semicolon can’t be used in this way to join the main clause ("what…extensive") and the supplementary element
("a network…Congress"). A semicolon is conventionally used to join two main clauses, whereas a colon is conventionally used to introduce an
element that explains or amplifies the information in the preceding clause, making the colon the better choice in this context. Choice C is
incorrect because it results in a comma splice. The addition of the pronoun and verb "it was" forms the start of a new main clause in the
sentence, and a comma can’t be used in this way to mark the boundary between two main clauses. Choice D is incorrect because it results in a
rhetorically unacceptable sentence fragment beginning with "a network."$qb$);
select seed_pool_question($qb$CB-97df6650$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The village of Panduyacu in Ecuador ______ one of the rare places in the world located almost directly on the equator.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are being"}, {"label": "B", "body": "have been"}, {"label": "C", "body": "is"}, {"label": "D", "body": "are"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is subject-verb agreement. The singular verb "is" agrees in number with the singular
subject "village."
Choice A is incorrect because the plural verb "are being" doesn’t agree in number with the singular subject "village." Choice B is incorrect because
the plural verb "have been" doesn’t agree in number with the singular subject "village." Choice D is incorrect because the plural verb "are" doesn’t
agree in number with the singular subject "village."$qb$);
select seed_pool_question($qb$CB-d198997b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Cy Twombly, a US painter and sculptor, created many large-scale abstract works, such as his 10-painting series Fifty Days at Iliam. In these works,
Twombly’s artistic style is exemplified by his use of graffiti-like ______ often incorporate words or phrases from poetry and mythology.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "scribbles: that"}, {"label": "B", "body": "scribbles that"}, {"label": "C", "body": "scribbles; that"}, {"label": "D", "body": "scribbles. That"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use and punctuation of a relative clause. This choice correctly uses the relative
pronoun “that” and no punctuation to create an integrated relative clause that provides essential information about the noun phrase (“graffiti-like
scribbles”) that it modifies.
Choice A is incorrect because no punctuation is needed between the integrated relative clause beginning with “that often” and the noun phrase
that it modifies (“graffiti-like scribbles”). Choice C is incorrect because no punctuation is needed between the integrated relative clause
beginning with “that often” and the noun phrase that it modifies (“graffiti-like scribbles”). Choice D is incorrect because no punctuation is needed
between the integrated relative clause beginning with “that often” and the noun phrase that it modifies (“graffiti-like scribbles”).$qb$);
select seed_pool_question($qb$CB-9579581e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$As cheesemaking practices spread throughout Europe and Asia during and after the Neolithic, divergent strategies for preserving milk ______
whereas rennet-coagulated cheesemaking became key to milk preservation in Europe and Southwest Asia, acid-heat coagulation methods
became common among nomadic herding populations of the northeastern Eurasian steppe.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "emerged"}, {"label": "B", "body": "emerged and"}, {"label": "C", "body": "emerged:"}, {"label": "D", "body": "emerged,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use within a sentence. A colon can be used between two main clauses
to signal that what follows is an elaboration of what came before. In this choice, the colon correctly introduces the following explanation of the
divergent milk preservation strategies that emerged.
Choice A is incorrect because it results in a run-on sentence. The main clause ("As…emerged") and the subordinate clause followed by another
main clause ("whereas…steppe") are fused without punctuation and/or a conjunction. Choice B is incorrect. Without a comma preceding it, the
conjunction "and" can’t be used in this way to join a main clause ("As…emerged") and a subordinate clause followed by another main clause
("whereas…steppe"). Choice D is incorrect because it results in a comma splice. A comma can’t be used in this way to join a main clause ("As…
emerged") and a subordinate clause followed by another main clause ("whereas…steppe").$qb$);
select seed_pool_question($qb$CB-60713427$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Polyphenols are organic compounds ______ among their many roles, provide pigment that helps protect plants against ultraviolet radiation from
sunlight.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "that—"}, {"label": "B", "body": "that;"}, {"label": "C", "body": "that,"}, {"label": "D", "body": "that:"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The comma after
“that” pairs with the comma after “roles” to separate the supplementary element “among their many roles” from the rest of the sentence. This
supplementary element functions to clarify that polyphenols have many roles, and the pair of commas indicates that this element could be
removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because a dash can’t be paired with a comma to separate the supplementary element from the rest of the sentence. Choice
B is incorrect because a semicolon can’t be paired with a comma to separate the supplementary element from the rest of the sentence. Choice D
is incorrect because a colon can’t be paired with a comma to separate the supplementary element from the rest of the sentence.$qb$);
select seed_pool_question($qb$CB-7f1df833$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 1966, Emmett Ashford became the first African American to umpire a Major League Baseball game. His energetic gestures announcing when
a player had struck out and his habit of barreling after a hit ball to see if it would land out of ______ transform the traditionally solemn umpire role
into a dynamic one.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "bounds helped"}, {"label": "B", "body": "bounds, helping"}, {"label": "C", "body": "bounds that helped"}, {"label": "D", "body": "bounds to help"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is finite verb use in a main clause. A main clause requires a finite verb to perform the
action of the subject (in this case, Ashford’s “gestures” and “habit”), and this choice supplies the finite past tense verb “helped” to indicate what
Ashford’s gestures and habit helped accomplish.
Choice B is incorrect because the non-finite participle “helping” doesn’t supply the main clause with a finite verb. Choice C is incorrect because
the relative clause “that helped” doesn’t supply the main clause with a finite verb. Choice D is incorrect because the non-finite to-infinitive “to
help” doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-2ee50d41$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The classic children’s board game Chutes and Ladders is a version of an ancient Nepalese game, Paramapada Sopanapata. In both games,
players encounter “good” or “bad” spaces while traveling along a path; landing on one of the good spaces ______ a player to skip ahead and arrive
closer to the end goal.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "allows"}, {"label": "B", "body": "are allowing"}, {"label": "C", "body": "have allowed"}, {"label": "D", "body": "allow"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject–verb agreement. The singular verb “allows” agrees in number with the
singular subject “landing.”
Choice B is incorrect because the plural verb “are allowing” doesn’t agree in number with the singular subject “landing.” Choice C is incorrect
because the plural verb “have allowed” doesn’t agree in number with the singular subject “landing.” Choice D is incorrect because the plural verb
“allow” doesn’t agree in number with the singular subject “landing.”$qb$);
select seed_pool_question($qb$CB-15d6d837$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Literary agents estimate that more than half of all nonfiction books credited to a celebrity or other public figure are in fact written by
ghostwriters, professional authors who are paid to write other ______ but whose names never appear on book covers.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "people’s stories"}, {"label": "B", "body": "peoples story’s"}, {"label": "C", "body": "peoples stories"}, {"label": "D", "body": "people’s story’s"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of plural and possessive nouns. The plural possessive noun “people’s” and
the plural noun “stories” correctly indicate that there are multiple stories from multiple people.
Choice B is incorrect because the context requires the plural possessive noun “people’s” and the plural noun “stories,” not the plural noun
“peoples” and the singular possessive noun “story’s.” Choice C is incorrect because the context requires the plural possessive noun “people’s,”
not the plural noun “peoples.” Choice D is incorrect because the context requires the plural noun “stories,” not the singular possessive noun
“story’s.”$qb$);
select seed_pool_question($qb$CB-59209b6d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Based on genetic evidence, archaeologists have generally agreed that reindeer domestication began in the eleventh century CE. However, since
uncovering fragments of a 2,000-year-old reindeer training harness in northern Siberia, ______ may have begun much earlier.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "researcher Robert Losey has argued that domestication"}, {"label": "B", "body": "researcher Robert Losey’s argument is that domestication"}, {"label": "C", "body": "domestication, researcher Robert Losey has argued,"}, {"label": "D", "body": "the argument researcher Robert Losey has made is that domestication"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “researcher Robert
Losey” the subject of the sentence and places it immediately after the modifying phrase “since…Siberia.” In doing so, this choice clearly
establishes that researcher Robert Losey—and not another noun in the sentence—is who uncovered fragments of a 2,000-year-old reindeer
training harness in northern Siberia.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase “researcher Robert Losey’s argument”
immediately after the modifying phrase illogically suggests that the “argument” is what uncovered fragments of a 2,000-year-old reindeer training
harness in northern Siberia. Choice C is incorrect because it results in a dangling modifier. The placement of the noun “domestication”
immediately after the modifying phrase illogically suggests that “domestication” is what uncovered fragments of a 2,000-year-old reindeer
training harness in northern Siberia. Choice D is incorrect because it results in a dangling modifier. The placement of the noun phrase “the
argument” immediately after the modifying phrase illogically suggests that the “argument” is what uncovered fragments of a 2,000-year-old
reindeer training harness in northern Siberia.$qb$);
select seed_pool_question($qb$CB-a75d5984$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Several advantages—the ability to react strongly with chip components, to avoid interference from other waves, and to be confined within tiny
circuits—______ acoustic waves as a promising alternative to electrical waves for transmitting data on computer chips; as a result, researchers
are invested in developing more acoustic wave–based chips.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "have positioned"}, {"label": "B", "body": "positioning"}, {"label": "C", "body": "by positioning"}, {"label": "D", "body": "having positioned"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject. In this case, the subject is "several advantages," and the present perfect tense verb "have positioned"
supplies the finite verb to indicate what has made acoustic waves a promising alternative to electrical waves.
Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite participle "positioning" doesn’t supply the main clause with
a finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The prepositional phrase "by positioning" doesn’t supply the
main clause with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite participle "having positioned"
doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-2b512e65$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Eli Eisenberg, a genetics expert at Tel Aviv University in Israel, recently discovered that ______ have a special genetic ability called RNA editing
that confers evolutionary advantages.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "cephalopods, ocean dwellers that include the squid, the octopus, and the cuttlefish"}, {"label": "B", "body": "cephalopods—ocean dwellers—that include the squid, the octopus, and the cuttlefish,"}, {"label": "C", "body": "cephalopods, ocean dwellers that include: the squid, the octopus, and the cuttlefish,"}, {"label": "D", "body": "cephalopods—ocean dwellers that include the squid, the octopus, and the cuttlefish—"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. In this choice, the
dash after "cephalopods" pairs with the dash after "cuttlefish" to clearly separate the supplementary element "ocean dwellers that include the
squid, the octopus, and the cuttlefish" from the rest of the sentence. This supplementary element functions to explain what cephalopods are, and
the pair of dashes indicates that this element could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because it fails to use appropriate punctuation to separate the supplementary element that explains what cephalopods are
from the rest of the sentence. Choice B is incorrect because it fails to use appropriate punctuation to separate the supplementary element that
explains what cephalopods are from the rest of the sentence. Choice C is incorrect because it fails to use appropriate punctuation to separate
the supplementary element that explains what cephalopods are from the rest of the sentence.$qb$);
select seed_pool_question($qb$CB-e41018de$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 1977, legendary Puerto Rican performer Rita Moreno won an Emmy Award, making her one of the rare talents to earn the highest honors in
television, music, film, and stage entertainment—the Emmy, Grammy, Oscar, and Tony ______ the achievement is known as “winning the EGOT.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "awards, respectively;"}, {"label": "B", "body": "awards; respectively"}, {"label": "C", "body": "awards, respectively—"}, {"label": "D", "body": "awards, respectively,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
separate the supplementary adverb “respectively” from the rest of the supplementary element introduced by the dash after “entertainment” (“the
Emmy...awards”), and it uses a semicolon to join the first main clause (“In...respectively”) and the second main clause (“the
achievement...EGOT’”).
Choice B is incorrect because placing the semicolon after “awards” illogically separates the supplementary adverb “respectively” from the
supplementary element it belongs to (“the Emmy...awards”) and attaches it to the following main clause (“the achievement...EGOT’”), resulting in
a confusing and ungrammatical sentence. Choice C is incorrect. The dash after “respectively” pairs with the dash after “entertainment” to close
the supplementary element (“the Emmy...respectively”), so it can’t also serve to mark the boundary between the two main clauses
(“In...respectively” and “the achievement...EGOT’”). The result fails to mark that boundary with appropriate punctuation. Choice D is incorrect
because it results in a comma splice. Without a conjunction following it, the comma after “respectively” can’t be used in this way to join the first
main clause (“In...respectively”) and the second main clause (“the achievement...EGOT’”).$qb$);
select seed_pool_question($qb$CB-856b495d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the early twentieth century, Joseph Kekuku and other Hawaiian ______ in the mainland United States to the bright and lilting sound of the kīkā
kila, or Hawaiian steel guitar. The instrument soon became a fixture in American blues and country music.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "musicians introduced audiences"}, {"label": "B", "body": "musicians’ introduced audiences’"}, {"label": "C", "body": "musician’s introduced audience’s"}, {"label": "D", "body": "musicians’ introduced audiences"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of plural nouns. The plural nouns "musicians" and "audiences" correctly
indicate that there were multiple musicians introducing the music to multiple audiences.
Choice B is incorrect because the context requires the plural nouns "musicians" and "audiences," not the plural possessive nouns "musicians’"
and "audiences’." Choice C is incorrect because the context requires the plural nouns "musicians" and "audiences," not the singular possessive
nouns "musician’s" and "audience’s." Choice D is incorrect because the context requires the plural noun "musicians," not the plural possessive
noun "musicians’."$qb$);
select seed_pool_question($qb$CB-870ae7ec$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Detroit natives Timothy Paule and Nicole Lindsey have combined their two passions, Detroit and beekeeping, to improve the health of their city’s
flowers and other vegetation. In 2017, the couple converted a vacant lot in the city into an ______ in the years that followed they acquired nine
additional lots and established more than 35 hives.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "apiary,"}, {"label": "B", "body": "apiary, and"}, {"label": "C", "body": "apiary and"}, {"label": "D", "body": "apiary"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. Both clauses in this sentence could stand alone as complete sentences, which means they are both independent
clauses. This choice uses a comma plus a coordinating conjunction to link them together, which is one of the correct ways to link two
independent clauses.
Choice A is incorrect. This choice results in a run-on sentence error. Both clauses in this sentence could stand alone as complete sentences,
which means they are both independent clauses. A comma by itself is not enough punctuation to link two independent clauses. Choice C is
incorrect. This choice results in a run-on sentence error. Both clauses in this sentence could stand alone as complete sentences, which means
they are both independent clauses. Independent clauses can only be linked in a few ways, including with a comma plus a coordinating
conjunction. This choice uses the coordinating conjunction “and,” but it is missing the comma beforehand. Choice D is incorrect. This choice
results in a run-on sentence error. Both clauses in this sentence could stand alone as complete sentences, which means they are both
independent clauses. Independent clauses need to have certain kinds of punctuation marks between them. This choice doesn’t use any
punctuation between the two clauses.$qb$);
select seed_pool_question($qb$CB-cfe23776$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$According to the original text of the US Constitution, written in 1787, the presidential candidate receiving the second-most Electoral College votes
becomes vice president. The 12th amendment, ratified in ______ separated the elections for the two offices.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "1804—"}, {"label": "B", "body": "1804,"}, {"label": "C", "body": "1804:"}, {"label": "D", "body": "1804"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation within a sentence. The comma after “1804” pairs with the
comma after “amendment” to separate the supplementary element “ratified in 1804” from the rest of the sentence. This supplementary element
functions to provide additional information on the term “12th amendment,” and the pair of commas indicates that this element could be removed
without affecting the grammatical coherence of the sentence.
Choice A is incorrect because a dash can’t be paired with a comma in this way to separate the supplementary element from the rest of the
sentence. Choice C is incorrect because a colon can’t be paired with a comma in this way to separate the supplementary element from the rest
of the sentence. Choice D is incorrect because it fails to use appropriate punctuation to separate the supplemental element from the rest of the
sentence.$qb$);
select seed_pool_question($qb$CB-4f2ff5f2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Tortoises can be found in many works of literature. For example, in Tom Stoppard’s 1993 play Arcadia, there is a tortoise that ______ by two
names (Plautus and Lightning) and appears in both of the play’s parallel timelines. As a character, the tortoise symbolizes the connection
between the past and present.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "goes"}, {"label": "B", "body": "will have gone"}, {"label": "C", "body": "went"}, {"label": "D", "body": "had gone"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the present tense verb
"goes" is consistent with the other present tense verbs ("appears" and "symbolizes") used to describe the tortoise in Stoppard’s play. Furthermore,
it’s conventional to use the present tense when discussing a literary work.
Choice B is incorrect because the future perfect tense verb "will have gone" isn’t consistent with the other present tense verbs used to describe
the tortoise in Stoppard’s play. Choice C is incorrect because the past tense verb "went" isn’t consistent with the other present tense verbs used
to describe the tortoise in Stoppard’s play. Choice D is incorrect because the past perfect tense verb "had gone" isn’t consistent with the other
present tense verbs used to describe the tortoise in Stoppard’s play.$qb$);
select seed_pool_question($qb$CB-2784cbaf$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To fully describe the motion of an object requires knowing each of five ______ movement: displacement, time, initial velocity, final velocity, and
acceleration. These are called kinematic variables.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "variable’s that characterize objects’"}, {"label": "B", "body": "variables that characterize objects’"}, {"label": "C", "body": "variables that characterize object’s"}, {"label": "D", "body": "variables that characterize objects"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The conventions being tested are the use of plural and possessive nouns. The plural noun "variables" correctly
indicates that there are multiple variables, and the plural possessive noun "objects’" correctly indicates that the movement of objects in general is
being discussed.
Choice A is incorrect because the context requires the plural noun "variables," not the singular possessive noun "variable’s." Choice C is incorrect
because the context requires the plural possessive noun "objects’," not the singular possessive noun "object’s." Choice D is incorrect because the
context requires the plural possessive noun "objects’," not the plural noun "objects."$qb$);
select seed_pool_question($qb$CB-863065c7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Legal scholars James Melton and Tom Ginsburg’s analysis of de jure judicial independence and its growth over decades ______ six constitutional
features that enhance such independence, including judicial tenure and selection procedure. Albania’s constitution contains five of these
features.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are identifying"}, {"label": "B", "body": "identify"}, {"label": "C", "body": "have identified"}, {"label": "D", "body": "identifies"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The singular verb "identifies" agrees in number with the
singular subject "analysis."
Choice A is incorrect because the plural verb "are identifying" doesn’t agree in number with the singular subject "analysis." Choice B is incorrect
because the plural verb "identify" doesn’t agree in number with the singular subject "analysis." Choice C is incorrect because the plural verb "have
identified" doesn’t agree in number with the singular subject "analysis."$qb$);
select seed_pool_question($qb$CB-872a002e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The present-day city of Dushanbe, Tajikistan, was for years the capital of the Tajik Autonomous Soviet Socialist Republic, one of many nominally
autonomous republics within the Soviet Union. Like ______ peer autonomous Soviet socialist republics, the Tajik Republic was established along
ethnolinguistic lines: most of the republic’s residents spoke Persian.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "their"}, {"label": "B", "body": "they’re"}, {"label": "C", "body": "its"}, {"label": "D", "body": "it’s"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of possessive determiners. The singular possessive determiner "its" agrees
in number with the singular subject "the Tajik Republic" and thus indicates that the other republics were its peers.
Choice A is incorrect because the plural possessive determiner "their" doesn’t agree in number with the singular subject "the Tajik Republic."
Choice B is incorrect because "they’re" is the contraction for "they are," not a possessive determiner. Choice D is incorrect because "it’s" is the
contraction for "it is" or "it has," not a possessive determiner.$qb$);
select seed_pool_question($qb$CB-fcaff694$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The city of Pompeii, which was buried in ash following the eruption of Mount Vesuvius in 79 CE, continues to be studied by archaeologists.
Unfortunately, as ______ attest, archaeological excavations have disrupted ash deposits at the site, causing valuable information about the
eruption to be lost.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "researchers, Roberto Scandone and Christopher Kilburn,"}, {"label": "B", "body": "researchers, Roberto Scandone and Christopher Kilburn"}, {"label": "C", "body": "researchers Roberto Scandone and Christopher Kilburn"}, {"label": "D", "body": "researchers Roberto Scandone, and Christopher Kilburn"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of a restrictive coordinated noun phrase. No punctuation is needed
within or around the coordinated noun phrase “researchers Roberto Scandone and Christopher Kilburn” because it would create an illogical
separation between the noun “researchers” and the coordinated noun phrase “Roberto Scandone and Christopher Kilburn.”
Choice A is incorrect because no punctuation is needed. Placing a pair of commas around the coordinated noun phrase “Roberto Scandone and
Christopher Kilburn” creates an illogical separation between the noun “researchers” and the aforementioned coordinated noun phrase. In this
case, it illogically suggests that researchers in general bear the specific names Roberto Scandone and Christopher Kilburn. Choice B is incorrect
because no punctuation is needed between the noun “researchers” and the coordinated noun phrase “Roberto Scandone and Christopher
Kilburn.” Choice D is incorrect because no punctuation is needed within the coordinated noun phrase “Roberto Scandone and Christopher
Kilburn.”$qb$);
select seed_pool_question($qb$CB-0fe5ce68$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Ten of William Shakespeare’s plays are classified as histories. Although each one of these plays, which include Henry V and Richard III, ______ on
a single historical figure (specifically, an English king), some, such as Henry VI Part One and Henry VI Part Two, feature different episodes from
the same monarch’s life.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "focuses"}, {"label": "B", "body": "focus"}, {"label": "C", "body": "are focused"}, {"label": "D", "body": "were focused"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb “focuses” agrees in number with the
singular subject “each one of these plays.” While the prepositional phrase “of these plays” within the subject contains a plural noun, the head of
the subject (“each one”) is singular, indicating that each individual play focuses on a single historical figure.
Choice B is incorrect because the plural verb “focus” doesn’t agree in number with the singular subject “each one of these plays.” Choice C is
incorrect because the plural verb “are focused” doesn’t agree in number with the singular subject “each one of these plays.” Choice D is incorrect
because the plural verb “were focused” doesn’t agree in number with the singular subject “each one of these plays.”$qb$);
select seed_pool_question($qb$CB-b369d54c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Woven from recycled yarn and hand tufted using a carpet weaving technique passed down by the artist’s Turkish grandmother, ______ so lush and
tactilely inviting that you are tempted to reach out and touch them.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "the topological tapestries of Argentine textile artist Alexandra Kehayoglou are"}, {"label": "B", "body": "the Argentine textile artist Alexandra Kehayoglou creates topological tapestries that are"}, {"label": "C", "body": "when she creates her topological tapestries, Argentine textile artist Alexandra Kehayoglou makes them"}, {"label": "D", "body": "Alexandra Kehayoglou is an Argentine textile artist whose topological tapestries are"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase "topological
tapestries" the subject of the sentence and places it immediately after the modifying phrase "woven…grandmother." In doing so, this choice
clearly establishes that the topological tapestries—and not another noun in the sentence—are being described as woven from recycled yarn and
hand tufted.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase "Argentine textile artist Alexandra Kehayoglou"
immediately after the modifying phrase illogically suggests that Kehayoglou is woven from recycled yarn and hand tufted. Choice C is incorrect
because it results in a dangling modifier. The placement of the pronoun "she" and the noun phrase "Argentine textile artist Alexandra Kehayoglou"
after the modifying phrase illogically suggests that Kehayoglou is woven from recycled yarn and hand tufted. Choice D is incorrect because it
results in a dangling modifier. The placement of the noun "Alexandra Kehayoglou" immediately after the modifying phrase illogically suggests
that Kehayoglou is woven from recycled yarn and hand tufted.$qb$);
select seed_pool_question($qb$CB-790fc366$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Using satellite remote sensing, Dr. Catherine Nakalembe, director of NASA’s Harvest Africa initiative, gathers important data on crop health.
Nakalembe doesn’t just compile the ______ she also shares her findings with African farmers, enabling them to make data-driven decisions about
managing critical food crops.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "information, though;"}, {"label": "B", "body": "information, though,"}, {"label": "C", "body": "information; though"}, {"label": "D", "body": "information though,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice uses a semicolon to join two independent clauses ("Nakalembe doesn’t just…though" and "she also
shares..."). This choice also appropriately includes "though" in the first clause, where it logically belongs.
Choice B is incorrect. This choice results in a grammar error called a comma splice. It incorrectly joins two independent clauses with only a
comma instead of a comma and a coordinating conjunction like "and" or "but." "Though" is a transition word, but it’s not a coordinating
conjunction. Choice C is incorrect. This choice results in a punctuation error. A semicolon can only be used to link two independent clauses.
However, if "though" is included in the second clause, it turns the second clause into a dependent clause, so a semicolon can’t be used after
"information." Choice D is incorrect. This choice results in a grammar error called a comma splice. It incorrectly joins two independent clauses
with only a comma instead of a comma and a coordinating conjunction like "and" or "but."$qb$);
select seed_pool_question($qb$CB-62120607$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$From afar, African American fiber artist Bisa Butler’s portraits look like paintings, their depictions of human faces, bodies, and clothing so
intricate that it seems only a fine brush could have rendered them. When viewed up close, however, the portraits reveal themselves to be ______
stitching barely visible among the thousands of pieces of printed, microcut fabric.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "quilts, and the"}, {"label": "B", "body": "quilts, the"}, {"label": "C", "body": "quilts; the"}, {"label": "D", "body": "quilts. The"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between a main clause and a supplementary phrase. This choice
correctly uses a comma to mark the boundary between the main clause (“the portraits...quilts”) and the supplementary noun phrase (“the
stitching...fabric”) that provides a further description of how the portraits can be identified as quilts.
Choice A is incorrect. A comma and the conjunction “and” can’t be used in this way to join a main clause and a supplementary noun phrase.
Choice C is incorrect because a semicolon can’t be used in this way to join a main clause and a supplementary noun phrase. Choice D is
incorrect because it results in a rhetorically unacceptable sentence fragment beginning with “the stitching.”$qb$);
select seed_pool_question($qb$CB-c437dd53$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Wanting to celebrate the 100th anniversary of the Alaska Purchase, ______ up with a motto that best captured the state’s unique character. The
commission selected “North to the Future,” submitted by Juneau journalist Richard Peter, as its winning entry.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "a contest sponsored by the Alaska Centennial Commission would award $300 to an individual who came"}, {"label": "B", "body": "an award of $300 would go to an individual in a contest sponsored by the Alaska Centennial Commission for coming"}, {"label": "C", "body": "$300 would be awarded to an individual by the Alaska Centennial Commission in a contest for coming"}, {"label": "D", "body": "the Alaska Centennial Commission sponsored a contest that would award $300 to an individual who came"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase "the Alaska
Centennial Commission" the subject of the sentence and places it immediately after the modifying phrase "wanting…Purchase." In doing so, this
choice clearly establishes that the Alaska Centennial Commission—and not another noun in the sentence—wanted to celebrate the 100th
anniversary of the Alaska Purchase.
Choice A is incorrect because it results in a dangling modifier. The placement of the noun phrase "a contest" immediately after the modifying
phrase illogically suggests that the contest wanted to celebrate the 100th anniversary of the Alaska Purchase. Choice B is incorrect because it
results in a dangling modifier. The placement of the noun phrase "an award of $300" immediately after the modifying phrase illogically suggests
that the award of $300 wanted to celebrate the 100th anniversary of the Alaska Purchase. Choice C is incorrect because it results in a dangling
modifier. The placement of the noun phrase "$300" immediately after the modifying phrase illogically suggests that the $300 wanted to celebrate
the 100th anniversary of the Alaska Purchase.$qb$);
select seed_pool_question($qb$CB-2bb7416a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In paleontology, the term “Elvis taxon” gets applied to a newly identified living species that was once presumed to be extinct. Like an Elvis
impersonator who might bear a striking resemblance to the late musical icon Elvis Presley himself, an Elvis taxon is not the real thing, ______ is a
misidentified look-alike.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "however but it"}, {"label": "B", "body": "however it"}, {"label": "C", "body": "however, it"}, {"label": "D", "body": "however. It"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The clause “Like an Elvis impersonator…real thing” and the clause “it is…look-alike” are both independent clauses, so
making them into two separate sentences is grammatically correct.
Choice A is incorrect. This choice creates a run-on sentence error. The clause “Like an Elvis impersonator…real thing” and the clause “it is…look-
alike” are both independent clauses, so they need to be separated with at least a comma + a coordinating conjunction. This choice provides the
coordinating conjunction “but,” but it’s missing a comma. Choice B is incorrect. This choice creates a run-on sentence error. The clause “Like an
Elvis impersonator…real thing” and the clause “it is…look-alike” are both independent clauses, so they need to be separated with a semicolon, a
colon, a dash, a period, or a comma + a coordinating conjunction. Choice C is incorrect. This choice creates a run-on sentence error. The clause
“Like an Elvis impersonator…real thing” and the clause “it is…look-alike” are both independent clauses, so they need to be separated with at least
a comma + a coordinating conjunction. This choice provides a comma, but it’s missing a coordinating conjunction.$qb$);
select seed_pool_question($qb$CB-97b62fab$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Smaller than poppy seeds, tardigrades are tiny, but they are tough. These minuscule animals can survive for thirty years without food or water,
and ______ can withstand extreme temperatures as low as minus 328 degrees and as high as 304 degrees Fahrenheit.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "that"}, {"label": "B", "body": "it"}, {"label": "C", "body": "they"}, {"label": "D", "body": "he"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is pronoun-antecedent agreement. The plural pronoun "they" agrees in number with the
plural antecedent "animals," which refers to tardigrades.
Choice A is incorrect because the singular pronoun "that" doesn’t agree in number with the plural antecedent "animals." Choice B is incorrect
because the singular pronoun "it" doesn’t agree in number with the plural antecedent "animals." Choice D is incorrect because the singular
pronoun "he" doesn’t agree in number with the plural antecedent "animals."$qb$);
select seed_pool_question($qb$CB-a05cc490$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$With the development of new technologies that use natural resources more efficiently, the overall consumption of those resources might be
expected to decrease. Economists have observed that improvements in efficiency often correlate negatively with resource ______ efficiency
gains, lowering the cost of use, may increase demand to the extent that resource consumption ultimately rises.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "conservation, though,"}, {"label": "B", "body": "conservation; though"}, {"label": "C", "body": "conservation, though;"}, {"label": "D", "body": "conservation, though"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
separate the supplementary adverb "though" from the preceding main clause ("Economists…conservation") and uses a semicolon to join the next
main clause ("efficiency gains…rises") to the rest of the sentence. Further, placing the semicolon after "though" indicates that the information in
the preceding main clause ("improvements in efficiency often correlate negatively with resource conservation") is contrary to what might be
assumed from the information in the previous sentence (resource consumption would be expected to decrease with the development of new,
more efficient technologies).
Choice A is incorrect because it results in a comma splice. Commas can’t be used in this way to punctuate a supplementary word or phrase
between two main clauses. Choice B is incorrect because it fails to mark the boundary between the two main clauses ("Economists...though" and
"efficiency gains....rises") with appropriate punctuation. Moreover, placing the semicolon after "conservation" illogically indicates that the
information in the next clause (gains in efficiency may lead to an increase in resource consumption) is contrary to the information in the previous
clause ("improvements in efficiency often correlate negatively with resource conservation"). Choice D is incorrect because placing a comma after
"conservation" illogically indicates that the information in the next clause (gains in efficiency may lead to an increase in resource consumption) is
contrary to the information in the previous clause ("improvements in efficiency often correlate negatively with resource conservation").$qb$);
select seed_pool_question($qb$CB-89ab0d46$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$After the printing press was introduced in 1440, handwritten manuscripts from Europe’s medieval period were often destroyed and the paper
used for other purposes. In one instance, pages ______ a collection of Norse tales dating to 1270 were discovered lining a bishop’s miter (hat).
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "from:"}, {"label": "B", "body": "from,"}, {"label": "C", "body": "from"}, {"label": "D", "body": "from—"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use within a sentence. No punctuation is needed between the
preposition “from” and the noun phrase beginning with “a collection.” The word “from” introduces a prepositional phrase that modifies the noun
“pages” and provides essential information about the pages’ origin.
Choice A is incorrect. No punctuation is needed within the prepositional phrase beginning with “from.” Choice B is incorrect. No punctuation is
needed within the prepositional phrase beginning with “from.” Choice D is incorrect. No punctuation is needed within the prepositional phrase
beginning with “from.”$qb$);
select seed_pool_question($qb$CB-85b8b9c5$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Many mechanical calculators were powered by a notched cylinder mechanism called the Leibniz wheel. Leibniz wheel calculators were popular
in the first half of the twentieth ______ these ingenious devices were eventually replaced by electronic calculators.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "century"}, {"label": "B", "body": "century,"}, {"label": "C", "body": "century, but"}, {"label": "D", "body": "century that"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and a coordinating conjunction ("but") to join the first main clause ("Leibniz...century") and the second main clause ("these
ingenious...calculators").
Choice A is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction. Choice
B is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. Choice D is incorrect because joining the two main clauses in this way with the subordinating conjunction "that" results in an
ungrammatical and illogical sentence.$qb$);
select seed_pool_question($qb$CB-b0a525be$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Santa Clara Pueblo artist Roxanne Swentzell’s sculpture Mud Woman Rolls On consists of five human figures made of clay and plant fiber and
arranged in descending size; each figure holds the smaller one in front of it. The arrangement of the figures, according to ______ represents her
idea that “we all come from the Earth, generation after generation.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Swentzell"}, {"label": "B", "body": "Swentzell,"}, {"label": "C", "body": "Swentzell:"}, {"label": "D", "body": "Swentzell—"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The phrase “according to Swentzell” is an aside that interrupts the flow of the sentence, so it needs to be separated
from the sentence with a pair of matching punctuation marks: two commas, two dashes, or a pair of parentheses. We already have a comma
before “according,” so we must add a comma after “Swentzell.” .
Choice A is incorrect. This choice creates a punctuation error. The phrase “according to Swentzell” is an aside that interrupts the flow of the
sentence, so it needs to be separated from the sentence with a pair of matching punctuation marks: one before and one after the phrase. Choice
C is incorrect. This choice creates a punctuation error. “The arrangement of the figures, according to Swentzell” is not an independent clause, so
it can’t come before a colon. Choice D is incorrect. This choice creates a punctuation error. The phrase “according to Swentzell” is an aside that
interrupts the flow of the sentence, so it needs to be separated from the sentence with a pair of matching punctuation marks. We already have a
comma at the beginning, so we have to use another comma here to match. We can’t just switch to a dash! .$qb$);
select seed_pool_question($qb$CB-eef91a50$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Nine months before Rosa Parks made history by refusing to comply with the segregated seating policy on a Montgomery, Alabama, bus, a
fifteen-year-old Montgomery girl named Claudette Colvin was arrested for the same ______ to some historians, Colvin’s arrest led to Parks’s
action and eventually to the desegregation of Montgomery’s bus system.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "offense. According"}, {"label": "B", "body": "offense, according"}, {"label": "C", "body": "offense according"}, {"label": "D", "body": "offense and according"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Nine months…offense” and “according to…system” are both independent clauses. Separating them with a period
and turning them into their own sentences is the only grammatically correct choice among the provided options.
Choice B is incorrect. This choice results in a comma splice error, which is a punctuation error that occurs when two independent clauses are
joined by only a comma. “Nine months…offense” and “according to…system” are both independent clauses, so they need to be either joined by a
semicolon, joined by a comma and a coordinating conjunction, or separated by a period. Choice C is incorrect. This choice results in a run-on
sentence, which occurs when two independent clauses are joined without punctuation. “Nine months…offense” and “according to…system” are
both independent clauses, so they need to be either joined by a semicolon, joined by a comma and a coordinating conjunction, or separated by a
period. Choice D is incorrect. This choice results in a run-on sentence, which occurs when two independent clauses are joined without
punctuation. “Nine months…offense” and “according to…system” are independent clauses, so we would need to put a comma before the
coordinating conjunction “and” to join them properly.$qb$);
