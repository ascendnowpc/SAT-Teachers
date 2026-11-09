-- ============================================================================
--  0077 — College Board's Reading and Writing questions
--
--  400 questions from College Board's SAT Suite Question Bank, into the
--  English practice pool. Part 3 of 5.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

select seed_pool_question($qb$CB-3566120b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Oscar Wilde’s 1895 play The Importance of Being Earnest.
CECILY: Have we got to part?
ALGERNON: I am afraid so. It’s a very painful parting.
CECILY: It is always painful to part from people whom one has known for a very brief space of time. The absence of old friends one can endure-
with equanimity. But even a momentary separation from anyone to whom one has just been introduced is almost unbearable.
As used in the text, what does the word “endure” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Regret"}, {"label": "B", "body": "Persist"}, {"label": "C", "body": "Tolerate"}, {"label": "D", "body": "Encourage"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because as used in the text, “endure” most nearly means tolerate. In the text, Cecily and Algernon discuss parting, or
saying goodbye. Cecily remarks on the deep pain of saying goodbye to people whom one has only known briefly and then comments on the
equanimity, or calm steadiness, one experiences when separated from old friends. The text sets up an ironic contrast: one can easily tolerate, or
put up with, the absence of close friends, but even a very short separation from a new acquaintance is unbearable.
Choice A is incorrect. Nothing in the text suggests that Cecily associates regret, or a feeling of sorrow, with the absence of old friends. Rather,
the text sets up an ironic contrast between the feeling of calm steadiness one feels when separated from old friends and the unbearable pain of
being separated from new acquaintances. Choice B is incorrect. Although in some contexts “endure” can mean persist, or proceed stubbornly, it
doesn’t have that meaning in this context because what is being endured is the absence of old friends. Whereas one can persist despite the
absence of someone else, one can’t persist the absence itself. Choice D is incorrect because the text doesn’t convey that Cecily encourages, or
urges, old friends to be absent. Although it may be that Cecily prefers new acquaintances to friends she has known for a long time, the text
focuses on her feelings as a result of others’ absences, not on her treatment of others.$qb$);
select seed_pool_question($qb$CB-f2c48e47$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from Charlotte Perkins Gilman’s 1910 poem “The Earth’s Entail.”
No matter how we cultivate the land,
Taming the forest and the prairie free;
No matter how we irrigate the sand,
Making the desert blossom at command,
We must always leave the borders of the sea;
The immeasureable reaches
Of the windy wave-wet beaches,
The million-mile-long margin of the sea.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "The speaker argues against interfering with nature and then gives evidence supporting this interference."}, {"label": "B", "body": "The speaker presents an account of efforts to dominate nature and then cautions that such efforts are only temporary."}, {"label": "C", "body": "The speaker provides examples of an admirable way of approaching nature and then challenges that approach."}, {"label": "D", "body": "The speaker describes attempts to control nature and then offers a reminder that not all nature is controllable."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This best describes the overall structure of the text. In the first half of the text, the speaker describes our attempts
to control nature: cultivating, taming, and irrigating different kinds of land. In the second half, the speaker states that we can never tame the sea
or the beach.
Choice A is incorrect. This doesn’t describe the overall structure of the text. The speaker never argues that we should not interfere with nature.
Rather, the speaker says that we are able to tame many different kinds of land, but we are unable to tame the sea or beaches. Choice B is
incorrect. This doesn’t describe the overall structure of the text. The speaker never describes our cultivation, taming, and irrigation of land as
“temporary.” Rather, the speaker says that we are able to tame many different kinds of land, but we are unable to tame the sea or
beaches. Choice C is incorrect. This doesn’t describe the overall structure of the text. The speaker never describes our cultivation, taming, and
irrigation of land as an “admirable” approach to nature.” Rather, the speaker says that we are able to tame many different kinds of land, but we
are unable to tame the sea or beaches.$qb$);
select seed_pool_question($qb$CB-79dec1e1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Art scholars have noted that some colors seem to be more ______ viewers than others. For example, people tend to find paintings featuring blues
and greens more appealing than paintings featuring yellows and oranges.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "confusing for"}, {"label": "B", "body": "attractive to"}, {"label": "C", "body": "corrected by"}, {"label": "D", "body": "similar to"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it best completes the text’s discussion of how viewers respond to colors. The text presents something art
scholars have noted and gives the example of people tending to find paintings with blues and greens more appealing than those with yellows
and oranges. This context conveys that certain colors are more "attractive to" viewers than other colors are.
Choice A is incorrect because the text indicates only that people tend to find some colors more appealing than others and gives no indication
that certain colors are ever "confusing for," or puzzling to, viewers. Choice C is incorrect because the text discusses the relative appeal of certain
colors in paintings but gives no indication that any colors would ever be "corrected by" viewers, or somehow fixed or improved by them. Choice D
is incorrect because it wouldn’t make much sense to say that some colors are more "similar to" viewers than others, which would suggest that
colors and viewers are alike to different degrees. Further, the text primarily emphasizes a difference, not a similarity, in how appealing paintings
tend to be based on the colors they contain.$qb$);
select seed_pool_question($qb$CB-bcc91b1e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The spacecraft OSIRIS-REx briefly made contact with the asteroid 101955 Bennu in 2020. NASA scientist Daniella DellaGiustina reports that
despite facing the unexpected obstacle of a surface mostly covered in boulders, OSIRIS-REx successfully ______ a sample of the surface,
gathering pieces of it to bring back to Earth.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "attached"}, {"label": "B", "body": "collected"}, {"label": "C", "body": "followed"}, {"label": "D", "body": "replaced"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the OSIRIS-REx spacecraft’s contact with the asteroid
101955 Bennu. In this context, “collected” means acquired and took away. The text indicates that although the boulders on the asteroid’s surface
caused some unforeseen problems, OSIRIS-REx was able to gather a sample to return to Earth. This context suggests that OSIRIS-REx
successfully collected a sample of 101955 Bennu.
Choice A is incorrect because in this context “attached” means connected or affixed. The text indicates that OSIRIS-REx gathered pieces of
101955 Bennu to bring to Earth; it doesn’t suggest that the spacecraft attached anything to the asteroid. Choice C is incorrect because in this
context “followed” means tracked or traveled behind and the text discusses OSIRIS-REx’s brief encounter with 101955 Bennu during which the
spacecraft gathered a sample to bring to Earth. The text doesn’t suggest that the spacecraft tracked the sample, and it’s not clear what it would
mean for the spacecraft to travel behind the sample it collected. Choice D is incorrect because in this context “replaced” means put back or
returned. The text indicates that OSIRIS-REx gathered pieces of 101955 Bennu to bring to Earth but doesn’t suggest that anything was returned to
the asteroid.$qb$);
select seed_pool_question($qb$CB-7d075fc5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Oral histories—whether they consist of interviews or recordings of songs and stories—can offer researchers a rich view of people’s everyday
experiences. For her book about coal mining communities in Kentucky during the twentieth century, Karida Brown therefore relied in part on
interviews with coal miners and their families. By doing so, she gained valuable insights into her subjects-’ day-to-day lives.
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It provides a little-known geographical fact about Kentucky."}, {"label": "B", "body": "It argues that Karida Brown is an expert on United States politics."}, {"label": "C", "body": "It presents a major historical event that took place in the twentieth century."}, {"label": "D", "body": "It describes how Karida Brown benefited from incorporating oral history in her book."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes how the underlined sentence functions in the text as a whole. The text begins
by pointing out one of the advantages of oral histories: that they allow researchers to document the daily experiences of people. The text then
goes on to describe how Karida Brown utilized interviews with coal miners and their families for her book about twentieth-century coal mining in
Kentucky. The underlined sentence affirms that the general advantages of oral histories mentioned earlier in the text were also benefits in
Brown’s particular case. Thus, the underlined sentence describes how Karida Brown benefited from incorporating oral history in her book.
Choice A is incorrect because though the text mentions coal miners who live in Kentucky, the underlined sentence does not offer a geographical
fact about Kentucky. Choice B is incorrect because the underlined sentence does not mention United States politics or that Brown is an expert in
this particular area. Choice C is incorrect. Although the text mentions that Brown’s book revolved around coal miners during the twentieth
century, the underlined sentence does not focus on a major historical event during this time.$qb$);
select seed_pool_question($qb$CB-9645f55e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
For decades, bluegrass musicians have debated whether their genre should exclude influences from mainstream genres such as rock. Many
insist that bluegrass is defined by its adherence to the folk music of the US South, out of which bluegrass emerged. Such “purists,” as they are
known, regard the recordings of Bill Monroe, which established the bluegrass sound in the 1940s, as a standard against which the genre should
still be measured.
Text 2
Bluegrass isn’t simply an extension of folk traditions into the era of recorded music. In reality, Bill Monroe created the bluegrass sound in the
1940s by combining Southern folk music with commercial genres that had arisen only a few decades before, such as jazz and the blues. Since
bluegrass has always been a mixed genre, contemporary bluegrass musicians should not be forbidden from incorporating into it influences from
rock and other mainstream genres.
Based on the texts, how would the author of Text 2 most likely regard the perspective of bluegrass purists, as described in Text 1?$qb$, null, $qb$[{"label": "A", "body": "As inconsistent, since bluegrass purists themselves enjoy other musical genres"}, {"label": "B", "body": "As unrealistic, since bluegrass purists have no way of enforcing their musical preferences"}, {"label": "C", "body": "As shortsighted, because bluegrass could enlarge its audience by including influences from mainstream genres"}, {"label": "D", "body": "As illogical, because the purists overlook crucial aspects of how the bluegrass sound first originated."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. According to Author 1, the “purists” argue that bluegrass should stick to its folk music roots. But Author 2 points out
that this isn’t how bluegrass emerged: it actually got its sound from a mix of folk, jazz, and blues.
Choice A is incorrect. There’s nothing in Text 2 about what other genres the purists enjoy, so this inference about Author 2’s views isn’t
supported. Choice B is incorrect. There’s nothing in Text 2 about whether or how purists can enforce their preferences, so this inference about
Author 2’s views isn’t supported. Choice C is incorrect. There’s nothing in Text 2 about the size of bluegrass’s audience, so this inference about
Author 2’s views isn’t supported.$qb$);
select seed_pool_question($qb$CB-f1c9d2c1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
Stage lighting theorist Adolphe Appia was perhaps the first to argue that light must be considered alongside all the various elements of a stage
to create a single, unified performance. Researcher Kelly Bremner, however, has noted that Appia lacked technical expertise in the use of light in
the theater. As a result of Appia’s inexperience, Bremner argues, Appia’s theory of light called for lighting practices that weren’t possible until
after the advent of electricity around 1881.
Text 2
Adolphe Appia was not an amateur in the practice of lighting. Instead, it is precisely his exposure to lighting techniques at the time that
contributed to his theory on the importance of light. When working as an apprentice for a lighting specialist in his youth, Appia observed the use
of portable lighting devices that could be operated by hand. This experience developed his understanding of what was possible in the
coordination of elements on the stage.
Based on the texts, how would the author of Text 2 most likely respond to the claim about Appia’s level of technical expertise made by Bremner
in Text 1?$qb$, null, $qb$[{"label": "A", "body": "Many lighting technicians dismissed Appia’s ideas about light on the stage."}, {"label": "B", "body": "Appia likely gained a level of technical expertise during his time as an apprentice."}, {"label": "C", "body": "Theater practitioners who worked with Appia greatly admired his work."}, {"label": "D", "body": "Appia was unfamiliar with the use of music and sound in theater."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The author of Text 2 directly contradicts Bremner’s claim that Appia lacked technical expertise by stating that Appia
was “not an amateur in the practice of lighting.” His experience as a lighting specialist’s apprentice would have, the author of Text 2 argues,
allowed Appia to “[develop] his understanding of what was possible” with the elements of theatrical design.
Choice A is incorrect. Neither text describes how other lighting technicians responded to Appia’s ideas. Furthermore, this claim isn’t relevant to
Bremner’s evaluation of Appia’s technical expertise. Choice C is incorrect. Neither text mentions anything about the opinions of theater
practitioners who worked with Appia, so this answer choice does not relate to the claim about Appia’s level of technical expertise made by
Bremner in Text 1. Choice D is incorrect. Neither text mentions anything about Appia’s familiarity with or ignorance of the use of music and
sound in theater. Both focus on his expertise (or lack thereof) in lighting.$qb$);
select seed_pool_question($qb$CB-31d0bd9a$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The parasitic dodder plant increases its reproductive success by flowering at the same time as the host plant it has latched onto. In 2020,
Jianqiang Wu and his colleagues determined that the tiny dodder achieves this ______ with its host by absorbing and utilizing a protein the host
produces when it is about to flower.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "synchronization"}, {"label": "B", "body": "hibernation"}, {"label": "C", "body": "prediction"}, {"label": "D", "body": "moderation"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of a relationship between the dodder plant and its host
plant. As used in this context, “synchronization” means the act of things happening at the same time. The text indicates that the dodder and its
host plant flower in unison and that this synchronization occurs because the dodder makes use of a protein produced by the host shortly before
flowering.
Choice B is incorrect because referring to “hibernation,” or the state of being dormant or inactive, wouldn’t make sense in context. The text
focuses on something the dodder plant actively engages in—making use of a protein and producing flowers. Choice C is incorrect because
stating that the dodder plant and its host engage together in “prediction,” or the act of declaring or indicating something in advance, wouldn’t
make sense in context. Rather than indicating that the dodder plant and its host plant make a prediction about flowering activity, the text
suggests that the host produces a protein as part of its regular flowering process and that the dodder then absorbs and uses that protein to
flower at the same time. Choice D is incorrect because referring to “moderation,” or the act of causing something to become less intense or
extreme, wouldn’t make sense in context. Although the text states that the dodder plant absorbs and uses a protein made by its host plant, it
doesn’t suggest that the dodder lessens the host plant’s flowering activity; the two plants simply flower in unison.$qb$);
select seed_pool_question($qb$CB-dc043599$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Text 1
Most scientists agree that the moon was likely formed after a collision between Earth and a large planet named Theia. This collision likely
created a huge debris field, made up of material from both Earth and Theia. Based on models of this event, scientists believe that the moon was
formed from this debris over the course of thousands of years.
Text 2
Researchers from NASA’s Ames Research Center used a computer to model how the moon could have formed. Although simulations of the
moon’s formation have been done in the past, the team from NASA ran simulations that were much more detailed. They found that the formation
of the moon was likely not a slow process that took many years. Instead, it’s probable that the moon’s formation happened immediately after
impact, taking just a few hours.
Which choice best describes a difference in how the author of Text 1 and the author of Text 2 view the evidence for the formation of the moon?$qb$, null, $qb$[{"label": "A", "body": "The author of Text 1 argues that the formation of the moon occurred much earlier than the author of Text 2 argues."}, {"label": "B", "body": "The author of Text 1 suggests there is more evidence confirming the existence of Theia than the author of Text 2 suggests."}, {"label": "C", "body": "The author of Text 1 claims that the moon’s surface is more similar to Earth’s surface than the author of Text 2 claims."}, {"label": "D", "body": "The author of Text 1 believes that the moon formed more slowly than the author of Text 2 believes."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. Text 1 states that the moon was formed from the debris “over the course of thousands of years,” while Text 2 states
that the moon’s formation happened “immediately after impact, taking just a few hours.” This shows a clear difference in how the authors view
the evidence for the speed of the moon’s formation.
Choice A is incorrect. While Text 2 suggests that the moon formed over “just a few hours” and Text 1 says it took “thousands of years,” neither
one mentions when that formation occurred. Choice B is incorrect. While Theia isn’t mentioned in Text 2, neither text describes or disputes
evidence of Theia’s existence. Choice C is incorrect. Neither text makes any claims about the similarity or difference between the moon’s surface
and Earth’s surface.$qb$);
select seed_pool_question($qb$CB-cf9a3f34$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Elizabeth von Arnim’s 1922 novel The Enchanted April. Mrs. Wilkins and her friend Rose are traveling in Italy.
“I’m going to have one of these gorgeous oranges,” said Mrs. Wilkins, staying where she was and reaching across to a black bowl-
piled with them. “Rose, how can you resist them. Look—have this one. Do have this beauty—” And she held out a big one.
As used in the text, what does the phrase “reaching across to” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Joining with"}, {"label": "B", "body": "Gaining on"}, {"label": "C", "body": "Stretching toward"}, {"label": "D", "body": "Arriving at"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because as used in the text "reaching across to" most nearly means stretching toward. The text begins with Mrs.
Wilkins stating that she wants to have one of the oranges that she’s admiring. The text then indicates that Mrs. Wilkins, staying where she is,
holds out a big orange to her friend. This context suggests that when the text describes Mrs. Wilkins as reaching across to the bowl of oranges, it
means that she is stretching toward the bowl.
Choice A is incorrect because the text never suggests that Mrs. Wilkins is joining with, or becoming attached to, the bowl of oranges. Rather, the
text indicates that she is stretching toward the bowl so she can pick out oranges for herself and her friend Rose to eat. Choice B is incorrect
because the text never suggests that Mrs. Wilkins is gaining on, or overtaking in a competition or race, the bowl of oranges. The text suggests
instead that the bowl is sitting still on a surface and that Mrs. Wilkins is extending her arm toward the bowl so she can pick out oranges for
herself and her friend Rose to eat. Choice D is incorrect because the text doesn’t indicate that Mrs. Wilkins is arriving at the bowl of oranges. In
fact, the text states that Mrs. Wilkins stays where she is when reaching across to the bowl, meaning that she remains at a distance from it.$qb$);
select seed_pool_question($qb$CB-70612a79$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Following the eradication of the gray wolf in Yellowstone National Park in 1926, the population of elk—a primary prey of the gray wolf—exceeded
a healthy size for the park’s ecosystem. Elk overpopulation led to overgrazing of areas that a multitude of other animals relied on for food and
shelter. As scientists began to see how essential the gray wolf was to the Yellowstone food chain, ecological restoration strategies were
employed to reintroduce the gray wolf to the park in 1996. The rebound effect in the park’s natural ecosystem was noticed almost immediately.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It summarizes a problem that developed in Yellowstone National Park in the 1920s and then offers potential solutions to that problem."}, {"label": "B", "body": "It mentions the elimination of the gray wolf from Yellowstone National Park and then explains why the wolf was eventually restored to the park."}, {"label": "C", "body": "It presents a claim about the health of the Yellowstone National Park gray wolf population and then gives specific examples to support that claim."}, {"label": "D", "body": "It explains why Yellowstone National Park allowed the eradication of the gray wolf and then discusses the consequences of reintroducing the wolf to the park."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes the overall structure of the text. The text begins by stating that the gray wolf
was eradicated from Yellowstone National Park in 1926. It then explains the consequences of this elimination—namely that the elk population
grew too large and overgrazing occurred, negatively affecting other animals in the area. The text then states that once scientists realized the
importance of the gray wolf to the Yellowstone food chain, they undertook efforts leading to the wolves’ reintroduction to the park in 1996. Thus,
the structure of the text can be accurately described as mentioning the elimination of the gray wolf from Yellowstone and then explaining why
the wolf was later restored to the park.
Choice A is incorrect. While the text does summarize a problem associated with an event in the 1920s (the eradication of gray wolves from
Yellowstone in 1926), the problems discussed arose after that event—namely, the subsequent elk overpopulation, resultant overgrazing, and then
further impacts to other animals in Yellowstone. Furthermore, the text doesn’t present multiple potential solutions. Instead, it describes one
solution that was actually implemented: the reintroduction of gray wolves in 1996. Choice C is incorrect because the text doesn’t make a claim
about the health of the gray wolf population apart from pointing out that the wolves had been eradicated from, and then subsequently restored
to, Yellowstone. Instead, the text focuses on outcomes associated with the gray wolf’s eradication and reintroduction. Choice D is incorrect.
Though the text does mention that the ecosystem of Yellowstone rebounded after the gray wolf was reintroduced in 1996, the text never explains
why the park allowed the wolves to be eradicated in 1926. It simply states that this eradication occurred without elaborating on the decision-
making process behind it.$qb$);
select seed_pool_question($qb$CB-1b5d4e3e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Were penguins always flightless? Theresa Cole and her team argue that penguins could fly at some point, but that they lost that ability more than-
60 million years ago as they adapted to marine life. After examining various penguin fossils and genetic information, the researchers concluded-
that over time penguins developed underwater vision, blood oxygenation, and bone density better suited for swimming than flying. Thus,
environmental conditions might have driven penguins to change from flyers to swimmers.
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It defines a scientific term used in the sentence that follows."}, {"label": "B", "body": "It contradicts a description in the sentence that follows."}, {"label": "C", "body": "It provides an answer to the question in the previous sentence."}, {"label": "D", "body": "It notes that the question in the previous sentence has not been researched."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it best describes how the underlined sentence functions in the text as a whole. The text begins with a
question: have penguins always been unable to fly? The underlined sentence then presents an answer that has been offered by researchers,
indicating that Theresa Cole and her team believe that penguins were once able to fly but lost that ability long ago as they began living in the sea.
The text then describes the research that led to that answer. Thus, the function of the underlined sentence is to provide an answer to the
question in the previous sentence.
Choice A is incorrect because none of the terms used in the sentence that follows are defined in the underlined sentence; no definitions are
given at all. Instead, the sentence presents Theresa Cole and her team’s answer to the earlier question about penguins’ ability to fly. Choice B is
incorrect because there is no contradiction between the underlined sentence and the sentence that follows since both convey that at some point
penguins underwent adaptations that limited their ability to fly and helped them swim and live in the sea. Instead of contradicting later
information, the underlined sentence presents an answer to the earlier question about penguins’ ability to fly. Choice D is incorrect because the
question in the previous sentence is about penguins’ ability to fly and the underlined sentence presents Theresa Cole and her team’s answer to
that question based on their research into penguin flight, which is described in the rest of the text.$qb$);
select seed_pool_question($qb$CB-dc234d74$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The recently observed gamma ray burst GRB 230307A lasted for 200 seconds, ______ for a burst generated by the merger of neutron stars.
Bursts caused by neutron mergers typically last fewer than 2 seconds.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "a coincidence"}, {"label": "B", "body": "a reprieve"}, {"label": "C", "body": "an incident"}, {"label": "D", "body": "an oddity"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of the duration of gamma ray burst GRB 230307A. In this
context, "an oddity" is something that is odd or unusual. The text explains that the burst lasted for 200 seconds and that other bursts generated
by neutron mergers have usually lasted fewer than 2 seconds. In other words, the duration of gamma ray burst GRB 230307A was unusual.
Choice A is incorrect because the text focuses on a difference between the duration of gamma ray burst GRB 230307A and the typical duration
of bursts caused by neutron mergers, not "a coincidence," or a point of correspondence, between them; the text indicates that GRB 230307A
lasted much longer than what is typical of other bursts. Choice B is incorrect. In this context, "a reprieve" would be either a temporary relief from
something or a delay of a punishment, neither of which would make sense as something that the duration of a gamma ray burst could provide to
the burst itself. Choice C is incorrect. Although it would make sense to refer to gamma ray burst GRB 230307A itself as "an incident," or a thing
that occurred, the missing word describes the duration of the burst, and it doesn’t make much sense to describe a length of time as an incident.
Further, the sentence emphasizes that the burst’s duration was very unusual, not simply that the burst occurred.$qb$);
select seed_pool_question($qb$CB-47955354$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Sumerian civilization (which lasted from around 3300 to 2000 BCE) ______ many concepts that persist into present-day civilizations: for example,
the first description of the seven-day week appears in the Sumerian Epic of Gilgamesh.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "transformed"}, {"label": "B", "body": "introduced"}, {"label": "C", "body": "inherited"}, {"label": "D", "body": "overlooked"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the contributions of the Sumerian civilization. In this
context, “introduced” means brought into practice or use. The text states that the first reference to a seven-day week appears in the Sumerian
Epic of Gilgamesh. The text presents this information about the seven-day week as an example of a concept introduced by the Sumerian
civilization that persists into present-day civilizations.
Choice A is incorrect because nothing in the text suggests that the Sumerian civilization “transformed,” or changed the nature of, concepts that
persist into present-day civilizations. Instead, the text’s presentation of a Sumerian literary work that contains the first description of the seven-
day week is an example of the phenomenon described in the first half of the sentence, suggesting that the Sumerians invented many concepts
that still persist. Choice C is incorrect because the information that a Sumerian literary work includes the first description of the seven-day week
suggests that Sumerian civilization may have originated the seven-day week and other concepts that persist into present-day civilizations, not
that it “inherited” the concepts, or received them from an ancestral figure or culture. Choice D is incorrect because the information that Sumerian
civilization produced the first description of the seven-day week is presented as an example of the phenomenon described in the first half of the
sentence, suggesting that Sumerian civilization originated this and other concepts that still persist, not that the Sumerians “overlooked,” or failed
to notice or consider, such concepts.$qb$);
select seed_pool_question($qb$CB-a3761c7e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Physicist Joseph Weber performed ______ work in gravitational wave research in the 1960s and 1970s, conducting key experiments that
scientists later used as the basis for their own investigations that led to the first verified detection of a gravitational wave in 2015.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "foundational"}, {"label": "B", "body": "supplementary"}, {"label": "C", "body": "repetitive"}, {"label": "D", "body": "ineffective"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of physicist Joseph Webster’s research on gravitational
waves. In this context “foundational” means the basis on which something else develops. The text indicates that Webster’s experiments in the
1960s and 1970s were earlier than, and “key” to, the work of later scientists in the field; thus, Webster’s work was foundational to the later
scientists’ experiments and the eventual detection of a gravitational wave in 2015.
Choice B is incorrect because the text does not suggest that Webster’s work was supplementary, or an additional element of an existing, larger
project, but rather it was “the basis for” later experiments. Choice C is incorrect because the text does not assert that Webster’s work was
repetitive, or involved doing something the same way many times. Rather, the text indicates that Webster’s work formed the basis for later
investigations in the field of gravitational wave research. Choice D is incorrect because the text does not state that Webster’s work was
ineffective, or failed to produce the desired outcome. Rather, the text strongly implies that Webster’s work was productive and extremely
important to later work in the field of gravitational wave research.$qb$);
select seed_pool_question($qb$CB-34d7bb25$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$According to Indian economist and sociologist Radhakamal Mukerjee (1889–1968), the Eurocentric concepts that informed early twentieth-
century social scientific methods—for example, the idea that all social relations are reducible to struggles between individuals—had little
relevance for India. Making the social sciences more responsive to Indians’ needs, Mukerjee argued, required constructing analytical categories
informed by India’s cultural and ecological circumstances. Mukerjee thus proposed the communalist “Indian village” as the ideal model on which
to base Indian economic and social policy.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "The text recounts Mukerjee’s early training in the social scientific disciplines and then lists social policies whose implementation Mukerjee oversaw."}, {"label": "B", "body": "The text mentions some of Mukerjee’s economic theories and then traces their impact on other Indian social scientists of the twentieth century."}, {"label": "C", "body": "The text presents Mukerjee’s critique of the social sciences and then provides an example of his attempts to address issues he identified in his critique."}, {"label": "D", "body": "The text explains an influential economic theory and then demonstrates how that theory was more important to Mukerjee’s work than other social scientists have acknowledged."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The text does indeed present Mukerjee’s critique of the social sciences—that they were too Eurocentric—and then
provides an example of how he attempted to address the issues he identified: by suggesting a social science model based on the Indian village.
Choice A is incorrect. The text doesn’t discuss Mukerjee’s early training or his oversight of the implementation of social policies at all. Choice B is
incorrect. The text never discusses any other Indian social scientists. Choice D is incorrect. The text never mentions other social scientists’
responses to Mukerjee’s work.$qb$);
select seed_pool_question($qb$CB-a086c2cb$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Built in the 1970s, Raccoon Mountain is a pumped-storage hydropower facility (a “water-battery”) located in the United States along the
Tennessee River. When energy demand is low, excess power from the regional electric utility’s nuclear plants is used to pump water (from a
lower reservoir filled from the Tennessee River) up a shaft to the summit lake, where the water is stored as gravitational potential energy. When
energy demand peaks, the water drains down from the summit lake, spinning turbines and generating upward of 1,700 megawatts of power—
enough to power one million homes for twenty hours.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To point out the differences between two methods of energy generation"}, {"label": "B", "body": "To explain the basics of how a specific energy technology works"}, {"label": "C", "body": "To encourage regional electric utilities to build energy storage facilities"}, {"label": "D", "body": "To discuss the benefits of a new energy technology"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes the main purpose of the text, which is to explain the basics of how a specific
energy technology works. The text introduces Raccoon Mountain as a pumped-storage hydropower facility built in the 1970s and then explains
how it operates: during periods of low demand, excess power pumps water up to a lake at the mountain’s summit, and when demand for energy
peaks, the water flows back down, spinning turbines along the way to generate electricity. The text provides some additional details, like the
name of the water source, but the overall focus is on explaining the basics of how pumped-storage hydropower works.
Choice A is incorrect because the text focuses on one method of energy generation—pumped-water hydropower—and briefly mentions another
type of energy generation (nuclear plants) only to identify it as a source of power for the pumping process. The text never makes any comparison
between the two methods. Choice C is incorrect because the text simply gives a factual description of how Raccoon Mountain, a pumped-
storage hydropower facility, operates; it never suggests that more energy storage facilities should be built, whether by regional utilities or by any
other entity. Choice D is incorrect because the text doesn’t present pumped-storage hydropower as a new technology; it indicates that Raccoon
Mountain was built in the 1970s, meaning that, rather than being new, this facility is approximately 50 years old.$qb$);
select seed_pool_question($qb$CB-c0e1b70a$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is adapted from Etsu Inagaki Sugimoto’s 1925 memoir A Daughter of the Samurai. As a young woman, Sugimoto moved from
feudal Japan to the United States.
The standards of my own and my adopted country differed so widely in some ways, and my love for both lands was so sincere,
that sometimes I had an odd feeling of standing upon a cloud in space, and gazing with measuring eyes upon two separate
worlds. At first I was continually trying to explain, by Japanese standards, all the queer things that came every day before my
surprised eyes; for no one seemed to know the origin or significance of even the most familiar customs, nor why they existed and
were followed.
Which choice best describes the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To convey the narrator’s experience of observing and making sense of differences between two cultures she embraces"}, {"label": "B", "body": "To establish the narrator’s hope of forming connections with new companions by sharing customs she learned as a child"}, {"label": "C", "body": "To reveal the narrator’s recognition that she is hesitant to ask questions about certain aspects of a culture she is newly encountering"}, {"label": "D", "body": "To emphasize the narrator’s wonder at discovering that the physical distance between two countries is greater than she had expected"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes the main purpose of the text. The narrator asserts that she loves both her
“own” country (Japan) and her “adopted country” (the United States) even though the two countries differ “widely.” She also indicates that, at
first, she would try to explain unfamiliar experiences that she had in the United States using the standards ingrained in her from growing up in
Japan. Thus, the main purpose of the text is to convey the narrator’s experience of observing and making sense of the differences between two
cultures she embraces.
Choice B is incorrect because the text makes no reference to possible companions. Although the text does indicate that the narrator sometimes
used the cultural framework she acquired growing up in Japan to explain some experiences she’s had, there is no suggestion that this was in
service of making friends. And although “no one seemed to know” strongly implies that the narrator has interacted with other people in the
United States, there is no indication that these conversations involved her discussing Japanese customs. Choice C is incorrect because nothing
in the text suggests that the narrator was hesitant to ask questions. In fact, the narrator indicates that “no one seemed to know the origin” of
various customs, which provides evidence that, rather than being hesitant, she sought information from several people. Choice D is incorrect
because the text makes no reference to the physical distance between Japan and the United States. Although the narrator indicates that the two
countries differ “widely” and likens them to “two separate worlds,” these descriptions relate to cultural aspects of the countries and the narrator’s
feelings about the two countries, not the physical distance between them.$qb$);
select seed_pool_question($qb$CB-a20b7511$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Scholars long thought that the initial spread of silk beyond China occurred in the second century CE, but this view has been ______ by new
archaeological evidence from South Asia that reveals that the people of the Indus Civilization made use of silk at least 1,000 years earlier.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "investigated"}, {"label": "B", "body": "misinterpreted"}, {"label": "C", "body": "anticipated"}, {"label": "D", "body": "contradicted"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of the initial spread of silk beyond China. In this context,
“contradicted” means opposed or challenged. The text indicates that new archaeological evidence about silk use in South Asia has done
something to a long-held thought about the initial spread of silk. According to the text, the new evidence reveals that people used silk in South
Asia 1,000 years before the second century CE, which directly challenges the previous belief that silk first spread beyond China in the second
century CE.
Choice A is incorrect because the text indicates that an archaeological finding about silk use has done something to a long-held thought about
the initial spread of silk, and it wouldn’t make sense to suggest that the finding could have “investigated,” or examined, a belief; evidence can’t
examine anything. Choice B is incorrect because the text indicates that an archaeological finding about silk use has done something to a long-
held thought about the initial spread of silk, and it wouldn’t make sense to suggest that the finding could have “misinterpreted,” or incorrectly
understood, a belief; evidence can’t try to understand anything. Choice C is incorrect. In this context, “anticipated” would mean expected or
predicted. The text indicates that a new archaeological finding about silk use has done something to a long-held thought about the initial spread
of silk, and a new finding can’t predict a belief that is already established.$qb$);
select seed_pool_question($qb$CB-bce4d106$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Archaeologists have identified a plethora of beads fashioned from Tritia gibbosula shells in many Middle Stone Age (MSA) sites across western
North Africa, including El Mnasra Cave, Morocco. In a 2021 paper, El Mehdi Sehasseh et al. attribute these artifacts’ apparent ______ to the
evolution and propagation of symbolic behavior (e.g., use of personal ornaments) in humans and the widespread availability of T. gibbosula
during the MSA.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "heterogeneity"}, {"label": "B", "body": "ubiquity"}, {"label": "C", "body": "expediency"}, {"label": "D", "body": "fecundity"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of beads found in Middle Stone Age sites. In this context,
“ubiquity” means widespread presence or commonness. The text states that archaeologists have encountered “a plethora,” or an abundance, of
beads made from Tritia gibbosula shells “in many Middle Stone Age (MSA) sites across western North Africa.” In this context, the abundance of
beads therefore suggests their ubiquity.
Choice A is incorrect because in this context, “heterogeneity” would mean variety or diversity among the beads. The text doesn’t suggest that the
beads varied significantly from one another; rather, it focuses on their widespread presence across multiple sites. Moreover, the text mentions
that all the beads were “fashioned from Tritia gibbosula shells,” suggesting consistency rather than heterogeneity. Choice C is incorrect because
the text doesn’t emphasize the beads’ “expediency,” or convenience or practicality. The text doesn’t support the idea of convenience (there’s no
indication, for example, that the beads were easy to use or make) but rather focuses on the beads’ abundant presence at MSA sites. Choice D is
incorrect. While “fecundity” can suggest abundant production, it specifically refers to fertility, and the text doesn’t connect the beads to this
theme. Instead, the text attributes their widespread presence to the development of symbolic behavior in humans and the natural availability of
Tritia gibbosula during the MSA.$qb$);
select seed_pool_question($qb$CB-bbb77c84$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Containing over 160 billion base pairs of DNA resulting from polyploidy (whole genome duplication) and accumulation of noncoding DNA without
significant deletion, the genome of Tmesipteris oblanceolata (New Caledonian fork fern) is the largest known among eukaryotes—and, given the
high biological costs of extremely large genomes, is unlikely to be ______.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "protracted"}, {"label": "B", "body": "superseded"}, {"label": "C", "body": "curtailed"}, {"label": "D", "body": "obviated"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the fork fern’s enormous genome. In this context,
"superseded" means surpassed or exceeded by something else. The text establishes that this plant has "the largest known" genome among
eukaryotes and mentions "the high biological costs of extremely large genomes," suggesting there are natural constraints that make it
biologically disadvantageous to maintain such massive genetic material. This context supports the idea that it’s unlikely another organism will
evolve an even larger genome that would replace this plant’s record—that is, its status as having the largest genome is unlikely to be superseded.
Choice A is incorrect because in this context, "protracted" would mean drawn out over time or space, and the text focuses on the record size of
the New Caledonian fork fern’s genome and the fact that extremely large genomes carry "high biological costs." This information suggests that
the biological upper limit for genome size may have been reached and that the New Caledonian fork fern’s genome is therefore unlikely to be
surpassed, or superseded, not that it’s unlikely to be protracted. Choice C is incorrect because in this context, "curtailed" would mean cut short or
reduced, and the text focuses on the record size of the New Caledonian fork fern’s genome and the fact that extremely large genomes carry "high
biological costs." This information suggests that the biological upper limit for genome size may have been reached and that the New Caledonian
fork fern’s genome is therefore unlikely to be surpassed, or superseded, not that it’s unlikely to be curtailed. Choice D is incorrect because in this
context, "obviated" would mean made unnecessary or redundant, and the text focuses on the record size of the New Caledonian fork fern’s
genome and the fact that extremely large genomes carry "high biological costs." This information suggests that the biological upper limit for
genome size may have been reached and that the New Caledonian fork fern’s genome is therefore unlikely to be surpassed, or superseded, not
that it’s unlikely to be obviated.$qb$);
select seed_pool_question($qb$CB-f631132b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the Here and Now Storybook (1921), educator Lucy Sprague Mitchell advanced the then controversial idea that books for very young children
should imitate how they use language, since toddlers, who cannot yet grasp narrative or abstract ideas, seek reassurance in verbal repetition and
naming. The most enduring example of this idea is Margaret Wise Brown’s 1947 picture book Goodnight Moon, in which a young rabbit names
the objects in his room as he drifts off to sleep. Scholars note that the book’s emphasis on repetition, rhythm, and nonsense rhyme speaks
directly to Mitchell’s influence.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "The text outlines a debate between two authors of children’s literature and then traces how that debate shaped theories on early childhood education."}, {"label": "B", "body": "The text summarizes an argument about how children’s literature should be evaluated and then discusses a contrasting view on that subject."}, {"label": "C", "body": "The text lists the literary characteristics that are common to many classics of children’s literature and then indicates the narrative subjects that are most appropriate for young children."}, {"label": "D", "body": "The text presents a philosophy about what material is most suitable for children’s literature and then describes a book influenced by that philosophy."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The text starts by introducing Mitchell’s philosophy about using simple, repetitive language in books for young
children. Then it describes a book influenced by that philosophy, Goodnight Moon.
Choice A is incorrect. Although two authors are mentioned in the text, they both agree about the type of language that should be contained in
books for young children. Choice B is incorrect. The text never discusses the evaluation of children’s literature. It does provide one view of how
children’s books should be written, but never introduces a competing view. Choice C is incorrect. The text doesn’t mention “many classics of
children’s literature.” Instead, it describes an educational theory and identifies one example of a famous children’s book that was influenced by
that theory.$qb$);
select seed_pool_question($qb$CB-80ebb189$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$As an architect in Los Angeles in the 1950s, Helen Liu Fong became known for avoiding ______ designs in her buildings. Instead of using
standard shapes and colors, she typically explored innovative forms and daring hues.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "creative"}, {"label": "B", "body": "bold"}, {"label": "C", "body": "traditional"}, {"label": "D", "body": "understandable"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of Helen Liu Fong’s architectural designs. In this context,
“traditional” means conventional. The text states that rather than use “standard shapes and colors,” Fong pursued “innovative” and “daring”
design choices in her work. Fong’s style is depicted as inventive, so it therefore makes sense in this context that she avoided mainstream,
traditional designs in her buildings.
Choice A is incorrect because the text indicates that Fong’s work is innovative and experimental. Thus, Fong’s design choices could reasonably
be considered creative, or original. She likely would have pursued creative designs, not avoided them. Choice B is incorrect because the text
indicates that Fong used “daring” hues in her designs. Thus, Fong likely would have pursued bold, or brave and vivid design choices; she wouldn’t
have avoided them. Choice D is incorrect because the text doesn’t address whether Fong’s designs are understandable, or reasonable or
expected. The text focuses on certain characteristics of Fong’s designs, not on how people received or understood them.$qb$);
select seed_pool_question($qb$CB-47904792$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Animals use many objects as tools to achieve goals more easily. Such goals include grooming, finding food, and protecting themselves. For a
long time, people thought tool use was unique to primates. Dolphins and other animals, though, have busted the myth that tool use requires
hands. Inventively, dolphins use sponges to protect their noses from scratches when foraging on the seafloor. Palm cockatoos also get creative.
They use leaves to pad their beaks when opening nuts.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To question the belief that birds are intelligent"}, {"label": "B", "body": "To compare tool use in humans with tool use in palm cockatoos"}, {"label": "C", "body": "To establish that tool use doesn’t indicate intelligence"}, {"label": "D", "body": "To argue that a variety of animals use tools"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately states the main purpose of the text. The text first states that animals make use of
objects as tools to help them achieve different goals. The text then explains that although people used to think only primates use tools, tool use
by dolphins (aquatic mammals) and palm cockatoos (birds) has shown that primates are not the only animals that use tools. Thus, the main
purpose of the text is to argue that a variety of animals, not just primates, use tools.
Choice A is incorrect because the text doesn’t mention intelligence at all, focusing just on the idea that animals use tools. Further, the text
mentions one kind of bird (palm cockatoos) only as an example of a non-primate that uses tools and describes its use of tools as creative, not
unintelligent. Choice B is incorrect. Although the text mentions tool use in primates (a group that includes humans) and in palm cockatoos, it
doesn’t compare humans’ tool use with palm cockatoos’ tool use. The text mentions palm cockatoos only as one example out of the variety of
animals that use tools and never directly mentions tool use in humans. Choice C is incorrect because the text discusses tool use but never
makes any mention of intelligence. Rather than establishing that tool use doesn’t indicate intelligence, the text describes certain tool use as
inventive and creative.$qb$);
select seed_pool_question($qb$CB-e7d37666$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$It is by no means ______ to recognize the influence of Dutch painter Hieronymus Bosch on Ali Banisadr’s paintings; indeed, Banisadr himself cites
Bosch as an inspiration. However, some scholars have suggested that the ancient Mesopotamian poem Epic of Gilgamesh may have had a far
greater impact on Banisadr’s work.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "substantial"}, {"label": "B", "body": "satisfying"}, {"label": "C", "body": "unimportant"}, {"label": "D", "body": "appropriate"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the sentence about the influences on Banisadr’s work. In context, “It is by no
means” followed by “unimportant” conveys how it is relevant to recognize Bosch’s influence on Banisadr. The text points out that the artist
himself cites Bosch as an inspiration, and then goes on to claim that The Epic of Gilgamesh has had a more significant influence than Bosch.
Choice A is incorrect because “substantial,” which means weighty or meaningful, incorrectly suggests that it wouldn’t be meaningful to
acknowledge Bosch’s influence on Banisadr. The phrase “indeed, Banisadr himself cites Bosch as an inspiration” doesn’t support this
suggestion. Choice B is incorrect because “satisfying,” which means pleasing, incorrectly suggests that it wouldn’t be pleasing to acknowledge
Bosch’s influence on Banisadr. The phrase “indeed, Banisadr himself cites Bosch as an inspiration” doesn’t support this suggestion. Choice D is
incorrect because “appropriate,” which means suitable, incorrectly suggests that it wouldn’t be proper to acknowledge Bosch’s influence on
Banisadr. The phrase “indeed, Banisadr himself cites Bosch as an inspiration” doesn’t support this suggestion.$qb$);
select seed_pool_question($qb$CB-b940952c$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$On the basis of extensive calculations and models, astronomers in the 1990s predicted that the collision of two neutron stars or a neutron star
and a black hole could release a massive burst of gamma rays in an event called a kilonova. This ______ was confirmed with observations in
2017.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "theory"}, {"label": "B", "body": "evidence"}, {"label": "C", "body": "constant"}, {"label": "D", "body": "experiment"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of a prediction about a kilonova. In this context, a "theory"
is an explanation that is considered scientifically acceptable. The text states that astronomers predicted in the 1990s that a collision between a
black hole and a neutron star or between two neutron stars could release a massive gamma ray burst called a kilonova, explaining that they
determined this possibility based on their extensive work with existing data and simulations ("calculations and models"). In other words, the
prediction was a theory—a well-supported explanation—that, as the text indicates, was later confirmed with observations in 2017.
Choice B is incorrect because the text indicates that it is the prediction made by astronomers in the 1990s that was confirmed in 2017, and a
prediction of an event isn’t "evidence," or proof, of that event’s existence, even when the prediction is based on extensive study. Further, there
would be no need for later confirmation of something that was already recognized as evidence. Choice C is incorrect because in this context, a
"constant" is a situation or factor that doesn’t change. The text indicates that it is the prediction made by astronomers in the 1990s that was
confirmed in 2017, and there is no reason to describe the prediction as a constant because the text doesn’t suggest that the prediction was
completely unchanged over time—it addresses only the making of the prediction and its later confirmation. Choice D is incorrect because the
text indicates that it is the prediction made by astronomers in the 1990s that was confirmed in 2017; although a prediction might be informed by
an "experiment," or a controlled test, a prediction is an idea rather than a test.$qb$);
select seed_pool_question($qb$CB-570970cd$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The following text is adapted from Indian Boyhood, a 1902 memoir by Ohiyesa (Charles A. Eastman), a Santee Dakota writer. In the text, Ohiyesa
recalls how the women in his tribe harvested maple syrup during his childhood.
Now the women began to test the trees—moving leisurely among them, axe in hand, and striking a single quick blow, to see if the sap would
appear. The trees, like people, have their individual characters; some were ready to yield up their life-blood, while others were more reluctant.-
Now one of the birchen basins was set under each tree, and a hardwood chip driven deep into the cut which the axe had made. From the
corners of this chip—at first drop by drop, then more freely—the sap trickled into the little dishes.
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It portrays the range of personality traits displayed by the women as they work."}, {"label": "B", "body": "It foregrounds the beneficial relationship between humans and maple trees."}, {"label": "C", "body": "It demonstrates how human behavior can be influenced by the natural environment."}, {"label": "D", "body": "It elaborates on an aspect of the maple trees that the women evaluate."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it best describes the function of the underlined sentence in the text’s overall portrayal of how the women in
Ohiyesa’s tribe harvested maple syrup. The text states that the women used an axe to strike the maple trees in order to find out which ones
would produce sap. The underlined sentence compares the trees to people, with the sap described as the trees’ “life-blood.” Some of the trees
are ready to give out their sap, while others are unwilling to do so. Using personification, the sentence provides greater detail about the aspect of
the maple trees—their potential to give sap—that the women are evaluating.
Choice A is incorrect because the personalities of the women are not discussed in the text. Although the underlined sentence does mention
“individual characters,” this reference is not to the women in the text but rather to the maple trees, which the sentence compares to people with
individual character traits. Choice B is incorrect because the underlined sentence focuses on the trees’ willingness or refusal to yield sap, not on
the beneficial relationship between the women and the trees. Additionally, although the text does suggest that the women and their tribe benefit
from the maple trees since the trees allow the women to harvest syrup, there is nothing in the text to suggest that the trees benefit from this
relationship in turn. Choice C is incorrect because the underlined sentence is comparing maple trees to humans, not addressing the influence of
the natural environment on how the actual humans in the text, the women, behave.$qb$);
select seed_pool_question($qb$CB-683f66c9$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Though not closely related, the hedgehog tenrecs of Madagascar share basic ______ true hedgehogs, including protective spines, pointed snouts,
and small body size—traits the two groups of mammals independently developed in response to equivalent roles in their respective habitats.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "examples of"}, {"label": "B", "body": "concerns about"}, {"label": "C", "body": "indications of"}, {"label": "D", "body": "similarities with"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because in context, sharing "similarities with" means having some resemblance to. The text establishes a
comparison between two groups of mammals, stating that although they aren’t closely related, hedgehog tenrecs and true hedgehogs play
similar roles in their habitats, a circumstance that has resulted in the independent development of some of the same physical traits. This context
supports the idea that hedgehog tenrecs resemble, or share basic similarities with, true hedgehogs in some respects.
Choice A is incorrect because the text doesn’t suggest that hedgehog tenrecs are "examples of," or representative of, true hedgehogs. The text
states that despite some shared physical traits, the two groups of mammals aren’t closely related; therefore, hedgehog tenrecs can’t be
examples of true hedgehogs. Choice B is incorrect because in this context, "concerns about" would mean worries about or interests in. The text
focuses on the various physical traits that hedgehog tenrecs and true hedgehogs share. There’s nothing in the text to suggest why hedgehog
tenrecs would be worried about true hedgehogs, or why they would be interested in them. Choice C is incorrect because in this context,
"indications of" would mean evidence of. By listing a set of traits that hedgehog tenrecs share with true hedgehogs, the text establishes a
comparison between the two groups of mammals, and saying that the traits shared within one group of mammals provide evidence of another
group of mammals wouldn’t be an effective way to establish the similarities between the two groups.$qb$);
select seed_pool_question($qb$CB-eae66bf9$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
In 2021, a team led by Amir Siraj hypothesized that the Chicxulub impactor—the object that struck the Yucatán Peninsula sixty-six million years
ago, precipitating the mass extinction of the dinosaurs—was likely a member of the class of long-period comets. As evidence, Siraj cited the
carbonaceous chondritic composition of samples from the Chicxulub impact crater as well as of samples obtained from long-period comet Wild
2 in 2006.
Text 2
Although long-period comets contain carbonaceous chondrites, asteroids are similarly rich in these materials. Furthermore, some asteroids are
rich in iridium, as Natalia Artemieva points out, whereas long-period comets are not. Given the prevalence of iridium at the crater and, more
broadly, in geological layers deposited worldwide following the impact, Artemieva argues that an asteroid is a more plausible candidate for the
Chicxulub impactor.
Based on the texts, how would Artemieva likely respond to Siraj’s hypothesis, as presented in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By insisting that it overestimates how representative Wild 2 is of long-period comets as a class"}, {"label": "B", "body": "By arguing that it does not account for the amount of iridium found in geological layers dating to the Chicxulub impact"}, {"label": "C", "body": "By praising it for connecting the composition of Chicxulub crater samples to the composition of certain asteroids"}, {"label": "D", "body": "By concurring that carbonaceous chondrites are prevalent in soil samples from sites distant from the Chicxulub crater"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. Siraj’s hypothesis is that the Chicxulub impactor was a long-period comet. But Artemieva points to the iridium found
in the crater and in “geological layers that were deposited worldwide after the impact” as evidence that it was actually an asteroid, not a long-
period comet.
Choice A is incorrect. We can’t infer that this is how Artemieva would respond to Siraj’s hypothesis. Text 2 never discusses whether Wild 2 is
representative of long-period comets in general. Rather, Text 2 presents Artemieva’s argument that the Chicxulub impactor was an asteroid, not a
long-term comet. Choice C is incorrect. We can’t infer that this is how Artemieva would respond to Siraj’s hypothesis. Siraj’s hypothesis doesn’t
make this connection: rather, Siraj hypothesizes that the Chicxulub impactor was a long-term comet. Choice D is incorrect. We can’t infer that this
is how Artemieva would respond to Siraj’s hypothesis. “Soil samples from sites distant from the Chicxulub crater” is too vague. Only soil samples
from sites that are connected to the impact in some way are involved in either hypothesis.$qb$);
select seed_pool_question($qb$CB-a1ff8ce3$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$As discussed by scholar Anna Mladentseva, many artworks produced in the mid-1990s to the early 2000s exclusively for exhibition on the
internet, such as Sinae Kim’s Genesis (2001), have become inaccessible because viewing them requires the use of ______ software (most notably
Adobe Flash, discontinued in 2021).
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "defunct"}, {"label": "B", "body": "arcane"}, {"label": "C", "body": "ubiquitous"}, {"label": "D", "body": "extraneous"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of artworks that were produced for exhibition on the
internet. In this context, "defunct" means no longer existing or functioning. According to the text, many artworks that were produced in the mid-
1990s to the early 2000s for exhibition on the internet have become inaccessible due to their reliance on certain software. As an example, the
text cites Sinae Kim’s Genesis, which relied on software that was discontinued in 2021. This context supports the idea that the software is
defunct.
Choice B is incorrect because the text indicates that viewing artworks produced in the mid-1990s to the early 2000s for exhibition on the internet
requires the use of software. Artists generally want their works to be seen by many people, so it wouldn’t make sense for creators of internet art
to require the use of software that is "arcane," or known or knowable to only a few people. Moreover, the text states that a prominent example of
software used to view these artworks is Adobe Flash, which was discontinued in 2021, meaning it’s now defunct. Choice C is incorrect because
"ubiquitous" would mean found everywhere, which wouldn’t make sense in this context. The text indicates that the reason why many artworks
that were produced in the mid-1990s to the early 2000s for exhibition on the internet have become inaccessible has to do with the software
required for viewing them. According to the text, one example of such software is Adobe Flash, which was discontinued in 2021, meaning it’s
now defunct. Choice D is incorrect because nothing in the text suggests that the software used to view artworks produced in the mid-1990s to
the early 2000s for exhibition on the internet is "extraneous," or irrelevant. Instead, the text indicates that use of specific software is required to
view certain artworks from this period and that the discontinuation of the software renders the works inaccessible.$qb$);
select seed_pool_question($qb$CB-9a94eb77$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
One challenge faced by researchers studying global urbanization is that countries may define urban settlements differently. Many countries
define urban settlements based on the number of people living in them. However, countries do not all use the same number; for example, Iceland
uses a minimum population of 200, while the Netherlands uses 20,000. Other countries use a combination of population and other factors. This
variation makes it difficult for researchers to compare aspects of urbanization in different countries.
Text 2
Recently, a group of six international organizations developed global definitions of common types of settlements. The group developed a new
measure called the “degree of urbanization.” This new measure establishes global criteria used to define three types of settlements (cities,
towns, and rural areas) and allows researchers to better understand global urbanization rates.
Based on the texts, how would the author of Text 2 most likely respond to the problem presented in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By recommending that a specific institution should further investigate the problem"}, {"label": "B", "body": "By suggesting that researchers focus on topics besides urbanization"}, {"label": "C", "body": "By supplying additional ways in which urbanization research is difficult"}, {"label": "D", "body": "By noting that a possible solution to the problem is available"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because Text 2 presents a possible solution to the problem identified in Text 1—that is, how disparities in the criteria
used by different countries to define urban settlements make it "difficult for researchers to compare aspects of urbanization in different
countries." Text 2 describes the creation of a shared framework for studying global urbanization: "global definitions of common types of
settlements" and a "new measure called the ‘degree of urbanization’" that "allows researchers to better understand global urbanization rates."
Choice A is incorrect. Although Text 2 mentions "a group of six international organizations" that developed criteria and a measure related to
settlements and urbanization, no organization or institution is singled out to perform further research. Choice B is incorrect because both texts
are about urbanization research and neither mentions any other fields of study. Choice C is incorrect. Text 2 discusses a possible solution to the
terminological problem in global urbanization research, not additional areas of difficulty in the field.$qb$);
select seed_pool_question($qb$CB-5e4e082c$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Chemically analyzing bulk rock-core samples from Australia’s Mount McRae Shale, Ariel Anbar et al. found a transient but significant increase in
molybdenum (Mo) at a point corresponding to roughly 2.5 billion years ago (Ga). On Earth, Mo is released mainly through oxidative weathering of
minerals; Anbar et al. therefore concluded that atmospheric oxygen briefly increased 2.5 Ga, then returned to its earlier negligible level.
Text 2
Sarah Slotznick et al. reexamined the Mount McRae Shale core. Since chemically analyzing bulk samples can occlude contextual details,
Slotznick et al. also employed high-resolution microscopy, which revealed volcanic debris—a known Mo host—around 2.5 Ga and microfractures
in the surrounding matrix. The researchers assert that fluid could have reached the debris through the microfractures and initiated oxidative
weathering long after debris deposition.
Based on the texts, Anbar et al. (Text 1) and Slotznick et al. (Text 2) would most likely disagree about the answer to which question about the
portion of the Mount McRae Shale rock-core corresponding to 2.5 Ga?$qb$, null, $qb$[{"label": "A", "body": "Does the increase in Mo in that portion suggest that atmospheric oxygen levels were not negligible before 2.5 Ga?"}, {"label": "B", "body": "Is the increase in Mo in that portion indicative of an increase in atmospheric oxygen dating to the same time?"}, {"label": "C", "body": "Is the increase in Mo in that portion attributable to oxidative weathering of the material found in that portion?"}, {"label": "D", "body": "Did chemically analyzing bulk samples lead to a false impression that there is an increase in Mo in that portion?"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because Anbar et al. and Slotznick et al. would most likely disagree about whether the molybdenum (Mo) increase
indicates atmospheric oxygen levels specifically at 2.5 Ga. Anbar et al. conclude that the Mo increase they found “at a point corresponding to
roughly 2.5 billion years ago” means that “atmospheric oxygen briefly increased 2.5 Ga, then returned to its earlier negligible level,” directly linking
the timing of the Mo increase to contemporaneous atmospheric oxygen levels. In contrast, Slotznick et al. discovered volcanic debris and
microfractures in the rock core and “assert that fluid could have reached the debris through the microfractures and initiated oxidative weathering
long after debris deposition.” If, as Slotznick asserts, the Mo detected at the 2.5 Ga portion could have been deposited there much later through
weathering processes, then the Mo increase wouldn’t necessarily indicate atmospheric oxygen levels at 2.5 Ga specifically. Thus, Anbar et al. and
Slotznick et al. disagree on whether the increase in Mo in the portion of the rock core corresponding to 2.5 Ga is indicative of an increase in
atmospheric oxygen dating to the same time.
Choice A is incorrect because neither research team’s findings directly address atmospheric oxygen levels before 2.5 Ga. Anbar et al. conclude
that oxygen “returned to its earlier negligible level” after 2.5 Ga, implying low pre–2.5 Ga levels, while Slotznick et al. focus on explaining the Mo
increase through later weathering processes rather than making claims about earlier atmospheric conditions. Choice C is incorrect because both
research teams would likely agree that the Mo increase is attributable to oxidative weathering. Anbar et al. state that “Mo is released mainly
through oxidative weathering of minerals,” and Slotznick et al. also reference “oxidative weathering” as the process that released Mo from the
volcanic debris. Their disagreement concerns the timing of this weathering, not whether oxidative weathering is responsible. Choice D is
incorrect because Slotznick et al. don’t suggest that bulk chemical analysis created a false impression about the presence of increased Mo. They
acknowledge that the Mo increase exists but offer a different explanation for its timing and source. They critique bulk analysis for occluding
“contextual details” that would require another kind of analysis to uncover, not for producing inaccurate measurements of Mo levels.$qb$);
select seed_pool_question($qb$CB-7b4dde72$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 1891, design artist William Morris cofounded the Kelmscott Press, which printed editions of books using preindustrial methods. Historians
argue that Morris’s repudiation of industrialization is ______ the Kelmscott editions’ use of handmade materials and intricate ornamentation
reminiscent of medieval manuscripts: these meticulously handcrafted elements exemplify the artistry involved.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "insensible to"}, {"label": "B", "body": "manifest in"}, {"label": "C", "body": "scrutinized by"}, {"label": "D", "body": "complicated by"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the Kelmscott Press’s books. In this context, "manifest
in" means evident or apparent from. The text states that the Kelmscott Press, which was cofounded by William Morris, produced its books using
preindustrial methods. The text notes the similarity between those methods, which include the use of handmade materials and intricate
ornamentation, and methods used in the creation of medieval manuscripts. This context suggests that Morris’s repudiation of industrialization is
apparent from, or manifest in, the methods and materials his company employed.
Choice A is incorrect because there is nothing in the text to suggest that Morris’s repudiation of industrialization is "insensible to," or unaware of
or lacking perception of, the use of handmade materials and intricate ornamentation in the production of the Kelmscott editions. Instead, the text
suggests that the methods and materials used to produce the Kelmscott editions are evidence of Morris’s repudiation of industrialization. Choice
C is incorrect because it would not make sense to say that Morris’s repudiation of industrialization was "scrutinized by," or examined closely by,
the Kelmscott editions’ use of handmade materials and intricate ornamentation. Although creating the Kelmscott editions may have involved
examining the books closely, the text does not mention this aspect of Morris’s work, and in any case, the action of using certain materials to
create those editions cannot scrutinize Morris’s attitude toward industrialization. Choice D is incorrect because the text gives no indication that
Morris’s repudiation of industrialization is "complicated by," or made more complex or difficult by, the Kelmscott Press’s use of preindustrial
methods and handcrafted elements to produce books. Instead, the text presents those methods as exemplifying Morris’s repudiation of
industrialization.$qb$);
select seed_pool_question($qb$CB-35fd0eb4$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The discoverers of the minor planet 1227 Geranium named it after the plant genus that includes cranesbills. Most of the recently discovered
minor planets, however, are given only an identification number, largely due to there being over 500,000 such bodies known at present, which
makes the already challenging task of finding a unique name for each nearly ______.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "insurmountable"}, {"label": "B", "body": "feasible"}, {"label": "C", "body": "substantial"}, {"label": "D", "body": "unnecessary"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of the difficulty in naming a large number of minor planets.
In this context, "insurmountable" means impossible to overcome or too difficult to solve. The text establishes that coming up with distinct names
for minor planets is already a difficult task that has become even more challenging because there are now more than 500,000 known minor
planets. The logical conclusion is that finding unique names for such a vast number of celestial objects has become virtually impossible—or
insurmountable—which explains why the majority of recently discovered minor planets receive only identification numbers instead of proper
names.
Choice B is incorrect because "feasible" means possible to do or achieve, which would contradict the logic of the text. The text indicates that the
task of naming minor planets has become more difficult because of their large number. The text then explains that this is why most new
discoveries receive only identification numbers. If the task were feasible, there would be no reason to abandon the practice of giving proper
names to minor planets in favor of using only numbers. Choice C is incorrect because "substantial" means considerable in size, amount, or
importance. While the text does suggest that naming all minor planets would be a significant undertaking, describing the task as substantial
wouldn’t logically explain why the naming practice has been largely abandoned in favor of using only identification numbers. The text suggests
that the task has become virtually impossible (insurmountable), not merely large or significant. Choice D is incorrect because "unnecessary,"
which means not needed, would suggest that giving proper names to minor planets serves no purpose. However, the text doesn’t question the
value or purpose of naming minor planets; rather, it explains that the sheer number of discoveries has made the already challenging naming task
nearly impossible to complete. The text provides an example of a named minor planet (1227 Geranium), indicating that naming has been
considered worthwhile but has become impractical because of the volume.$qb$);
select seed_pool_question($qb$CB-c8a2af72$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
French Impressionist artist Edgar Degas insisted that his paintings be kept in their original frames after they were sold. Like many Impressionist
painters, Degas used painted frames that stood in contrast to the gold frames frequently seen at the Paris Salon, a prestigious art exhibition that
was sponsored by the French government and promoted traditional painting styles. Impressionist painters likely chose these colorful frames to
distinguish themselves from what was considered conventional at the time.
Text 2
Impressionist painters often focused on the interplay of color and light in their works. As such, those Impressionists who placed their works in
painted frames instead of the more traditional gold ones did so for aesthetic reasons: a frame’s color was likely chosen because it would
harmonize with the colors or subjects in a painting. Gold, conversely, could distract from the subtleties in a painted scene.
Based on the texts, both authors would most likely agree with which statement?$qb$, null, $qb$[{"label": "A", "body": "Gold frames were considered especially desirable by those who purchased works from Impressionist painters."}, {"label": "B", "body": "The colors in an Impressionist painting were often chosen to complement the colors of the frame it would be placed in."}, {"label": "C", "body": "Many Impressionist painters were intentional about the frames they selected for their works."}, {"label": "D", "body": "Degas’s preferred framing style was different from that of most Impressionist painters."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it presents the statement about the use of painted frames in Impressionist painting that both authors would
be most likely to agree with. Text 1 discusses painter Edgar Degas’s insistence that his works remain in their original painted frames, which
contrasted with the gold frames that were typical of the Paris art scene at the time. The text then argues that the preference of Degas and other
French Impressionist painters for colorful frames can likely be attributed to their desire "to distinguish themselves from what was considered
conventional at the time." Text 2 also notes that Impressionist painters "placed their works in painted frames" but argues that they probably did
so for a purely aesthetic reason: to ensure that "the frame’s color...would harmonize with the colors or subjects in a painting." Though differing on
Impressionist painters’ rationale for using painted frames, the authors of both texts would agree that many Impressionist painters were
intentional about the frames they selected for their works.
Choice A is incorrect because neither text suggests that gold frames were considered desirable by those purchasing Impressionist works.
Indeed, it can be inferred from the fact that Impressionist painters used painted frames that those who purchased those works wouldn’t have
had a strong preference for gold frames. Choice B is incorrect because neither text suggests that Impressionist painters chose colors for their
paintings based on planned frame colors. Indeed, Text 2 states that frame colors were chosen to "harmonize with the colors or subjects in a
painting," implying that the color scheme of paintings predated and took precedence over the choice of the colors of frames. Choice D is
incorrect because Text 1 presents Degas’s preference for painted frames as being typical of Impressionist painters’ attitudes toward the framing
of their works. Moreover, although Text 2 doesn’t specifically discuss Degas, it concurs with Text 1’s assertion that these painters preferred
painted frames. Thus, both texts position painted frames as a hallmark of French Impressionist painting, not as a deviation from it.$qb$);
select seed_pool_question($qb$CB-10a409bd$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Ida B. Wells’s 1970 autobiography A Crusade for Justice. Mr. Watts is a reference to George Frederic Watts, an
English painter.
[Manchester’s] art galleries are so arranged- that the name of every picture is plainly seen and one has no need of a catalogue to
pick out the name and the artist. This is a convenience to the general public, which other art galleries, which shall be nameless,
might copy to advantage. To her treasure of art Manchester has added Mr. Watts’ latest picture, the Good Samaritan.
©1970 by the University of Chicago Press
As used in the text, what does the word “arranged” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Organized"}, {"label": "B", "body": "Ranked"}, {"label": "C", "body": "Scheduled"}, {"label": "D", "body": "Discussed"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because as used in the text, "arranged" most nearly means "organized." The text states that a welcome feature of
Manchester’s art galleries (as opposed to others) is that the titles of the paintings are easy to see and that a catalogue is therefore unneeded
while visitors browse the art galleries. This suggests that the paintings are displayed in a systematic, or organized, way.
Choice B is incorrect. "Ranked" might mean either classified or placed in orderly rows. Neither of these meanings would necessarily imply that
the names of the paintings are easy to see (even if the paintings are placed in rows, their labels might be obscured). Choice C is incorrect
because it would not make sense in context to describe the paintings as "scheduled," or planned to take place at a certain time. Choice D is
incorrect because if the paintings were "discussed," or talked about, this would have no bearing on whether the names of the paintings could be
easily seen.$qb$);
select seed_pool_question($qb$CB-a60b0004$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Scholarly discussions of gender in Shakespeare’s comedies often celebrate the rebellion of the playwright’s characters against the rigid
expectations ______ by Elizabethan society. Most of the comedies end in marriage, with characters returning to their socially dictated gender
roles after previously defying them, but there are some notable exceptions.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "interjected"}, {"label": "B", "body": "committed"}, {"label": "C", "body": "illustrated"}, {"label": "D", "body": "prescribed"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of gender roles in Shakespeare’s comedies. As used in this
context, “prescribed” would mean laid down as rules. The text indicates that the characters in the comedies often defy gender roles that are
“socially dictated” (even if most characters do return to those roles eventually) and that scholars have been very interested in these acts of
defiance. This context indicates that what the characters are rebelling against are standards of behavior prescribed by the society of the time.
Choice A is incorrect because saying that expectations about gender were “interjected,” or suddenly inserted between other things, wouldn’t
make sense in context. There’s no suggestion in the text that the issue of gender roles was inserted between other things or was an interruption
in a larger discussion. Choice B is incorrect because the text indicates that Shakespeare depicts characters rebelling against expectations about
gender that have been “socially dictated,” not expectations that society has “committed,” or carried out, entrusted, or promised. Choice C is
incorrect because the text indicates that Shakespeare depicts characters rebelling against expectations about gender that have been “socially
dictated,” not expectations that have been “illustrated,” or clarified with examples. Although it’s possible for expectations about gender roles to
be illustrated, there’s nothing in the text to indicate that characters in Shakespeare’s comedies rebel against illustrations of gender expectations.$qb$);
select seed_pool_question($qb$CB-a5e747f0$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Despite how ______ they may seem on first glance, the works of the philosopher Georg Hegel have proven to be quite influential. Readers who
manage to penetrate Hegel’s frustratingly dense prose often find that his thrillingly original and profound ideas wind up shaping their own
thinking.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "authoritative"}, {"label": "B", "body": "opaque"}, {"label": "C", "body": "empirical"}, {"label": "D", "body": "facile"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of Hegel’s works. In this context, "opaque" means difficult
to understand or unclear. The text creates a contrast between the initial impression given by Hegel’s works and their influence and insight, noting
that readers must "penetrate Hegel’s frustratingly dense prose" to access his important ideas. This context clearly establishes that Hegel’s
writing is initially challenging to comprehend, or opaque.
Choice A is incorrect because "authoritative" means influential or clearly accurate. Hegel’s works may be authoritative, but it wouldn’t make
logical sense in context to say that although his works seem authoritative, they have been influential. Instead, the text focuses on the fact that
Hegel’s works are challenging to read, but that working through the dense prose can be rewarding. Choice C is incorrect because referring to
Hegel’s works as "empirical," which means factual or verifiable, would suggest that they are based on observation or experience rather than
theory. The text, however, doesn’t address this aspect of Hegel’s philosophy. Instead, it focuses on the difficulty of understanding his writing.
Choice D is incorrect because describing Hegel’s works as "facile," which means superficial or simplistic, would directly contradict the text’s
characterization of his writing as "frustratingly dense" and requiring effort to understand.$qb$);
select seed_pool_question($qb$CB-03080769$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Philosopher G.E. Moore’s most influential work entails the concept of common sense. He asserts that there are certain beliefs that all people,
including philosophers, know instinctively to be true, whether or not they profess otherwise: among them, that they have bodies, or that they exist
in a world with other objects that have three dimensions. Moore’s careful work on common sense may seem obvious but was in fact
groundbreaking.
Text 2
External world skepticism is a philosophical stance supposing that we cannot be sure of the existence of anything outside our own minds.
During a lecture, G.E. Moore once offered a proof refuting this stance by holding out his hands and saying, “Here is one hand, and here is
another.” Many philosophers reflexively reject this proof (Annalisa Coliva called it “an obviously annoying failure”) but have found it a challenge to
articulate exactly why the proof fails.
Based on the texts, how would the author of Text 1 most likely respond to proponents of the philosophical stance outlined in Text 2?$qb$, null, $qb$[{"label": "A", "body": "By agreeing with those proponents that Moore’s treatment of positions that contradict his own is fundamentally unserious"}, {"label": "B", "body": "By suggesting that an instinctive distaste for Moore’s position is preventing external world skeptics from constructing a sufficiently rigorous refutation of Moore"}, {"label": "C", "body": "By arguing that if it is valid to assert that some facts are true based on instinct, it is also valid to assert that some proofs are inadequate based on instinct"}, {"label": "D", "body": "By pointing out that Moore would assert that external world skepticism is at odds with other beliefs those proponents must unavoidably hold"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. According to the author of Text 1, Moore’s definition of common sense—things we instinctively know are true—
includes the belief that we all “exist in a world with other objects.” The author of Text 1 describes this notion as both “obvious” and
“groundbreaking.” So it’s safe to infer that the author would observe that Moore would respond to external world skeptics by arguing that since
everyone instinctively knows that things exist outside of their own minds, then external world skepticism must be wrong.
Choice A is incorrect. We can’t infer that the author of Text 1 would respond this way to external world skeptics. If anything, the author of Text 1
seems to agree with Moore. Choice B is incorrect. We can’t infer that the author of Text 1 would respond this way to external world skeptics. The
author of Text 1 never mentions external world skeptics directly, let alone why they have a hard time refuting Moore’s position. Choice C is
incorrect. We can’t infer that the author of Text 1 would respond this way to external world skeptics. Text 1’s presentation of Moore’s concept of
common sense only includes the idea that some facts are true based on instinct—it doesn’t mention the idea that some proofs are inadequate
based on instinct.$qb$);
select seed_pool_question($qb$CB-b0ea8c28$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Sueño de Familia is an exhibition of drawings, paintings, and ceramics that explores the artistic heritage of US-based artist Yolanda González.
The exhibition ______ five generations, featuring works by González’s great-grandfather, grandmother, mother, and niece as well as González
herself.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "borrows"}, {"label": "B", "body": "spans"}, {"label": "C", "body": "judges"}, {"label": "D", "body": "neglects"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the Sueño de Familia art exhibition. In this context,
“spans” means extends across or covers. The text states that the exhibition explores González’s artistic heritage and features artwork by her
great-grandfather, grandmother, mother, and niece. This context conveys the idea that the exhibition spans, or extends across, five generations of
González’s family.
Choice A is incorrect because it wouldn’t make sense to say that the exhibition “borrows,” or acquires, five generations of González’s family. The
text indicates that the exhibition features artwork by family members from five generations, not that the five generations themselves have been
acquired for inclusion in the exhibition. Choice C is incorrect because the text indicates that the purpose of the exhibition is to highlight artwork,
not to “judge,” or give an opinion on, five generations of the artist’s family. Choice D is incorrect because the text doesn’t suggest that the
exhibition “neglects,” or gives little attention to, five generations of González’s family. On the contrary, the text indicates that the exhibition is
dedicated to exploring González’s artistic heritage and therefore designed to bring attention to her family members and their artwork.$qb$);
select seed_pool_question($qb$CB-749f3334$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from Charlotte Forten Grimké’s 1888 poem “At Newport.”
Oh, deep delight to watch the gladsome waves
Exultant leap upon the rugged rocks;
Ever repulsed, yet ever rushing on-—
Filled with a life that will not know defeat;-
To see the glorious hues of sky and sea.
The distant snowy sails, glide spirit like,
Into an unknown world, to feel the sweet
Enchantment of the sea thrill all the soul,
Clearing the clouded brain, making the heart
Leap joyous as it own bright, singing waves!
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It portrays the surroundings as an imposing and intimidating scene."}, {"label": "B", "body": "It characterizes the sea’s waves as a relentless and enduring force."}, {"label": "C", "body": "It conveys the speaker’s ambivalence about the natural world."}, {"label": "D", "body": "It draws a contrast between the sea’s waves and the speaker’s thoughts."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes how the underlined portion functions in the text as a whole. The text presents
the speaker’s experience of viewing the sea. In the underlined portion, the speaker focuses on the idea that the waves hitting rocks on the shore
are a relentless and enduring force: they are constantly pushed back (“ever repulsed”) but always return (“ever rushing on”), as though they have
an energy that can’t be overcome (“a life that will not know defeat”).
Choice A is incorrect. Although the underlined portion characterizes the waves as a relentless force (always “repulsed” but still “rushing on” and
never being defeated), the speaker doesn’t suggest that the surroundings are intimidating. Instead, the speaker presents the scene in a positive
way, describing the “deep delight” of the “gladsome,” or cheerful, waves and feeling “the heart / Leap joyous” while viewing the sea. Choice C is
incorrect because the underlined portion doesn’t suggest that the speaker is ambivalent, or has mixed feelings about, the natural world. Instead,
it presents a single view of one part of the immediate surroundings: the speaker characterizes the sea’s waves as an unstoppable force, since
they are constantly pushed back but always return (“ever repulsed, yet ever rushing on”). Choice D is incorrect. Although the text later suggests
the speaker’s view of her own thoughts by referring to a “clouded brain” and a heart that leaps joyously, this reference neither occurs within the
underlined portion nor establishes a clear contrast with the relentless determination of the waves. The underlined portion addresses only the
speaker’s view of the waves and doesn’t suggest what her own thoughts might be.$qb$);
select seed_pool_question($qb$CB-5ccbfe22$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To entice study participants, psychology researchers commonly offer a gift card or other compensation. However, this practice may undercut the
applicability of the study’s results: people who join a study in response to ______ may differ in important ways from a representative sample of
the population of interest.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "a propensity"}, {"label": "B", "body": "an inducement"}, {"label": "C", "body": "a paradigm"}, {"label": "D", "body": "an appeasement"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of how compensation in psychology studies may affect the
applicability of results. In this context, “an inducement” means a reward offered to encourage a person to take a particular action. The text
indicates that psychology researchers commonly offer rewards such as gift cards to encourage people to participate in their studies, potentially
rendering the participant pool unrepresentative of the target population. This context supports the idea that participants are joining studies in
response to an inducement.
Choice A is incorrect. While participants might join a study in response to “a propensity,” or a natural inclination, to do so, the text isn’t focused on
participants’ predispositions. Rather, the text is concerned with the external rewards that researchers offer to attract participants. Choice C is
incorrect because saying that participants join studies in response to “a paradigm,” or a typical model or framework, wouldn’t make sense in
context. The text doesn’t address any such framework. Instead, it focuses on tangible rewards that researchers offer to attract study
participants. Choice D is incorrect because saying that participants join a study in response to “an appeasement,” or a concession made to
pacify a person, wouldn’t make sense in context. The text describes researchers offering gift cards and other forms of compensation to attract
willing study participants, not to address anyone’s grievance or dissatisfaction.$qb$);
select seed_pool_question($qb$CB-fce80a36$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 2008 a complete set of ancient pessoi (glass game pieces) was uncovered from beneath a paving stone in modern-day Israel. Due to their
small size, pessoi were easily misplaced, making a whole set a rare find. This has led some experts to suggest that the set may have been buried
intentionally; however, without clear evidence, archaeologists are left to ______ what happened.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "speculate about"}, {"label": "B", "body": "dismiss"}, {"label": "C", "body": "expand on"}, {"label": "D", "body": "catalog"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "Speculate" means "to form a theory or guess without any clear evidence." This makes sense because, due to the
lack of "clear evidence," the archaeologists can only guess how the pessoi set might have come to be there.
Choice B is incorrect. "Dismiss" can mean "send away" or "treat as unworthy of consideration." The text implies that the archaeologists are trying
to figure out the truth—they wouldn’t "dismiss" what really happened. Choice C is incorrect. "Expand on" means "give more details about," but
there aren’t any details to give. Without any "clear evidence," the archaeologists can’t give any more details. Choice D is incorrect. "Catalog"
means "carefully record" or "make a list of." However, there’s no "clear evidence," so there’s no real information to "catalog."$qb$);
select seed_pool_question($qb$CB-e5e7f264$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The general store was essential to daily life in the rural United States during the 1800s because it provided the supplies that the people living in
nearby communities needed. Also, the store was a ______ of information. People socializing at the general store would share news and help
spread it throughout their communities.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "source"}, {"label": "B", "body": "rival"}, {"label": "C", "body": "condition"}, {"label": "D", "body": "waste"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of the role of the general store in US rural communities
during the 1800s. In this context, "source" means a place where something originates or is obtained. The text states that people would share
news while socializing at the general store. This context supports the idea that the store served as a source of information in rural communities.
Choice B is incorrect because "rival" would mean competitor or opponent. The text doesn’t indicate that the general store was a rival of anything.
Instead, the text describes the general store as a place that enabled the sharing of information within rural communities. Choice C is incorrect
because in this context, "condition" would mean state, circumstance, or requirement. Although the text implies that visiting the store was helpful
for acquiring information since people shared news there, it wouldn’t make sense to say that the general store was a condition of information.
Choice D is incorrect because "waste" would mean something that is unused, discarded, or spent unnecessarily, which would not make sense in
context. The text describes the general store as an essential part of daily life and a place for socializing and information sharing. The store was
therefore a source, not a waste, of information.$qb$);
select seed_pool_question($qb$CB-e4e2aeb3$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Like the work of Ralph Ellison before her, Toni Morrison’s novels feature scenes in which characters deliver sermons of such length and verbal
dexterity that for a time, the text exchanges the formal parameters of fiction for those of oral literature. Given the many other echoes of Ellison in
Morrison’s novels, both in structure and prose style, these scenes suggest Ellison-’s direct influence on Morrison.
Text 2
In their destabilizing effect on literary form, the sermons in Morrison’s works recall those in Ellison’s. Yet literature by Black Americans abounds
in moments where interpolated speech erodes the division between oral and written forms that literature in English has traditionally observed.
Morrison’s use of the sermon is attributable not only to the influence of Ellison but also to a community-wide strategy of resistance to externally
imposed literary conventions.
Based on the texts, how would the author of Text 2 most likely characterize the underlined claim in Text 1?$qb$, null, $qb$[{"label": "A", "body": "As failing to consider Ellison’s and Morrison’s equivalent uses of the sermon within the wider cultural context in which they wrote"}, {"label": "B", "body": "As misunderstanding the function of sermons in novels by Black American writers other than Ellison and Morrison"}, {"label": "C", "body": "As disregarding points of structural and stylistic divergence between the works of Ellison and those of Morrison"}, {"label": "D", "body": "As being indebted to the tradition of resisting literary conventions that privilege written forms, such as novels, over sermons and other oral forms"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The author of Text 2 argues that Morrison’s use of the sermon is not only influenced by Ellison, but also by a
“community-wide strategy of resistance” to literary conventions practiced by Black American authors. Ellison, Text 2 alleges, is only one of many
influences on Morrison.
Choice B is incorrect. Neither text specifically mentions sermons in works by authors other than Morrison or Ellison, only a tendency towards
eroding “the division between oral and written forms” among Black American writers. Choice C is incorrect. Both texts describe similarities
between the works of Ellison and Morrison, and neither points out instances of divergence. Text 2 simply suggests that Morrison was influenced
by more than just Ellison. Choice D is incorrect. While Text 2 does discuss Morrison’s resistance to certain literary conventions, it’s unclear what
it would mean for the underlined claim to be “indebted” to that tradition. This choice recycles language from the text, but not in a way that makes
any coherent point.$qb$);
select seed_pool_question($qb$CB-0d402146$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$US traffic signals didn’t always contain the familiar three lights (red, yellow, and green). Traffic lights only ______ red and green lights until the
three-light traffic signal was developed in the 1920s.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "avoided"}, {"label": "B", "body": "featured"}, {"label": "C", "body": "appreciated"}, {"label": "D", "body": "disregarded"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of traffic signals. The text indicates that while US traffic
signals now have lights of three different colors (red, yellow, and green), before some point in the 1920s they had only red and green lights. This
context conveys that before three-color signals were developed, traffic lights “featured,” or had as a characteristic, just two colors.
Choice A is incorrect because it wouldn’t make sense to suggest that traffic signals could have ever “avoided,” or stayed away from, certain
colors of lights. The people who made the traffic signals might have chosen not to use certain colors, but signals themselves can’t make
choices. Choice C is incorrect. In this context, “appreciated” would mean valued or recognized with gratitude, and it wouldn’t make sense to
suggest that traffic signals could have ever valued or recognized anything. Choice D is incorrect. In this context, “disregarded” would mean
ignored or treated as unworthy, and it wouldn’t make sense to suggest that traffic signals could have ever ignored something or had an opinion
of something’s worth.$qb$);
select seed_pool_question($qb$CB-e5da61f1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Charles Chesnutt’s 1899 short story “Mars Jeems’s Nightmare.” The narrator and his wife have recently
moved to the southern United States, and Julius is their carriage driver.
Julius [was] very useful when we moved to our new residence. He had a thorough knowledge of the neighborhood, was familiar
with the roads and the watercourses, knew the qualities of the various soils and what they would produce, and where the best
hunting and fishing were to be had. He was a marvelous hand in the management of horses and dogs.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To compare the narrator’s reaction to a new home with his wife’s reaction"}, {"label": "B", "body": "To give an example of Julius’s knowledge about soil"}, {"label": "C", "body": "To show that the narrator and Julius often hunt and fish together"}, {"label": "D", "body": "To explain different ways in which Julius was helpful"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes the main purpose of the text, which is to explain different ways in which Julius
was helpful. The text begins with the narrator stating that Julius was very helpful to him and his wife when they moved to their new residence.
The narrator then provides a list of examples to illustrate Julius’s helpfulness. For instance, the narrator states that Julius was familiar with the
neighborhood’s roads, which suggests that he was helpful in navigating them, and that Julius helped manage the horses and dogs. The text’s
many examples of Julius’s usefulness reinforce just how helpful he was and in how many different ways.
Choice A is incorrect because the text doesn’t portray either the narrator’s or his wife’s reaction to their new home. Rather, the text focuses on
how Julius was useful to the narrator and his wife in their new home. Choice B is incorrect. Although the text states that Julius was
knowledgeable about the soil, this is one of several supporting details that illustrate how helpful Julius was. Moreover, the text merely states that
Julius was knowledgeable about soil; it doesn’t provide an example of that knowledge. Choice C is incorrect because there’s nothing in the text to
suggest the frequency with which the narrator and Julius hunted and fished together. In fact, it’s unclear from the text whether the narrator and
Julius hunted and fished together at all. The text merely indicates that Julius knew the best places to hunt and fish—a detail that supports the
text’s main purpose by conveying Julius’s usefulness.$qb$);
select seed_pool_question($qb$CB-ac5bf490$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is from Reyna Grande’s 2012 memoir The Distance Between Us. In the text, Grande reflects on a time when she and her older
sister Mago were children. A Barbie is a type of doll.
I begged Mago to come play with me. She wasn’t as interested in my Barbie as she had been just two months before, which made-
me sad because that was the only thing Mago had envied me for. Usually, it was me doing the envying. After I pestered her-
relentlessly, she finally put her notebook down and came over to me.
©2012 by Reyna Grande
Which choice best describes the function of the underlined portion in the text?$qb$, null, $qb$[{"label": "A", "body": "It indicates Grande’s unhappiness over Mago’s disinterest in Grande’s doll."}, {"label": "B", "body": "It expresses Grande’s anger over Mago’s refusal to spend time with her."}, {"label": "C", "body": "It presents an example of how Mago and Grande generally played together as children."}, {"label": "D", "body": "It provides a reason for why Mago is unwilling to play with Grande."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes the function of the underlined portion in the text. The underlined portion
("which made me sad because that was the only thing Mago had envied me for") directly expresses Grande’s unhappiness about her sister’s
diminished interest in her Barbie doll. The underlined text specifically identifies that Grande feels sad and explains why Mago’s disinterest
particularly affects her—because it was the one rare instance where her older sister had envied her, rather than the reverse.
Choice B is incorrect because the underlined portion expresses sadness, not anger. Although there is some correspondence between the
emotions anger and envy and the text does indicate that Grande usually envies her sister, the underlined portion states that Grande feels sad
about Mago’s disinterest in Grande’s Barbie, not angry about Mago’s refusal to spend time with her. Choice C is incorrect. While the first part of
the sentence that contains the underlined portion indicates that Mago has previously taken an interest in Grande’s Barbie, implying that the
sisters may regularly have played with the Barbie together in the past, the underlined portion doesn’t provide an example of this. The underlined
portion instead explains why Mago’s recently developed disinterest in the Barbie saddens Grande. Choice D is incorrect because neither the
underlined portion nor the text as a whole explains why Mago is unwilling to play with Grande. Rather than addressing Mago’s motivation or
reasoning, the underlined portion describes Grande’s emotional reaction to Mago’s disinterest in Grande’s Barbie and explains why this lack of
interest matters to Grande.$qb$);
select seed_pool_question($qb$CB-6a1dc7c5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Virginia Woolf’s 1928 novel Orlando is an oddity within her body of work. Her other major novels consist mainly of scenes of everyday life and
describe their characters’ interior states in great detail, whereas Orlando propels itself through a series of fantastical events and considers its
characters’ psychology more superficially. Woolf herself sometimes regarded the novel as a minor work, even admitting once that she “began it
as a joke.”
Text 2
Like Woolf’s other great novels, Orlando portrays how people’s memories inform their experience of the present. Like those works, it examines
how people navigate social interactions shaped by gender and social class. Though it is lighter in tone—more entertaining, even—this literary
“joke” nonetheless engages seriously with the themes that motivated the four or five other novels by Woolf that have achieved the status of
literary classics.
Based on the texts, how would the author of Text 2 most likely respond to the assessment of Orlando presented in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By conceding that Woolf’s talents were best suited to serious novels but asserting that the humor in Orlando is often effective"}, {"label": "B", "body": "By agreeing that Orlando is less impressive than certain other novels by Woolf but arguing that it should still be regarded as a classic"}, {"label": "C", "body": "By acknowledging that Orlando clearly differs from Woolf’s other major novels but insisting on its centrality to her body of work nonetheless"}, {"label": "D", "body": "By concurring that the reputation of Orlando as a minor work has led readers to overlook this novel but maintaining that the reputation is unearned"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it reflects how the author of Text 2 would most likely respond to the assessment of Orlando in Text 1. Both
authors agree that Orlando is unusual for Woolf: Text 1 states that the novel examines its characters’ psychologies more superficially than
Woolf’s other novels do, and Text 2 describes it as being lighter in tone. However, while Text 1 calls Orlando an “oddity” and mentions that Woolf
“began it as a joke,” Text 2 asserts that Orlando engages the same themes as Woolf’s other great novels. Hence, the author of Text 2 would most
likely accept that Orlando differs from Woolf’s other novels but would also insist on its importance in the context of Woolf’s work as a writer.
Choice A is incorrect. Text 2 does suggest that the humor in Orlando is effective. However, there’s nothing in Text 2 to suggest that the author
would agree that Woolf’s talents were best suited to serious novels. Rather, the author of Text 2 compares Orlando favorably to other novels by
Woolf that are implied to be darker in tone. Choice B is incorrect because the author of Text 2 does not indicate that Orlando is less impressive
than Woolf’s other novels, but instead points out that it engages the same themes as other novels by Woolf that are considered classics. Choice
D is incorrect because there’s nothing in Text 1 or Text 2 to suggest that readers have generally ignored Orlando because of its reputation.$qb$);
select seed_pool_question($qb$CB-5dce6cab$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Given that the conditions in binary star systems should make planetary formation nearly impossible, it’s not surprising that the existence of
planets in such systems has lacked ______ explanation. Roman Rafikov and Kedron Silsbee shed light on the subject when they used modeling to
determine a complex set of factors that could support planets’ development.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "a discernible"}, {"label": "B", "body": "a straightforward"}, {"label": "C", "body": "an inconclusive"}, {"label": "D", "body": "an unbiased"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s description of efforts to explain the existence of planets in binary star
systems. As used in this context, describing an explanation as “a straightforward” one would mean that the explanation is direct and
uncomplicated. The text asserts that since it should be “nearly impossible” for planets to form in binary star systems, it’s “not surprising” that
there isn’t a straightforward explanation for the existence of planets in such systems; the fact that one potential approach involves “complex”
factors offers further contextual support for this idea.
Choice A is incorrect because it would not make sense in context to say that there isn’t “a discernible” explanation—meaning an explanation
capable of being perceived—for the existence of planets in binary star systems. The text discusses just such an explanation offered by Roman
Rafikov and Kedron Silsbee, which indicates that their explanation can be discerned. Choice C is incorrect because the text emphasizes how
difficult it is to explain the existence of planets in binary star systems, suggesting that the situation isn’t marked by the lack of “an inconclusive”
explanation—an explanation that does not resolve the issue—but rather that if any explanations have been offered, they’ve likely been
inconclusive ones. Choice D is incorrect because nothing in the text suggests that there is a lack of “an unbiased,” or impartial and unprejudiced,
explanation for the existence of planets in binary star systems. The text indicates that it’s difficult to explain the existence of planets in such
systems and it describes one attempt to do so, but there is no evidence that explanations from Roman Rafikov and Kedron Silsbee or others are
biased.$qb$);
select seed_pool_question($qb$CB-edbc6cca$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is from Bram Stoker’s 1911 novel The Lair of the White Worm. Adam is meeting his great-uncle Richard at a port.
The meeting so auspiciously begun proceeded well. Adam, seeing that the old man was interested in the novelty of the ship,
suggested that he should stay the night on board, and that he would himself be ready to start at any hour and go anywhere that
the other suggested. This affectionate willingness to fall in with his own plans quite won the old man’s heart. He warmly accepted
the invitation, and at once they became not only on terms of affectionate relationship, but almost like old friends.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "It states the reasons why Adam and his great-uncle Richard decide to sleep on the ship rather than finding lodging on land."}, {"label": "B", "body": "It showcases how Adam’s flexibility and consideration strengthen his relationship with his great-uncle Richard."}, {"label": "C", "body": "It describes why Adam and his great-uncle Richard are excited for their upcoming journey on the ship."}, {"label": "D", "body": "It contrasts great-uncle Richard’s wary first impressions of Adam with his ultimate affection toward him."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes the main purpose of the text, which is to showcase how Adam’s flexibility and
consideration strengthen his relationship with his great-uncle Richard. The text begins by stating that the meeting between the two characters is
proceeding well and then describes Adam’s thoughtful behavior: noticing his great-uncle’s interest in the ship, Adam suggests staying on board
overnight and expresses willingness to accommodate his great-uncle’s schedule and destination preferences. The text goes on to describe the
positive effect of Adam’s thoughtfulness and flexibility, indicating that Adam’s “affectionate willingness” to accommodate Richard’s preferences
“quite won the old man’s heart.” The text concludes by suggesting that Adam’s ability to anticipate his great-uncle’s wishes and willingness to
accommodate them result in the rapid development of affection and intimacy between them, stating that they soon became “almost like old
friends.” Therefore, the text’s main purpose is to demonstrate how Adam’s flexibility and consideration strengthened his and his great-uncle’s
relationship.
Choice A is incorrect. Although the text explains Adam’s reason for suggesting that Richard spend the night on the ship rather than finding
lodging on land (which is that Adam perceives Richard’s interest in the ship), this isn’t the text’s main purpose. Rather, Adam’s suggestion about
where to sleep for the night serves as an example of the consideration Adam shows toward Richard, and the text mentions it mainly to explain
how an affectionate relationship developed so quickly between them. Moreover, the text only states that Adam encourages Richard to stay on
the ship; it doesn’t specify where Adam plans to spend the night. Choice C is incorrect because the text doesn’t describe why Adam and his
great-uncle Richard are excited about their journey. While the text mentions that Adam is willing to “start at any hour and go anywhere,” it
provides no details about any planned journey, its destination, or even whether they will be continuing by ship or some other mode of
transportation, nor does the text mention anything about either character’s feelings of excitement about their plans. We learn only that Adam is
accommodating about potential travel plans, not that either character is particularly eager about the journey itself. The text’s main focus is on
Adam and Richard’s developing relationship, not on any anticipated travel experiences. Choice D is incorrect because the text doesn’t show a
contrast between initial wariness and later affection. On the contrary, the text begins by stating that the meeting between Adam and his great-
uncle Richard has begun in an “auspicious,” or promising, manner and is “proceed[ing] well,” suggesting that Richard’s impression is positive from
the outset. There’s no indication of any initial suspicion, caution, or reserve on Richard’s part that later changes to affection. Instead, the text
describes a consistently positive interaction that deepens from a good first impression into a stronger, more familiar relationship because of
Adam’s considerate behavior.$qb$);
select seed_pool_question($qb$CB-d4e8662d$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The percentage of US forest land that a 2023 federal report identified as being either mature or old growth exceeds other recent estimates. Given
how little ______ there is among scientists regarding the scope of these categories, this discrepancy shouldn’t be surprising: forest researchers
regularly dispute one another’s classifications.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "deliberation"}, {"label": "B", "body": "vigilance"}, {"label": "C", "body": "interest"}, {"label": "D", "body": "consensus"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of US forest land classifications. In this context,
"consensus" means agreement. The text indicates that a percentage given in a US forest land report differs from other estimates and that this
discrepancy isn’t surprising, given that forest researchers regularly dispute one another’s classifications of parts of US forest land as either
mature or old growth. This context conveys that there is little agreement when it comes to these categories.
Choice A is incorrect because the text states that there is often dispute among forest researchers about classifications of US forest land as
either mature or old growth, which directly indicates that when it comes to these categories, there is much "deliberation," or discussion and
consideration, not little deliberation. Choice B is incorrect because the text indicates that there is often dispute among forest researchers about
classifications of US forest land as either mature or old growth; this doesn’t imply that there is little "vigilance," or careful attention, among
researchers when it comes to these categories but rather conveys that researchers do pay attention to forest land classifications and question
one another’s decisions. Choice C is incorrect because the text indicates that there is often dispute among forest researchers about
classifications of US forest land as either mature or old growth; this doesn’t imply that there is little "interest," or concern, among researchers
when it comes to these categories but rather conveys that researchers are concerned with forest land classifications and pay attention to one
another’s classifications.$qb$);
select seed_pool_question($qb$CB-8a47383f$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The National Heritage Fellowship was created to publicly ______ exceptional folk and traditional artists in the United States. In 2015, the
fellowship was given to the circus aerialist (mid-air acrobat) Dolly Jacobs to celebrate her lifetime contributions to the arts.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "startle"}, {"label": "B", "body": "recognize"}, {"label": "C", "body": "familiarize"}, {"label": "D", "body": "convey"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the purpose of the National Heritage Fellowship. In this
context, "recognize" means acknowledge or honor someone officially for their achievements. The text states that the fellowship was created for
"exceptional folk and traditional artists." It then provides an example of one recipient of the fellowship, circus aerialist Dolly Jacobs, who was
given the fellowship "to celebrate her lifetime contributions to the arts." The fact that the fellowship is given to celebrate exceptional artists for
their achievements therefore suggests that its purpose is to publicly honor, or recognize, them.
Choice A is incorrect because "startle" would mean alarm or surprise, and there’s nothing in the text to suggest that Jacobs and other artists who
received the National Heritage Fellowship didn’t expect to receive it or were alarmed by it. It therefore wouldn’t make sense to say the fellowship
was created to publicly alarm or surprise exceptional artists. Choice C is incorrect because in this context, "familiarize" would mean make known
or familiar, but the text gives no indication that Jacobs or other recipients of the National Heritage Fellowship were unknown or unfamiliar before
receiving the fellowship or that the fellowship was intended to make them familiar to the public. In fact, the text describes recipients as
"exceptional" and notes that Jacobs received the award "to celebrate her lifetime contributions to the arts," both of which suggest that Jacobs
and other recipients were already well known in the arts world. Choice D is incorrect because "convey" would mean either transport or
communicate something, neither of which would be logical in this context. The fellowship doesn’t transport artists, and though the process of
awarding the fellowship might communicate something about the artists to the general public, it would be illogical to state that the fellowship
communicates the artists themselves. Rather, the fellowship honors artists for their contributions.$qb$);
select seed_pool_question($qb$CB-f99847ed$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For her 2021 art installation Anthem, Wu Tsang joined forces with singer and composer Beverly Glenn-Copeland to produce a piece that critics
found truly ______: they praised Tsang for creatively transforming a museum rotunda into a dynamic exhibit by projecting filmed images of Glenn-
Copeland onto a massive 84-foot curtain and filling the space with the sounds of his and other voices singing.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "restrained"}, {"label": "B", "body": "inventive"}, {"label": "C", "body": "inexplicable"}, {"label": "D", "body": "mystifying"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the art installation Anthem. In this context, “inventive”
means characterized by invention and creativity. The text explains that critics’ responses to the installation involved praise for Tsang’s creative
transformation of a space into a dynamic exhibit with huge images and lots of sound. This context conveys that the critics found the piece
particularly creative.
Choice A is incorrect because the text indicates that critics praised the installation for being dynamic and including huge images and lots of
sound, and it wouldn’t make sense to describe such an exhibit as “restrained,” or limited and not extravagant or showy. Choice C is incorrect
because it wouldn’t make sense to say that critics found the installation “inexplicable,” or incapable of being explained or interpreted, since the
critics were able to explain their praise for the installation’s transformation of a space with huge images and lots of sound. Choice D is incorrect
because the text focuses on the idea that critics praised Tsang for creatively transforming a space into a dynamic exhibit, not that they found the
installation “mystifying,” or bewildering and hard to understand. Nothing in the text suggests that the critics couldn’t understand the piece.$qb$);
select seed_pool_question($qb$CB-bcd924a5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The unique subak water management system used to irrigate the rice paddy fields of the Indonesian island of Bali has a rich cultural,
philosophical, and historical significance dating back to the ninth century. The many elements of subak—terraces, canals, and water temples—
are ______: they are joined together into a single cohesive unit.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "outmoded"}, {"label": "B", "body": "informal"}, {"label": "C", "body": "interconnected"}, {"label": "D", "body": "optional"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of Bali’s subak water management system. In this context,
“interconnected” would mean joined or linked together. The text describes the various components of the subak system—“terraces, canals, and
water temples”—and then states that they are “joined together into a single cohesive unit.” This context indicates that these elements are
connected with one another in an integrated system.
Choice A is incorrect because “outmoded” would mean outdated or no longer in use. While the text does indicate that the subak system has “rich
cultural, philosophical, and historical significance,” the text doesn’t suggest that the subak system is obsolete or not currently used. Choice B is
incorrect because “informal” would suggest that the subak system lacks structure or organization. The text contradicts this by describing a
complex system with specific components (“terraces, canals, and water temples”) that are “joined together into a single cohesive unit,” indicating
formal organization rather than informality. Choice D is incorrect because “optional” would suggest that the various elements of the subak
system are not necessary or required. The text indicates the opposite by stating that these elements are “joined together into a single cohesive
unit,” suggesting that each component plays a necessary role in the functioning of the integrated system.$qb$);
select seed_pool_question($qb$CB-83fd3cf4$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Despite stated claims of global relevance, much major research on income inequality performed in the 2010s suffered from a myopic focus on a
few countries in North America and Western Europe, partly due to limited data availability. Researchers would later ______ this shortcoming after
gaining new access to banking records located in nations in Africa, such as Tunisia, and Eastern Europe, such as Hungary.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "presuppose"}, {"label": "B", "body": "categorize"}, {"label": "C", "body": "mitigate"}, {"label": "D", "body": "validate"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of research on income inequality in the 2010s. In this
context, "mitigate" means to make less severe or reduce the negative effects of something. The text first identifies a shortcoming in the
research: a "myopic focus on a few countries" despite claims of "global relevance." The text then explains that researchers later gained access to
new data from previously excluded regions (Africa and Eastern Europe). This context supports the idea that with these new data, researchers
would be able to reduce, or mitigate, the identified shortcoming by incorporating a broader range of geographic regions into their studies of
income inequality.
Choice A is incorrect because in this context, "presuppose" would mean to assume in advance that something is true, and it wouldn’t make
logical sense to say that researchers later assumed as true in advance a shortcoming they had already encountered. Choice B is incorrect
because in this context, "categorize" would mean to classify or place into groups. The text indicates that researchers did something about the
shortcoming that characterized research on income inequality in the 2010s—limited geographic scope—after they gained access to new data
from previously excluded regions. Categorizing a shortcoming doesn’t require access to or analysis of new data; it could be done without any
new information, but by analyzing new data, researchers went beyond merely categorizing the shortcoming and instead took action to address it.
Choice D is incorrect because in this context, "validate" would mean to confirm or substantiate something. The text indicates that researchers
did something about a known shortcoming of research on income inequality in the 2010s—limited geographic scope—after they gained access
to new data from previously excluded regions. Confirming an already known shortcoming doesn’t require access to or analysis of new data; it
could be done without any new information, but by analyzing new data, researchers went beyond merely validating the shortcoming and instead
took action to make the shortcoming less severe.$qb$);
select seed_pool_question($qb$CB-5e101c70$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Most animals can regenerate some parts of their bodies, such as skin. But when a three-banded panther worm is cut into three pieces, each
piece grows into a new worm. Researchers are investigating this feat partly to learn more about humans’ comparatively limited abilities to
regenerate, and they’re making exciting progress. An especially promising discovery is that both humans and panther worms have a gene for
early growth response (EGR) linked to regeneration.
Text 2
When Mansi Srivastava and her team reported that panther worms, like humans, possess a gene for EGR, it caused excitement. However, as the
team pointed out, the gene likely functions very differently in humans than it does in panther worms. Srivastava has likened EGR to a switch that
activates other genes involved in regeneration in panther worms, but how this switch operates in humans remains unclear.
Based on the texts, what would the author of Text 2 most likely say about Text 1’s characterization of the discovery involving EGR?$qb$, null, $qb$[{"label": "A", "body": "It is reasonable given that Srivastava and her team have identified how EGR functions in both humans and panther worms."}, {"label": "B", "body": "It is overly optimistic given additional observations from Srivastava and her team."}, {"label": "C", "body": "It is unexpected given that Srivastava and her team’s findings were generally met with enthusiasm."}, {"label": "D", "body": "It is unfairly dismissive given the progress that Srivastava and her team have reported."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it reflects how the author of Text 2 would most likely respond to Text 1 based on the information provided.
Text 1 discusses the discovery of a regeneration-linked gene, EGR, in both three-banded panther worms (which are capable of full regeneration)
and humans (who have relatively limited regeneration abilities). Text 1 characterizes this discovery as “especially promising” and a sign of
“exciting progress” in understanding human regeneration. The author of Text 2, on the other hand, focuses on the fact that the team that reported
the EGR finding pointed out that while EGR’s function in humans isn’t yet known, it’s likely very different from its function in panther worms.
Therefore, the author of Text 2 would most likely say that Text 1’s enthusiasm about the EGR discovery is overly optimistic given Srivastava’s
team’s observations about EGR in humans.
Choice A is incorrect because the author of Text 2 explains that Srivastava and her team explicitly reported that they haven’t yet identified how
EGR functions in humans; therefore, the author of Text 2 wouldn’t say that Text 1’s excitement is reasonable for the stated reason. Instead, the
author of Text 2 would likely characterize Text 1’s excitement as premature and overly optimistic. Choice C is incorrect because Text 1 does treat
Srivastava’s team’s findings with enthusiasm; it describes the discovery of EGR in both three-banded panther worms and humans as promising
and exciting. It would be illogical for the author of Text 2 to say that because most others treat the discovery with enthusiasm, Text 1’s
enthusiastic characterization of the discovery is unexpected. Choice D is incorrect because Text 1 isn’t at all dismissive of Srivastava’s team’s
findings; instead, Text 1 is optimistic about the EGR discovery, characterizing it as promising and exciting. There’s nothing in Text 2 to suggest
that the author of Text 2 would say that Text 1’s praise for the discovery is dismissive, or disdainful.$qb$);
select seed_pool_question($qb$CB-df45f0eb$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Several studies have found negligible electoral consequences for governments that impose fiscal austerity measures, yet some European-
governments recently suffered electorally due to their austerity programs. Evelyne Huebscher and colleagues attribute this incongruity to-
governments’ tendency—not followed in the recent European cases—to implement austerity programs strategically to avoid electoral costs (e.g.,
setting spending cuts to take effect only after the next election), which has obscured the inherent political risks of austerity measures in the
election data scholars have examined.
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It explains a discrepancy between what has been observed in study settings and what has been observed in real-world settings that the text goes on to assert is attributable to the studies not using real-world data."}, {"label": "B", "body": "It identifies a conflict between research findings and recent events that the text goes on to suggest is a consequence of a complicating factor in the data used to generate those findings."}, {"label": "C", "body": "It presents a long-standing divergence in research findings that the text goes on to say is due to different groups of researchers using data that derive from different electoral circumstances."}, {"label": "D", "body": "It describes a recent exception to a general pattern in research findings that the text goes on to explain is a result of researchers underestimating the significance of inconsistencies in the data they’ve analyzed."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it best describes how the underlined sentence functions in the text as a whole. The underlined sentence
explains that contrary to what several studies would suggest, recent European governments suffered electorally after the launch of fiscal
austerity programs. The text goes on to indicate that the researchers generated their findings from data that didn’t reveal the true political risk of
austerity measures because the data were based on cases in which governments had set austerity programs to take effect after the next
election, a practice the European governments that recently suffered electorally didn’t adhere to, thus introducing a complicating factor resulting
in a conflict between the research findings and recent events.
Choice A is incorrect because the underlined sentence doesn’t indicate that the discrepancy described in the text is between observations made
in study settings and observations made in real-world settings. Rather, the underlined sentence indicates that the outcome of recent events is
contrary to what would be expected based on the findings of several studies. Additionally, there is nothing in the text to suggest that the studies
mentioned did not use real-world data; instead, the text indicates that the data used was generated under potentially different circumstances
than the recent events. Choice C is incorrect because the underlined sentence doesn’t present a long-standing divergence in research findings
but rather a discrepancy between past research findings and recent events that the text goes on to attribute to researchers’ use of data that
didn’t reveal the true political risk of austerity measures. Choice D is incorrect because while the underlined sentence notes that there have been
some recent exceptions to a general pattern observed in several research studies, it does not go on to attribute this exception to the researchers
underestimating inconsistencies in the data. Rather, the text goes on to attribute this to a circumstance (fiscal austerity measures being
implemented before an election rather than after) which adds a complicating factor into the data not accounted for in past studies.$qb$);
select seed_pool_question($qb$CB-2d77660e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the late 1800s, Spanish-language newspapers flourished in cities across Texas. San Antonio alone produced eleven newspapers in Spanish
between 1890 and 1900. But El Paso surpassed all other cities in the state. This city produced twenty-two newspapers in Spanish during that
period. El Paso is located on the border with Mexico and has always had a large population of Spanish speakers. Thus, it is unsurprising that this
city became such a rich site for Spanish-language journalism.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To compare Spanish-language newspapers published in Texas today with ones published there during the late 1800s"}, {"label": "B", "body": "To explain that Spanish-language newspapers thrived in Texas and especially in El Paso during the late 1800s"}, {"label": "C", "body": "To argue that Spanish-language newspapers published in El Paso influenced the ones published in San Antonio during the late 1800s"}, {"label": "D", "body": "To explain why Spanish-language newspapers published in Texas were so popular in Mexico during the late 1800s"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes the main purpose of the text. The text begins by stating that there were many
Spanish-language newspapers in cities across Texas in the late 1800s, citing San Antonio as a city that produced eleven such newspapers. The
text then goes on to note that in El Paso, there were twenty-two newspapers published in Spanish in the late 1800s, more than any other Texas
city. The text then concludes by explaining that the reason for this large number of Spanish-language newspapers was likely El Paso’s location
near Mexico and its large population of Spanish speakers. Therefore, the main purpose of the text is to explain that Spanish-language
newspapers thrived in Texas cities, especially in El Paso, in the late 1800s.
Choice A is incorrect because the text doesn’t discuss Spanish-language newspapers published in Texas today, let alone compare them with
newspapers that were published in the 1800s. Choice C is incorrect. Although the text characterizes El Paso as a particularly rich site for
Spanish-language journalism in the late 1800s, the text doesn’t discuss whether newspapers published in El Paso influenced the newspapers
published in other cities across Texas, including San Antonio. Choice D is incorrect because the text doesn’t mention whether Spanish-language
newspapers published in Texas were also widely read in Mexico. The text only focuses on the popularity of Spanish-language newspapers within
Texas, and especially in El Paso.$qb$);
select seed_pool_question($qb$CB-12d81fc1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Because literacy in Nahuatl script, the writing system of the Aztec Empire, was lost after Spain invaded central Mexico in the 1500s, it is unclear
exactly how meaning was encoded in the script’s symbols. Although many scholars had assumed that the symbols signified entire words,
linguist Alfonso Lacadena theorized in 2008 that they signified units of language smaller than words: individual syllables.
Text 2
The growing consensus among scholars of Nahuatl script is that many of its symbols could signify either words or syllables, depending on
syntax and content at any given site within a text. For example, the symbol signifying the word huipil (blouse) in some contexts could signify the
syllable “pil” in others, as in the place name “Chipiltepec.” Thus, for the Aztecs, reading required a determination of how such symbols functioned
each time they appeared in a text.
Based on the texts, how would the author of Text 2 most likely characterize Lacadena’s theory, as described in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By praising the theory for recognizing that the script’s symbols could represent entire words"}, {"label": "B", "body": "By arguing that the theory is overly influenced by the work of earlier scholars"}, {"label": "C", "body": "By approving of the theory’s emphasis on how the script changed over time"}, {"label": "D", "body": "By cautioning that the theory overlooks certain important aspects of how the script functioned"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. Lacadena’s theory is that Nahuatl script symbols signified syllables, but the consensus described in Text 2 is that
they can signify either symbols or full words, depending on the context. So the author of Text 2 would likely consider Lacadena’s theory too
simplistic: it’s missing the importance of the context in determining the meaning of a symbol.
Choice A is incorrect. This conflicts with Text 1’s description of Lacadena’s theory. Lacadena’s theory is that Nahuatl script symbols signified
syllables. Choice B is incorrect. This conflicts with Text 1’s description of Lacadena’s theory. Text 1 states that Lacadena’s theory differed from
what earlier scholars believed. Choice C is incorrect. We can’t infer that this is how the author of Text 2 would characterize Lacadena’s theory.
Neither text mentions how or even if the script changed over time.$qb$);
select seed_pool_question($qb$CB-af43b0bd$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Researchers have long hypothesized that woolly mammoths were hunted to extinction in North America by humans using spears with grooved
tips known as Clovis points. One anthropologist set out to test this hypothesis. Using a mechanical spear-thrower, he launched spears with
Clovis points into mounds of clay—substitutes for the animals’ large bodies. The projectiles generally penetrated only a few inches into the clay,
an amount insufficient to have harmed most woolly mammoths. This led the anthropologist to conclude that hunters using spears with Clovis
points likely weren’t the principal drivers of the extinction.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To argue for the significance of new findings amid an ongoing debate among researchers"}, {"label": "B", "body": "To discuss the advantages and disadvantages of the method used in an experiment"}, {"label": "C", "body": "To summarize two competing hypotheses and a major finding associated with each one"}, {"label": "D", "body": "To describe an experiment whose results cast doubt on an established hypothesis"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately states the main purpose of the text, which is to describe an experiment whose results
cast doubt on an established hypothesis. The text begins by noting that researchers have long believed that woolly mammoths were hunted to
extinction in North America by humans using spears with Clovis points. The text then describes an experiment conducted by an anthropologist
to test this hypothesis. According to the text, the results of the experiment led the anthropologist to conclude that hunters using spears with
Clovis points likely weren’t the primary cause of the extinction. The anthropologist’s results cast doubt on the long-held hypothesis presented at
the beginning of the text and suggest that woolly mammoths may have become extinct in North America due to some other cause.
Choice A is incorrect because there’s nothing in the text to suggest that researchers have been involved in an ongoing debate. On the contrary,
the text suggests that most researchers agree on the cause of the woolly mammoth’s extinction in North America. Choice B is incorrect because
the text never mentions any advantages or disadvantages of the method used in the experiment, focusing instead on the results achieved using
that method. Choice C is incorrect because the text addresses only one hypothesis, that mammoths were hunted to extinction in North America
by humans using spears with Clovis points. Rather than present a competing hypothesis, the text explains how one anthropologist designed an
experiment to test this long-held hypothesis.$qb$);
select seed_pool_question($qb$CB-be069e38$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In Habitat Threshold, Chamoru (Chamorro) poet Craig Santos Perez practices what he calls “recycling,” in which he preserves the syntactical and
rhetorical structures of canonical poems but replaces their content to evoke current environmental issues. The form of these poems is thus
______ to their meaning, inviting readers to consider how climate change alters ostensibly familiar experiences.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "antithetical"}, {"label": "B", "body": "resigned"}, {"label": "C", "body": "invulnerable"}, {"label": "D", "body": "integral"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of Craig Santos Perez’s poetic practice in Habitat
Threshold. In this context, “integral” means essential or fundamentally connected. The text describes Perez’s “recycling” technique, in which he
retains the syntactical and rhetorical structures (i.e., formal elements) of canonical poems but alters their content to address current
environmental issues. The text further indicates that this technique invites readers to recognize how climate change has transformed seemingly
familiar experiences—an effect that depends on the contrast between a poem’s recognizable inherited form and its new content. Because
meaning derives from the particular way in which form and content interact in Perez’s poems, the context supports the idea that the form of
these poems is integral to their meaning—in other words, form is fundamentally bound up with what the poems convey.
Choice A is incorrect because it wouldn’t make sense in context to say that the form of Perez’s poems is “antithetical,” or directly opposed, to
their meaning. The text indicates that the inherited form and the new content work together to produce the poems’ effect, so the form is
essential, not opposed, to the poems’ meaning. Choice B is incorrect because it wouldn’t make sense in context to say that the form of Perez’s
poems is “resigned,” or passively accepting. “Resigned” describes an attitude held by a person, not a relationship between a poem’s form and its
meaning. Moreover, the poems’ form actively contributes to their meaning; it would contradict the text to suggest that the poems’ form merely
serves as a passive vehicle for meaning. Choice C is incorrect because it wouldn’t make sense in context to say that the form of Perez’s poems
is “invulnerable,” or incapable of being harmed. The text doesn’t characterize the poems’ meanings as threats to their form; instead, it discusses
how form and meaning relate.$qb$);
select seed_pool_question($qb$CB-5127fc1e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The north celestial pole (NCP)—the fixed point around which stars in the Northern Hemisphere (including the Sun) appear to rotate—is
discernible only at night. Inspired by the navigational strategies of some insects and birds, researchers devised a method for locating the NCP in
daytime using skylight polarization, which occurs as atmospheric particles scatter sunlight. A polarimetric camera captures images of
polarization patterns, which rotate as the Sun’s position in the sky changes; temporal variances across images can then be used to determine an
observer’s latitude and bearing relative to the NCP.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It illustrates how most navigational tools utilize the NCP, recounts how researchers discovered that certain animals are able to navigate without using the NCP, and then proposes that this discovery could be used to avoid problems in navigation associated with reliance on the NCP."}, {"label": "B", "body": "It presents a celestial-based method of navigation, enumerates the comparative benefits of an alternative method used by certain animals that is based on an unrelated natural occurrence, and then indicates how researchers assessed the relative accuracy of the two methods."}, {"label": "C", "body": "It explains how the NCP is typically located, emphasizes a key difference between how humans and certain animals use the NCP for navigation, and then suggests an alternative way of using the NCP to improve existing navigational instruments."}, {"label": "D", "body": "It notes an obstacle to observing an astronomical phenomenon, mentions a navigational ability of certain animals that inspired a solution to that obstacle, and then explains how researchers used an optical device to mimic that ability."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it accurately describes the overall structure of the text. The text begins by pointing out an obstacle to
observing the astronomical phenomenon of the NCP: the NCP is visible only at night. The text then indicates that, inspired by the ability of some
insects and birds to navigate using visualizations of polarized sunlight, researchers devised a way to locate the NCP during daylight. The text
then indicates that the researchers mimicked the insects’ and birds’ polarized-light visualization capabilities using a polarimetric camera. Thus,
the text notes an obstacle to observing an astronomical phenomenon, mentions a navigational ability of certain animals that inspired a solution
to that obstacle, and then explains how researchers used an optical device to mimic that ability.
Choice A is incorrect. Although it’s reasonable to conjecture that humans have used the NCP for navigation, the text doesn’t indicate this is the
case, let alone that the NCP is relevant to a majority of navigational tools. Furthermore, the text doesn’t state that researchers discovered that
insects and birds navigate without the NCP; rather, it indicates that it’s known that some animals navigate by using skylight polarization to locate
the NCP during the day and that this knowledge inspired the method the researchers devised. Choice B is incorrect. Although it’s reasonable to
conjecture that humans have used the NCP for navigation, the text doesn’t state that this is the case. Furthermore, the text discusses how some
animals’ use of navigational strategies based on the same celestial occurrence served as the inspiration for the researchers’ polarized-light
approach, not as the basis for a comparison of the relative effectiveness of animal and human methods of navigation. Choice C is incorrect.
Although the text implies that humans have typically been able to locate the NCP visually at night and indicates that some animals use the NCP
to navigate, the text doesn’t state that humans use the NCP for navigation. The text therefore doesn’t emphasize a difference between how
humans and animals use the NCP for this purpose. Furthermore, the text doesn’t suggest that existing navigational instruments will be
augmented with polarimetric technologies.$qb$);
select seed_pool_question($qb$CB-6ae393f7$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Asteroid 6478 Gault has experienced intermittent mass loss since at least 2013, but in contrast to some other asteroids with repeated mass-loss
episodes, 6478 Gault has not lost mass at its perihelion (the closest point of its orbit to the Sun), and thus the loss is not attributable to solar
energy–driven ice vaporization. And as Jane X. Luu et al. point out, the singular nature of impact ejection makes it untenable as an account of
multiple loss episodes of similar duration over several years. Instead, Luu et al. are likely correct that 6478 Gault is shedding mass due to
rotational instability.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It presents a scientific observation, describes a contrast between that observation and other observations, and then explains why those other observations should not be considered credible."}, {"label": "B", "body": "It describes an astronomical finding, discusses competing theories about that finding that the author regards as flawed, and then describes new evidence that supports an alternative theory."}, {"label": "C", "body": "It introduces a natural phenomenon, refutes two potential explanations for that phenomenon, and then presents a third explanation for that phenomenon that the author regards as plausible."}, {"label": "D", "body": "It discusses a physical process, evaluates possible causes of that process, and then states that a persuasive account of the process has yet to be put forward."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most accurately describes the overall structure of the text. The text begins by introducing the natural
phenomenon of intermittent mass loss with regard to Asteroid 6478 Gault and notes that it curiously has not lost mass at its perihelion like other
asteroids typically do. The text then refutes "solar energy–driven ice vaporization" and "the singular nature of impact ejection" as two possible
explanations for Asteroid 6478 Gault’s intermittent mass loss. Finally, the text presents Luu et al.’s explanation that "6478 Gault is shedding mass
due to rotational instability," which the author says is "likely correct." Thus, the overall structure of the text is that it introduces a natural
phenomenon, refutes two potential explanations for that phenomenon, and then presents a third explanation for that phenomenon that the
author regards as plausible.
Choice A is incorrect because the text doesn’t distinguish between multiple observations. It focuses on the single observation that Asteroid 6478
Gault is losing mass and evaluates multiple explanations for the phenomenon. The text also asserts that Luu et al.’s explanation is credible and
"likely correct." Choice B is incorrect because the text describes a natural phenomenon, not a specific astronomical finding. In addition, although
the text does note flawed reasons for Asteroid 6478 Gault’s intermittent mass loss, it doesn’t mention that Asteroid 6478 Gault’s intermittent
mass loss is based on new evidence. Choice D is incorrect. Although the text does evaluate explanations for the cause of Asteroid 6478 Gault’s
intermittent mass loss, the text also asserts that Luu et al.’s explanation that they have put forth is persuasive and "likely correct."$qb$);
select seed_pool_question($qb$CB-16f2d678$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Although the government of the Soviet Union attempted to ______ Georgi Vladimov’s novel Faithful Ruslan, copies of the book circulated in secret
among readers in several parts of the country.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "replicate"}, {"label": "B", "body": "critique"}, {"label": "C", "body": "import"}, {"label": "D", "body": "suppress"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of Georgi Vladimov’s novel Faithful Ruslan. In this context,
“suppress” means to prevent something, such as a book, from being accessed by the public. The text indicates that the novel was circulated
secretly within the Soviet Union, a stratagem that was necessary because of the government’s efforts to suppress the book, or prevent it from
being circulated and read.
Choice A is incorrect because in this context, “replicate” would mean to copy or reproduce a book, and this meaning wouldn’t make sense in the
text’s discussion of Faithful Ruslan. If the Soviet government had attempted to replicate Vladimov’s novel, there would be no reason for copies to
circulate “in secret,” since the government would be actively making more copies available, not restricting access. Choice B is incorrect. Although
a repressive government might well “critique” a novel, or evaluate it negatively, simply critiquing one wouldn’t necessarily lead to copies of it
circulating “in secret.” Instead, the text suggests that the Soviet government took decisive action against Faithful Ruslan that necessitated its
underground circulation and did not merely offer criticism of the novel. Choice C is incorrect because “import” means to bring a product, such as
a book, into a country from elsewhere. However, the text suggests that copies of Faithful Ruslan were already present in the Soviet Union and that
the government was trying to restrict their circulation rather than increasing access to the novel by importing copies from another country.$qb$);
select seed_pool_question($qb$CB-e4f312c5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While most animals are incapable of passing somatic mutations—genetic alterations that arise in an organism’s nonreproductive cells—on to
their offspring, elkhorn coral (Acropora palmata) presents an intriguing ______: in a 2022 study, researchers found that elkhorn coral produced
offspring that inherited somatic mutations from a parent.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "hypothesis"}, {"label": "B", "body": "affinity"}, {"label": "C", "body": "anomaly"}, {"label": "D", "body": "corroboration"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. An "anomaly" is something that deviates from norms or expectations. In this case, the elkhorn coral is an anomaly
because it can pass on somatic mutations, whereas most other animals can’t.
Choice A is incorrect. A "hypothesis" is "a theory about something," but no theories are provided about elkhorn coral in this text, just facts. Choice
B is incorrect. "Affinity" represents "an inclination or liking toward something." As genetic mutations tend to occur without any conscious effort,
you can’t really have an inclination toward passing on somatic mutations. Choice D is incorrect. "Corroboration" means "evidence to support or
prove something." Because elkhorn coral do the opposite of what most animals do, they do not provide corroboration of the theory that somatic
mutations can’t be passed onto offspring. Rather, they show the opposite.$qb$);
select seed_pool_question($qb$CB-a4f50d30$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Scientists previously thought that all electric eels belong to a single species, but a team of researchers led by zoologist C. David de Santana
proved this idea wrong by ______ that there are in fact three distinct species of electric eels.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "pretending"}, {"label": "B", "body": "complaining"}, {"label": "C", "body": "requiring"}, {"label": "D", "body": "demonstrating"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Demonstrating” means “showing,” and the text describes how de Santana disproved a previous belief in only one
species of electric eel by showing that three electric eel species actually exist.
Choice A is incorrect. Pretending that there are three species of electric eel might be a fun game for marine biologists, but it wouldn’t prove the
existence of more than one species. Choice B is incorrect. Complaining won’t prove anything about eels, so de Santana could not have proved
wrong the idea of only one species of electric eel by complaining about it. Choice C is incorrect. “Requiring” means “needing.” It wouldn’t make
sense to say that de Santana “needed” there to be three distinct species of electric eel.$qb$);
select seed_pool_question($qb$CB-fa7a89f1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Studying how workload affects productivity, Maryam Kouchaki and colleagues found that people who chose to do relatively easy tasks first were
less ______ compared to those who did hard tasks first. Finishing easy tasks gave participants a sense of accomplishment, but those who
tackled hard tasks first actually became more skilled and productive workers over time.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "secretive"}, {"label": "B", "body": "efficient"}, {"label": "C", "body": "outgoing"}, {"label": "D", "body": "unsympathetic"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion about Kouchaki and colleagues’ research into how
workload affects productivity. In context, “efficient” means effective or well organized. The text indicates that, according to Kouchaki and
colleagues’ research, people who worked on hard tasks first were “more skilled and productive” than those who did easy tasks first. This context
conveys the idea that despite their sense of accomplishment, the people who chose to do the easy tasks first were less efficient or productive
than those who tackled hard tasks first.
Choice A is incorrect because there’s nothing in the text to suggest that workers who do easy tasks first are less “secretive,” or uncommunicative
or silent, than those who do hard tasks first. Rather, the text suggests that people are less skillful or efficient if they tackle easy tasks before the
hard ones. Choice C is incorrect because “outgoing” means openly friendly, which wouldn’t make sense in this context. The text focuses on
Kouchaki and colleagues’ research in which people who worked on hard tasks first were “more skilled and productive” than those who did easy
tasks first and were therefore less efficient. Choice D is incorrect because there’s nothing in the text to suggest that workers who do easy tasks
first are less “unsympathetic,” or insensitive or unkind, than those who do hard tasks first. Rather, the text suggests that people are less skillful or
efficient if they tackle easy tasks before the hard ones.$qb$);
select seed_pool_question($qb$CB-e37b9e34$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Some researchers believe that the genes that enable groundhogs and certain other mammals to hibernate through the winter by slowing their
breathing and heart rates and lowering their body temperature may be ______ in humans: present yet having essentially no effect on our bodily
processes.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "decisive"}, {"label": "B", "body": "lacking"}, {"label": "C", "body": "variable"}, {"label": "D", "body": "dormant"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it logically completes the text’s discussion about genes related to hibernation. In this context, “dormant”
means inactive. The text explains that the same genes that enable certain nonhuman mammal species to hibernate during the winter by altering
their bodily processes are also found in our species but have “essentially no effect” on humans’ bodily processes. In other words, these genes
don’t function in humans.
Choice A is incorrect because in this context, “decisive” means has the power to affect the outcome of something, but the text states that genes
related to hibernation are instead inactive in humans—that is, the genes don’t affect humans’ bodily processes, although they are present in their
bodies. Choice B is incorrect because in this context, “lacking” means missing, but the text states that the genes are present in humans, though
inactive. Choice C is incorrect because “variable” means characterized by the potential to change, but the text indicates that these genes don’t
change in their effect on humans’ bodily processes; instead, the genes are consistently inactive in humans.$qb$);
select seed_pool_question($qb$CB-faa5696c$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Arturo A. Schomburg was dedicated to preserving books, art, and other materials from peoples of African descent around the world. To get these
items, Schomburg ______ friends and colleagues, whom he asked to bring back rare and valuable objects from their international travels. Now,
Schomburg’s collection is a valuable resource for scholars of Black history and culture.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "admired"}, {"label": "B", "body": "disagreed with"}, {"label": "C", "body": "warned"}, {"label": "D", "body": "depended on"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of Arturo A. Schomburg’s collection. In this context, the
phrase “depended on” means relied on. The text explains that Schomburg, wanting to preserve “books, art, and other materials” created by
peoples of African descent from around the world, built a large collection of these objects. The text also states that in order to obtain these
items, Schomburg asked friends and colleagues who were traveling internationally to bring them back for him. This implies that he wouldn’t have
been able to create his collection without help. Thus, the context supports the idea that Schomburg relied on, or depended on, friends and
colleagues to build his collection.
Choice A is incorrect because “admired” means respected and approved of. Although it’s reasonable to expect that Schomburg respected his
friends and colleagues, the text doesn’t discuss any such aspect of their relationships. The text focuses instead on what Schomburg asked his
friends and colleagues to do to help build his collection. Choice B is incorrect because “disagreed with” means held an opposing belief, and
nothing in the text suggests that Schomburg and his friends or colleagues held opposing views on any subject. In fact, the text strongly implies
that Schomburg’s friends and colleagues supported him in his goal of preserving objects of importance for Black history and culture by bringing
him such objects from around the world. Choice C is incorrect because “warned” means informed someone in advance about something
dangerous, which wouldn’t make sense in this context. Nothing in the text suggests that Schomburg thought his friends and colleagues were in
any danger, let alone that he warned them of danger.$qb$);
select seed_pool_question($qb$CB-f0ae0da3$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
When companies in the same industry propose merging with one another, they often claim that the merger will benefit consumers by increasing
efficiency and therefore lowering prices. Economist Ying Fan investigated this notion in the context of the United States newspaper market. She
modeled a hypothetical merger of Minneapolis-area newspapers and found that subscription prices would rise following a merger.
Text 2
Economists Dario Focarelli and Fabio Panetta have argued that research on the effect of mergers on prices has focused excessively on short-
term effects, which tend to be adverse for consumers. Using the case of consumer banking in Italy, they show that over the long term (several
years, in their study), the efficiency gains realized by merged companies do result in economic benefits for consumers.
Based on the texts, how would Focarelli and Panetta (Text 2) most likely respond to Fan’s findings (Text 1)?$qb$, null, $qb$[{"label": "A", "body": "They would recommend that Fan compare the near-term effect of a merger on subscription prices in the Minneapolis area with the effect of a merger in another newspaper market."}, {"label": "B", "body": "They would argue that over the long term the expenses incurred by the merged newspaper company will also increase."}, {"label": "C", "body": "They would encourage Fan to investigate whether the projected effect on subscription prices persists over an extended period."}, {"label": "D", "body": "They would claim that mergers have a different effect on consumer prices in the newspaper industry than in most other industries."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because, based on the information presented in the texts, it represents how Focarelli and Panetta would most likely
respond to Fan’s findings. Text 1 indicates that Fan found that a newspaper merger would result in a rise in subscription prices. This rise wouldn’t
benefit customers, who would have to pay more for news after a merger. Text 2 presents Focarelli and Panetta’s argument that merger research
tends to focus too much on what happens immediately after the merger. Text 2 goes on to describe their finding that mergers can be
economically beneficial for consumers over the long term. This suggests that Focarelli and Panetta would encourage Fan to investigate the long-
term effect of the hypothetical newspaper merger on subscription prices.
Choice A is incorrect because Text 2 doesn’t indicate that Focarelli and Panetta connect the effects of mergers to specific locations. Instead,
Focarelli and Panetta focus on the length of time over which the effects of mergers should be evaluated. Choice B is incorrect because Text 2
indicates that Focarelli and Panetta found that merged companies experience "efficiency gains" over the long term, meaning that their expenses
go down relative to their output, not that their expenses increase. Choice D is incorrect because there’s no indication in Text 2 that Focarelli and
Panetta believe that the newspaper industry is different from any other industry when it comes to the effects of mergers. Although their own
research was about consumer banking, Text 2 suggests that they view their conclusions as applicable to mergers in general.$qb$);
select seed_pool_question($qb$CB-b3e145e4$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the 1950s, scientists didn’t know much about the ocean floor. Many scientists at the time believed that the ocean floor was mostly flat. But-
geologist Marie Tharp and her research partner, Bruce Heezen, proved that this idea was wrong. Using sonar data collected from the Atlantic
Ocean, Tharp and Heezen showed that the floor was filled with canyons, mountains, and valleys.
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It identifies a scientific belief that Tharp and Heezen showed to be wrong."}, {"label": "B", "body": "It describes the design of Tharp and Heezen’s experiment."}, {"label": "C", "body": "It emphasizes a disagreement between Tharp and Heezen."}, {"label": "D", "body": "It presents data to support a claim that Tharp and Heezen made."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes how the underlined sentence functions in the text as a whole. The first
sentence of the text establishes that scientists didn’t know much about the ocean floor in the 1950s. The second sentence, which is underlined,
describes what many scientists thought at the time—that the ocean floor was mostly flat. The remainder of the text establishes that the ocean
floor is far from flat, citing research conducted by Marie Tharp and Bruce Heezen. Thus, the purpose of the underlined sentence is to identify a
scientific belief that Tharp and Heezen showed to be wrong.
Choice B is incorrect. Although Tharp and Heezen’s work with sonar data in the Atlantic Ocean is mentioned later in the text, the underlined
sentence doesn’t describe the design of their experiment. Instead, it identifies a belief held by scientists that Tharp and Heezen demonstrated to
be wrong. Choice C is incorrect because the underlined sentence presents a belief held by many scientists in the 1950s; nowhere does the text
mention a disagreement between Tharp and Heezen, whom the text describes as research partners working together to map the ocean floor.
Choice D is incorrect because the underlined sentence doesn’t present data in support of a claim; instead, it presents a scientific belief that
Tharp and Heezen’s work showed to be wrong.$qb$);
select seed_pool_question($qb$CB-54c6128b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$When ancient oak planks were unearthed during subway construction in Rome, Mauro Bernabei and his team examined the growth rings in the
wood to determine where these planks came from. By comparing the growth rings on the planks to records of similar rings in oaks from Europe,
the team could trace the wood to the Jura region of France, hundreds of kilometers from Rome. Because timber could only have been-
transported from distant Jura to Rome by boat, the team-’s findings suggest the complexity of Roman trade routes.
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It presents a conclusion about Roman trade routes based on the team’s findings."}, {"label": "B", "body": "It questions how the team was able to conclude that the planks were used to build a boat."}, {"label": "C", "body": "It explains why the planks were made from oak rather than a different kind of wood."}, {"label": "D", "body": "It describes common methods used in Roman subway construction."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes how the underlined sentence functions in the text as a whole. The first
sentence explains that Bernabei and his team studied growth rings to obtain information about the ancient oak planks found during a
construction project in Rome. The next sentence presents what the researchers learned: the wood from the planks came from France’s Jura
region, which is far from Rome. The underlined sentence then presents the implications of the findings about the planks: the wood must have
been brought to Rome by boat, a difficult task that suggests Roman trade routes were complex. Thus, the underlined sentence mainly functions
to present a conclusion about Roman trade routes based on the team’s findings.
Choice B is incorrect because the text doesn’t suggest that the team thought the ancient planks were used in the construction of a boat, nor does
the underlined sentence question that conclusion. Instead, the text states that the wood could only have been transported from Jura to Rome in
a boat. Choice C is incorrect because the underlined sentence simply offers a conclusion drawn from the team’s findings about the likely place of
origin of the ancient planks; the text never mentions why oak was chosen for the planks instead of other wood. Choice D is incorrect because
neither the underlined sentence nor the text as a whole addresses any methods that Romans used in constructing subways. Instead, the
underlined sentence offers a conclusion drawn from the team’s findings about the likely place of origin of the ancient wooden planks discovered.$qb$);
select seed_pool_question($qb$CB-2c50ed1a$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
Literary scholars have struggled with the vastness of Nigerian writer Wole Soyinka’s collective works of drama (spanning over 20 plays in total). It
is best, however, to understand Soyinka’s body of work as a dramatist chronologically. Soyinka’s progression as a playwright can be considered
to fall into three periods, with each one representing a particular thematic and stylistic cohesion: the 1960s, the two decades between 1970 and
1990, and lastly, from roughly 1990 onwards.
Text 2
It is tempting to impose a linear sense of order on the expanse of Wole Soyinka’s body of work as a dramatist. However, critics who have
considered Soyinka’s plays to fit neatly into three phases overlook potential commonalities in Soyinka’s work that span across these phases.
Additionally, this view may discount significant differences in the styles and content of plays written around the same time.
Which choice best describes a difference in how the author of Text 1 and the author of Text 2 view the study of Soyinka’s works of drama?$qb$, null, $qb$[{"label": "A", "body": "While the author of Text 1 believes that thinking about Soyinka’s works of theater in phases is useful, the author of Text 2 views such an approach as limiting."}, {"label": "B", "body": "Although the author of Text 1 claims that Soyinka’s style as a dramatist has evolved over time, the author of Text 2 argues that Soyinka’s style has remained consistent throughout his career."}, {"label": "C", "body": "The author of Text 1 considers Soyinka’s plays to showcase his strongest writing, whereas the author of Text 2 believes that Soyinka’s poetry is where he is most skilled."}, {"label": "D", "body": "The author of Text 1 argues that Soyinka’s early plays were his most politically charged, whereas the author of Text 2 claims that Soyinka’s most recent plays are the most politicized."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The author of Text 1 states that Soyinka’s progression as a playwright can be considered to fall into three periods,
implying that this is a helpful way to understand his works. The author of Text 2, on the other hand, challenges this view and says that it
overlooks potential commonalities and differences in Soyinka’s work across what Text 1 calls distinctive stylistic phases.
Choice B is incorrect. This choice overstates the central claim of Text 2. The author of Text 2 argues against the chronological progression
supported in Text 1, but does not go so far as to say that Soyinka’s style remained consistent. In fact, Text 2 points out “significant differences in
styles and content” among Soyinka’s plays. Choice C is incorrect. Neither of the texts mention Soyinka’s poetry, nor do they rank his dramatic
writing relative to his other work. Choice D is incorrect. Neither text discusses the political aspects of Soyinka’s plays, nor do they make any
claims about whether they have changed over time.$qb$);
select seed_pool_question($qb$CB-0ed94d4c$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Jackie Ormes’s Torchy Brown in Dixie to Harlem (1937–38) was the first comic strip by a Black woman to appear in a widely read newspaper. The
strip tells the story of Torchy, a young woman who leaves Mississippi to become a performer in New York City. Torchy’s story reflects the
experience of the Great Migration (1910–1970), when millions of Black Americans left the South in search of opportunities in other parts of the
United States. Torchy Brown thus shows how Ormes used comics to comment humorously on issues affecting Black Americans, which she
continued to do throughout her career.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To show how Ormes’s Torchy Brown inspired other Black women to write comic strips in the 1930s"}, {"label": "B", "body": "To illustrate how the subjects Ormes addressed in her comic strips changed over the course of her career"}, {"label": "C", "body": "To give an example of how Ormes presented the experiences of Black Americans in her comic strips"}, {"label": "D", "body": "To claim that several characters in Torchy Brown were based on people that Ormes knew personally"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The text describes how Torchy Brown depicted the experiences of a young Black woman experiencing America’s
Great Migration. It further states that Ormes continued to use comics throughout her career to humorously comment on important issues
impacting Black Americans.
Choice A is incorrect. The text never mentions other Black women comic strip writers. Choice B is incorrect. The text never mentions any
changes in the subjects Ormes addressed. Choice D is incorrect. The text never mentions the inspiration for characters in Torchy Brown.$qb$);
select seed_pool_question($qb$CB-9ff88d6b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The work of Tobias Gerstenberg et al. on tracking eye movements supports a theory that people envision ______ scenarios when making causal
judgments: when subjects were asked to look at two colliding billiard balls and judge whether one caused or prevented the other’s movement
through a gate, their eyes looked at where the target ball would have gone if the ball that altered its path did not exist.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "ambivalent"}, {"label": "B", "body": "retrospective"}, {"label": "C", "body": "counterfactual"}, {"label": "D", "body": "analogical"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of what people envision when making causal judgments,
or judgments of cause and effect. In this context, “counterfactual” means contrary to fact. The text explains that in an experiment in which
subjects judged whether one billiard ball caused or prevented another billiard ball’s movement through a gate, researchers found that the
subjects looked at where the target ball would have gone if the other ball hadn’t been there at all—that is, the subjects pictured the path the target
ball would have taken in a scenario contrary to the one they actually saw. This would be an example of people envisioning counterfactual
scenarios when considering causes and effects.
Choice A is incorrect because it wouldn’t make sense to describe scenarios people envision when making judgments of cause and effect as
“ambivalent,” or characterized by conflicting feelings. People might have conflicting feelings in response to a scenario, but a scenario itself can’t
have feelings. Choice B is incorrect. In this context, “retrospective” would mean looking back at something that occurred in the past. The text
indicates that when asked to make a judgment about the movement of the target billiard ball, subjects envisioned what would have happened if
only one ball had been present—that is, the text indicates that they envisioned a scenario that hadn’t actually happened, not that they examined
only what had already actually happened. Choice D is incorrect. The text indicates that in an experiment involving the interaction of two billiard
balls, eye movements showed that subjects pictured the path one ball would have taken if the other hadn’t been present. Because the subjects
were picturing a scenario in the same context (the movement of the target billiard ball), just with a different arrangement of details (only one ball
present), this wouldn’t be an example of people envisioning “analogical” scenarios, or hypothetical scenarios that are comparable to the scenario
in question despite having different contexts.$qb$);
select seed_pool_question($qb$CB-d8d33cc5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The early British postal system required the cost of mail delivery to be paid upon receipt, a system which encouraged inventive strategies by the
intended recipient to avoid payment. To improve this system, ______ were proposed in 1837, including the use of a postage stamp, a small receipt
pasted to the mail indicating that delivery costs had been paid by the sender.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "investigations"}, {"label": "B", "body": "expansions"}, {"label": "C", "body": "reforms"}, {"label": "D", "body": "possessions"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of the early British postal system. In this context, "reforms"
most nearly means attempts at improving something. The text indicates that the pay-upon-delivery postage method led to fee avoidance on the
part of recipients. It then says that action was taken to improve the postal system, giving examples such as the move to having the sender pay
and affixing stamps to indicate payment had been received. These represent revisions to the system intended to improve its functioning;
therefore, "reforms" most logically completes the text.
Choice A is incorrect. In this context, "investigations" most nearly means attempts to understand something. And although it is plausible that an
attempt to improve the postal system would involve investigations, nothing in the text provides a logical basis for understanding the example of
changes like affixing stamps to letters as an investigation. Choice B is incorrect. In this context, "expansions" most nearly means additions to
something. Although the text indicates that some new policies were adopted, nothing in the text suggests that the overall number of policies
increased, which expansions would seem to entail. Choice D is incorrect. In this context, "possessions" most nearly means items of personal
property or things that otherwise belong to, or are part of, something. The text provides no logical context for understanding changes like affixing
stamps to letters as possessions.$qb$);
select seed_pool_question($qb$CB-79fe7550$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Researcher Haesung Jung led a 2020 study showing that individual acts of kindness can ______ prosocial behavior across a larger group. Jung
and her team found that bystanders who witness a helpful act become more likely to offer help to someone else, and in doing so, can inspire still
others to act.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "require"}, {"label": "B", "body": "remember"}, {"label": "C", "body": "foster"}, {"label": "D", "body": "discourage"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of Jung and her team’s study of acts of kindness. In this
context, “foster” means encourage or promote the development of. The text indicates that Jung and her team found that seeing a helpful (or
prosocial) act makes a bystander more likely to help someone else, which can in turn inspire additional people to help others. That is, the team
showed that single acts of kindness can foster additional prosocial acts across a group.
Choice A is incorrect because nothing in the text suggests that Jung and her team found that single acts of kindness “require,” or depend on or
make obligatory, broader prosocial (or helpful) behavior across a group. There’s no suggestion in the text that individual acts of kindness can
only occur if other prosocial acts have already occurred, and the text indicates only that an act of kindness can inspire additional helpful acts, not
that it necessarily will do so. Choice B is incorrect because the text focuses on a possible direct effect of individual acts of kindness, or single
helpful actions, and it wouldn’t make sense to suggest that actions can “remember,” or hold a memory of, something. Choice D is incorrect
because the text doesn’t indicate that Jung and her team found that single acts of kindness can “discourage,” or hinder, prosocial (or helpful)
behavior across a group. On the contrary, the text states that Jung and her team found that seeing a helpful act makes a bystander more likely to
help someone else, which can in turn inspire even more people to help others.$qb$);
select seed_pool_question($qb$CB-0a04cac5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The following text is adapted from Jane Austen’s 1814 novel Mansfield Park. The speaker, Tom, is considering staging a play at home with a
group of his friends and family.
We mean nothing but a little amusement among ourselves, just to vary the scene, and exercise our powers in something new. We want no
audience, no publicity. We may be trusted, I think, in choosing some play most perfectly unexceptionable; and I can conceive no greater harm
or danger to any of us in conversing in the elegant written language of some respectable author than in chattering in words of our own.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To offer Tom’s assurance that the play will be inoffensive and involve only a small number of people"}, {"label": "B", "body": "To clarify that the play will not be performed in the manner Tom had originally intended"}, {"label": "C", "body": "To elaborate on the idea that the people around Tom lack the skills to successfully stage a play"}, {"label": "D", "body": "To assert that Tom believes the group performing the play will be able to successfully promote it"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately portrays the main purpose of the text. At the beginning of the text, Tom asserts that he
and the other people staging the play are doing so only for “a little amusement among ourselves” and aren’t interested in attracting an audience
or any attention with the production. Then, Tom promises that the play they chose is modest and appropriate, and he further reasons that using
the well-written prose of “some respectable author” is better than using their own words. Overall, the main purpose of the text is to convey Tom’s
promise that the play will be inoffensive and involve only a few people.
Choice B is incorrect because the text doesn’t indicate that Tom had earlier intentions for the play’s performance or that anything has changed
since the group first decided to stage a play. Instead, the text focuses on how harmless the entire endeavor will be. Choice C is incorrect.
Although Tom mentions that using the words of a “respectable author” will be better than using their own words, he never addresses the idea
that the people around him generally aren’t skilled enough to stage a play. Choice D is incorrect because in the text Tom specifically says that
they “want no audience, no publicity,” which indicates that they don’t plan on promoting the play at all.$qb$);
select seed_pool_question($qb$CB-1fa751f1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Handedness, a preferential use of either the right or left hand, typically is easy to observe in humans. Because this trait is present but less ______
in many other animals, animal-behavior researchers often employ tasks specially designed to reveal individual animals’ preferences for a certain
hand or paw.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "recognizable"}, {"label": "B", "body": "intriguing"}, {"label": "C", "body": "significant"}, {"label": "D", "body": "useful"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion about handedness in animals. As used in this context,
“recognizable” means apparent or identifiable. The text indicates that handedness is “easy to observe in humans,” but that animal-behavior
researchers use special tasks to determine handedness in other animals. This context and the use of “less” before the blank indicate that
compared with handedness in humans, handedness in other animals is less recognizable.
Choice B is incorrect because there’s nothing in the text to suggest that handedness is less “intriguing,” or fascinating, in nonhuman animals than
it is in humans. The text focuses on how easy it is to observe handedness in humans as compared with other animals; the text doesn’t suggest
that handedness is more fascinating in humans. Choice C is incorrect because there’s nothing in the text to suggest that handedness is less
“significant,” or important or meaningful, in nonhuman animals than it is in humans. The text focuses on how easy it is to observe handedness in
humans as compared with other animals; the text doesn’t suggest that handedness is more significant in humans. Choice D is incorrect because
“useful,” or functional or helpful, wouldn’t make sense in context. The text focuses on the ease with which researchers can determine whether an
animal or person is right- or left-handed, not on how useful handedness in nonhuman animals is compared with handedness in humans.$qb$);
select seed_pool_question($qb$CB-1d9a09c0$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Jason Reynolds’s 2016 novel Ghost. The narrator, who is in middle school, is at a bus stop.
I just go there [to the bus stop] to look at the people working out. See, the gym across the street has this big window—like the
whole wall is a window—and they have those machines that make you feel like you walking up steps and so everybody just be
facing the bus stop, looking all crazy like they’re about to pass out. And trust me, there ain’t nothing funnier than that. So I check
that out for a little while like it’s some kind of movie: The About to Pass Out Show, starring stair-stepper person one through ten.
©2016 by Jason Reynolds
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To give a reason why the narrator is excited to start middle school"}, {"label": "B", "body": "To describe an activity that the narrator finds amusing"}, {"label": "C", "body": "To explain a problem that the narrator has overcome"}, {"label": "D", "body": "To discuss a movie that the narrator saw in a theater"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes the main purpose of the text. The text describes how the narrator watches
people working out at a gym through a window near a bus stop. The narrator says that "there ain’t nothing funnier" than watching people try to
work out on the stair climber machine. Thus, the main purpose of the text is to describe an activity that the narrator finds amusing.
Choice A is incorrect because the text isn’t about the narrator beginning middle school. The text describes how the narrator finds people working
out at a gym amusing and makes no mention of school life. Choice C is incorrect because the text doesn’t mention any problems that the
narrator currently has or has overcome. It just describes how the narrator finds watching people work out amusing. Choice D is incorrect
because the narrator invents the made-up movie mentioned in the text. The text doesn’t indicate that the narrator has seen a movie in a theater.
The focus of the text is on the narrator watching people at the gym, not watching a movie.$qb$);
select seed_pool_question($qb$CB-49bbe4d7$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For painter Jacob Lawrence, being ______ was an important part of the artistic process. Because he paid close attention to all the details of his
Harlem neighborhood, Lawrence’s artwork captured nuances in the beauty and vitality of the Black experience during the Harlem Renaissance
and the Great Migration.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "skeptical"}, {"label": "B", "body": "observant"}, {"label": "C", "body": "critical"}, {"label": "D", "body": "confident"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of Jacob Lawrence’s artistic process. In this context,
“observant” means watchful and perceptive. The text emphasizes that the “close attention” Lawrence paid to “all the details” of his neighborhood
allowed him to reflect subtle elements of “the beauty and vitality of the Black experience” in his artwork. This context indicates that being
observant of his surroundings was an important part of Lawrence’s work as an artist.
Choice A is incorrect because the text gives no indication that Lawrence was “skeptical,” or had an attitude of doubt in general or about particular
things, let alone that skepticism was important to him as an artist. Rather than indicating that he was skeptical, the text focuses on how
Lawrence paid careful attention to everything around him and reflected his observations in his artwork. Choice C is incorrect because the text
gives no indication that Lawrence was “critical,” which in this context would mean inclined to criticize harshly or unfairly. Rather than indicating
that Lawrence found fault in things, the text suggests that he paid careful attention to everything around him and that his artwork reflects this
careful attention. Choice D is incorrect because the text doesn’t suggest that Lawrence was “confident,” or self-assured. Rather than addressing
how Lawrence felt about himself and how that feeling affected his artistic process, the text emphasizes the careful attention Lawrence paid to
everything around him—attention that allowed him to capture subtle elements of a particular place and time in his artwork.$qb$);
select seed_pool_question($qb$CB-f6d1f735$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Researchers have struggled to pinpoint specific causes for hiccups, which happen when a person’s diaphragm contracts ______. However,
neuroscientist Kimberley Whitehead has found that these uncontrollable contractions may play an important role in helping infants regulate their
breathing.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "involuntarily"}, {"label": "B", "body": "beneficially"}, {"label": "C", "body": "strenuously"}, {"label": "D", "body": "smoothly"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of diaphragm contractions and hiccups. In this context,
“involuntarily” means done without any control, or by reflex. The text explains that when a person’s diaphragm repeatedly contracts and results in
hiccups (which may be beneficial for infants), those muscle contractions are “uncontrollable.” This context indicates that the diaphragm
contractions occur without the person’s control.
Choice B is incorrect because it wouldn’t support the logical relationship established in the text’s discussion of diaphragm contractions and
hiccups. The text indicates that although specific causes for hiccups haven’t been identified, it may be the case that the muscle contractions that
occur have an important purpose in infants. It wouldn’t make sense to say that even though the contractions occur “beneficially,” or with a good
or helpful effect, they might play a positive role in infants’ breathing regulation. Choice C is incorrect because the text indicates that the
diaphragm contractions that result in hiccups are “uncontrollable.” Because those muscle contractions are described as happening automatically
and without the person’s control, it wouldn’t make sense to describe them as occurring “strenuously,” or in a way that requires great effort or
energy. Choice D is incorrect because the text doesn’t describe the quality of the diaphragm contractions that result in hiccups beyond stating
that they are “uncontrollable.” Nothing in the text indicates that those muscle contractions occur “smoothly,” or evenly and continuously.$qb$);
select seed_pool_question($qb$CB-fcc328c6$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Streams and rivers carry soil and rocks from one location to another. But there is another way for these geological materials to move. Scientists-
call this process -“aeolian transport.” In aeolian transport, winds move small particles of soil or rock over potentially great distances. Geologist
Melisa Diaz and her team studied dust in Antarctica to find out if it was moved by aeolian transport. They discovered that the dust matched
geological material in Australia. Aeolian transport had carried it from one continent to another, across thousands of miles of open ocean.
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It presents Melisa Diaz’s remarks about difficulties that her team encountered."}, {"label": "B", "body": "It introduces a scientific term that is used in the discussion that follows."}, {"label": "C", "body": "It emphasizes the surprising nature of the findings that are presented."}, {"label": "D", "body": "It explains the difference between two kinds of geological material."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes the function of the underlined portion in the text as a whole. The first two
sentences introduce the idea that soil and rocks can be moved from one location to another by something other than rivers and streams. The
underlined sentence then states that the term used by scientists to refer to this process is “aeolian transport.” The discussion that follows
explains what aeolian transport is (the movement of small geological materials over potentially great distances by the wind) and describes an
example of a study that found that dust particles had been moved by aeolian transport from Australia to Antarctica. Thus, the underlined portion
introduces a scientific term that is used in the discussion that follows.
Choice A is incorrect because the underlined portion of the text doesn’t present any remarks from Melisa Diaz, nor does it suggest that Diaz and
her team encountered difficulties in their study. Instead, the phrase in quotation marks in the underlined portion simply presents a term that is
used by scientists to refer to a specific process discussed in the text. Choice C is incorrect because nothing in either the underlined portion or
the text as a whole suggests that the findings of the study presented in the text were surprising or unexpected. In fact, the text suggests that
Diaz and her team wanted to see if aeolian transport could explain the appearance of certain geological materials in Antarctica, and their
findings did indeed confirm the involvement of aeolian transport. Choice D is incorrect. Although the first sentence of the text mentions soil and
rocks, which are two different kinds of geological material, the underlined portion doesn’t refer to these materials, nor does it explain the
difference between them. Rather, the underlined portion introduces the scientific term “aeolian transport,” which is used in the discussion that
follows.$qb$);
select seed_pool_question($qb$CB-01de46bb$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Menominee and Anishinaabe peoples have been growing wild rice—known as manoomin in the Ojibwe language—in the Great Lakes region
of North America for centuries, but climatic changes are causing lakes to get deeper, thereby threatening wild rice. These plants are extremely
______ to water depth during the “floating leaf” stage of development, and if the water is too deep, the buoyancy of the young wild-rice plants can
literally uproot them from the lake bottom, destroying them.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "immune"}, {"label": "B", "body": "sensitive"}, {"label": "C", "body": "limited"}, {"label": "D", "body": "receptive"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of wild rice. As used in this context, "sensitive" means
vulnerable or easily affected. The text indicates that climate change is causing the lakes to get deeper, which consequently threatens the wild
rice that grows in the area. The text goes on to state that deep water can cause young wild-rice plants to uproot from the bottom of the lake. This
context supports the idea that the plants are sensitive to water depth during early stages of development.
Choice A is incorrect because "immune" means protected or shielded, which wouldn’t make sense in this context. The text explains that deep
water can cause young wild-rice plants to become uprooted and destroyed, indicating that these plants are harmed by deep water, not protected
from it. Choice C is incorrect because "limited" means confined or restrained, which wouldn’t make sense in this context. The text explains that
water depth can negatively affect young wild-rice plants but doesn’t suggest that water depth limits or restrains the plants. Choice D is incorrect
because "receptive" means open or tolerant, which wouldn’t make sense in this context. The text doesn’t indicate that the wild-rice plants are
open to or tolerant of an increase in water depth but rather the opposite: an increase in water depth can harm young wild-rice plants.$qb$);
select seed_pool_question($qb$CB-aa7ae735$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Mohsin Hamid’s 2017 novel Exit West. Saeed lives with his mother and father.
On cloudless nights after a daytime rain, Saeed’s father would sometimes bring out the telescope, and the family would sip green tea on their
balcony, enjoying a breeze, and take turns to look up at objects whose light, often, had been emitted before any of these three viewers had been
born—light from other centuries, only now reaching Earth.-
©2017 by Mohsin Hamid
As used in the text, what does the word “reaching” most nearly mean?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-aa7ae735.png$qb$, $qb$[{"label": "A", "body": "Arriving at"}, {"label": "B", "body": "Consulting with"}, {"label": "C", "body": "Running to"}, {"label": "D", "body": "Clinging to"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The word "reaching" in this text means "to arrive" at Earth. Before, the light had been traveling across space; now, it
had arrived at Earth.
Choice B is incorrect. "Consulting with" means "seeking advice or information from someone." Light is not alive, so it can’t consult with Earth.
Choice C is incorrect. It’s confusing to say that starlight is "only now running to Earth," both because light doesn’t literally "run" and because the
text is describing the moment the light touches Earth, not the period of time when it’s traveling to Earth. Choice D is incorrect. This might be
tempting, as "clinging to" has a connotation of "sticking to." It wouldn’t make sense to say that the light was "only now" clinging to Earth.$qb$);
select seed_pool_question($qb$CB-a7991da1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A unique dialect, or regional variety, of Spanish is spoken in Puerto Rico. It contains many words borrowed from the language of the Taínos, the
Indigenous people of Puerto Rico. African languages also made important contributions to the Puerto Rican dialect. For example, the way certain
vowel sounds are pronounced in it can be ______ to how they are pronounced in Yoruba, a West African language.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "traced"}, {"label": "B", "body": "surrendered"}, {"label": "C", "body": "announced"}, {"label": "D", "body": "offered"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of the origins of the unique dialect of Spanish spoken in
Puerto Rico. In this context, "traced" means tracked back to. The text notes that the regional variety of Spanish spoken in Puerto Rico has its
roots in the language of the Taínos and in the West African language of Yoruba. This context supports the idea that the way certain vowel sounds
are pronounced in the Puerto Rican dialect can be traced back to Yoruba.
Choice B is incorrect because the text presents the statement about the relationship between vowel pronunciation in the Puerto Rican dialect of
Spanish and in Yoruba as an example to support the claim that African languages have contributed to the Puerto Rican dialect. It therefore
wouldn’t make sense to say that the pronunciation of certain vowel sounds in the Puerto Rican dialect can be "surrendered," or handed over on
demand, to the pronunciation in Yoruba. Choice C is incorrect because the text gives no indication that the way certain vowel sounds are
pronounced in the Puerto Rican dialect of Spanish has been "announced," or officially declared or proclaimed. According to the text, elements of
the dialect have been inherited or borrowed from African languages, and the relationship between the pronunciation of certain vowels in the
Puerto Rican dialect and in Yoruba is an example of this inheritance, suggesting that the pronunciation in the Puerto Rican dialect can be traced
to Yoruba. Choice D is incorrect because the text presents the statement about the relationship between vowel pronunciation in the Puerto Rican
dialect of Spanish and in Yoruba as an example to support the claim that African languages have contributed to the Puerto Rican dialect. It
therefore wouldn’t make sense to say that the pronunciation of certain vowel sounds in the Puerto Rican dialect can be "offered," or presented as
a gift, to the pronunciation in Yoruba.$qb$);
select seed_pool_question($qb$CB-84a7fbca$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When Mexican-American archaeologist Zelia Maria Magdalena Nuttall published her 1886 research paper on sculptures found at the ancient
Indigenous city of Teotihuacan in present-day Mexico, other researchers readily ______ her work as groundbreaking; this recognition stemmed
from her convincing demonstration that the sculptures were much older than had previously been thought.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "acknowledged"}, {"label": "B", "body": "ensured"}, {"label": "C", "body": "denied"}, {"label": "D", "body": "underestimated"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of Nuttall’s 1886 research paper. In this context,
“acknowledged” means recognized as having a certain status. The text indicates that other researchers recognized Nuttall’s work as
groundbreaking because of its “convincing demonstration” related to the age of the ancient sculptures. In other words, the researchers
recognized the groundbreaking status of Nuttall’s work.
Choice B is incorrect because in this context, “ensured” would mean to have guaranteed or made sure something was the case. The text states
that other researchers gave Nuttall’s work recognition after it was published, but there’s no indication that they contributed to the work or had any
involvement that would have allowed them to make sure the work would be groundbreaking. Choice C is incorrect because the text doesn’t
suggest that other researchers “denied,” or refused to admit or accept, that Nuttall’s work was groundbreaking; on the contrary, it indicates that
researchers praised the work, recognizing it as groundbreaking due to its “convincing demonstration” related to the age of the ancient sculptures.
Choice D is incorrect because the text doesn’t suggest that other researchers “underestimated,” or undervalued, Nuttall’s work; on the contrary, it
indicates that researchers praised the work, recognizing it as groundbreaking due to its “convincing demonstration” related to the age of the
ancient sculptures.$qb$);
select seed_pool_question($qb$CB-5179fd36$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Urban planning expert Francisco Lara-Valencia and colleagues have argued that managing environmental matters along the US-Mexico border
______ coordination between the two countries’ governments. Since ecosystems extend across the border, actions taken on one side can have
environmental effects on the other side, making international cooperation essential.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "requires"}, {"label": "B", "body": "praises"}, {"label": "C", "body": "reports"}, {"label": "D", "body": "advises"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of environmental management along the US and Mexican
border. In this context, "requires" means needs in order to perform a task. The text indicates that because ecosystems span the border, actions
taken by the government on one side of the border can affect the environment in the nation on the other side of the border, which makes
international cooperation crucial. In other words, because actions on one side of the US and Mexican border can affect the other side of the
border, managing environmental matters along the border requires coordination between the two governments.
Choice B is incorrect because "praises" in this context would mean to express a favorable judgment, but the text doesn’t describe approval
expressed by anyone, and it wouldn’t make sense to say that environmental management itself praises intergovernmental coordination. Choice C
is incorrect. In this context, "reports" would mean gives an account. Although coordination between the US and Mexican governments likely
would involve some sort of reporting, the text doesn’t describe any such practice. Choice D is incorrect. In this context, "advises" would mean
recommends a course of action, and although governments can advise one another, it wouldn’t make sense to say that environmental
management itself makes recommendations.$qb$);
select seed_pool_question($qb$CB-1f2d6173$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Scholarly accounts of the Chicano movement—a movement that advocated for the social, political, and cultural empowerment of Mexican
Americans and reached its zenith in the 1960s and 1970s—tend to focus on the most militant, outspoken figures in the movement, making it-
seem uniformly radical. Geographer Juan Herrera has shown, however, that if we shift our focus toward the way the movement manifested in
comparatively low-profile neighborhood institutions and projects, we see participants espousing an array of political orientations and
approaches to community activism.
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It presents a trend in scholarship on the Chicano movement that the text claims has been reevaluated by researchers in light of Herrera’s work on the movement’s participants."}, {"label": "B", "body": "It identifies an aspect of the Chicano movement that the text implies was overemphasized by scholars due to their own political orientations."}, {"label": "C", "body": "It describes a common approach to studying the Chicano movement that, according to the text, obscures the ideological diversity of the movement’s participants."}, {"label": "D", "body": "It summarizes the conventional method for analyzing the Chicano movement, which the text suggests creates a misleading impression of the effectiveness of neighborhood institutions and projects."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most accurately describes how the underlined portion functions in the text as a whole. The text begins by
mentioning scholarly accounts of the Chicano movement, which the underlined portion describes as tending "to focus on the most militant,
outspoken figures in the movement," making the movement as a whole seem uniformly radical. The text then indicates that the work of
geographer Juan Herrera shows that focusing less on such militant figures and instead paying more attention to manifestations of the Chicano
movement in less widely known neighborhood institutions and projects would reveal that the movement’s participants embraced a range of
political orientations and approaches. Thus, the underlined portion describes a common approach to studying the Chicano movement that,
according to the text, obscures the ideological diversity of the movement’s participants.
Choice A is incorrect. Though the underlined portion does present a trend in scholarship on the Chicano movement, the text does not indicate
that other scholars have reevaluated their methods in light of Herrera’s work. It only indicates that Herrera’s work suggests that the work of those
other scholars does not provide a complete picture of the Chicano movement. Choice B is incorrect. Though the underlined portion does identify
an aspect of the Chicano movement that the text indicates has been overemphasized, the text does not discuss the political orientations of the
scholars whose work is mentioned in the text. Choice D is incorrect. Though the underlined portion does summarize the conventional method for
analyzing the Chicano movement, the rest of the text does not address the effectiveness of "comparatively low-profile neighborhood institutions
and projects." Instead, the text suggests that those projects were led by people with a variety of approaches to community activism.$qb$);
select seed_pool_question($qb$CB-428cd2c1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Some people have speculated that two helmets with attached horns discovered in Denmark in 1942 belonged to Vikings, but scholars have long
been skeptical. Archaeologist Helle Vandkilde and colleagues recently provided radiocarbon dates for the helmets, and their findings ______
scholars’ skepticism: the helmets date to the Nordic Bronze Age, centuries before the Vikings existed.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "anticipate"}, {"label": "B", "body": "inspect"}, {"label": "C", "body": "reveal"}, {"label": "D", "body": "justify"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of the helmets found in Denmark. In this context, “justify”
means confirm or give reasons for. The text indicates that scholars have long been skeptical about the supposed Viking origin of two helmets
found in Denmark. The radiocarbon dating of the helmets conducted by Vandkilde and colleagues demonstrates that the helmets date from the
Nordic Bronze Age, making the helmets too old to have belonged to Vikings. This context supports the idea that the scholars’ skepticism is
justified.
Choice A is incorrect because “anticipate” means expect or come before, neither of which would make sense in context. The text indicates that
scholars have long been skeptical of the idea that the helmets belonged to Vikings. Because the skepticism has existed for a long time,
Vandkilde and colleagues’ research couldn’t be said to anticipate it. Instead, the radiocarbon dating results justify or confirm the scholar’s
skepticism. Choice B is incorrect because “inspect” means examine or review, which wouldn’t make sense in this context. Research findings are
inanimate and therefore unable to inspect scholars’ skepticism. The text focuses on the origin of two helmets, which some people believe
belonged to Vikings. Vandkilde and colleagues found that the helmets are from the Nordic Bronze Age and therefore much older than the
Vikings. This context suggests that the researchers’ findings justify, not inspect, the scholars’ skepticism. Choice C is incorrect because “reveal”
means uncover or report, which wouldn’t make sense in context. The text focuses on the origin of two helmets, which some people believe
belonged to Vikings. Vandkilde and colleagues tested the helmets and found that they date to the Nordic Bronze Age and therefore are much
older than the Vikings. This context suggests that the researchers’ findings confirm or justify the scholars’ skepticism, which was already known
so didn’t need to be revealed.$qb$);
select seed_pool_question($qb$CB-62a18353$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Zora Neale Hurston’s 1921 short story “John Redding Goes to Sea.” John wants to travel far beyond the village
where he lives near his mother, Matty.
[John] had on several occasions attempted to reconcile his mother to the notion, but found it a difficult task. Matty always took-
refuge in self-pity and tears. Her son’s desires were incomprehensible to her, that was all.
As used in the text, what does the phrase “reconcile his mother to” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Get his mother to accept"}, {"label": "B", "body": "Get his mother to apologize for"}, {"label": "C", "body": "Get his mother to match"}, {"label": "D", "body": "Get his mother to reunite with"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The expression “reconcile to” means “to cause (a person) to accept something difficult or disagreeable.” The text
suggests that John wants his mother to accept his desire to travel, even though she doesn’t like that idea.
Choice B is incorrect. This doesn’t make sense. John doesn’t want his mother to apologize for his own desire to travel—he wants her to accept
his desire to travel. Choice C is incorrect. The text doesn’t suggest that John wants his mother to match his desire to travel. Rather, he wants her
to accept his desire to travel even though she doesn’t like it. Choice D is incorrect. This is tempting, because it seems to pick up on the idea of
people “reconciling” after a fight, but it actually doesn’t make sense. The text never suggests that John’s mother was “united with” the idea of him
traveling in the past—if anything, it seems like she’s always been against it. Besides, it would be strange to say that a person “reunites with” a
notion.$qb$);
select seed_pool_question($qb$CB-4eee64fa$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Space scientists Anna-Lisa Paul, Stephen M. Elardo, and Robert Ferl planted seeds of Arabidopsis thaliana in samples of lunar regolith—the
surface material of the Moon—and, serving as a control group, in terrestrial soil. They found that while all the seeds germinated, the roots of the
regolith-grown plants were stunted compared with those in the control group. Moreover, unlike the plants in the control group, the regolith-grown
plants exhibited red pigmentation, reduced leaf size, and inhibited growth rates—indicators of stress that were corroborated by postharvest
molecular analysis.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "It describes an experiment that addressed an unresolved question about the extent to which lunar regolith resembles terrestrial soils."}, {"label": "B", "body": "It compares two distinct methods of assessing indicators of stress in plants grown in a simulated lunar environment."}, {"label": "C", "body": "It presents evidence in support of the hypothesis that seed germination in lunar habitats is an unattainable goal."}, {"label": "D", "body": "It discusses the findings of a study that evaluated the effects of exposing a plant species to lunar soil conditions."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The text describes an experiment wherein space scientists compared plant growth in terrestrial and lunar soil
conditions. It then discusses the findings of the study, including the fact that all the seeds germinated but that the plants grown in lunar soil
exhibited signs of stress.
Choice A is incorrect. The text doesn’t address this question, and never describes any specific characteristics of either soil. It merely describes
the outcome of an experiment that exposed a plant species to lunar soil conditions. Choice B is incorrect. The text never compares methods of
assessing indicators of stress—instead, it simply mentions several stress indicators observed in the study (red pigmentation, reduced leaf size,
and inhibited growth rates). Choice C is incorrect. The text doesn’t present any evidence that we could never achieve seed germination in lunar
habitats, and in fact states that the seeds in the lunar soil did germinate.$qb$);
select seed_pool_question($qb$CB-c2c26e20$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Sadakichi Hartmann’s 1894 short story “Magnolia Blossoms.” The narrator is standing on the deck of a boat.
What a night it was! My soul had left its body to lose itself in the wild unrestrained beauty around me—from where it came—and
only left a trembling suggestion of its existence within me. The other passengers moved around me like shadows, and again and-
again my eyes drank in all the glory and wealth of that night.
As used in the text, what does the word “suggestion” most nearly mean?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c2c26e20.png$qb$, $qb$[{"label": "A", "body": "Trace"}, {"label": "B", "body": "Opinion"}, {"label": "C", "body": "Dispute"}, {"label": "D", "body": "Command"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because as used in the text, “suggestion” most nearly means trace. The text portrays the narrator standing on the
deck of a boat, admiring the view of nature afforded by this position: “My soul had left its body to lose itself in the wild unrestrained beauty
around me,” says the narrator, “and only left a trembling suggestion of its existence within me.” This intense response to beauty is such that the
narrator’s soul seems to disengage from its body, leaving behind only a barely detectible indication of its presence there. In other words, the
narrator senses only a trace of soul left in the body.
Choice B is incorrect. Although in some contexts “suggestion” can refer to an implied or indirectly expressed opinion, the text doesn’t portray the
narrator expressing an opinion; instead, the narrator is explaining an experience of intense emotion. Choice C is incorrect. While “suggestion”
might be used in some contexts to refer to the tactful expression of a differing viewpoint, it doesn’t refer to the dispute or difference of opinion
itself. Moreover, the text doesn’t portray a dispute between characters with differing viewpoints. Choice D is incorrect. Although in some
contexts, “suggestion” might be used to refer to a politely worded command, the text doesn’t portray a scenario in which someone receives such
a command.$qb$);
select seed_pool_question($qb$CB-4b54bbf0$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the 2010s, the price of pop music cassette tapes from the 1980s and 1990s rose dramatically, which had the counterintuitive effect of ______
demand: buyers who hadn’t previously wanted to purchase vintage cassettes thronged the market, believing prices would continue to rise and
the tapes could be resold later at a profit.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "exploiting"}, {"label": "B", "body": "monetizing"}, {"label": "C", "body": "appraising"}, {"label": "D", "body": "engendering"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of how rising prices affected demand for vintage cassette
tapes. In this context, "engendering" means producing or causing to exist. The text indicates that the effect of a dramatic increase in the price of
vintage cassettes was counterintuitive, or contrary to what would typically be expected. Generally, when prices rise, demand falls—but the text
indicates that in this case, buyers who previously had no interest in cassettes "thronged the market" (that is, many of them began purchasing
cassettes) because they saw the cassettes as potential investments. This context conveys that the rising prices surprisingly produced
significant demand, producing many new buyers for vintage cassettes.
Choice A is incorrect because the text focuses on a rise in prices of vintage cassettes, and it wouldn’t make sense to describe the price increase
itself—rather than sellers of vintage cassettes—as "exploiting," or unfairly or selfishly taking advantage of, demand. Further, wanting to take
advantage of new demand would be a motivation for a price increase, not a counterintuitive effect of it. Choice B is incorrect. In this context,
"monetizing" would mean utilizing as a source of profit, and it wouldn’t make sense to describe a price increase itself, rather than sellers of
vintage cassettes, as using demand as a source of profit; moreover, seeking to profit when there’s new demand would be a reason for price
increases, not a counterintuitive effect of them. Choice C is incorrect. In this context, "appraising" would mean assessing the value or
significance of something. The text focuses on a rise in prices of vintage cassettes, and while it would be reasonable to suggest that sellers
might have appraised demand for those cassettes, it wouldn’t make sense to suggest that a price increase itself could do such an assessment;
moreover, an appraisal of demand would most likely precede a price increase rather than be an effect of it.$qb$);
select seed_pool_question($qb$CB-1374a9fa$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Austin McCoy has argued that historians have tended to ______ rank-and-file workers in analyses of changes in organized labor in the United
States in the decades following the Second World War, presenting political, business, and labor leaders as the major actors and ordinary workers
as nearly devoid of agency.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "epitomize"}, {"label": "B", "body": "marginalize"}, {"label": "C", "body": "extol"}, {"label": "D", "body": "substantiate"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of how historians have treated rank-and-file (ordinary)
workers in their analyses. In this context, "marginalize" means treat as unimportant or relatively powerless within a group or society. The text
explains that according to Austin McCoy, historians have tended to treat "political, business, and labor leaders" as the "major actors" involved in
making changes in organized labor in the period after the Second World War. By emphasizing the contributions of these leaders, historians have
in effect minimized the contributions of ordinary workers, treating them as relatively unimportant and "nearly devoid of agency," thereby
marginalizing them.
Choice A is incorrect. In this context, "epitomize" would mean either serve as an ideal example of something or make into an example of
something, neither of which would make sense. In stating that historians have tended to characterize political, business, and labor leaders as the
primary actors responsible for changes in the post-Second World War labor movement in a manner that minimizes the influence of ordinary
workers, the text suggests that historians have tended to present ordinary workers as unimportant to or uninfluential within the movement, not
that historians themselves serve as examples of ordinary workers, or that historians in their analyses have made ordinary workers into examples
of the changes that occurred. Choice C is incorrect because in this context, "extol" would mean praise highly or glorify. The text states that
historians have tended to present ordinary workers as being "nearly devoid of agency," thereby minimizing their importance. It therefore wouldn’t
make sense to say that in doing so, historians have tended to praise or glorify them. Choice D is incorrect because "substantiate" would mean
verify with evidence, and nothing in the text suggests that historians have verified rank-and-file workers or their contributions in their analyses. If
anything, the text suggests the opposite, implying that by minimizing workers’ agency in organized labor, historians have likely overlooked
evidence demonstrating their influence.$qb$);
select seed_pool_question($qb$CB-a70cbc53$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Raymond Antrobus, an accomplished poet and writer of prose, recently released his debut spoken word poetry album, The First Time I Wore
Hearing Aids, in collaboration with producer Ian Brennan. The album contains both autobiographical and reflective pieces combining Antrobus’s
spoken words with Brennan’s fragmented audio elements and pieces of music to convey how people who are deaf may experience sound, both
its presence and absence. Some critics suggest that the album questions the function of sound in the world, highlighting that the experience of
sound is multifaceted.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It introduces a collaborative spoken word poetry project, details the approach taken to produce the work, and then provides an example of critique the album received upon release."}, {"label": "B", "body": "It mentions a collection of spoken word poems, distinguishes one poem as being an exemplar on the album, and then offers a summary of the subject matter of the whole collection."}, {"label": "C", "body": "It summarizes the efforts to produce a collection of spoken word poems, presents biographies of two people who worked on the album, and speculates about the meaning behind the poetry."}, {"label": "D", "body": "It connects two artists to the same spoken word poetry project, explains the extent of their collaboration on each poem, and then provides an overview of the technique used to produce the work."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The text first introduces the album as being a collaboration between Antrobus and Brennan, then describes the
approach taken to produce it, then mentions how critics have said that it calls into question the function of sound.
Choice B is incorrect. While the text does mention a collection of spoken word poems, it doesn’t single out one poem as being particularly
noteworthy. Additionally, the text doesn’t simply summarize the subject matter—it goes into detail about the content and production of the
album. Choice C is incorrect. The text doesn’t provide biographical information about the two artists, and the text doesn’t speculate about the
meaning behind the poetry—instead, it relays what some critics have said about the album. Choice D is incorrect. The text doesn’t provide just an
overview of the production techniques used but instead goes into more detail about the content and audio elements of the album, as well as
critical response to the album.$qb$);
select seed_pool_question($qb$CB-3d658a5a$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Some foraging models predict that the distance bees travel when foraging will decline as floral density increases, but biologists Shalene Jha and
Claire Kremen showed that bees’ behavior is inconsistent with this prediction if flowers in dense patches are ______: bees will forage beyond
patches of low species richness to acquire multiple resource types.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "depleted"}, {"label": "B", "body": "homogeneous"}, {"label": "C", "body": "immature"}, {"label": "D", "body": "dispersed"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of Jha and Kremen’s finding about bees’ foraging behavior.
In this context, “homogeneous” means uniform or of the same kind. The text indicates that some models predict that the distance that bees
travel when they’re foraging declines as the density of flowers increases. The text goes on to say, however, that Jha and Kremen identified a
circumstance in which bees don’t behave this way. Specifically, if bees encounter “patches of low species richness”—that is, patches in which the
flowers are largely from the same species—they’ll travel beyond those patches to get varied food resources. This context thus suggests that
bees don’t behave as some models predict if the dense patches of flowers the bees encounter are homogeneous.
Choice A is incorrect because the text indicates that Jha and Kremen found that bees will behave differently than some models predict if the
bees encounter flower patches that are not rich in species, not if the flowers are “depleted,” or emptied or reduced in quality or quantity. Although
it could be true that bees are likely to leave depleted patches in search of more resources, the text doesn’t indicate that Jha and Kremen
investigated that possibility. Choice C is incorrect because there’s no information in the text suggesting that bees will not behave as some
models predict if flowers in patches are “immature,” or not fully developed. Instead, the text indicates that Jha and Kremen found that bees will
behave contrary to some models’ predictions if the flower patches are not rich in species. Choice D is incorrect because the text indicates that
bees’ behavior will be inconsistent with the predictions of some models if the flower patches that the bees encounter are of low species
richness, not if the flowers are in patches that are “dispersed,” or widely scattered. Although the text does describe bees as leaving patches that
are not rich in species to forage elsewhere, there’s no suggestion that Jha and Kremen found that the distance between dense flower patches
affects whether the bees behave as some models predict.$qb$);
select seed_pool_question($qb$CB-cd2ce51f$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Like the 1945 play it reimagines—Federico García Lorca’s The House of Bernarda Alba—Marcus Gardley’s 2014 play The House That Will Not Stand
prominently features women. In both plays, the all-female cast ______ an array of female characters, including a strong mother and several
daughters dealing with individual struggles.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "engulfs"}, {"label": "B", "body": "encourages"}, {"label": "C", "body": "comprises"}, {"label": "D", "body": "provokes"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of Gardley’s play. In this context, “comprises” means
constitutes or makes up the totality of, and the text indicates that The House That Will Not Stand had an “all-female cast” that stands in some
relationship to “an array of female characters” in the play. Because all cast members are female, the characters must be played by these female
cast members; therefore the cast constitutes, or comprises, the collection of characters.
Choice A is incorrect. In this context, “engulfs” would mean encloses or overwhelms, and although it is fairly common to describe an actor as
embodying (or personifying realistically) a character, there is nothing in the text to suggest that the cast members enclosed or overwhelmed the
characters they played. Choice B is incorrect because in this context, “encourages” would mean inspires with courage or hope. Although the text
does mention “a strong mother and several daughters dealing with individual struggles,” which might suggest that there are moments of
encouragement among the characters during the play, there is nothing to suggest that the cast members encouraged the characters they
portrayed. Choice D is incorrect because, in this context, “provokes” would mean instigates or incites to anger. Nothing in the text addresses
provocation or what it might mean for actors to provoke the characters they are playing.$qb$);
select seed_pool_question($qb$CB-17bf10de$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Despite its beautiful prose, The Guns of August, Barbara Tuchman’s 1962 analysis of the start of World War I, has certain weaknesses as a work
of history. It fails to address events in Eastern Europe just before the outbreak of hostilities, thereby giving the impression that Germany was the
war’s principal instigator. Had Tuchman consulted secondary works available to her by scholars such as Luigi Albertini, she would not have
neglected the influence of events in Eastern Europe on Germany’s actions.
Text 2
Barbara Tuchman’s The Guns of August is an engrossing if dated introduction to World War I. Tuchman’s analysis of primary documents is
laudable, but her main thesis that European powers committed themselves to a catastrophic outcome by refusing to deviate from military plans
developed prior to the conflict is implausibly reductive.
Which choice best describes a difference in how the authors of Text 1 and Text 2 view Barbara Tuchman’s The Guns of August?$qb$, null, $qb$[{"label": "A", "body": "The author of Text 1 argues that Tuchman should have relied more on the work of other historians, while the author of Text 2 implies that Tuchman’s most interesting claims result from her original research."}, {"label": "B", "body": "The author of Text 1 believes that the scope of Tuchman’s research led her to an incorrect interpretation, while the author of Text 2 believes that Tuchman’s central argument is overly simplistic."}, {"label": "C", "body": "The author of Text 1 asserts that the writing style of The Guns of August makes it worthwhile to read despite any perceived deficiency in Tuchman’s research, while the author of Text 2 focuses exclusively on the weakness of Tuchman’s interpretation of events."}, {"label": "D", "body": "The author of Text 1 claims that Tuchman would agree that World War I was largely due to events in Eastern Europe, while the author of Text 2 maintains that Tuchman would say that Eastern European leaders were not committed to military plans in the same way that other leaders were."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. Both texts are critical of The Guns of August, but for different reasons: the author of Text 1 argues that Tuchman
missed an important factor leading up to the war because she didn’t consult secondary sources, and the author of Text 2 argues that Tuchman’s
main thesis is "reductive," which is a close synonym for "overly simplistic."
Choice A is incorrect. This doesn’t accurately describe the difference. This choice’s summary of Text 1 is accurate, but Text 2 never says that
Tuchman’s most interesting claims result from her original research. Choice C is incorrect. This doesn’t accurately describe the difference. Text 1
never says that The Guns of August is worthwhile to read despite its research weaknesses. Text 2 does call out a weakness of Tuchman’s
interpretation of events, but it also praises her analysis of primary sources. Choice D is incorrect. This doesn’t accurately describe the difference.
Text 1 actually says that Tuchman "fails to address" the influence of events in Eastern Europe, while Text 2 says that Tuchman’s thesis was that
European powers (not Eastern European leaders) were committed to military plans.$qb$);
select seed_pool_question($qb$CB-b4c6cff6$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Karel Čapek’s 1920 play R.U.R. (Rossum’s Universal Robots), translated by Paul Selver and Nigel Playfair in
1923. Fabry and Busman are telling Miss Glory why their company manufactures robots.
FABRY: One Robot can replace two and a half workmen. The human machine, Miss Glory, was terribly imperfect. It had to be removed sooner or
later.
BUSMAN: It was too expensive.
FABRY: It was not effective. It no longer answers the requirements of- modern engineering. Nature has no idea of keeping pace with modern
labor.
As used in the text, what does the word “answers” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Explains"}, {"label": "B", "body": "Rebuts"}, {"label": "C", "body": "Defends"}, {"label": "D", "body": "Fulfills"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because as used in the text, “answers” most nearly means fulfills. In the text, Fabry and Busman claim that the
robots manufactured by their company are more efficient than human workers, which they refer to as “the human machine.” Fabry observes that
the human machine “no longer answers the requirements of modern engineering.” That is, human workers are incapable of meeting the rigorous
needs of modern, industrialized workplaces.
Choice A is incorrect. Although in some contexts “answers” can mean explains, it doesn’t have that meaning in this context because the topic
under discussion is human beings’ inability to perform labor efficiently, not their inability to engage in discussion or explanation. Choice B is
incorrect. Although in some contexts “answers” can mean rebuts, or proves a claim or argument to be false, it wouldn’t make sense to speak of
proving requirements to be false; requirements might or might not be reasonable, but they can’t be verified as truthful or untruthful, as claims or
accusations can. Choice C is incorrect. Although in some contexts, “answers” can mean defends against criticism, or justifies, it doesn’t have
that meaning in this context because the opinion that Fabry expresses is that human workers can no longer fulfill the requirements of modern
workplaces, not that they have ceased to justify those requirements or to defend them against criticism; indeed, there is no suggestion in the text
that workers ever defended those requirements.$qb$);
select seed_pool_question($qb$CB-d8d1ecaa$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Business researcher Melanie Brucks and colleagues found that remote video conference meetings may be less conducive to brainstorming than
in-person meetings are. The researchers suspect that video meeting participants are focused on staring at the speaker on the screen and don’t
allow their eyes or mind to wander as much, which may ultimately ______ creativity.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "recommend"}, {"label": "B", "body": "criticize"}, {"label": "C", "body": "impede"}, {"label": "D", "body": "construct"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The first sentence tells us that video meetings are “less conducive to” (meaning less good for) brainstorming. This
suggests that the video meeting participants’ focus is bad for their creativity. “Impede” means “delay” or “prevent,” which works perfectly in this
context.
Choice A is incorrect. This choice is too positive to fit the context. The first sentence tells us that video meetings are “less conducive to”
(meaning less good for) brainstorming. This suggests that the video meeting participants’ focus is bad for their creativity. Choice B is incorrect.
This choice doesn’t make sense. The participants’ intense focus on the screen is the subject of the missing verb. It wouldn’t make sense to say
that their over-focusing “criticizes” their creativity. Choice D is incorrect. “Construct” means “build” or “make,” which is too positive to fit the
context. The first sentence tells us that video meetings are “less conducive to” (meaning less good for) brainstorming. This suggests that the
video meeting participants’ focus is bad for their creativity.$qb$);
select seed_pool_question($qb$CB-d0198544$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
In 2007, a team led by Alice Storey analyzed a chicken bone found in El Arenal, Chile, dating it to 1321–1407 CE—over a century before
Europeans invaded the region, bringing their own chickens. Storey also found that the El Arenal chicken shared a unique genetic mutation with
the ancient chicken breeds of the Polynesian Islands in the Pacific. Thus, Polynesian peoples, not later Europeans, probably first introduced-
chickens to South America.-
Text 2
An Australian research team weakened the case for a Polynesian origin for the El Arenal chicken by confirming that the mutation identified by
Storey has occurred in breeds from around the world. More recently, though, a team led by Agusto Luzuriaga-Neira found that South American
chicken breeds and Polynesian breeds share other genetic markers that European breeds lack. Thus, the preponderance of evidence now favors
a Polynesian origin.
Based on the texts, how would the author of Text 2 most likely respond to the underlined claim in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By broadly agreeing with the claim but objecting that the timeline it presupposes conflicts with the findings of the genetic analysis conducted by Storey’s team"}, {"label": "B", "body": "By faulting the claim for implying that domestic animals couldn’t have been transferred from South America to the Polynesian Islands as well"}, {"label": "C", "body": "By critiquing the claim for being based on an assumption that before the European invasion of South America, the chickens of Europe were genetically uniform"}, {"label": "D", "body": "By noting that while the claim is persuasive, the findings of Luzuriaga-Neira’s team provide stronger evidence for it than the findings of the genetic analysis conducted by Storey do"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it accurately describes how the author of Text 2 would most likely respond to the underlined claim in Text 1.
Text 1 indicates that Storey found a genetic mutation in South American chickens from before the European invasion and in Polynesian chickens,
which implies that chickens were first brought to South America by Polynesian people. Text 2 explains that the genetic mutation Storey found is
in chickens from all over the world, thus undercutting the mutation as evidence of a Polynesian origin. However, Text 2 goes on to say “[m]ore
recently” Luzuriaga-Neira and colleagues found multiple genetic markers shared by South American and Polynesian chickens but “that European
breeds lack,” which strongly suggests a Polynesian origin for the South American chickens. This indicates that the author of Text 2 believes
Luzuriaga-Neira’s evidence for a Polynesian origin is compelling while Storey’s evidence has been undermined. Thus, the author of Text 2 would
most likely agree with the underlined statement and believes Luzuriaga-Neira and colleagues’ evidence for the statement is stronger than
Storey’s evidence is.
Choice A is incorrect because both texts indicate that chickens were introduced to South America before the arrival of Europeans. Text 1 states
that the El Arenal chicken bone dates from “1321–1407 CE—over a century before Europeans invaded the region” and concludes that these
chickens were likely brought to South America by Polynesians. While Text 2 is not as explicit about the time period as Text 1 is, nothing in Text 2
undermines the timing of events ascribed to Storey’s account in Text 1. Choice B is incorrect because both texts agree that chickens were first
brought to South America by Polynesian peoples (the underlined claim), and nothing in Text 2 suggests that this claim is in any way deficient
because the possibility that animals could have been transferred from South America to Polynesia was not explicitly addressed. Choice C is
incorrect because the criticism that Text 2 raises about the ideas in Text 1 is specifically about whether the single genetic mutation cited by
Storey in fact supports the idea of a Polynesian origin for South American chickens. There is nothing in Text 2 to suggest that the underlined
sentence (Storey’s conclusion) is deficient because it is based on an assumption about the genetic uniformity of European chickens.$qb$);
select seed_pool_question($qb$CB-de059199$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Typically, synthetic leather is petroleum based, but materials scientists searching for an ecologically sustainable alternative have used various
bacteria that secrete linear chains of glucose, forming a dense mesh of cellulose called a pellicle, which is leatherlike except in color. The
standard process for dyeing leather generates substantial wastewater and other undesirable byproducts, so adopting such a regimen would run-
counter to the ecological promise of the pellicle approach. To address this, Kenneth T- . Walker and colleagues worked to modify
Komagataeibacter rhaeticus bacteria to produce a pellicle with embedded pigmentation cells, thereby allowing the pellicle to “dye” itself from the
inside.
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "To concede that the researchers’ main goal as described in the text will be challenging to achieve due to the standard coloring approach being impractical for use on a pellicle"}, {"label": "B", "body": "To indicate the characteristic of conventional synthetic leathers that makes those leathers poorly suited to achieve the researchers’ main goal as presented in the text"}, {"label": "C", "body": "To describe a consideration that led the researchers to employ an alternative approach to coloring a pellicle that allowed them to achieve their main goal as presented in the text"}, {"label": "D", "body": "To illustrate how the researchers adapted the pellicle approach to overcome a potential impediment to their main goal as presented in the text"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it best describes the function of the underlined portion in the text as a whole. The text establishes that
scientists developed a pellicle (a dense cellulose mesh) as an ecologically sustainable alternative to petroleum-based synthetic leather, noting
that the pellicle is leatherlike except in color. The text then notes that the standard dyeing process for leather generates wastewater and other
byproducts, and the underlined portion states that using such a process would be inconsistent with the ecological promise of the pellicle
approach. The sentence that follows the underlined portion describes how Walker and colleagues addressed this problem by modifying bacteria
to produce a pellicle with embedded pigmentation. Thus, the underlined portion describes a consideration—the incompatibility of standard
dyeing methods with ecological aims—that led the researchers to employ an alternative coloring approach consistent with their goal of
ecological sustainability.
Choice A is incorrect because the text presents the underlined portion not as a concession that the researchers’ main goal, developing an
ecologically sustainable alternative to synthetic leather, will be difficult to achieve, but as a reason why adopting a particular method of dyeing
would be inconsistent with that goal. Choice B is incorrect because the underlined portion addresses a problem with the standard process for
dyeing leather, not a characteristic of conventional synthetic leathers themselves. The issue identified in the underlined portion concerns the
environmental impact of the standard method used to dye leather, not the petroleum-based nature of conventional synthetics. Choice D is
incorrect because the underlined portion identifies the problem that motivated the researchers’ search for an alternative method of coloring the
pellicle, not the method of coloring itself. The method of modifying bacteria to embed pigmentation is described in the sentence that follows the
underlined portion.$qb$);
select seed_pool_question($qb$CB-a2be625e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from Sarah Orne Jewett’s 1899 short story “Martha’s Lady.” Martha is employed by Miss Pyne as a maid.
Miss Pyne sat by the window watching, in her best dress, looking stately and calm; she seldom went out now, and it was almost
time for the carriage. Martha was just coming in from the garden with the strawberries, and with more flowers in her apron. It was
a bright cool evening in June, the golden robins sang in the elms, and the sun was going down behind the apple-trees at the foot
of the garden. The beautiful old house stood wide open to the long-expected guest.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To convey the worries brought about by a new guest"}, {"label": "B", "body": "To describe how the characters have changed over time"}, {"label": "C", "body": "To contrast the activity indoors with the stillness outside"}, {"label": "D", "body": "To depict the setting as the characters await a visitor’s arrival"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately reflects the main purpose of the text. The text portrays Miss Pyne as awaiting the arrival
of a carriage while Martha brings strawberries and flowers from the garden into the house. The text also describes the surroundings of the
scene, stating that Miss Pyne looks "stately and calm," the evening is bright and cool, and birds are singing in the garden as the sun sets. Then
the last sentence states that the house was "wide open to the long-expected guest," which strongly suggests that Miss Pyne’s anticipation and
Martha’s activities were in preparation for the guest who is expected to arrive in the carriage. Thus, the text depicts the setting and conveys what
these characters are doing as they await the arrival of their visitor.
Choice A is incorrect because there is nothing in the text to indicate that the characters feel any worry about the guest’s arrival. The text indicates
that the guest was "long-expected," but characterizing Miss Pyne as "stately and calm" conflicts with the idea that the characters are worried
about the guest. Choice B is incorrect because the text describes a moment in time when two characters are awaiting the arrival of a visitor
rather than an extended period over which characters could be seen changing. Choice C is incorrect. Although the text describes the activity
indoors (Miss Pyne sitting calmly), it describes a higher level of activity, not stillness, outside (Martha bringing fruit and flowers and birds
singing).$qb$);
select seed_pool_question($qb$CB-ab56a107$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
Digital art, the use of digital technology to create or display images, isn’t really art at all. It doesn’t require as much skill as creating physical art.
“Painting” with a tablet and stylus is much easier than using paint and a brush: the technology is doing most of the work.
Text 2
The painting programs used to create digital art involve more than just pressing a few buttons. In addition to knowing the fundamentals of art,
digital artists need to be familiar with sophisticated software. Many artists will start by drawing an image on paper before transforming the piece
to a digital format, where they can apply a variety of colors and techniques that would otherwise require many different traditional tools.
Based on the texts, how would the author of Text 2 most likely respond to the claims of the author of Text 1?$qb$, null, $qb$[{"label": "A", "body": "By arguing that a piece of art created digitally can still be displayed traditionally"}, {"label": "B", "body": "By explaining that it’s actually much harder to use a tablet and stylus to create art than to use paint and a brush"}, {"label": "C", "body": "By insisting that digital art requires artistic abilities and skill even if it employs less traditional tools"}, {"label": "D", "body": "By admitting that most digital artists don’t think fundamental drawing skills are important"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it reflects how the author of Text 2 would respond to the claims in Text 1. Both texts address skills needed
to produce digital art. Text 1 claims that digital art doesn’t require the same amount of skill as creating physical art and that “the technology is
doing most of the work.” Text 2 states that digital art requires “knowing the fundamentals of art” and that many digital artists begin their work on
paper and then transfer it to a digital format using “sophisticated software” and “a variety of colors and techniques.” Therefore, the author of Text
2 would most likely insist that digital art requires artistic abilities even if it employs less traditional tools.
Choice A is incorrect because neither text discusses nondigital means of displaying art. Choice B is incorrect because the author of Text 2
doesn’t address whether it’s harder to use a tablet and stylus than it is to use paint and a brush. Text 2 does argue that digital art requires skills
that aren’t part of the traditional methods for producing art, but the text doesn’t address relative difficulty. Choice D is incorrect because the
author of Text 2 states that digital artists still need to know “the fundamentals of art” and that many digital artists begin their work by drafting on
paper before transferring the work to a digital format.$qb$);
select seed_pool_question($qb$CB-f773a56b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$As Mexico’s first president from an Indigenous community, Benito Juarez became one of the most ______ figures in his country’s history: among
the many significant accomplishments of his long tenure in office (1858–1872), Juarez consolidated the authority of the national government
and advanced the rights of Indigenous peoples.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "unpredictable"}, {"label": "B", "body": "important"}, {"label": "C", "body": "secretive"}, {"label": "D", "body": "ordinary"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of Juarez. In this context, “important” means marked by
significant work or consequence. The text indicates that Juarez, who was the first president of Mexico from an Indigenous community, became a
certain kind of figure in Mexico’s history. It then supports that claim by describing some of the “many significant accomplishments” from
Juarez’s long tenure in office. This context conveys that Juarez is a significant and consequential figure in Mexico’s history.
Choice A is incorrect because the text focuses on Juarez’s role as the first president of Mexico from an Indigenous community and on his many
major accomplishments during his lengthy time in office; nothing in the text suggests that Juarez was “unpredictable,” or tended to behave in
ways that couldn’t be predicted. Choice C is incorrect because nothing in the text suggests that Juarez was a particularly “secretive” figure, or
that he tended to keep things private or hidden from others. Instead, the text focuses on things that are known about Juarez: that he was the first
president of Mexico from an Indigenous community, that he had a lengthy tenure, and that his many major accomplishments included
consolidating the national government’s authority and advancing Indigenous rights. Choice D is incorrect because the text focuses on the idea
that Juarez, who was the first president of Mexico from an Indigenous community, had many major accomplishments during his lengthy time in
office. Rather than suggesting that Juarez was an “ordinary,” or common and typical, figure in Mexico’s history, this context conveys that Juarez
was instead a notable figure.$qb$);
select seed_pool_question($qb$CB-f653b273$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
A tiny, unusual fossil in a piece of 99-million-year-old amber is of the extinct species Oculudentavis khaungraae. The O. khaungraae fossil consists
of a rounded skull with a thin snout and a large eye socket. Because these features look like they are avian, or related to birds, researchers
initially thought that the fossil might be the smallest avian dinosaur ever found.
Text 2
Paleontologists were excited to discover a second small fossil that is similar to the strange O. khaungraae fossil but has part of the lower body
along with a birdlike skull. Detailed studies of both fossils revealed several traits that are found in lizards but not in dinosaurs or birds. Therefore,
paleontologists think the two creatures were probably unusual lizards, even though the skulls looked avian at first.
Based on the texts, what would the paleontologists in Text 2 most likely say about the researchers’ initial thought in Text 1?$qb$, null, $qb$[{"label": "A", "body": "It is understandable because the fossil does look like it could be related to birds, even though O. khaungraae is probably a lizard."}, {"label": "B", "body": "It is confusing because it isn’t clear what caused the researchers to think that O. khaungraae might be related to birds."}, {"label": "C", "body": "It is flawed because the researchers mistakenly assumed that O. khaungraae must be a lizard."}, {"label": "D", "body": "It is reasonable because the O. khaungraae skull is about the same size as the skull of the second fossil but is shaped differently."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it reflects what the paleontologists in Text 2 would most likely say about what the researchers in Text 1
initially thought. Text 1 focuses on the discovery of a strange fossil consisting of the skull of the extinct species Oculudentavis khaungraae.
According to Text 1, the fossil has features that appear to be avian, or related to birds, which led researchers to initially think that the fossil might
be a very small avian dinosaur. Text 2 begins by noting the discovery of a second fossil similar to the one discussed in Text 1, then explains that
based on detailed studies of both fossils, paleontologists think that the two creatures were probably unusual lizards, even though the skulls
appeared avian at first. This suggests that the paleontologists in Text 2 recognize that the fossils do indeed look like they could be related to
birds. For this reason, the paleontologists in Text 2 would most likely say that the initial thought of the researchers in Text 1—that the fossil was
avian—is understandable, even if the fossil is probably not avian but rather is from a lizard.
Choice B is incorrect because Text 2 indicates that the fossils initially looked avian, so the paleontologists described in Text 2 wouldn’t be
confused by the researchers in Text 1 initially thinking that O. khaungraae might be related to birds. The paleontologists would find that initial
thought understandable, not confusing. Choice C is incorrect because Text 1 never mentions lizards, so it wouldn’t make sense for the
paleontologists in Text 2 to say that the researchers in Text 1 mistakenly assumed that O. khaungraae must be a lizard. Choice D is incorrect.
Although the paleontologists in Text 2 might agree that the initial thought of the researchers in Text 1 was reasonable, nothing in Text 2 suggests
that the two skulls were shaped differently.$qb$);
select seed_pool_question($qb$CB-7afb470b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Diadromous fish migrate between freshwater and marine biomes during their life cycle. The migration’s obligate nature is why diadromous fish
can be ______ those that are merely euryhaline (able to tolerate high salinity): the euryhaline blackchin tilapia can survive high salinity, but its life
cycle does not involve relocation to a different biome, as does that of the diadromous wild salmon.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "demarcated from"}, {"label": "B", "body": "reconstituted as"}, {"label": "C", "body": "conflated with"}, {"label": "D", "body": "derived from"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of diadromous fish. In this context, "demarcated from"
means separate or set apart from. The text indicates that diadromous fish differ from euryhaline fish in that diadromous fish "migrate between
freshwater and marine biomes during their life," whereas euryhaline fish do not relocate to a different biome because they can tolerate higher
salinity environments. Therefore, this context suggests that because of differences between their migration patterns, diadromous fish are
distinct and can be demarcated from euryhaline fish.
Choice B is incorrect. Although the text states that diadromous fish migrate and relocate, the text does not suggest that diadromous fish would
be "reconstituted as," or formed again as, anything new. Only their environments change and not the fish themselves. Choice C is incorrect
because the text does not suggest that diadromous fish can be "conflated with," or combined with, euryhaline fish. Instead, the text distinguishes
the two types of fish by pointing out their differences with regard to migration and tolerance for salinity. Choice D is incorrect because the text
indicates that based on migration habits and tolerance for salinity, diadromous fish are different from euryhaline fish; so it would not make
logical sense to say that diadromous fish would be "derived from," or be an extension of or result from, euryhaline fish.$qb$);
select seed_pool_question($qb$CB-5e732e67$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Many films from the early 1900s have been lost. These losses include several films by the first wave of Black women filmmakers. We know
about these lost movies only from small pieces of evidence. For example, an advertisement for Jennie Louise Touissant Welcome’s documentary
Doing Their Bit still exists. There’s a reference in a magazine to Tressie Souders’s film A Woman’s Error. And Maria P. Williams’s The Flames of
Wrath is mentioned in a letter and a newspaper article, and one image from the movie was discovered in the 1990s.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "The text identifies a complex problem, then presents examples of unsuccessful attempts to solve that problem."}, {"label": "B", "body": "The text summarizes a debate among researchers, then gives reasons for supporting one side in that debate."}, {"label": "C", "body": "The text describes a general situation, then illustrates that situation with specific examples."}, {"label": "D", "body": "The text discusses several notable individuals, then explains commonly overlooked differences between those individuals."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The first three sentences describe the general situation: these early films have been lost, and we only know about
them from small pieces of evidence. The rest of the text offers specific examples of the small pieces of evidence.
Choice A is incorrect. This isn’t the overall structure. The fact that we only know about these lost early films from small pieces of evidence isn’t
presented as a “complex problem”—that’s too extreme. And the examples presented are not “unsuccessful attempts” to solve it. If anything, the
examples represent a success, because we discovered that these films existed in the first place. Choice B is incorrect. This isn’t the overall
structure. There’s no “debate” presented in the text, so there’s no “side” for the text to support. Choice D is incorrect. This isn’t the overall
structure. The text doesn’t discuss any “differences” between the filmmakers.$qb$);
select seed_pool_question($qb$CB-d9e55268$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is adapted from Louise Erdrich’s 2020 novel The Night Watchman. Louis Pipestone is collecting signatures for a petition from
fellow members of the Turtle Mountain Band of Chippewa on the tribe’s reservation in North Dakota.
Louis Pipestone tended the petition like a garden. He kept it with him at all times. In town, his eyes sharpened when he noticed a
tribal member who hadn’t yet signed. Wherever they were—at the gas pump, mercantile [general store], at Henry’s [Café], on the
road, or outside the clinic and hospital—Louis cornered them. If they were waiting for a baby to be born, he’d have them sign. If
they were laughing, if they were arguing. If they were taking a child home from school, they signed.
©2020 by Louise Erdrich
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To suggest that some tribal members refuse to sign the petition because they dislike Louis Pipestone"}, {"label": "B", "body": "To show that attitudes toward the petition within the tribal community change over time"}, {"label": "C", "body": "To demonstrate that most tribal members are enthusiastic about signing the petition"}, {"label": "D", "body": "To portray Louis Pipestone’s strong commitment to collecting signatures for the petition"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately states the text’s main purpose. The text indicates that Louis always had his petition with
him, asked everyone he encountered to sign it if they hadn’t already, and lists several comical circumstances in which he might try to get
someone to sign. Thus, the main purpose of the text is to illustrate Louis’s dedicated focus on getting people to sign the petition.
Choice A is incorrect. Although the text suggests that Louis was aggressive in seeking signatures for the petition—for example, saying that he
"cornered" people—nothing in the text addresses how those people feel toward Louis, let alone that they are refusing his request. Choice B is
incorrect because, other than portraying Louis’s commitment to gathering signatures, the text doesn’t discuss community members’ attitudes
toward Louis or the petition. Choice C is incorrect because the text never mentions the attitudes of the people Louis approaches toward the
petition, but the text does indicate that he "cornered" prospective signatories, strongly suggesting that their enthusiasm was neither needed nor
considered.$qb$);
select seed_pool_question($qb$CB-93ce86d0$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Curious about how people visually perceive objects in their dreams, Stephen LaBerge and team recruited lucid dreamers—people aware that
they’re dreaming as it’s happening—for a research study. These participants were reliably able to signal when they had entered a dream state; the
team then observed participants’ eye movements as they slept. The smoothness with which participants-’ eyes tracked objects in their dreams
closely matched how sighted people who are awake visually track objects around them, suggesting to the team that the brain perceives dream-
objects as the product of something other than pure imagination.
Which choice best states the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "To offer key evidence that undermines LaBerge and team’s initial hypothesis"}, {"label": "B", "body": "To show the unexpected result that led LaBerge and team to change the focus of their study"}, {"label": "C", "body": "To illustrate an important real-world implication of LaBerge and team’s main finding"}, {"label": "D", "body": "To identify a comparable circumstance that helps justify LaBerge and team’s conclusion"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes how the underlined portion functions in the text as a whole. The text first
establishes that in order to investigate visual perception of objects in dreams, LaBerge and team observed the eye movements of lucid dreamers
(people who are aware of their dreaming as it occurs) when these participants signaled that they were in a dream state. The underlined portion
then describes a finding that rests on a comparison: the way participants’ eyes tracked objects in dream states was very similar to how sighted
people track real objects when awake. Finally, the text states that the team concluded from this finding that objects in dreams are perceived as
more than just products of imagination—implying that the team thinks the eye movements are an indication that the brain treats dream objects
as more real than imaginary. Thus, the function of the underlined portion is to identify a circumstance that is comparable to one in the study and
that helps justify LaBerge and team’s conclusion, presenting the close similarity of visual tracking in wakeful and dreaming scenarios as support
for the implicit idea that the brain perceives dream objects not as imaginary but as somewhat or fully real objects.
Choice A is incorrect because the text never presents LaBerge and team’s initial hypothesis, only what question they were interested in studying
and what they found. So although the underlined portion does present evidence, that evidence doesn’t serve to undermine any hypothesis in the
text. Choice B is incorrect because the text gives no indication that LaBerge and team changed the focus of their study at any point or that the
finding described in the underlined portion (or any other finding) was unexpected or surprising. Choice C is incorrect. Rather than illustrating an
implication of the main finding by LaBerge and team, the underlined portion only presents the finding itself, stating that the team found that the
movements of lucid dreamers’ eyes while dreaming were very similar to those of sighted people visually tracking objects while awake. The next
part of the text indicates what the finding implied to the team but still doesn’t offer a real-world example as illustration.$qb$);
select seed_pool_question($qb$CB-faee8ec7$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
It seems clear that emotional contagion (the unintentional transfer of an emotional state from one person to another) requires physical-
interaction and the observation of body language. After all, research shows that talking to someone who is smiling and expressing positive-
feelings often causes people to respond in a comparably positive way. Similarly, displays of nervous fidgeting have been found to prompt others
to begin behaving more nervously, too.
Text 2
In an experiment using a social networking service, Zeyao Yang and Emilio Ferrara found evidence of emotional contagion in text-based online
interactions. The researchers discovered that reading social media posts that expressed a positive outlook led people to make more positive
posts themselves, while posts with a negative emotional tone led people to make more negative posts.
Based on the texts, what would the researchers in Text 2 most likely say about the claim underlined in Text 1?$qb$, null, $qb$[{"label": "A", "body": "It perpetuates a flawed understanding of emotional contagion, because there isn’t enough evidence to suggest that smiling is a sign of emotional contagion."}, {"label": "B", "body": "It reflects an incomplete view of emotional contagion, because this phenomenon can occur even without in-person interaction."}, {"label": "C", "body": "It’s fairly persuasive, because studies attempting to identify emotional contagion in situations without in-person interaction have thus far yielded unclear results."}, {"label": "D", "body": "It’s mostly accurate, because the social networking study confirmed that emotional contagion primarily occurs in response to negative emotions like nervousness."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it represents how the researchers in Text 2 would most likely respond to the underlined claim in Text 1. Text
1 begins by asserting that the unintended transfer of feelings from one person to another, known as emotional contagion, seems to rely on both
people being physically present and able to observe body language. Text 1 then references research that supports this assertion. Text 2
describes an experiment conducted by the researchers Yang and Ferrara in which they found evidence of emotional contagion in the absence of
physical interaction, namely through text-based interactions on social media. The researchers in Text 2 wouldn’t completely agree with what is
asserted in the underlined portion of Text 1 (that emotional contagion seems to require physical proximity), because their study, which used a
social media networking service, found that physical interaction isn’t the only way that emotional contagion can take place. Thus, the researchers
in Text 2 would most likely respond to the underlined claim in Text 1 by stating that it reflects an incomplete view of emotional contagion,
because the phenomenon can occur without an in-person interaction.
Choice A is incorrect. Although the researchers in Text 2 would likely agree that the underlined statement in Text 1 perpetuates a flawed
conclusion that emotional contagion requires physical interaction, Text 2 doesn’t address what the researchers thought about smiling as a sign
of emotional contagion. Choice C is incorrect because the researchers in Text 2 wouldn’t say that the underlined claim in Text 1 is fairly
persuasive. According to Text 2, the researchers conducted a study that found emotional contagion didn’t require physical interaction, because
they found evidence of it in text-based online interactions. Choice D is incorrect because neither of the texts claim that emotional contagion
primarily occurs when a person is exposed to negativity. Instead, Text 1 claims that physical interaction is required for emotional contagion to
occur, and Text 2 describes a study that suggests emotional contagion can occur in text-based online interactions.$qb$);
select seed_pool_question($qb$CB-c19b2f77$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
Little is known about how plate tectonics—wherein slabs of Earth’s crust move over, under, away from, and against one another—began. Some-
researchers contend that tectonic movements began around 3 billion years ago, often noting that computer models of Earth- ’s mantle
temperature at the time indicate that the mantle would have been sufficiently molten to enable the plates to move.
Text 2
Ultimately, any plausible claim about the inception of tectonic movement must rest on empirical evidence from the geological record. Researcher
Wriju Chowdhury and his team analyzed the geochemistry of zircon crystals to gain insight into the chemical composition of the magma from
which the crystals formed and, based on the data, compellingly argue that plate tectonics may have been occurring as early as 4.2 billion years
ago.
Based on the texts, how would the author of Text 2 most likely respond to what “some researchers contend” as described in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By suggesting that the temperature of Earth’s mantle 3 billion years ago was likely insufficient to allow for the level of tectonic movement predicted by computer models"}, {"label": "B", "body": "By distinguishing between computer models of Earth’s mantle temperature that reliably predict the onset of plate tectonics and those that do not"}, {"label": "C", "body": "By indicating that computer models of Earth’s mantle temperature are still being improved such that new models tend to be much more reliable than their predecessors"}, {"label": "D", "body": "By asserting that a more definitive form of evidence than the computer models suggests a different timeline for the onset of plate tectonics on Earth"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it reflects how the author of Text 2 would most likely respond to what the researchers mentioned in Text 1
contend. Text 1 discusses the lack of knowledge of how plate tectonics on Earth began. Text 1 also mentions researchers who contend that
movements of tectonic plates began around 3 billion years ago. As support for this assertion, these researchers cite computer models (which
are simulations, not empirical evidence) of the temperature in Earth’s mantle that show that at that time, the mantle would have been sufficiently
molten for plates to move. However, the author of Text 2 asserts that empirical evidence from the geological record is necessary to make
plausible claims about when tectonic movement began. Text 2 mentions an analysis performed by Wriju Chowdhury and his team of the
geochemistry of zircon crystals (which would constitute empirical evidence). Chowdhury and his team argue, based on this analysis, that
tectonic plates may have begun to move as early as 4.2 billion years ago. Therefore, since the author of Text 2 would consider Chowdhury et al.’s
empirical evidence to be more conclusive than the computer models cited in Text 1, the author of Text 2 would most likely assert that a more
definitive form of evidence than the computer models suggests a different timeline for the onset of plate tectonics on Earth.
Choice A is incorrect because the author of Text 2 makes no claims about the temperature of Earth’s mantle and therefore wouldn’t argue that
the temperature of Earth’s mantle 3 billion years ago was insufficient to allow tectonic movement. Choice B is incorrect because the author of
Text 2 claims that empirical evidence is needed to fix the earliest date of tectonic movement. Computer models are simulations, not empirical
evidence, so the author of Text 2 wouldn’t distinguish between different kinds of computer models but would instead argue that no computer
models can reliably predict the onset of plate tectonics. Choice C is incorrect because the author of Text 2 wouldn’t consider any computer
model to be able to provide evidence to support a plausible claim about tectonic movement, no matter how much such models were improved.
The author of Text 2 would only accept empirical evidence.$qb$);
select seed_pool_question($qb$CB-14b7dced$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from Walt Whitman’s 1860 poem “Calamus 24.”
I HEAR it is charged against me that I seek to destroy institutions;
But really I am neither for nor against institutions
(What indeed have I in common with them?—Or what with the destruction of them?),
Only I will establish in the Mannahatta [Manhattan] and in every city of These States, inland and seaboard,
And in the fields and woods, and above every keel [ship] little or large, that dents the water,
Without edifices, or rules, or trustees, or any argument,
The institution of the dear love of comrades.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "The speaker questions an increasingly prevalent attitude, then summarizes his worldview."}, {"label": "B", "body": "The speaker regrets his isolation from others, then predicts a profound change in society."}, {"label": "C", "body": "The speaker concedes his personal shortcomings, then boasts of his many achievements."}, {"label": "D", "body": "The speaker addresses a criticism leveled against him, then announces a grand ambition of his."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it best describes the overall structure of the text. The speaker begins by stating that he has heard that
others are accusing him of seeking to destroy institutions. The speaker then addresses this criticism by stating that he is “neither for nor against
institutions.” Instead, the speaker states that his ultimate goal is to instill “the institution of the dear love of comrades” everywhere in the country.
Therefore, the overall structure of the text is best described as an address of criticism followed by an announcement of a grand ambition.
Choice A is incorrect. While the speaker does address an opinion of him that he believes to be untrue, he doesn’t indicate that this attitude has
become increasingly prevalent. The speaker also concludes by explaining his goal for the future rather than his current worldview. Choice B is
incorrect because the text doesn’t portray the speaker as isolated or regretful, and the speaker gestures toward a hope for societal change but
doesn’t offer an explicit prediction that it will happen. Choice C is incorrect because the speaker addresses a criticism of him that he believes to
be false; he doesn’t admit any personal shortcomings. Moreover, the speaker concludes by stating a goal he has rather than showcasing his
achievements.$qb$);
select seed_pool_question($qb$CB-3118ca93$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The fashion resale market, in which consumers purchase secondhand clothing from stores and online sellers, generated nearly $30 billion
globally in 2019. Expecting to see continued growth, some analysts ______ that revenues will more than double by 2028.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "produced"}, {"label": "B", "body": "denied"}, {"label": "C", "body": "worried"}, {"label": "D", "body": "predicted"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of the fashion resale market’s continued growth. As used
in this context, “predicted” means forecast, or indicated that something would happen in the future. The text indicates that the fashion resale
market made a lot of money in 2019 and that some analysts expected the market to continue to grow. This context suggests that the analysts
believed that the fashion resale market was going to make more money than it had already made, with the analysts indicating that revenues
would more than double by 2028.
Choice A is incorrect because it wouldn’t make sense in context to say that some analysts “produced,” or manufactured or brought about, the
increase in future revenues of the fashion resale market. The analysts themselves couldn’t have brought about the future revenue growth, since,
as the text suggests, they were merely in the position of drawing conclusions about future fashion resale market revenue based on 2019
revenue. Choice B is incorrect because the text indicates that some analysts expected the fashion resale market to continue to grow in the
future, not that they “denied,” or rejected, this notion. Nothing in the text supports the idea that these analysts thought the revenues wouldn’t
grow. Choice C is incorrect because the text indicates that some analysts expected the fashion resale market to continue to grow in the future,
not that they “worried,” or felt concerned, that revenue would significantly increase by 2028. Nothing in the text suggests that the analysts felt
concerned about the increase; rather, the text suggests that the increase would represent a favorable outcome, since it would mean that the
fashion resale market grew to generate even more revenue.$qb$);
select seed_pool_question($qb$CB-21d95d1d$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Ofelia Zepeda’s contributions to the field of linguistics are ______: her many accomplishments include working as a linguistics professor and
bilingual poet, authoring the first Tohono O’odham grammar book, and co-founding the American Indian Language Development Institute.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "pragmatic"}, {"label": "B", "body": "controversial"}, {"label": "C", "body": "extensive"}, {"label": "D", "body": "universal"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of how Ofelia Zepeda has contributed to the field of
linguistics. As used in this context, “extensive” means having a wide or considerable extent. The text indicates that Zepeda’s many
accomplishments in linguistics are varied, including teaching linguistics, writing poetry in more than one language, creating a grammar book, and
co-founding a language institute. This context supports the idea that Zepeda’s contributions to the field are extensive.
Choice A is incorrect because the sentence presents Zepeda’s accomplishments as examples to support the claim made in the first part of the
sentence. It wouldn’t make sense to say that achievements as a professor, poet and author, and co-founder of a language institute demonstrate
that Zepeda’s contributions in her field are “pragmatic,” or related to practical matters and not involving intellectual or artistic matters. Choice B is
incorrect because the sentence presents Zepeda’s accomplishments as a professor, poet and author, and co-founder of a language institute as
examples to support the claim made in the first part of the sentence. There’s no reason to believe that the positive achievements listed
demonstrate that Zepeda’s contributions in her field are “controversial,” or have caused disputes and opposing viewpoints. Choice D is incorrect
because in this context, “universal” would mean including or covering everything in a group. The sentence presents Zepeda’s accomplishments
as examples to support the claim made in the first part of the sentence, and it wouldn’t make sense to say that these specific achievements—
particularly as the author of a grammar book specific to the Tohono O’odham language—demonstrate that Zepeda’s contributions relate to
everything in the field of linguistics.$qb$);
select seed_pool_question($qb$CB-b622fb78$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is from the 1913 story “The King’s Coin” by Emily Pauline Johnson, a Kanienkahagen (Mohawk) writer also known as
Tekahionwake. Fox-Foot, a young Ojibwe man, is guiding a group of fur traders who are traveling by canoe and suspects that they are being
followed.
At supper time, Fox-Foot would allow no fire to be built, no landing to be made, no trace of their passing to be left. They ate-
canned meat and marmalade, drank again of the stream and pushed on, until just at dusk they reached the edge of a long, still
lake, with shores of granite and dense fir forest.
As used in the text, what does the word “trace” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Evidence"}, {"label": "B", "body": "Blemish"}, {"label": "C", "body": "Amount"}, {"label": "D", "body": "Sketch"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because the text indicates that Fox-Foot doesn’t let the group build a fire or create a canoe landing when it’s time for
supper. This context suggests that he doesn’t want anyone who might be following the group to see any sign of them or their activities. In other
words, Fox-Foot doesn’t want there to be any trace, or evidence, of the group’s movements ("their passing") through the area.
Choice B is incorrect because the text conveys that Fox-Foot doesn’t want the group to be detected, not that he doesn’t want their presence to
create a blemish, or a spoiling flaw, in the area; human activity could disturb a natural environment, but the context emphasizes that Fox-Foot is
instead focused on avoiding giving any sign of the group’s movements through a place ("their passing") to anyone who might be following them.
Choice C is incorrect because the text focuses on Fox-Foot’s desire to avoid detection by those who might be following the group. This context
conveys that Fox-Foot doesn’t want to create any signs or evidence of the group moving through a place ("their passing"), not that he doesn’t
want to leave behind some quantity of their presence; indeed, it isn’t clear what an amount of a group’s movement would be. Choice D is
incorrect because nothing in the text suggests that the group has a sketch, or rough drawing, of their movements through that area ("their
passing") that might be left behind. Rather, the context emphasizes that Fox-Foot is focused on ensuring that the group doesn’t give any kind of
indication of their presence, as he wants to avoid detection by anyone who might be following the group.$qb$);
select seed_pool_question($qb$CB-56ec23a0$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Hiroshi Senju is known worldwide for his paintings of waterfalls. These paintings are large and tend not to show the entire waterfall. Instead,
Senju focuses on just the point where the falling water reaches the pool below, keeping the top of the waterfall out of view. While Senju’s
paintings are rooted in art movements originating in the United States, the artist uses traditional Japanese techniques and materials that make
his work instantly recognizable.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It introduces an artist and then explains some common characteristics of well-known paintings by that artist."}, {"label": "B", "body": "It explains a specific painting technique and then provides examples of artists who use the technique."}, {"label": "C", "body": "It describes a famous painting and then compares it to a lesser-known painting from the same time period."}, {"label": "D", "body": "It gives an opinion on an artist and then suggests multiple reasons why the artist’s work has been largely overlooked."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most effectively describes the overall structure of the text. The first sentence introduces Hiroshi Senju as
an artist famous for his paintings of waterfalls. The rest of the text describes defining features of these “instantly recognizable” paintings: they
are large, show only part of a waterfall, and draw from art movements in the US and from techniques and materials traditionally used in Japan.
Thus, the text introduces Senju and then explains some common characteristics of his well-known paintings.
Choice B is incorrect because the text doesn’t focus on a specific painting technique or name multiple artists. Instead, it focuses on describing
some characteristics of works by one artist (Senju). Choice C is incorrect because the text doesn’t describe any single famous painting or make
a comparison between paintings. Instead, it describes features that are shared by multiple paintings by Senju. Choice D is incorrect. The text
doesn’t provide an opinion on Senju; it simply relates facts about him and his work. Moreover, instead of suggesting Senju’s work has been
largely overlooked, the text indicates that Senju is “known worldwide for his paintings.”$qb$);
select seed_pool_question($qb$CB-a318c1ef$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Cambrian explosion gets its name from the sudden appearance and rapid diversification of animal remains in the fossil record about 541
million years ago, during the Cambrian period. Some scientists argue that this ______ change in the fossil record might be because of a shift in
many organisms to body types that were more likely to be preserved.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "catastrophic"}, {"label": "B", "body": "elusive"}, {"label": "C", "body": "abrupt"}, {"label": "D", "body": "imminent"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically and precisely completes the text’s discussion of the fossil record from the Cambrian
period. In this context, “abrupt” means sudden. The text explains that the fossil record reflects the unexpected appearance and rapid
diversification, or increase in variety, of animal remains during the Cambrian period. This context establishes that these remains’ entry into the
fossil record was sudden.
Choice A is incorrect. Although the word “explosion” appears in the name of the event marked by the fossil record change, the text never
suggests that the change was “catastrophic,” or disastrous. In context, “explosion” refers to the rapid diversification, or the swift increase in
variety, of animal remains in the fossil record—a phenomenon that the text presents in a relatively neutral manner, without commenting on
whether it was negative or positive. Choice B is incorrect because the text never suggests that the change toward greater diversification is
“elusive,” or difficult to locate, in the fossil record. Rather, the text notes that the change occurred about 541 million years ago, suggesting that
scientists have indeed been able to locate it. Choice D is incorrect because it wouldn’t make sense in context to describe the change in the fossil
record as “imminent,” or about to occur, since the text indicates that the change already occurred millions of years ago.$qb$);
select seed_pool_question($qb$CB-e56b66e5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Set in a world where science fiction tropes exist as everyday realities, Charles Yu’s 2010 novel How to Live Safely in a Science Fictional Universe
traces a time traveler’s quest to find his father. Because the journey at the novel’s center is so ______, with the protagonist ricocheting chaotically
across time, the reader often wonders whether the pair will ever be reunited.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "haphazard"}, {"label": "B", "body": "premeditated"}, {"label": "C", "body": "inspirational"}, {"label": "D", "body": "fruitless"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of Yu’s novel. In this context, “haphazard” means marked
by a lack of plan or order. The text indicates that the quest featured in the novel, which involves the protagonist bouncing across time, is chaotic
and causes the reader to often wonder what will happen. This context suggests that the protagonist’s journey seems to be marked by a lack of
order.
Choice B is incorrect because the text indicates that the journey featured in Yu’s novel involves a character “ricocheting chaotically,” or bouncing
in a disordered way, across time and causes the reader to often wonder what will happen. It wouldn’t make sense to say that a chaotic journey
seems “premeditated,” or characterized by forethought and planning. Choice C is incorrect because the text doesn’t give any indication that
readers regard the journey in Yu’s novel as “inspirational,” or as causing extraordinarily creative or brilliant thoughts or actions; instead, the text
focuses on the idea that the protagonist’s journey is chaotic, or disordered, and doesn’t give readers a clear sense of what will happen. Choice D
is incorrect. Rather than suggesting that the journey featured in Yu’s novel is “fruitless,” or has an unsuccessful outcome, the text focuses on the
idea that while reading about the protagonist’s chaotic movements across time, readers are often unsure of what will happen—that is, they don’t
know whether the protagonist will be successful in finding his father.$qb$);
select seed_pool_question($qb$CB-bce627d9$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Mineralogical differences are detectable in samples collected from two locations on the near-Earth asteroid Ryugu, but such differences may not
indicate substantial compositional variations in the asteroid. Cosmochemist Kazuhide Nagashima and colleagues note that at the small scale of
the samples, the distribution of minerals is unlikely to be ______.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "neglected"}, {"label": "B", "body": "redundant"}, {"label": "C", "body": "ongoing"}, {"label": "D", "body": "uniform"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The text tells us that the samples are too "small scale" to reflect the composition of the asteroid, which probably
doesn’t show the same variation on a large scale. This suggests that the mineral composition of the samples are unlikely to be exactly the same
from sample to sample.
Choice A is incorrect. "Neglected" means "suffering a lack of proper care" or "abandoned," which doesn’t work here. The text never suggests that
the distribution of minerals in the samples would be neglected, so this statement doesn’t logically follow. Choice B is incorrect. "Redundant"
means "not or no longer useful or needed," which is too strong. The text doesn’t suggest that the variation between the samples isn’t a useful
finding at all—just that we can’t assume that the large-scale composition of the asteroid will show the same variation. But the composition of the
samples might be useful for something else. Choice C is incorrect. "Ongoing" means "still in progress," which doesn’t make sense: the
distribution of minerals in a sample can’t be "ongoing."$qb$);
select seed_pool_question($qb$CB-f83f0aab$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Some scientists have suggested that mammals in the Mesozoic era were not a very ______ group, but paleontologist Zhe-Xi Luo’s research
suggests that early mammals living in the shadow of dinosaurs weren’t all ground-dwelling insectivores. Fossils of various plant-eating
mammals have been found in China, including species like Vilevolodon diplomylos, which Luo says could glide like a flying squirrel.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "predatory"}, {"label": "B", "body": "obscure"}, {"label": "C", "body": "diverse"}, {"label": "D", "body": "localized"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of the kinds of mammals alive during the Mesozoic era. As
used in this context, “diverse” means to have a significant amount of variety. The text indicates that some scientists have suggested that
Mesozoic mammals can’t be characterized in a certain way, then contrasts the view put forward by those scientists with Luo’s research, which
shows that Mesozoic mammals “weren’t all ground-dwelling insectivores” and instead were “various.” This context suggests that some scientists
have viewed Mesozoic mammals as being all alike, or not a very diverse group.
Choice A is incorrect because it wouldn’t make sense to say that some scientists have suggested that Mesozoic mammals weren’t very
“predatory,” or that they didn’t prey on other animals, since the text establishes a contrast between what some scientists have suggested and
Luo’s research showing that Mesozoic mammals “weren’t all ground-dwelling insectivores.” This context suggests that some scientists have
regarded Mesozoic mammals as all being insectivores, or animals that prey on insects, not that some scientists have suggested that Mesozoic
mammals didn’t prey on other animals. Choice B is incorrect because it wouldn’t make sense to say that some scientists have suggested that
Mesozoic mammals weren’t very “obscure,” or concealed or not well known, since the text establishes a contrast between what some scientists
have suggested and Luo’s research showing that Mesozoic mammals were a varied group. There’s no contrast between saying that the
mammals weren’t concealed or well known and the mammals being varied. Choice D is incorrect because it wouldn’t make sense to say that
some scientists have suggested that Mesozoic mammals weren’t very “localized,” or confined to a particular area, since the text establishes a
contrast between what some scientists have suggested and Luo’s research showing that Mesozoic mammals were a varied group. There’s no
contrast between saying that the mammals weren’t localized and the mammals being varied. Although the text mentions mammal fossils found
in China, nothing in the discussion of Luo’s research addresses the limits of Mesozoic mammal habitats.$qb$);
select seed_pool_question($qb$CB-be947479$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Jazz tap is a dance form that was first developed in African American communities. Jazz tap was heavily influenced by jazz music, which
became widely popular in the United States in the 1920s. Tap dancers were inspired by jazz music’s quick rhythms and by the way jazz musicians
would make up melodies as they played. As jazz music continued to develop in the 1930s and 1940s, jazz tap evolved with it. Because of jazz
music’s influence, jazz tap quickly developed into a dance form that was very different from earlier kinds of tap dance.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "It explains why audiences prefer some kinds of music over others."}, {"label": "B", "body": "It discusses the development of a dance form."}, {"label": "C", "body": "It describes how to play a musical instrument."}, {"label": "D", "body": "It emphasizes the popularity of a famous dancer."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it best describes the main purpose of the text. The text indicates where and when jazz tap first developed
(in African American communities in the 1920s) and what influenced it (the quick rhythms and improvisations in jazz music) and then explains
that it evolved alongside jazz music in the 1930s and 1940s, resulting in a very different form of tap dance than had existed before. Therefore,
the main purpose of the text is to discuss jazz tap’s development.
Choice A is incorrect. Although the text indicates that jazz music became widely popular in the US in the 1920s and describes some of jazz
music’s qualities, the text never explains why audiences prefer some kinds of music—jazz or otherwise—over others. Choice C is incorrect
because the text never mentions any musical instruments and doesn’t describe how to play one. Choice D is incorrect because the text
discusses jazz tap generally and never identifies a particular dancer, famous or otherwise.$qb$);
select seed_pool_question($qb$CB-d5235d39$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Mule Bone, a 1930 play written by Zora Neale Hurston and Langston Hughes, is perhaps the best-known of the few examples of ______ in
literature. Most writers prefer working alone, and given that working together cost Hurston and Hughes their friendship, it is not hard to see why.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "characterization"}, {"label": "B", "body": "interpretation"}, {"label": "C", "body": "collaboration"}, {"label": "D", "body": "commercialization"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it logically and precisely completes the text’s discussion of The Mule Bone, a play that Zora Neale Hurston
and Langston Hughes wrote together. In this context, “collaboration” means working together with someone to write a literary work. The text
indicates that most writers prefer to work alone and that working together destroyed the friendship between Hurston and Hughes. This
establishes that The Mule Bone is a relatively rare example of collaboration in literature.
Choice A is incorrect because in this context, “characterization” would mean a literary work’s portrayal of characters’ psychological experiences
and motivations, but the text doesn’t discuss characterization in The Mule Bone specifically or in collaborative works more generally. Choice B is
incorrect because in this context, “interpretation” would mean the explanation of a literary work’s meaning or significance, but the text doesn’t
discuss how readers or critics have interpreted The Mule Bone; instead, the text discusses how the play was written collaboratively and how the
writing process affected the two authors. Choice D is incorrect because in this context, “commercialization” would mean writing a literary work in
such a way as to ensure its commercial appeal, but the text never discusses commercial appeal as a factor in the writing of The Mule Bone
specifically or the writing of collaborative works more generally.$qb$);
select seed_pool_question($qb$CB-3021d9ef$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In a 2020 paper, Arya Udry et al. cautioned that although similarities in the isotopic signatures of elements detected in Mars’s atmosphere and in
Martian meteorites recovered on Earth make it tempting to treat the geochemical properties of the meteorites as ______ those of Mars’s interiors,
Mars’s geology cannot be ascertained based solely on meteorite-sample analyses.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "contrivances of"}, {"label": "B", "body": "proxies for"}, {"label": "C", "body": "catalysts of"}, {"label": "D", "body": "deterrents to"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the relationship between Martian meteorites and Mars’s
interior geology. In this context, “proxies for” means substitutes used to represent something else. The text describes Udry and colleagues as
cautioning against a tempting line of reasoning: because the isotopic signatures (chemical fingerprints) of elements in Mars’s atmosphere
resemble those in Martian meteorites recovered on Earth, researchers might be inclined to treat the meteorites’ geochemical properties as
reasonably standing in for those of Mars’s interiors. The text indicates that Udry and colleagues argue against this reasoning, noting that Mars’s
geology cannot be determined solely from meteorite analysis. This context conveys that it is tempting to treat the meteorites’ properties as
proxies for those of Mars’s interiors.
Choice A is incorrect because “contrivances of” would mean things artificially devised or produced by something, and it wouldn’t make sense to
say that it’s tempting to treat the geochemical properties of meteorites as having been artificially produced by the planet the meteorites came
from; it’s not clear how a planet could fabricate such properties. Further, the text is focused on the idea that it’s tempting to treat the meteorites’
properties as standing in for those of Mars’s interiors, which likely wouldn’t be the case if the meteorite’s properties were considered artificial in
any way. Choice C is incorrect because “catalysts of” something are things that trigger or accelerate its change or action. The text focuses on the
idea of analyzing samples of Martian meteorites found on Earth to determine Mars’s geology; this suggests that the temptation is to view the
geochemical properties of the meteorites as direct evidence of those of Mars’s interior, not to treat them as though they had caused changes in
Mars’s interior geology. Choice D is incorrect because “deterrents to” something would mean things that discourage or prevent it, and it wouldn’t
make sense to say that it’s tempting to treat the geochemical properties of Martian meteorites as preventing the geochemical properties of
Mars’s interiors; the meteorites came from Mars and are no longer there, so their properties can’t have any effect on those of the planet.$qb$);
select seed_pool_question($qb$CB-1fbf276a$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Interruptions in the supply chain for microchips used in personal electronics have challenged an economist’s assertion that retailers can expect
robust growth in sales of those devices in the coming months. The delays are unlikely to ______ her projection entirely but will almost certainly
extend its time frame.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "dispute"}, {"label": "B", "body": "withdraw"}, {"label": "C", "body": "underscore"}, {"label": "D", "body": "invalidate"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of the economist’s claim about sales of personal
electronic devices. In this context, “invalidate” most nearly means nullify or make invalid. The text indicates that interruptions in the supply of
microchips for personal electronics “have challenged” the economist’s claim that sales of personal electronics will show strong growth in the
coming months. The text goes on to clarify the effect of the delays on the economist’s projection, stating that the delays are very likely to extend
the time frame over which the projected growth in sales will occur. This context suggests that the delays are unlikely to invalidate the
economist’s projection entirely—the delays will probably alter the time frame of the projection, not nullify it or make it invalid.
Choice A is incorrect because saying that the delays are unlikely to “dispute,” or argue against, the economist’s projection wouldn’t make sense.
Since the delays are an inanimate circumstance, they couldn’t argue against a prediction about the sales of personal electronics. Choice B is
incorrect because saying that the delays are unlikely to “withdraw,” or remove from consideration, the economist’s projection wouldn’t make
sense. Although the economist could withdraw her projection because of the delays, the delays themselves couldn’t withdraw her projection
since they’re an inanimate circumstance and thus can’t choose to remove something from consideration. Choice C is incorrect because there’s
nothing in the text to suggest that the delays will “underscore,” or emphasize, the economist’s projection. Instead, the text suggests that the
delays are likely to extend the time frame of the economist’s projection but not to undermine the projection entirely.$qb$);
select seed_pool_question($qb$CB-1c6b1fa0$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1801, a Blackfoot chief named Ac Ko Mok Ki drew a finely detailed map of the Upper Missouri region. This work demonstrates a vast amount-
of topographic knowledge, as the map features specific names of mountains and rivers, as well as the first-known sketch of the drainage-
network of the Missouri River. The map is especially notable because Ac Ko Mok Ki also included details about the numerous tribes that lived in-
the area.
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It emphasizes Ac Ko Mok Ki’s desire to represent other tribes on the map."}, {"label": "B", "body": "It explains how Ac Ko Mok Ki developed an interest in mapmaking."}, {"label": "C", "body": "It identifies some reasons why the map is impressive."}, {"label": "D", "body": "It details how the map was used for hunting and trading purposes."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it best describes how the underlined sentence functions in the text as a whole. The text presents
information about a map drawn by Blackfoot chief Ac Ko Mok Ki in 1801. The underlined sentence states that the map "demonstrates a vast
amount of topographic knowledge" and mentions that it features the "specific names of mountains and rivers" and includes the first-known
sketch of the Missouri River’s drainage network. These are all characteristics that indicate that the map was executed with remarkable skill.
Thus, the underlined sentence identifies some reasons why the map is impressive.
Choice A is incorrect. Though the sentence after the underlined sentence in the text mentions that Ac Ko Mok Ki included information about
other tribes on his map, the underlined sentence itself does not address this topic. Choice B is incorrect because nothing in the underlined
sentence indicates how Ac Ko Mok Ki became interested in mapmaking, only that his mapmaking skills are impressive. Choice D is incorrect
because though the underlined sentence describes several features of the map, it does not specifically describe how the map was used.$qb$);
select seed_pool_question($qb$CB-f4166aae$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In addition to being an accomplished psychologist himself, Francis Cecil Sumner was a ______ increasing the opportunity for Black students to
study psychology, helping to found the psychology department at Howard University, a historically Black university, in 1930.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "proponent of"}, {"label": "B", "body": "supplement to"}, {"label": "C", "body": "beneficiary of"}, {"label": "D", "body": "distraction for"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of Francis Cecil Sumner. As used in this context,
“proponent of” means supporter of. The text says that Sumner helped to found the psychology department at historically Black Howard
University in 1930. This is evidence that Sumner supported increasing the opportunity for Black students to study psychology.
Choice B is incorrect because the phrase “supplement to,” or addition to, wouldn’t make sense in context. The text discusses Sumner’s efforts to
increase the number of Black psychology students, but it doesn’t make sense to describe him as an addition to his efforts. Choice C is incorrect
because Sumner was already an accomplished psychologist himself when he helped to found the Howard University psychology department.
While Black students were the beneficiaries of his efforts—that is, they received help because of his efforts—it wouldn’t make sense in this
context to describe Sumner as a “beneficiary of” opportunities, because he was the one doing the helping. Choice D is incorrect because
founding a psychology department at Howard University wouldn’t be a “distraction for” Sumner’s aim to increase the opportunity for Black
students to study psychology—that is, it wouldn’t be something that draws Sumner’s attention away from that goal, but rather the opposite.$qb$);
select seed_pool_question($qb$CB-9b2fbb2e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Logically, a damaged fossil should provide less information than an intact one, but for paleontologist Brigitte Schoenemann, a broken area on a
fossilized trilobite (a crustacean-like creature) ______ fresh insight, allowing her to view the inner structure of the organism’s eye.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "resolved"}, {"label": "B", "body": "adjusted"}, {"label": "C", "body": "offered"}, {"label": "D", "body": "directed"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion about how, for Schoenemann, a damaged trilobite fossil
was informative. In context, “offered” means provided or gave. The text suggests that although it may seem counterintuitive, a broken fossilized
trilobite allowed Schoenemann to observe more details of the trilobite’s eye than an intact fossilized trilobite would. This context conveys the
idea that a damaged fossil offered, or provided, fresh insight into the structure of a trilobite’s eye.
Choice A is incorrect because “resolved” means determined or figured out, which wouldn’t make sense in this context. The text focuses on how
Schoenemann was able to get more information from a broken fossil than an intact one. Although the damaged fossil may have allowed her to
determine certain information, as an inanimate object the fossil isn’t capable of resolving anything. Choice B is incorrect because saying that the
broken part of a trilobite fossil “adjusted,” or changed or modified, fresh insight wouldn’t make sense in this context. The text focuses on how
Schoenemann was able to get more information from a broken fossil than an intact one. This context suggests that the fossil offered fresh
insight, or understanding, not that it adjusted fresh insight. Choice D is incorrect because “directed” means managed or instructed, which
wouldn’t make sense in this context. The text focuses on how Schoenemann was able to get more information from a broken fossil than an
intact one. This context suggests that the fossil offered fresh insight, or understanding, not that it directed fresh insight.$qb$);
select seed_pool_question($qb$CB-1782cdd7$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In many agricultural environments, the banks of streams are kept forested to protect water quality, but it’s been unclear what effects these
forests may have on stream biodiversity. To investigate the issue, biologist Xingli Giam and colleagues studied an Indonesian oil palm plantation,
comparing the species richness of forested streams with that of nonforested streams. Giam and colleagues found that species richness was
significantly higher in forested streams, a finding the researchers attribute to the role leaf litter plays in sheltering fish from predators and
providing food resources.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "It discusses research intended to settle a debate about how agricultural yields can be increased without negative effects on water quality."}, {"label": "B", "body": "It explains the differences between stream-protection strategies used in oil palm plantations and stream-protection strategies used in other kinds of agricultural environments."}, {"label": "C", "body": "It describes findings that challenge a previously held view about how fish that inhabit streams in agricultural environments attempt to avoid predators."}, {"label": "D", "body": "It presents a study that addresses an unresolved question about the presence of forests along streams in agricultural environments."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The author first describes an unresolved question: what effect do bank forests have on stream biodiversity? Then
the author presents a study that answers the question: bank forests increase stream biodiversity.
Choice A is incorrect. This isn’t the main purpose of the text. The text never mentions agricultural yields. Choice B is incorrect. This isn’t the main
purpose of the text. The text never mentions other kinds of agricultural environments. Choice C is incorrect. This isn’t the main purpose of the
text. The text never mentions any previously held view about how fish in these streams try to avoid predators.$qb$);
select seed_pool_question($qb$CB-d74788e1$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$British painter Peter Edwards has a ______ painting portraits of notable figures from a variety of different fields. These characteristic works
include his esteemed portraits of poet Wendy Cope and soccer player and coach Ryan Griggs.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "complaint about"}, {"label": "B", "body": "reputation for"}, {"label": "C", "body": "question about"}, {"label": "D", "body": "requirement for"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of Peter Edwards as a portrait painter. In this context,
having a "reputation for" something means that one is widely recognized for being associated with a particular activity. The text indicates that
Edwards has created "characteristic works" including "esteemed portraits" of notable figures, suggesting he is known and respected for this type
of painting. This choice clearly indicates that Edwards has established recognition or fame specifically in connection with painting portraits of
well-known individuals.
Choice A is incorrect because the text presents Edwards’s portrait painting in a positive manner, describing his works as "esteemed." In this
context, "complaint about" would mean dissatisfaction or grievance regarding the activity of painting portraits, which contradicts the positive
characterization of Edwards’s work. Nothing in the text suggests that Edwards has expressed any dissatisfaction with or objection to painting
portraits of notable figures. Choice C is incorrect because the text gives no indication that Edwards has a "question about" painting portraits,
which in this context would mean uncertainty or doubt regarding this activity. Instead, the text presents Edwards as someone who has already
created multiple portrait works described as "characteristic" and "esteemed," suggesting established practice rather than uncertainty. The
mention of specific examples of his portrait work further demonstrates that he is not questioning his portrait painting. Choice D is incorrect
because the text does not suggest that Edwards has a "requirement for" painting portraits, which in this context would mean a mandatory
obligation or necessary condition. Instead, the text indicates that portrait painting is something Edwards is known for doing well, not something
he is obligated to do. The text describes his portrait work as "characteristic," suggesting it’s a defining feature of his artistic practice rather than
an externally imposed requirement.$qb$);
select seed_pool_question($qb$CB-6d44060a$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Works of moral philosophy, such as Plato’s Republic or Aristotle’s Nicomachean Ethics, are partly concerned with how to live a morally good life.
But philosopher Jonathan Barnes argues that works that present a method of living such a life without also supplying a motive are inherently
useful only to those already wishing to be morally good—those with no desire for moral goodness will not choose to follow their rules. However,
some works of moral philosophy attempt to describe what constitutes a morally good life while also proposing reasons for living one.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It provides a characterization about a field of thought by noting two works in it and then details a way in which some works in that field are more comprehensive than others."}, {"label": "B", "body": "It mentions two renowned works and then claims that despite their popularity it is impossible for these works to serve the purpose their authors intended."}, {"label": "C", "body": "It summarizes the history of a field of thought by discussing two works and then proposes a topic of further research for specialists in that field."}, {"label": "D", "body": "It describes two influential works and then explains why one is more widely read than the other."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The text starts by stating what moral philosophy is concerned with and naming two examples of works in the field.
Then it describes a shortcoming of some works in that field (they say how but not why), and finally it states that other works try to avoid that
shortcoming (by including both how and why to live a morally good life).
Choice B is incorrect. This is too extreme. The text never mentions whether the two works are popular or not, and it never argues that these
works don’t serve their intended purpose of describing how to live a morally good life. Rather, the text claims that works of moral philosophy that
don’t include both how and why to be moral are not useful to readers who don’t already want to be moral. Choice C is incorrect. This isn’t the
overall structure. The text never discusses the history of moral philosophy at all, and it doesn’t propose any topic for further research. Choice D is
incorrect. This isn’t the overall structure. The text never discusses which of the two works is more widely read.$qb$);
select seed_pool_question($qb$CB-590f0ad2$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Industrial activity is often assumed to be a threat to wildlife, but that isn’t always so. Consider the silver-studded blue butterfly (--?Plebejus argus):
as forest growth has reduced grasslands in northern Germany, many of these butterflies have left meadow habitats and are now thriving in active
limestone quarries. In a survey of multiple active quarries and patches of maintained grassland, an ecologist found silver-studded blue butterflies
in 100% of the quarries but only 57% of the grassland patches. Moreover, butterfly populations in the quarries were four times larger than those
in the meadows.
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-590f0ad2.png$qb$, $qb$[{"label": "A", "body": "It challenges a common assumption about the species under investigation in the research referred to in the text."}, {"label": "B", "body": "It introduces discussion of a specific example that supports the general claim made in the previous sentence."}, {"label": "C", "body": "It suggests that a certain species should be included in additional studies like the one mentioned later in the text."}, {"label": "D", "body": "It provides a definition for an unfamiliar term that is central to the main argument in the text."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes how the underlined portion functions in the text as a whole. The first sentence
presents the general claim that industrial activity is not always a threat to wildlife. The underlined portion of the sentence that follows suggests
that the silver-studded blue butterfly is an example of wildlife thriving in areas of industrial activity: active limestone quarries. Thus, the function
of the underlined portion is to introduce a specific example in support of the general claim in the previous sentence.
Choice A is incorrect. Although the first sentence indicates that “industrial activity is often assumed” to harm wildlife, in the case of the silver-
studded blue butterfly the text mentions neither an assumption about this species nor any challenge to such an assumption. Choice C is
incorrect because the text mentions only one study: the “survey.” Additional studies are not mentioned in the text. Choice D is incorrect because
neither the underlined portion nor any other portion of the text provides a definition for any of the terms used in the text’s argument.$qb$);
select seed_pool_question($qb$CB-19688783$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from Lucy Maud Montgomery’s 1908 novel Anne of Green Gables. Anne, an eleven-year-old girl, has come to live on a farm
with a woman named Marilla in Nova Scotia, Canada.
Anne reveled in the world of color about her.
“Oh, Marilla,” she exclaimed one Saturday morning, coming dancing in with her arms full of gorgeous boughs, “I’m so glad I live in
a world where there are Octobers. It would be terrible if we just skipped from September to November, wouldn’t it? Look at these
maple branches. Don’t they give you a thrill—several thrills? I’m going to decorate my room with them.”
“Messy things,” said Marilla, whose aesthetic sense was not noticeably developed. “You clutter up your room entirely too much
with out-of-doors stuff, Anne. Bedrooms were made to sleep in.”
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To demonstrate that Anne has a newly developed appreciation of nature"}, {"label": "B", "body": "To describe an argument that Anne and Marilla often have"}, {"label": "C", "body": "To emphasize Marilla’s disapproval of how Anne has decorated her room"}, {"label": "D", "body": "To show that Anne and Marilla have very different personalities"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes the main purpose of the text. The text begins by noting that Anne “reveled in
the world of color about her”—that is, she takes great delight in colorful things. It then relates a scene when she enthusiastically enters the house
with autumn foliage and announces that she will decorate her room with it. The focus of the text then shifts to Marilla, who has an undeveloped
“aesthetic sense,” or appreciation of beauty, as can be seen when she dismisses the maple leaves as “messy things” and criticizes Anne for
cluttering her room with objects from outside. This episode thus illustrates that Anne and Marilla differ in their appreciation of beauty and, more
generally, in their basic character: Anne is exuberant and joyful, while Marilla is stern and critical. Therefore, the purpose of the text is to show
that Anne and Marilla have very different personalities.
Choice A is incorrect because the text presents Anne’s appreciation of nature as a basic personality trait, not as a newfound enthusiasm, and
never indicates how recently she developed that appreciation. Choice B is incorrect. Although the text portrays Anne and Marilla as having
different personalities and attitudes toward natural beauty and home decoration, it doesn’t show them engaging in an argument about this
difference or suggest that they often argue about it. Choice C is incorrect. Although the text does indicate that Marilla disapproves of how Anne
plans to decorate her room, Marilla’s disapproval is a supporting detail that serves to develop her personality, which the text as a whole contrasts
with Anne’s personality.$qb$);
select seed_pool_question($qb$CB-1107e7dc$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Economists often assert that countries looking to increase their reliance on solar energy should expand their capacity for storage; having an
ample reserve of stored energy can mitigate the effects of ______ solar energy collection caused by unpredictable shifts in cloud cover and haze.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "developments of"}, {"label": "B", "body": "fluctuations in"}, {"label": "C", "body": "calibrations with"}, {"label": "D", "body": "incentives for"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of solar energy collection and storage. In this context,
"fluctuations in" means irregular changes in. The text notes that economists recommend that countries that want to rely more on solar energy
(energy captured from sunlight) should attempt to expand their storage capacity. The text goes on to explain that having a large amount of
stored solar energy can lessen the negative effect of "unpredictable shifts in cloud cover and haze"—that is, unpredictable changes in
environmental conditions that at times limit sunlight. This context suggests that having ample solar energy stored and ready to use can mitigate
the issue of fluctuations in solar energy collection caused by irregular patterns of sunlight availability.
Choice A is incorrect because in this context, "developments of solar energy collection" would most clearly refer to the creation of ways to collect
solar energy (energy captured from sunlight). The text focuses on collection and the idea that having stored energy can mitigate, or make less
bad, the effects of a problem caused by unpredictable changes that affect sunlight ("cloud cover and haze"); there’s no reason to think that the
creation of new collection methods would be viewed as a problem that would need to be mitigated. Choice C is incorrect because in this context,
"calibrations with" would most clearly refer to precise adjustments for a particular purpose. The text focuses on the collection of solar energy
(energy captured from sunlight) and the idea that having stored energy can mitigate, or make less bad, the effects of a problem caused by
unpredictable changes that affect sunlight ("cloud cover and haze"); there’s no reason to think that precision in something related to solar energy
collection would be viewed as a problem that would need to be mitigated. Choice D is incorrect. The text focuses on the collection of solar
energy (energy captured from sunlight) and the idea that having stored energy can mitigate, or make less bad, the effects of a problem caused by
unpredictable changes that affect sunlight ("cloud cover and haze"); nothing in the text suggests that "incentives for," or rewards for, solar energy
collection would be viewed as a problem that would need to be mitigated, especially in countries that want to rely more on solar energy than they
already do.$qb$);
select seed_pool_question($qb$CB-d7dccee7$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In a 2019 study, Jeremy Gunawardena and colleagues found that the single-celled protozoan Stentor roeseli not only uses strategies to escape
irritating stimuli but also switches strategies when one fails. This evidence of protozoans sophisticatedly “changing their minds” demonstrates
that single-celled organisms may not be limited to ______ behaviors.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "aggressive"}, {"label": "B", "body": "rudimentary"}, {"label": "C", "body": "evolving"}, {"label": "D", "body": "advantageous"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of single-celled organism behavior. As used in this context,
“rudimentary” means basic or unsophisticated. According to the text, a study of the single-celled protozoan Stentor roeseli showed that the
organisms can switch strategies for escaping certain stimuli, “sophisticatedly ‘changing their minds’” and using new strategies should other
strategies fail. This context suggests that single-celled organisms may not be limited to behaviors that are basic or rudimentary, since the study
showed that single-celled protozoans can respond complexly to irritating stimuli.
Choice A is incorrect because the text doesn’t suggest that single-celled organisms may not be limited to behavior that is “aggressive,” or
threatening. Rather, the text suggests that single-celled organisms may not be limited to behaviors that are basic, since the study of Stentor
roeseli showed that single-celled protozoans can respond complexly to irritating stimuli. Choice C is incorrect because the text doesn’t suggest
that single-celled organisms may not be limited to behavior that is “evolving,” or advancing. Rather, the text suggests that single-celled organisms
may not be limited to behaviors that are basic, since the study of Stentor roeseli showed that single-celled protozoans can respond complexly to
irritating stimuli. Choice D is incorrect because the text doesn’t suggest that single-celled organisms may not be limited to behavior that is
“advantageous,” or helpful. Rather, the text suggests that single-celled organisms may not be limited to behaviors that are basic, since the study
of Stentor roeseli showed that single-celled protozoans can respond complexly to irritating stimuli.$qb$);
select seed_pool_question($qb$CB-d69bc408$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is adapted from Aphra Behn’s 1689 novel The Lucky Mistake. Atlante and Rinaldo are neighbors who have been secretly
exchanging letters through Charlot, Atlante’s sister.
[Atlante] gave this letter to Charlot; who immediately ran into the balcony with it, where she still found Rinaldo in a melancholy posture, leaning
his head on his hand: She showed him the letter, but was afraid to toss it to him, for fear it might fall to the ground; so he ran and fetched a
long cane, which he cleft at one end, and held it while she put the letter into the cleft, and stayed not to hear what he said to it. But never was
man so transported with joy, as he was at the reading of this letter; it gives him new wounds; for to the generous, nothing obliges love so much
as love.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It describes the delivery of a letter, and then portrays a character’s happiness at reading that letter."}, {"label": "B", "body": "It establishes that a character is desperate to receive a letter, and then explains why another character has not yet written that letter."}, {"label": "C", "body": "It presents a character’s concerns about delivering a letter, and then details the contents of that letter."}, {"label": "D", "body": "It reveals the inspiration behind a character’s letter, and then emphasizes the excitement that another character feels upon receiving that letter."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes the overall structure of the text. The narrator begins by explaining how Charlot
carefully delivers Atlante’s letter to Rinaldo, and then relates that Rinaldo feels “transported with joy” after reading the letter. Therefore, the overall
structure of the text is best described as a description of the delivery of a letter followed by the portrayal of a character’s happiness after reading
the letter.
Choice B is incorrect because the text indicates that the letter has been written; there’s no explanation why another character hasn’t written one.
In addition, the text’s description of Rinaldo “in a melancholy posture” suggests that he’s sad and thoughtful, not that he’s desperate to receive
the letter. Choice C is incorrect. Although the text states that Charlot won’t toss the letter to Rinaldo because she doesn’t want it to fall, the text
doesn’t refer to the contents of the letter. Instead, the text describes how happy Rinaldo feels after reading it. Choice D is incorrect. Although the
text does describe Rinaldo’s reaction to the letter, the text doesn’t begin by discussing Atlante’s inspiration for writing the letter. Instead, the text
begins by discussing the delivery of the letter.$qb$);
select seed_pool_question($qb$CB-22105871$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
In a study of insect behavior, Samadi Galpayage and colleagues presented bumblebees with small wooden balls and observed many of the bees
clinging to, rolling, and dragging the objects. The researchers provided no external rewards (such as food) to encourage these interactions. The-
bees simply appeared to be playing-—and for no other reason than because they were having fun.
Text 2
Insects do not have cortexes or other brain areas associated with emotions in humans. Still, Galpayage and her team have shown that
bumblebees may engage in play, possibly experiencing some kind of positive emotional state. Other studies have suggested that bees
experience negative emotional states (for example, stress), but as Galpayage and her team have acknowledged, emotions in insects, if they do
indeed exist, are likely very rudimentary.
Based on the texts, how would the author of Text 2 most likely respond to the underlined portion of Text 1?$qb$, null, $qb$[{"label": "A", "body": "By objecting that the bees were actually experiencing a negative feeling akin to stress rather than a positive feeling"}, {"label": "B", "body": "By arguing that some insects other than bumblebees may be capable of experiencing complex emotional states"}, {"label": "C", "body": "By pointing out that even humans sometimes struggle to have fun while engaging in play"}, {"label": "D", "body": "By noting that if the bees were truly playing, any positive feelings they may have experienced were probably quite basic"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The author of Text 2 agrees with the author of Text 1 that bumblebees may engage in play and possibly experience
some kind of positive emotional state. However, the author of Text 2 also qualifies this claim by stating that emotions in insects, if they do exist,
are “likely very rudimentary.”
Choice A is incorrect. While Text 2 states that other studies might indicate “negative emotional states” in bees, it does not contradict the findings
from the Galpayage study—that the bees might have been having fun. Choice B is incorrect. The author of Text 2 does not mention or imply that
any insects, including bumblebees, are capable of experiencing complex emotional states. The author of Text 2 states that if insects do feel
emotions, those emotions are “likely very rudimentary.” Choice C is incorrect. The author of Text 2 does not compare or contrast the behavior or
emotions of insects and humans, and neither does the author of Text 1.$qb$);
select seed_pool_question($qb$CB-a1d2c4d0$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Pteropods are small swimming snails with thin, delicate calcium carbonate shells. These animals are thought to be especially vulnerable to
ocean acidification due to calcium carbonate’s susceptibility to dissolution at lower pH values. Victoria L. Peck and colleagues recently found
that the periostracum (a protective coating on pteropods’ outer shells) prevents this dissolution when intact. Moreover, the team was surprised
to discover that even when the periostracum is breached, pteropods can still mitigate damage by rebuilding the inner shell wall.
Which choice best describes the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To call for additional research on biological mechanisms that improve pteropod survival rates"}, {"label": "B", "body": "To discuss a conclusion drawn in a study of calcium carbonate’s role in protecting the periostracum of pteropods"}, {"label": "C", "body": "To address some of the ways ocean acidification has altered pteropod behavior over time"}, {"label": "D", "body": "To present findings that suggest that a concern about the effects of ocean acidification on pteropod shells may be unwarranted"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes the main purpose of the text, which is to present findings that suggest a
previously held concern about the effects of ocean acidification on pteropod shells may be unwarranted. The text introduces the concern that
pteropods are thought to be particularly vulnerable to ocean acidification, or lower pH levels, due to the susceptibility of their calcium carbonate
shells to dissolution at lower pH levels. However, the text then describes findings from a recent study that suggest this concern may be
unjustified, insofar as the protective periostracum coating on a pteropod’s shell prevents dissolution, and even when the coating is breached, a
pteropod can rebuild the inner shell wall, reducing the damage.
Choice A is incorrect because the text doesn’t call for additional research or suggest that more research is needed on biological mechanisms
that improve pteropod survival rates. Instead, the text discusses a recent study showing that pteropods may not be as vulnerable to ocean
acidification as is feared. Choice B is incorrect because the study discussed in the text doesn’t address calcium carbonate’s role in protecting the
periostracum of pteropods. According to the text, the study addresses the periostracum’s role in protecting pteropods’ calcium carbonate shells
from dissolution due to ocean acidification. Choice C is incorrect because the text doesn’t address how ocean acidification has altered pteropod
behavior over time. Instead, the text focuses on the potential effects of ocean acidification on pteropods’ shells and the mechanisms protecting
against those effects.$qb$);
select seed_pool_question($qb$CB-02e49a0c$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Genetic studies have led researchers to suggest that turtles are most closely related to the group that includes modern crocodiles. But studies of
fossils have suggested instead that turtles are most closely related to other groups, such as the one that contains modern snakes. However,-
many of the fossil studies have relied on incomplete data sets.- For a 2022 investigation, biologist Tiago R. Simões and colleagues examined
more than 1,000 reptile fossils collected worldwide. From this large data set, they found clear agreement with the results of the genetic studies.
Which choice best describes the function of the underlined sentence?$qb$, null, $qb$[{"label": "A", "body": "It offers an overview of the tools scientists use to examine fossils."}, {"label": "B", "body": "It describes a limitation of some studies about the origin of turtles."}, {"label": "C", "body": "It summarizes previous research on the evolution of crocodiles."}, {"label": "D", "body": "It criticizes a widely held belief about genetic studies of reptiles."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes how the underlined sentence functions in the text as a whole. The first two
sentences introduce two competing views on the origins of turtles. Genetic studies place them closer to the group that includes crocodiles, while
fossil studies indicate that they’re more closely related to other groups, including one that contains snakes. The next sentence, which is
underlined, presents a limitation with many of the studies of fossils: their reliance on “incomplete data sets.” The last sentence summarizes a
fossil study that used more complete data (“more than 1,000 reptile fossils”), which supported the genetics studies’ conclusions about turtles.
Thus, the underlined sentence mainly functions to describe a limitation of some studies about the origin of turtles.
Choice A is incorrect because the underlined sentence doesn’t address the topic of the tools used by scientists to examine fossils. Instead, the
sentence introduces a shortcoming of many fossil studies conducted on turtle origins. Choice C is incorrect because neither the underlined
portion nor the text as a whole discusses the evolution of crocodiles. Modern crocodiles are mentioned earlier in the text because, according to
genetic studies, they are a part of the group that turtles may be closely related to. Choice D is incorrect. The underlined sentence is raising an
issue with fossil studies, not genetic studies, saying that fossil studies have at times relied on incomplete data. Furthermore, the sentence
doesn’t reference any widely held beliefs. Earlier in the text, hypotheses are mentioned that are suggested by genetic studies and fossil studies,
but the underlined sentence is just introducing a limitation of some fossil studies.$qb$);
select seed_pool_question($qb$CB-27d9bb69$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Many studies in psychology have shown that people seek out information even when they know in advance that they have no immediate use for
it and that they won’t directly benefit from it. Such findings support the consensus view among researchers of curiosity: namely, that curiosity is
not instrumental but instead represents a drive to acquire information for its own sake.
Text 2
While acknowledging that acquiring information is a powerful motivator, Rachit Dubey and colleagues ran an experiment to test whether
emphasizing the usefulness of scientific information could increase curiosity about it. They found that when research involving rats and fruit flies
was presented as having medical applications for humans, participants expressed greater interest in learning about it than when the research
was not presented as useful.
Based on the texts, how would Dubey and colleagues (Text 2) most likely respond to the consensus view discussed in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By suggesting that curiosity may not be exclusively motivated by the desire to merely acquire information"}, {"label": "B", "body": "By conceding that people may seek out information that serves no immediate purpose only because they think they can use it later"}, {"label": "C", "body": "By pointing out that it is challenging to determine when information-seeking serves no goal beyond acquiring information"}, {"label": "D", "body": "By disputing the idea that curiosity can help explain apparently purposeless information-seeking behaviors"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The researchers in Text 2 recognize that acquiring information is a powerful motivator, but showed that this
motivation can still be affected by other factors, like whether or not the information is expected to be useful or not. This suggests that other
desires may play a part in driving people to acquire information.
Choice B is incorrect. The consensus view in Text 1 is that people acquire information regardless of whether they think they can use it later.
Dubey and colleagues acknowledge this fact (so they don’t claim people seek out information “only” because it might be useful later). Choice C
is incorrect. This choice misreads the results of Dubey and colleagues’ study in Text 2. Neither text discusses the difficulty of determining the
motivation for information-seeking. Choice D is incorrect. This choice contradicts Text 2, which starts with Dubey and colleagues
“acknowledging that acquiring information is a powerful motivator” (i.e., agreeing that curiosity explains the seeking of apparently purposeless
information). The research in Text 2 simply suggests that more than just curiosity can motivate information-seeking behavior when the
information has a purpose.$qb$);
select seed_pool_question($qb$CB-c885c38b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Conventional wisdom long held that human social systems evolved in stages, beginning with hunter-gatherers forming small bands of members
with roughly equal status. The shift to agriculture about 12,000 years ago sparked population growth that led to the emergence of groups with
hierarchical structures: associations of clans first, then chiefdoms, and finally, bureaucratic states.
Text 2
In a 2021 book, anthropologist David Graeber and archaeologist David Wengrow maintain that humans have always been socially flexible,
alternately forming systems based on hierarchy and collective ones with decentralized leadership. The authors point to evidence that as far back
as 50,000 years ago some hunter-gatherers adjusted their social structures seasonally, at times dispersing in small groups but also assembling
into communities that included esteemed individuals.
Based on the texts, how would Graeber and Wengrow (Text 2) most likely respond to the “conventional wisdom” presented in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By conceding the importance of hierarchical systems but asserting the greater significance of decentralized collective societies"}, {"label": "B", "body": "By disputing the idea that developments in social structures have followed a linear progression through distinct stages"}, {"label": "C", "body": "By acknowledging that hierarchical roles likely weren’t a part of social systems before the rise of agriculture"}, {"label": "D", "body": "By challenging the assumption that groupings of hunter-gatherers were among the earliest forms of social structure"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it describes the most likely way that Graeber and Wengrow (Text 2) would respond to the “conventional
wisdom” presented in Text 1. According to Text 1, the conventional wisdom about human social systems is that they developed through stages,
beginning with hunter-gatherer bands, then moving to clan associations, then chiefdoms, and finally arriving at states with bureaucratic
structures. Text 2 indicates that Graeber and Wengrow believe that human social systems have been flexible, shifting between different types of
structures, including both hierarchical and collective systems, and that these shifts may have even occurred seasonally. This suggests that
Graeber and Wengrow would dispute the idea that developments in social structures have followed a linear progression through distinct stages.
Choice A is incorrect because nothing in Text 2 suggests that Graeber and Wengrow believe that decentralized collective societies are more
significant than hierarchical systems. Text 2 is focused on Graeber and Wengrow’s view that humans have flexibly shifted among various social
structures, not on the importance of particular structures relative to others. Choice C is incorrect because Text 2 doesn’t include any information
suggesting that Graeber and Wengrow believe that hierarchies didn’t emerge until after the rise of agriculture. In fact, Text 2 indicates that
Graeber and Wengrow cite evidence suggesting that some hunter-gatherer groups formed social structures with hierarchical elements
(“communities that included esteemed individuals”) 50,000 years ago, long before the rise of agriculture, which Text 1 says occurred around
12,000 years ago. Choice D is incorrect because there’s no information in Text 2 suggesting that Graeber and Wengrow would challenge the
assumption that groupings of hunter-gatherers were among the earliest forms of social structure. Although Text 1 does indicate that hunter-
gatherer groups are assumed to be the earliest human social system, Text 2 says only that Graeber and Wengrow believe that some hunter-
gatherer groups made use of different social structures at different times. Text 2 doesn’t imply that Graeber and Wengrow doubt that hunter-
gatherer groups preceded most other social structures.$qb$);
select seed_pool_question($qb$CB-de2c2f57$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
The fossil record suggests that mammoths went extinct around 11 thousand years (kyr) ago. In a 2021 study of environmental DNA (eDNA)—
genetic material shed into the environment by organisms—in the Arctic, Yucheng Wang and colleagues found mammoth eDNA in sedimentary
layers formed millennia later, around 4 kyr ago. To account for this discrepancy, Joshua H. Miller and Carl Simpson proposed that arctic
temperatures could preserve a mammoth carcass on the surface, allowing it to leach DNA into the environment, for several thousand years.
Text 2
Wang and colleagues concede that eDNA contains DNA from both living organisms and carcasses, but for DNA to leach from remains over
several millennia requires that the remains be perpetually on the surface. Scavengers and weathering in the Arctic, however, are likely to break
down surface remains well before a thousand years have passed.
Which choice best describes how Text 1 and Text 2 relate to each other?$qb$, null, $qb$[{"label": "A", "body": "Text 1 discusses two approaches to studying mammoth extinction without advocating for either, whereas Text 2 advocates for one approach over the other."}, {"label": "B", "body": "Text 1 presents findings by Wang and colleagues and gives another research team’s attempt to explain those findings, whereas Text 2 provides additional detail that calls that explanation into question."}, {"label": "C", "body": "Text 1 describes Wang and colleagues’ study and a critique of their methodology, whereas Text 2 offers additional details showing that methodology to be sound."}, {"label": "D", "body": "Text 1 argues that new research has undermined the standard view of when mammoths went extinct, whereas Text 2 suggests a way to reconcile the standard view with that new research."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. Text 1 introduces Wang and colleagues’ study and its surprising results, and then mentions Miller and Simpson’s
hypothesis as a possible way to explain them. Text 2, however, challenges Miller and Simpson’s hypothesis by pointing out the difficulties of
preserving mammoth carcasses on the surface for thousands of years: “scavengers and weathering” are the additional details that complicate
the Miller/Simpson hypothesis.
Choice A is incorrect. Neither text compares two different approaches for studying mammoth extinction. Text 1 describes one study and one
hypothesis pertaining to it. Text 2 critiques that hypothesis. Choice C is incorrect. Text 1 does not describe a critique of Wang and colleagues’
methodology, but rather an interpretation of their results by Miller and Simpson. Text 2 does not offer additional details showing that
methodology to be sound, but rather casts doubt on the Miller/Simpson explanation. Choice D is incorrect. Both components mentioned here
(the new “undermining” research and the theory for reconciling this discovery) are contained in Text 1. Text 2 then shows how the attempt to
reconcile the standard view and new research is flawed, and still fails to explain the discrepancy.$qb$);
select seed_pool_question($qb$CB-3f753a8e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Investigating whether shared false visual memories—specific but inaccurate and widely held recollections of images such as product logos—are
caused by people’s previous ______ incorrect renditions of the images, researchers Deepasri Prasad and Wilma Bainbridge found that, in fact,
such memories are often not explained by familiarity with erroneous versions of the images.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "compliance with"}, {"label": "B", "body": "exposure to"}, {"label": "C", "body": "criteria for"}, {"label": "D", "body": "forfeiture of"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Exposure to" means "having contact with." It makes sense that Prasad and Bainbridge were investigating whether
seeing false versions of images was a cause of false visual memories. Notice how "exposure to incorrect renditions" matches the idea of
"familiarity with erroneous versions," which appears later in the sentence.
Choice A is incorrect. "Compliance with" means "going along with a command or directive." False versions of images can’t give commands or
directives, so this doesn’t apply. Choice C is incorrect. "Criteria" means "standards by which to judge something." It’s not clear how people would
come to have standards for the wrong version of an image in the first place, let alone how those standards would cause them to falsely
remember the correct version. In other words, this choice would result in a confusing, unclear sentence. Choice D is incorrect. "Forfeiture of"
means "a giving up of something." It wouldn’t make sense to say that false memories of an image might be caused by giving up the wrong
version of the image.$qb$);
select seed_pool_question($qb$CB-53542eb5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Shoppers can help keep money cycling within a community by making purchases at small local businesses instead of large retailers. Some cities
are ______ programs to encourage this behavior, establishing reward points and other incentives for shopping at small businesses.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "instituting"}, {"label": "B", "body": "occupying"}, {"label": "C", "body": "underestimating"}, {"label": "D", "body": "encountering"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of programs that encourage money to cycle within a
community. In this context, "instituting" means initiating. The text indicates that making purchases at small local businesses can help keep
money cycling within a community. The text goes on to state that some cities are establishing incentives to promote small business shopping.
This context supports the idea that some cities are instituting programs to encourage this consumer behavior.
Choice B is incorrect because saying that some cities are "occupying," or forcibly holding possession or control of, programs that encourage
shoppers to make purchases at small local businesses wouldn’t make sense in context. The text doesn’t discuss who controls these programs
but instead indicates that some cities are establishing incentives that encourage shoppers to make purchases at small local businesses.
Furthermore, it wouldn’t make sense to say that a city is occupying a program. Choice C is incorrect because nothing in the text suggests that
cities are "underestimating," or failing to understand the value of, programs that encourage consumers to shop at small local businesses. The
text indicates that some cities are establishing incentives to encourage small business shopping, which suggests that these cities understand
the value of such programs. Choice D is incorrect because saying that some cities are "encountering," or coming into contact with, programs that
encourage consumers to shop at small local businesses wouldn’t make sense in context. The text indicates that some cities are already
establishing incentives to encourage shoppers to make purchases at small businesses. This context suggests that the cities are instituting the
programs, not that they are encountering them.$qb$);
select seed_pool_question($qb$CB-3bd32343$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is adapted from Henry James’s 1881 novel The Portrait of a Lady.
Everything Osmond did was pose—pose so subtly considered that if one were not on the lookout one mistook it for impulse. Ralph
had never met a man who lived so much in the land of consideration. His tastes, his studies, his accomplishments, his collections,-
were all for a purpose.
As used in the text, what does the word “consideration” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Deference"}, {"label": "B", "body": "Courtesy"}, {"label": "C", "body": "Calculation"}, {"label": "D", "body": "Indecision"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because as used in the text, “consideration” most nearly means calculation. The text describes Osmond as someone
whose every action is a “pose;” that is, he adopted a deliberate appearance crafted so subtly that an unwary observer “mistook it for impulse.”
The text further indicates that Osmond’s tastes, studies, accomplishments, and collections “were all for a purpose,” meaning each was
strategically chosen to serve some intended end. The phrase “the land of consideration” thus characterizes Osmond as someone whose mental
life is dominated by deliberate planning—that is, calculation.
Choice A is incorrect because “deference,” meaning submissive yielding to others’ wishes, wouldn’t make sense in context. The text portrays
Osmond as a man who carefully crafts his own image and arranges his life “for a purpose,” which suggests self-direction rather than yielding to
others. Choice B is incorrect because although “consideration” can mean courtesy, or thoughtful regard for others, this meaning wouldn’t fit the
text, which characterizes the calculated, purposeful nature of Osmond’s behavior, not his treatment of other people. Choice D is incorrect
because “indecision,” meaning the inability to make a choice, wouldn’t make sense in context. The text portrays Osmond as decisive in his self-
presentation: each pose is “subtly considered,” and his tastes and accomplishments serve “a purpose,” indicating firm choices made in service of
his aims.$qb$);
select seed_pool_question($qb$CB-6c64a8f3$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Ecologist Exequiel Ezcurra and colleagues found that the inhabitants of the Mexica empire used natural landmarks to track time with a high
degree of ______. By observing the sun’s position in relation to various points on the mountains surrounding the Basin of Mexico, the Mexica were
able to precisely identify the dates when significant events such as solstices occurred.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "precariousness"}, {"label": "B", "body": "exactitude"}, {"label": "C", "body": "resilience"}, {"label": "D", "body": "inconspicuousness"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the method the inhabitants of the Mexica empire used
to track time. In this context, "exactitude" means precision. The text indicates that the Mexica used the sun’s position relative to various natural
landmarks to track the passage of time, explaining that such methods allowed the Mexica to accurately determine the dates of important events
such as solstices. This context supports the idea that the Mexica people were able to track time with a high degree of precision, or exactitude.
Choice A is incorrect because in this context "precariousness" would mean instability, and there’s nothing in the text to suggest that the method
used by the Mexica people to track time was unstable or produced unstable results. Rather, the text indicates that the method yielded precise
results, allowing the Mexica to accurately determine the dates of significant events. Choice C is incorrect because in this context "resilience"
would mean persistence, and there’s nothing in the text to suggest that the Mexica worked stubbornly in spite of obstacles in order to track time.
Choice D is incorrect because in this context "inconspicuousness" would mean discreetness, and there’s nothing in the text to suggest that the
Mexica wanted to track time without being noticed.$qb$);
select seed_pool_question($qb$CB-82b7c3b2$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is from Booth Tarkington’s 1921 novel Alice Adams.
Mrs. Adams had always been fond of vases, she said, and every year her husband’s Christmas present to her was a vase of one
sort or another—whatever the clerk showed him, marked at about twelve or fourteen dollars.-
As used in the text, what does the word “marked” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Staged"}, {"label": "B", "body": "Priced"}, {"label": "C", "body": "Stained"}, {"label": "D", "body": "Watched"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The text suggests that Mrs. Adam’s typical Christmas present from her husband was a vase that cost, or was
"priced at," about twelve or fourteen dollars.
Choice A is incorrect. This isn’t the meaning of "marked" as used here. It wouldn’t make sense to say that a vase was "staged at twelve or
fourteen dollars." Choice C is incorrect. This isn’t the meaning of "marked" as used here. It wouldn’t make sense to say that a vase was "stained
at twelve or fourteen dollars." Choice D is incorrect. This isn’t the meaning of "marked" as used here. It wouldn’t make sense to say that a vase
was "watched at twelve or fourteen dollars."$qb$);
select seed_pool_question($qb$CB-662892ad$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Wakako Yamauchi is best known for And the Soul Shall Dance, her 1977 play about a Japanese American family in Southern California. The play
is based on a short story Yamauchi had published three years earlier. Adapting the story wasn’t easy. Theater relies on dialogue between
characters, but the original story features little dialogue and instead describes its characters’ silent thoughts. To transform the story into a play,-
Yamauchi created situations where characters reveal their thoughts by speaking them aloud during conversations with each other.-
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It offers information about how Yamauchi adapted her short story into a play."}, {"label": "B", "body": "It argues that Yamauchi’s play influenced later playwrights."}, {"label": "C", "body": "It explains why Yamauchi’s short story is better known than the play adaptation is."}, {"label": "D", "body": "It describes how Yamauchi chose the actors who performed in the play."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it best describes how the underlined sentence functions in the text as a whole. According to the text, it was
hard for Yamauchi to adapt her short story into the play And the Soul Shall Dance because the story had included little dialogue, instead
describing the characters’ silent thoughts. The underlined sentence offers information about how Yamauchi ultimately succeeded in adapting
the story into a play: it explains that Yamauchi created situations where the characters of the play could reveal their internal thoughts while
speaking with each other.
Choice B is incorrect because neither the underlined sentence nor the text as a whole makes any mention of playwrights other than Yamauchi or
how the play might have influenced them. Choice C is incorrect because the text states that Yamauchi is best known for her play And the Soul
Shall Dance, which conveys that the play is better known than the short story it’s based on is. Choice D is incorrect because neither the underlined
sentence nor the text as a whole mentions the actors who performed in the play or Yamauchi’s approach to choosing them.$qb$);
select seed_pool_question($qb$CB-d563bf65$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Jean Webster’s 1912 novel Daddy-Long-Legs. The narrator is a young college student writing letters detailing
her weekly experiences.
[The college is] organizing the Freshman basket-ball team and there’s just a chance that I shall make it. I’m little of course, but
terribly quick and wiry and tough. While the others are hopping about in the air, I can dodge under their feet and grab the ball.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To compare basketball with other sports"}, {"label": "B", "body": "To provide details of how to play basketball"}, {"label": "C", "body": "To state how players will be chosen for the basketball team"}, {"label": "D", "body": "To explain why the narrator thinks she might make the basketball team"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes the main purpose of the text. In the first sentence of the text, the narrator
states that she thinks there’s a chance she will become part of the basketball team at her college. She goes on to explain that she is "quick" and
"tough." Based on these characteristics, she thinks she has a chance to join the team. Thus, the main purpose of the text is to explain why the
narrator thinks she might make the basketball team.
Choice A is incorrect because the text focuses solely on basketball and doesn’t mention any other kinds of sports. Choice B is incorrect because
the text doesn’t describe aspects of the game of basketball. Instead, it provides the narrator’s reasoning for thinking that she might make her
school basketball team. Choice C is incorrect. Although the narrator explains why she thinks she will be chosen for the basketball team at her
school, the text doesn’t go into the general decision-making process or the requirements for being picked for the team.$qb$);
select seed_pool_question($qb$CB-159ef46d$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Text 1
Although food writing is one of the most widely read genres in the United States, literary scholars have long neglected it. And within this genre,
cookbooks attract the least scholarly attention of all, regardless of how well written they may be. This is especially true of works dedicated to
regional US cuisines, whose complexity and historical significance are often overlooked.
Text 2
With her 1976 cookbook The Taste of Country Cooking, Edna Lewis popularized the refined Southern cooking she had grown up with in Freetown,
an all-Black community in Virginia. She also set a new standard for cookbook writing: the recipes and memoir passages interspersing them are
written in prose more elegant than that of most novels. Yet despite its inarguable value as a piece of writing, Lewis-’s masterpiece has received
almost no attention from literary scholars.-
Based on the two texts, how would the author of Text 1 most likely regard the situation presented in the underlined sentence in Text 2?$qb$, null, $qb$[{"label": "A", "body": "As typical, because scholars are dismissive of literary works that achieve popularity with the general public"}, {"label": "B", "body": "As unsurprising, because scholars tend to overlook the literary value of food writing in general and of regional cookbooks in particular"}, {"label": "C", "body": "As justifiable, because Lewis incorporated memoir into The Taste of Country Cooking, thus undermining its status as a cookbook"}, {"label": "D", "body": "As inevitable, because The Taste of Country Cooking was marketed to readers of food writing and not to readers of other genres"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. Text 1 states that literary scholars ignore regional cookbooks most of all, even when they have historical
significance and are well written. So the author of Text 1 wouldn’t be surprised that scholars ignored Edna Lewis’s cookbook.
Choice A is incorrect. We can’t infer that this is how the author of Text 1 would regard the situation. Text 1 never suggests that scholars are
dismissive of popular works in general. Instead, Text 1 says that scholars ignore food writing specifically, despite its popularity—and despite the
fact that it can be historically significant and complex. Choice C is incorrect. We can’t infer that this is how the author of Text 1 would regard the
situation. Text 1 never suggests that elements of other genres should be kept out of cookbooks. Choice D is incorrect. We can’t infer that this is
how the author of Text 1 would regard the situation. Text 1 never discusses how food writing is or should be marketed.$qb$);
select seed_pool_question($qb$CB-d7807ec8$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Political blogs with conspicuous ideological alignments became an integral component of US media in the early 2000s. While some
commentators lauded this development, asserting that such blogs had a welcome transparency missing from traditional news, less ______
observers countered that such blogs tended to ideological extremes that exacerbated political polarization to problematic levels.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "sanguine"}, {"label": "B", "body": "recalcitrant"}, {"label": "C", "body": "misanthropic"}, {"label": "D", "body": "earnest"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of political blogs. In this context, "sanguine" means
optimistic. The text begins by noting the rise of political blogs with readily identifiable ideological alignments in the early 2000s. The text then
indicates that some commentators saw this as a positive development, citing a reason why (their difference from traditional news). Finally, the
text goes on to contrast those commentators with others who have a negative opinion of the rise of political blogs (because they increase
political polarization among their readers). This context supports the idea that the second group of commentators is less positive than the first:
thus, the second group of commentators is less optimistic, or sanguine.
Choice B is incorrect because it would not make sense in this context to describe those commentators who have a negative opinion of political
blogs as less "recalcitrant," or obstinately uncooperative, than those commentators who supported political blogs. Choice C is incorrect because
the text gives no indication that those commentators who have a negative opinion of political blogs are less "misanthropic," or less
contemptuous of humankind, than those commentators who have a positive opinion of political blogs—there is no indication in the text that
those commentators who like political blogs would be contemptuous of humankind at all. Choice D is incorrect because there is no evidence that
those commentators who have a negative opinion of political blogs are less "earnest," or sincere, than those who have a positive opinion of such
blogs—presumably, both groups of commentators hold their beliefs with equal conviction.$qb$);
select seed_pool_question($qb$CB-e1e89221$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is from Frances Hodgson Burnett’s 1911 novel The Secret Garden. Mary, a young girl, is outside trying her new jump rope.
The sun was shining and a little wind was blowing—not a rough wind, but one which came in delightful little gusts and brought a-
fresh scent of newly turned earth with it. She skipped round the fountain garden, and up one walk and down another.
As used in the text, what does the word “rough” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Harsh"}, {"label": "B", "body": "Scratchy"}, {"label": "C", "body": "Basic"}, {"label": "D", "body": "Vague"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because as used in the text, "rough" most nearly means harsh, or forceful and unpleasant. The text describes Mary’s
surroundings as she plays: the sun is out and there’s "a little wind." To further illustrate the wind, the narrator contrasts the word "rough" with a
description of the wind blowing in "delightful little gusts," suggesting that the wind is not unpleasant or harsh at all.
Choice B is incorrect. Although in some contexts "rough" objects, or objects with irregular surfaces, can sometimes be scratchy, rough doesn’t
mean scratchy in this context. The text explains that the wind is not rough but rather gentle, "delightful little gusts," which suggests that the use
of "rough" here is referring to the degree of force of the wind. Choice C is incorrect because there’s nothing in the text to suggest that the wind
wasn’t "basic," or simple and uncomplicated. Instead, the text describes the wind as blowing not roughly or harshly but in "delightful little gusts."
Choice D is incorrect because the word "vague" means not clearly expressed or seen. Nothing in the text indicates that the wind was barely
noticeable to Mary as she played outside, but rather the text states that it was delightful.$qb$);
select seed_pool_question($qb$CB-b11bb2a3$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Amy Lowell’s 1912 poem “Summer.”
It is summer, glorious, deep-toned summer,
The very crown of nature’s changing year
When all her surging life is at its full.
To me alone it is a time of pause,
A void and silent space between two worlds,-
When inspiration lags, and feeling sleeps,
Gathering strength for efforts yet to come.
As used in the text, what does the phrase “a void” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "A useless"}, {"label": "B", "body": "An empty"}, {"label": "C", "body": "A forgotten"}, {"label": "D", "body": "An incomplete"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because as used in the text, a span of time is described as "a void" space, which most nearly means an empty or
vacant one. In the text, the speaker describes summertime in counterintuitive terms: although nature’s "surging life is at its full" during the
season, the speaker feels summer to be "a time of pause, / A void and silent space between two worlds." The speaker says further that during
summer, "feeling sleeps / Gathering strength" for future efforts. Thus, the speaker regards summer as an empty stretch of time, to be followed by
a period of greater activity.
Choice A is incorrect. Although the text does present summer as a time of inactivity, it doesn’t characterize that inactivity as useless, or as having
no purpose; in fact, the speaker regards summer as a time when "feeling" gathers "strength for efforts yet to come." Choice C is incorrect.
Although the text characterizes summer as a time "when inspiration lags, and feeling sleeps," it doesn’t discuss the season’s relationship to the
speaker’s memory or suggest that summer can easily be forgotten. Choice D is incorrect. In some contexts, "void" can mean devoid of, or lacking,
a particular element, and such a lack could be conceived of as incompleteness. However, the text doesn’t portray summer as not being complete
or whole; instead, it characterizes vacancy or inactivity as being an essential quality of the season, as experienced by the speaker.$qb$);
select seed_pool_question($qb$CB-97360a00$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is adapted from Gwendolyn Bennett’s 1926 poem “Street Lamps in Early Spring.”
Night wears a garment
All velvet soft, all violet blue...
And over her face she draws a veil
As shimmering fine as floating dew...
And here and there
In the black of her hair
The subtle hands of Night
Move slowly with their gem-starred light.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It presents alternating descriptions of night in a rural area and in a city."}, {"label": "B", "body": "It sketches an image of nightfall, then an image of sunrise."}, {"label": "C", "body": "It makes an extended comparison of night to a human being."}, {"label": "D", "body": "It portrays how night changes from one season of the year to the next."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most accurately describes the overall structure of the text. Throughout the text, the speaker characterizes
nighttime as if it were a person who wears clothing (“a garment” that is “velvet soft” and “violet blue”) and a veil “over her face” and who moves
her hands “slowly with their gem-starred light” through her dark hair. Thus, the text is structured as an extended comparison of night to a human
being.
Choice A is incorrect because the text never mentions any particular location; instead, it focuses on presenting a single description of night as a
person with certain clothing and features. Choice B is incorrect because the text doesn’t make any reference to the sun or sunrise; instead, it
focuses on presenting a single image of night as a person with certain clothing and features. Choice D is incorrect. Rather than describing how
nighttime changes seasonally (or in any other way), the text presents a single image of night as a person with certain clothing and features.$qb$);
select seed_pool_question($qb$CB-9c35759f$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Novelist N. K. Jemisin declines to ______ the conventions of the science fiction genre in which she writes, and she has suggested that her readers
appreciate her work precisely because of this willingness to thwart expectations and avoid formulaic plots and themes.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "question"}, {"label": "B", "body": "react to"}, {"label": "C", "body": "perceive"}, {"label": "D", "body": "conform to"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of Jemisin’s writing. In this context, “conform to” means to
act in accordance with something. The text suggests that in her science fiction writing, Jemisin’s willingness to go against expectations and not
use plots and themes that seem to follow a formula reflects how she treats the standard practices of the genre. This context conveys that
Jemisin chooses not to act in accordance with those conventions.
Choice A is incorrect. In this context, “question” would mean doubt or object to. The text indicates that Jemisin is willing to go against
expectations and not use formulaic plots and themes in her science fiction writing, suggesting that she may actually object to those conventions
of the genre, not that she chooses not to question them. Choice B is incorrect because the text indicates that in her science fiction writing,
Jemisin is willing to go against expectations and not use formulaic plots and themes. Rather than suggesting that Jemisin chooses not to “react
to,” or act in response to, the standard practices of the genre, this context suggests that she is acting in response to such conventions by
deliberately avoiding them. Choice C is incorrect. In this context, “perceive” would mean become aware of or understand. The text indicates that
in her science fiction writing, Jemisin is willing to go against expectations and not use formulaic plots and themes. This context conveys that
Jemisin is aware of and deliberately avoids those conventions of the genre, not that she chooses not to be aware of them.$qb$);
select seed_pool_question($qb$CB-dd19befa$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The familial structure of the black swan (Cygnus atratus) shows tremendous ______: breeding pairs with demonstrated success in rearing cygnets
(young swans) have been observed to foster those of less successful pairs, and while rearing by female-male pairs is most common, male-male
pairs sometimes rear cygnets too, achieving a significantly higher rate of survival to adulthood than female-male pairs.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "cohesion"}, {"label": "B", "body": "elasticity"}, {"label": "C", "body": "affection"}, {"label": "D", "body": "reciprocity"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of black swan familial structures. In this context,
“elasticity” means flexibility or adaptability. The text provides examples of flexible family arrangements among black swans: successful male-
female breeding pairs are known to foster other pairs’ cygnets, and while they are less common, male-male pairs also successfully rear cygnets.
This context therefore emphasizes the flexibility or elasticity of black swan familial structures, showing how this trait contributes to the success
of the species.
Choice A is incorrect. Although close family units may show “cohesion,” which refers to unity or harmony within a group, the text’s focus is on the
variety and adaptability of black swan family structures. The examples given—fostering other pairs’ cygnets and forming male-male as well as
female-male pairs—highlight flexibility rather than cohesion, emphasizing family structures that vary from the model in which a breeding pair
raises its own young. Choice C is incorrect. While “affection,” or fondness, might be present in black swan relationships, the text doesn’t focus on
emotional bonds but rather on the structural flexibility of black swan familial arrangements. The examples provided demonstrate adaptable
breeding and rearing practices rather than affectionate behaviors. Choice D is incorrect because “reciprocity” would suggest mutual exchange or
cooperation between parties. Although the text mentions the fostering of cygnets by different successful breeding pairs, it doesn’t establish that
this is based on reciprocal exchanges. The focus is instead on the flexibility of family structures and the effectiveness of these varied structures
in rearing young.$qb$);
select seed_pool_question($qb$CB-0afb2ac4$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Ancient Inca inhabiting the Andes Mountains used terraces, rows of flattened land with built-in irrigation systems, to grow crops at different
altitudes. This method of farming proved to be highly ______, as evidenced by the great number and variety of crops grown at that time.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "chaotic"}, {"label": "B", "body": "uniform"}, {"label": "C", "body": "effective"}, {"label": "D", "body": "burdensome"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of the ancient Inca farming method. In this context,
“effective” means successful in producing a desired result. The text describes how the Inca used terraces with built-in irrigation systems to grow
crops at different altitudes and then indicates that this farming method produced positive results “as evidenced by the great number and variety
of crops grown at that time.” The context clearly suggests that the terraced farming approach was highly productive, or effective.
Choice A is incorrect because to describe the Inca farming method as “chaotic” contradicts the text’s description of a systematic approach using
deliberately constructed terraces with built-in irrigation systems. Moreover, the “great number and variety of crops” yielded by this method seems
unlikely to result from a disorganized, or chaotic, approach. Choice B is incorrect because “uniform” means consistent or the same throughout. It
does not make sense in this context to describe a farming method as highly uniform if it produced a “great number and variety of crops.”
Moreover, the text indicates that Inca terrace farming was specifically designed to accommodate different crops at different altitudes,
highlighting the diversity rather than uniformity of this approach. Choice D is incorrect because the success of the method, “as evidenced by the
great number and variety of crops grown,” does not support the claim that the Inca farming method was “burdensome,” or difficult to implement
or maintain. In fact, the context clearly emphasizes the advantages, rather than the burdens, of Inca terrace farming.$qb$);
select seed_pool_question($qb$CB-6a1194e8$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Rydra Wong, the protagonist of Samuel R. Delany’s 1966 novel Babel-17, is a poet, an occupation which, in Delany’s work, is not ______: nearly a
dozen of the characters that populate his novels are poets or writers.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "infallible"}, {"label": "B", "body": "atypical"}, {"label": "C", "body": "lucrative"}, {"label": "D", "body": "tedious"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of Samuel R. Delany’s character Rydra Wong. As used in
this context, “atypical” would mean unrepresentative or not common. The text indicates that Wong is one of “nearly a dozen” characters in
Delany’s novels who are poets or writers. This context conveys that being a poet isn’t an atypical occupation for a character in one of Delany’s
works.
Choice A is incorrect because “infallible” means to be accurate or without fault, which wouldn’t make sense in context. The text focuses on the
fact that Delany has written many characters who are poets and writers. This context suggests that the occupation isn’t atypical for Delany, not
that the occupation isn’t infallible, or problematic. Choice C is incorrect because “lucrative” means to be profitable, which wouldn’t make sense in
context. If writing poet characters weren’t profitable, it wouldn’t be logical to explain this by citing that Delany gave many of his characters the
same occupation. Choice D is incorrect because “tedious” means to be boring, which wouldn’t make sense in context. The text focuses on the
fact that Delany has written many characters who are poets and writers. This context suggests that the occupation isn’t atypical for Delany, not
that the occupation isn’t tedious.$qb$);
select seed_pool_question($qb$CB-490b205f$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In editor Lisa Yaszek’s introduction to her anthology The Future Is Female! More Classic Science Fiction Stories by Women, Yaszek identifies an
increasing sense of ______ feminist mode of writing in the 1970s, in contrast to many woman-authored science fiction stories of the 1920s to
1960s whose politics were less deliberately signaled.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "a prudently"}, {"label": "B", "body": "an overtly"}, {"label": "C", "body": "a cordially"}, {"label": "D", "body": "an inadvertently"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of Yaszek’s introduction to her science fiction anthology. In
this context "overtly" means openly or without concealment. The text draws a contrast between the lack of "deliberately signaled" political
themes in woman-authored science fiction from the 1920s to the 1960s and what Yaszek notes about woman-authored science fiction from the
1970s. This contrast implies that the work from the 1970s did clearly reflect feminist political themes. In other words, the text indicates that
unlike women who wrote science fiction in the 1920s to the 1960s, the women who wrote science fiction in the 1970s expressed overtly feminist
themes.
Choice A is incorrect. In this context "prudently" would mean cautiously, which might plausibly describe the women who wrote science fiction
from the 1920s to the 1960s, in that they tended to avoid revealing their political views; however, the text contrasts these authors with the women
writing science fiction in the 1970s, thereby suggesting that the authors writing in the 1970s were not restrained in that way. Choice C is incorrect
because in this context "cordially" would mean politely, and nothing in the text indicates that politeness was a significant factor for women
writing science fiction either from the 1920s to the 1960s or in the 1970s. The text draws a contrast between the lack of "deliberately signaled"
political themes in woman-authored science fiction from the 1920s to the 1960s and what Yaszek notes about woman-authored science fiction
from the 1970s. It’s unclear how "less deliberately signaled" politics and an increasing sense of politeness toward feminism would constitute a
meaningful contrast. Choice D is incorrect because in this context, "inadvertently" would mean unintentionally, and nothing in the text suggests
that Yaszek thought the feminist elements of the woman-authored science fiction from the 1970s arose without deliberate effort.$qb$);
select seed_pool_question($qb$CB-051d3065$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Kelp forests grow underwater along the eastern Pacific Coast. These underwater forests are important to fish and other marine animals. Ocean
currents can be powerful and rough, making it difficult for animals to find safe places to hide from predators. The underwater forests slow down
the currents. This creates a more ______ environment with calmer waters where animals can take shelter.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "tranquil"}, {"label": "B", "body": "dangerous"}, {"label": "C", "body": "imaginative"}, {"label": "D", "body": "surprising"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of how kelp forests help marine animals. In this context,
"tranquil" means free from disturbance, or calm. The text indicates that ocean currents are powerful and make it difficult for marine animals to
hide from predators and that kelp forests slow currents down to create calmer areas. In other words, kelp forests create a more tranquil
environment.
Choice B is incorrect because the text indicates that kelp forests provide shelter for marine animals, meaning they create environments that are
safer, not more "dangerous." Choice C is incorrect because the text discusses how kelp forests affect currents in the ocean, and it isn’t clear how
an ocean environment could be "imaginative," or full of imagination. Choice D is incorrect because the text indicates that kelp forests create a
calm and safe environment, and an environment that is "surprising" would be characterized by unexpected occurrences, not calmness.$qb$);
select seed_pool_question($qb$CB-4fa7e50e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$According to a US tax policy expert, state taxes are ______ other factors when considering an interstate move. Even significant differences in
state taxation have almost no effect on most people’s decisions, while differences in employment opportunities, housing availability, and climate
are strong influences.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "consistent with"}, {"label": "B", "body": "representative of"}, {"label": "C", "body": "overshadowed by"}, {"label": "D", "body": "irrelevant to"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of the factors that influence peoples’ decisions to move to
a different state. As used in this context, “overshadowed by” means to be surpassed by or caused to seem less important than other factors
affecting a move. The text indicates that, according to a US tax policy expert, when people think about an interstate move, state taxes have little
effect on their decisions, while employment opportunities, housing availability, and climate have a very strong effect. This context suggests that
people consider these other factors to be more important than state taxes.
Choice A is incorrect because the text indicates that state taxes aren’t as important a consideration as other factors when people are thinking of
moving to another state. The context doesn’t suggest that state taxes are “consistent with,” or in agreement with these other factors. Choice B is
incorrect because it wouldn’t make sense in context to say that state taxes are “representative of,” or typical of, other factors. Taxes aren’t an
example of employment opportunities, housing availability, and climate, which are the other factors listed in the text. Choice D is incorrect
because it wouldn’t make sense in context to say that state taxes are “irrelevant to,” or unconnected or unimportant to other factors. State taxes
are irrelevant to peoples’ decisions, not to other factors. In other words, although the text suggests that state taxes may be irrelevant to people
considering a move to another state, the other factors mentioned in the text, such as employment opportunities, are unable to have an opinion
about state taxes. Furthermore, the text indicates that significant differences in state taxes have almost no effect on peoples’ choices to move,
but they aren’t completely unimportant.$qb$);
select seed_pool_question($qb$CB-aa7fc89b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is adapted from Susan Glaspell’s 1912 short story “‘Out There.’” An elderly shop owner is looking at a picture that he recently
acquired and hopes to sell.
It did seem that the picture failed to fit in with the rest of the shop. A persuasive young fellow who claimed he was closing out his stock let the
old man have it for what he called a song. It was only a little out-of-the-way store which subsisted chiefly on the framing of pictures. The old
man looked around at his views of the city, his pictures of cats and dogs, his flaming bits of landscape. “Don’t belong in here,” he fumed.
And yet the old man was secretly proud of his acquisition. There was a hidden dignity in his scowling as he shuffled about pondering the least
ridiculous place for the picture.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To reveal the shop owner’s conflicted feelings about the new picture"}, {"label": "B", "body": "To convey the shop owner’s resentment of the person he got the new picture from"}, {"label": "C", "body": "To describe the items that the shop owner most highly prizes"}, {"label": "D", "body": "To explain differences between the new picture and other pictures in the shop"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes the main purpose of the text. The text begins by stating that the new picture
“failed to fit in” with the other items that the shop owner has. The text goes on to illustrate that point by describing the other pictures the shop
owner has, indicating that the shop owner is fuming because he doesn’t think the new picture belongs in the store. In the second paragraph,
however, the text indicates that the shop owner is “secretly proud of his acquisition.” The main purpose of the text is thus to reveal the shop
owner’s conflicted feelings about the new picture.
Choice B is incorrect because the text doesn’t suggest that the shop owner resents the young man who sold him the new picture; in fact, the text
gives no indication of the owner’s feelings about the young man at all. Choice C is incorrect. Although the text indicates that the new picture is
different from the other items in the shop, there’s no suggestion that the shop owner prizes either the new picture or the pictures of the city, pets,
and landscapes more than he prizes any other items. Choice D is incorrect because the text doesn’t describe what the new picture looks like;
rather, the text identifies some of the other kinds of images that the shop owner has and states that they’re different from the new picture
without explaining how they’re different.$qb$);
select seed_pool_question($qb$CB-72bae7f4$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A team investigating frugivorous (fruit-eating) birds found that their feeding patterns vary depending on where they live within their habitat range.
At the geographic boundaries of their natural range, these birds become highly selective, choosing fruits that closely match their beak size to
maximize energy intake while minimizing effort. However, this fruit-selection strategy doesn’t occur at elevation boundaries (the highest and
lowest altitudes of their range). In these areas, other factors, such as territorial competition among species, have a stronger influence on feeding
patterns.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To describe research methods that can be used to study the habitat preferences of frugivorous birds"}, {"label": "B", "body": "To present research findings concerning how location within a habitat affects the feeding patterns of frugivorous birds"}, {"label": "C", "body": "To discuss how competition among frugivorous bird species influences their habitat boundaries"}, {"label": "D", "body": "To explain why habitat boundaries are more important than beak size in determining the feeding patterns of frugivorous birds"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately states the main purpose of the text. The text begins by introducing research on variation
in frugivorous birds’ feeding patterns based on the specific part of their habitat range the birds occupy. The text then explains that birds at the
geographic edges of their range feed selectively based on beak size, whereas birds at altitude-based boundaries feed based on local competition
with other species. Therefore, the main purpose of the text is to present research findings concerning how location within a habitat affects the
feeding patterns of frugivorous birds.
Choice A is incorrect. Although the text does discuss studying habitats of frugivorous birds, it doesn’t address specific research methods. Choice
C is incorrect. Although the text mentions territorial competition as a factor affecting the feeding patterns of frugivorous birds at elevation
boundaries, nothing in the text suggests that such competition affects the boundaries of those birds’ habitats. Choice D is incorrect. Although
the text mentions beak size as a key factor shaping frugivorous birds’ feeding patterns at the geographic boundaries of the birds’ natural range, it
doesn’t compare the relative importance of different factors or indicate that habitat boundaries matter more than beak size. Instead, the text
presents findings showing that different types of boundaries—geographic and elevational—are associated with different influences on feeding
patterns.$qb$);
select seed_pool_question($qb$CB-e23f50b9$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The people of medieval Europe have traditionally been seen as uninterested in cleanliness and hygiene, but modern research has shown that this
is largely a myth. According to historian Eleanor Janega, most medieval towns in Europe had at least one public bathhouse, which often offered
both full-immersion baths and—more affordably—steam baths. While such amenities were available mainly to town dwellers, regular bathing in-
rivers and streams or daily sponge baths at home were common practices throughout medieval Europe.
Which choice best describes the function of the underlined portion?$qb$, null, $qb$[{"label": "A", "body": "It asserts that in medieval Europe steam baths were more popular in rural areas than in urban ones."}, {"label": "B", "body": "It describes a limitation of earlier historians’ studies of medieval European bathing habits."}, {"label": "C", "body": "It concedes that not all people in medieval Europe had access to public bathhouses."}, {"label": "D", "body": "It explains why Janega decided to study the popularity of public bathhouses in medieval Europe."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most effectively describes the function of the underlined portion. The text discusses the long-standing
misconception that people in medieval Europe were uninterested in cleanliness and hygiene. As evidence that this idea is false, the text cites
historian Eleanor Janega’s assertion that in medieval Europe, towns usually had at least one bathhouse, where people could take immersion
baths or steam baths for a fee. The underlined portion then notes that mainly town dwellers had access to these bathhouses. The remainder of
the text explains that those who lacked such access were nonetheless able to bathe in outdoor waterways or take sponge baths at home.
Therefore, the underlined portion concedes that some people in medieval Europe lacked access to public bathhouses.
Choice A is incorrect. The underlined portion establishes that amenities such as steam baths were mainly available to town dwellers, which
suggests in turn that steam baths were largely unavailable to people in rural areas. Thus, the distinction made by the underlined portion is not
between the popularity of steam baths in towns versus their lack of popularity in rural areas but instead between their presence in towns and
absence in rural areas. Choice B is incorrect. Although the text does explain that recent historians have disproved the idea that medieval
Europeans rarely bathed, it doesn’t attribute that misconception to earlier historians of medieval Europe or suggest that their research was
subject to limitations. Moreover, the underlined portion addresses a limitation of life in medieval Europe, not of historical research. Choice D is
incorrect because the underlined portion doesn’t address why historian Eleanor Janega decided to study the popularity of public bathhouses in
medieval Europe—nor does any portion of the text. The text mentions Janega in passing, but it doesn’t go into detail about why she decided to
study the popularity of public bathhouses in medieval Europe.$qb$);
select seed_pool_question($qb$CB-359b891c$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Painter Alma W. Thomas was fascinated by the colors and shapes found in nature. The flowers and trees in the garden at her home in
Washington, DC, ______ her work. For example, Thomas’s use of broken brushstrokes was inspired by the way that light would shine through the
leaves of a tree in front of her house.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "restricted"}, {"label": "B", "body": "announced"}, {"label": "C", "body": "distracted"}, {"label": "D", "body": "influenced"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of painter Alma W. Thomas’s work. In this context,
"influenced" means to have had an effect on something’s development. The text indicates that there is a connection between Thomas’s work and
the flowers and trees in her home’s garden, giving the example of Thomas’s brushstrokes being inspired by light shining through the leaves of a
tree in front of her house. This context conveys that Thomas’s work was influenced by the flowers and trees in the garden.
Choice A is incorrect because the text conveys that Thomas drew inspiration for her work from the plants in her garden, which suggests that the
flowers and trees contributed positively to her work, not that they "restricted," or limited, her work. Choice B is incorrect because it wouldn’t make
sense to suggest that flowers and trees in a garden could have "announced," or made known, a painter’s work. Choice C is incorrect because the
text conveys that Thomas drew inspiration for her work from the plants in her garden, which suggests that the flowers and trees contributed
positively to her work, not that they were a distraction. Further, it’s not clear how an artist’s work could itself be "distracted."$qb$);
select seed_pool_question($qb$CB-aad56f2b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$As a young photographer in the 1950s, William Klein ______ the conventions of photography by creating images that were high contrast and
included blurred and distorted elements—features generally seen as flaws. So unorthodox was Klein’s work that he had difficulty finding a
publisher for his now-iconic 1956 photo book Life is Good & Good for You in New York.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "reviewed"}, {"label": "B", "body": "defied"}, {"label": "C", "body": "respected"}, {"label": "D", "body": "prevented"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Defied" means "resisted" or "deliberately disobeyed," which matches the way Klein broke from the conventions of
photography in his time by including features that were generally seen as flaws.
Choice A is incorrect. "Reviewed" means "analyzed" or "evaluated," but that doesn’t really fit the context here. Klein isn’t directly providing any
thoughtful examination of the conventions of photography: he’s just breaking all the rules. Choice C is incorrect. "Respected" can mean "admired"
or "followed" (as in the case of conventions). It’s clear that Klein didn’t respect conventions, given his use of photographic features that were
generally considered "flaws." Choice D is incorrect. "Prevented" means "stopped," and Klein did not stop the conventions—they still existed.
Instead, he made images that were seen as "flawed" under those conventions.$qb$);
select seed_pool_question($qb$CB-48555763$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from Herman Melville’s 1854 novel The Lightning-rod Man.
The stranger still stood in the exact middle of the cottage, where he had first planted himself. His singularity impelled a closer scrutiny. A lean,-
gloomy figure. Hair dark and lank, mattedly streaked over his brow. His sunken pitfalls of eyes were ringed by indigo halos, and played with an
innocuous sort of lightning: the gleam without the bolt. The whole man was dripping. He stood in a puddle on the bare oak floor: his strange
walking-stick vertically resting at his side.
Which choice best states the function of the underlined sentence in the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It elaborates on the previous sentence’s description of the character."}, {"label": "B", "body": "It introduces the setting that is described in the sentences that follow."}, {"label": "C", "body": "It establishes a contrast with the description in the previous sentence."}, {"label": "D", "body": "It sets up the character description presented in the sentences that follow."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This best states the function of the underlined sentence. The sentence basically says: “He stood out, so I looked
more closely at him.” Then the rest of the text describes him in detail.
Choice A is incorrect. This doesn’t state the function of the underlined sentence. The previous sentence basically says: “He was still standing in
the middle of the cottage”—it doesn’t include any description of the character himself. Choice B is incorrect. This doesn’t state the function of
the underlined sentence. The following sentences describe the character, not the setting. Choice C is incorrect. This doesn’t state the function of
the underlined sentence. The underlined sentence basically says: “He stood out, so I looked more closely at him.” The previous sentence
basically says: “He was still standing in the middle of the cottage.” There’s no contrast between these two sentences.$qb$);
select seed_pool_question($qb$CB-e19e8478$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Understanding juvenile sea turtles’ migratory patterns is crucial for conservation efforts. While adult sea turtles are well studied, little is known
about juveniles during their oceanic stage, when they spend most of their time in the open ocean. To learn about this stage, researchers tagged
and released six juvenile green sea turtles (Chelonia mydas) into the eastern Caribbean Sea. Their findings revealed that the majority of the
turtles passively drifted with ocean currents throughout the region. However, two individuals swam against the currents, possibly in search of
foraging grounds off the coast of South America.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To describe successful conservation efforts for sea turtles"}, {"label": "B", "body": "To summarize research on an understudied stage of sea turtle development"}, {"label": "C", "body": "To compare the behavior of adult and juvenile sea turtles during migration"}, {"label": "D", "body": "To suggest reasons why some juvenile sea turtles swim against the ocean currents"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately states the main purpose of the text. The text begins by noting that little is known about
juvenile sea turtles during their oceanic stage, establishing this as an understudied area. The text then describes a study in which researchers
tagged and released six juvenile green sea turtles and reports the findings: most turtles drifted passively with currents, while two swam against
them. Therefore, the main purpose of the text is to summarize research on an understudied stage of sea turtle development.
Choice A is incorrect because although the text mentions that understanding migratory patterns is important for conservation, it does not
describe any conservation efforts, successful or otherwise; instead, the text summarizes research findings about a stage of sea turtle
development. Choice C is incorrect. Although the text notes that adult sea turtles are well studied while juveniles are not, it does not compare the
migratory behavior of adults and juveniles; instead, the text focuses solely on findings about juvenile turtles. Choice D is incorrect. Although the
text briefly mentions that two turtles swam against currents and speculates that they may have done so in search of foraging grounds, this is a
single detail within the text’s broader summary of the study, not the main purpose of the text as a whole.$qb$);
select seed_pool_question($qb$CB-e7247766$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Horizontal gene transfer occurs when an organism of one species acquires genetic material from an organism of another species through
nonreproductive means. The genetic material can then be transferred “vertically” in the second species—that is, through reproductive inheritance.
Scientist Atma Ivancevic and her team have hypothesized infection by invertebrate parasites as a mechanism of horizontal gene transfer
between vertebrate species: while feeding, a parasite could acquire a gene from one host, then relocate to a host from a different vertebrate-
species and transfer the gene to it in turn.-
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It explains why parasites are less susceptible to horizontal gene transfer than their hosts are."}, {"label": "B", "body": "It clarifies why some genes are more likely to be transferred horizontally than others are."}, {"label": "C", "body": "It contrasts how horizontal gene transfer occurs among vertebrates with how it occurs among invertebrates."}, {"label": "D", "body": "It describes a means by which horizontal gene transfer might occur among vertebrates."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The text defines horizontal gene transfer and then gives one possibility for how it happens in vertebrates (via
infection by parasites). The underlined part describes how that mechanism could work.
Choice A is incorrect. The underlined portion doesn’t do this. Parasites are only described as the mechanism that does the transferring, not the
species that gives or receives the genes. Choice B is incorrect. The underlined portion doesn’t do this. The text never discusses which genes are
more likely to be transferred. Choice C is incorrect. The underlined portion doesn’t do this. The text never discusses how horizontal gene transfer
occurs among invertebrates.$qb$);
select seed_pool_question($qb$CB-ae2b3112$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$By combining Indigenous and classical music, Cree composer and cellist Cris Derksen creates works that reflect the diverse cultural landscape
of Canada. For her album Orchestral Powwow, Derksen composed new songs in the style of traditional powwow music that were accompanied
by classical arrangements played by an orchestra. But where an orchestra would normally follow the directions of a conductor, the musicians on
Orchestral Powwow are led by the beat of a powwow drum.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To examine how Derksen’s musical compositions blend cultures"}, {"label": "B", "body": "To argue that Derksen should be recognized for creating a new style of music"}, {"label": "C", "body": "To describe the difficulties Derksen encountered when producing her album"}, {"label": "D", "body": "To establish a contrast between Derksen’s classical training and her Cree heritage"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes the main purpose of the text, which is to discuss how Derksen’s compositions
incorporate elements from both Indigenous and classical music. After introducing Derksen, the text describes how the songs Derksen composed
for her album Orchestral Powwow feature aspects of the two musical traditions. Specifically, the text notes that Derksen wrote songs in the style
of traditional powwow music but accompanied them with classical arrangements played by an orchestra that followed the beat of a powwow
drum rather than the directions of a conductor. In this way, Derksen’s compositions blend different cultures.
Choice B is incorrect because although the text suggests that Derksen’s songs contain innovative elements since they blend styles from two
different musical traditions, it doesn’t discuss whether her compositions constitute a new style of music, let alone whether Derksen should be
recognized for creating a new style of music. Choice C is incorrect because the text doesn’t mention any difficulties Derksen encountered when
producing her album. Rather, the text describes how the songs on the album exemplify how Derksen combines music from two different
cultures. Choice D is incorrect because although the text mentions Derksen’s Cree heritage and suggests that she relies on knowledge of both
Indigenous and classical music when she composes her songs, it doesn’t discuss her musical training. Additionally, the text is primarily focused
on how Derksen combines different cultural traditions, not on contrasting Derksen’s training with her heritage.$qb$);
select seed_pool_question($qb$CB-e7b709fc$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Archaeologists studying an ancient amphitheater in Switzerland believe that it dates back to the fourth century CE. Their discoveries of a coin
made between 337 and 341 CE and era-appropriate building materials ______ evidence for this theory.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "dismiss"}, {"label": "B", "body": "provide"}, {"label": "C", "body": "regulate"}, {"label": "D", "body": "refuse"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the archaeologists’ study of the ancient amphitheater in
Switzerland. In this context, “provide” means make available or supply. The text states that the archaeologists believe that the amphitheater
dates to the fourth century CE. The text goes on to say that the archaeologists discovered a coin made between 337 and 341 CE (that is, made
during the fourth century CE) and building materials appropriate to the era in question. This context suggests that these discoveries provide
evidence for the archaeologists’ theory about the dating of the amphitheater.
Choice A is incorrect because the archaeologists’ discoveries are presented as supplying evidence in favor of their theory about the dating of the
amphitheater, not something that would “dismiss,” or reject serious consideration of, evidence for that theory. Choice C is incorrect because
nothing in the text suggests that the archaeologists’ discoveries would “regulate,” or govern or bring order to, evidence for the archaeologists’
theory about the dating of the amphitheater. The discoveries are presented as supplying evidence for the archaeologists’ theory, not as changing
how evidence for the theory is controlled or ordered. Choice D is incorrect because the archaeologists’ discoveries are presented as supplying
evidence in favor of their theory about the dating of the amphitheater, not something that would “refuse,” or be unwilling to accept, evidence for
the archaeologists’ theory.$qb$);
select seed_pool_question($qb$CB-94eb800d$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For a 2020 exhibition, photographer and neurobiologist Okunola Jeyifous ______ a series of new images based on a series of alphabet posters
from the 1970s known as the “Black ABCs,” which featured Black children from Chicago. Jeyifous photographed the now-adult models and
layered the photos over magnified images of the models’ cells, resulting in what he called “micro and macro portraiture.”
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "validated"}, {"label": "B", "body": "created"}, {"label": "C", "body": "challenged"}, {"label": "D", "body": "restored"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically and precisely completes the text’s discussion of Jeyifous’s series of images for the 2020
exhibition. In this context, “created” means produced. The text explains that Jeyifous, a photographer and neurobiologist, photographed adults
who had appeared as children in posters from the 1970s, then combined those photographs with magnified images of the adults’ cells—a
process that resulted in what he called “micro and macro portraiture.” This context suggests that Jeyifous drew on his dual interests in
photography and neurobiology to produce the images for display in the exhibition.
Choice A is incorrect because there’s nothing in the text to suggest that Jeyifous “validated,” or corroborated, the series of images. The text
describes Jeyifous’s process for composing the images but doesn’t describe Jeyifous making an effort to evaluate the images for their artistic or
scientific legitimacy. Choice C is incorrect because there’s nothing in the text to suggest that Jeyifous “challenged,” or disputed, an aspect of the
images; rather, the focus of the text is on the inspiration behind the images and the method Jeyifous used to achieve them. Choice D is incorrect
because the text indicates that Jeyifous made the images himself using a combination of photography and magnified pictures of cells, not that
he “restored,” or reconditioned, the images from a deteriorated state.$qb$);
select seed_pool_question($qb$CB-3cfbf077$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Hycean planets are a class of exoplanets (planets outside our solar system) with oceans of liquid water—critical to supporting life—and
atmospheres rich in hydrogen. Computer models have determined that for potential hycean planets, the range of the habitable zone (HZ), the
distance from a star that allows a planet to retain liquid water on its surface, begins at about 1 astronomical unit (AU). In 2021, Nikku
Madhusudhan et al. identified K2-18 b as a hycean candidate, noting that the planet is located right on the inner edge of the HZ.
Text 2
In a 2023 paper, Shang-Min Tsai et al. claimed that the hydrogen-rich atmospheres of K2-18 b and other hycean candidates admit wavelengths of
light that cause elevated surface temperatures and increased water evaporation. Unlike earlier assessments, Tsai et al.’s calculations therefore
placed the inner edge for these planets’ HZ as far out as 3.85 AU.
Based on the texts, how would Tsai et al. (Text 2) most likely respond to Madhusudhan et al.’s research, as presented in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By stating that the chemical composition of the atmosphere of the hycean candidate Madhusudhan et al. identified suggests that this planet’s surface is unlikely to harbor liquid water"}, {"label": "B", "body": "By maintaining that Madhusudhan et al. relied on a model whose estimates of surface temperatures on hycean candidates are likely too high"}, {"label": "C", "body": "By observing that unlike the hycean candidate Madhusudhan et al. discovered, most other types of planets with hydrogen-rich atmospheres are likely located within the HZ"}, {"label": "D", "body": "By arguing that K2-18 b and other hycean candidates are unlikely to support life because these planets are located too far from the stars they orbit"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it reflects how Tsai et al. would most likely respond to Madhusudhan et al.’s identification of K2-18 b as a
hycean candidate. Text 1 establishes that the habitable zone (HZ) for potential hycean planets, which are typified by abundant liquid water and
hydrogen-rich atmospheres, represents “the distance from a star that allows a planet to retain liquid water on its surface” and is estimated to
begin at about 1 astronomical unit (AU). Based on this characterization of the HZ, Madhusudhan et al. identified K2-18 b as a hycean candidate
whose location falls on the “inner edge” of the HZ—implying that its distance from its star is about 1 AU. However, Text 2 presents Tsai et al.’s
claim that the same hydrogen-rich atmospheres that typify K2-18 b and other hycean candidates “admit wavelengths of light that cause elevated
surface temperatures and increased water evaporation,” phenomena that would be exacerbated by proximity to their host stars. Tsai et al.
instead placed the inner edge of the HZ “as far out as 3.85 AU,” implying that hycean candidates at lesser distances from their stars would be
unlikely to maintain liquid oceans because of elevated surface temperatures and subsequent water evaporation. According to Tsai et al.’s HZ
estimate, K2-18 b—at roughly 1 AU—would be too close to its star to retain liquid water. Therefore, based on the details in the texts, Tsai et al.
would most likely respond that the very atmospheric composition that defines K2-18 b as a hycean candidate suggests that it is unlikely to
harbor liquid water on its surface.
Choice B is incorrect. In contrast to the suggestion that Madhusudhan et al.’s estimates of the surface temperature of hycean candidates are
“likely too high,” Tsai et al.’s findings suggest the opposite: earlier assessments of the HZ didn’t fully account for the warming effect of
wavelengths of light admitted by these planets’ hydrogen-rich atmospheres, which is why Tsai et al. placed the edge of the HZ farther out. The
information in Text 2 therefore suggests that Tsai et al. would view Madhusudhan et al.’s temperature estimates as too low rather than as too
high. Choice C is incorrect because neither text discusses other types of planets with hydrogen-rich atmospheres or compares them to hycean
candidates. It therefore doesn’t follow from the information in the texts that Tsai et al. would observe that most other hydrogen-rich planets are
likely within the HZ. Text 2 only indicates that the HZ for hycean candidates begins at about 3.85 AU and that K2-18 b therefore isn’t likely to be
within the HZ, not that other planets with hydrogen-rich atmospheres are mostly located within the HZ. Choice D is incorrect because it
mischaracterizes Tsai et al.’s findings. Rather than indicating that K2-18 b and other hycean candidates are “too far from the stars they orbit,” Tsai
et al.’s findings suggest the opposite problem. Because these planets’ hydrogen-rich atmospheres admit wavelengths of light that cause elevated
temperatures and water evaporation at distances of less than 3.85 AU, Tsai et al. would be more likely to argue that K2-18 b (at a distance of
about 1 AU) and planets like it are too close to their stars, not too far from them. Moreover, Text 2 doesn’t suggest anything about hycean
candidates more generally being unable to support life, only that hycean candidates at distances less than 3.85 AU from their stars, like K2-18 b,
likely don’t have the liquid water needed to sustain life. Presumably, hycean candidates that are within the HZ described by Tsai et al. could
harbor liquid oceans necessary for supporting life.$qb$);
select seed_pool_question($qb$CB-dc0bca21$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$It would be a mistake to ______ the exhibit that artist and curator Joe Baker, who is a member of the Lenape (Delaware) people, has organized at
the Brooklyn Public Library. The exhibit, which includes Lenape beadwork from the 1850s as well as modern works that use traditional patterns,
is essential viewing.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "complicate"}, {"label": "B", "body": "amplify"}, {"label": "C", "body": "overlook"}, {"label": "D", "body": "assemble"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of an exhibit at the Brooklyn Public Library. In this context,
"overlook" means to ignore or to miss. The text states that artist and curator Joe Baker organized an exhibit that features Lenape beadwork in
historical and modern works. The text describes the exhibit as "essential viewing," suggesting that it’s an important exhibit that people should
make an effort to visit; this context conveys that it would be a mistake to overlook the exhibit.
Choice A is incorrect. In this context, "complicate" would mean to add difficulty, and there’s no reason to think the text would need to directly
caution against complicating Baker’s exhibit; the text focuses on the idea that the exhibit is "essential viewing," not on the idea of a potential
difficulty that could be raised. Choice B is incorrect. In this context, "amplify" means to increase, and there’s no reason to believe the text would
indicate that it would be a mistake to increase an exhibit the text describes as "essential viewing." Choice D is incorrect because it wouldn’t make
sense to say that it would be a mistake to "assemble," or put together, Baker’s exhibit: the text makes it clear that the exhibit has already been put
together and, further, praises the exhibit as "essential viewing."$qb$);
select seed_pool_question($qb$CB-c218cd98$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 1776, the United States sent Benjamin Franklin to France to try to win the country’s support in the United States’ fight for independence from
Great Britain. Franklin was very popular in France. This ______ surely helped him to convince France to assist the United States.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "thoughtfulness"}, {"label": "B", "body": "esteem"}, {"label": "C", "body": "controversy"}, {"label": "D", "body": "sincerity"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of Benjamin Franklin’s popularity in France. In this context,
"esteem" means high regard. The text indicates that Franklin was very popular, or highly regarded, in France, where he sought the country’s
support for the United States in its fight for independence, and indicates that his status helped him achieve his goal. The context therefore
suggests that being held in high regard by the people likely helped Franklin convince France to help the United States.
Choice A is incorrect because the text directly indicates that it was Franklin’s popularity that likely helped him convince France to help the United
States, not his "thoughtfulness" (which in this context would mean either his careful reasoning and attention or his kind consideration of others’
needs). Choice C is incorrect because the text doesn’t suggest that there was any "controversy," or dispute, about Franklin’s presence in France;
instead, the text states that Franklin was very popular in France and directly indicates that this status likely helped him convince France to help
the United States. Choice D is incorrect because the text directly indicates that it was Franklin’s popularity that likely helped him convince France
to help the United States, not his "sincerity," or his honesty.$qb$);
select seed_pool_question($qb$CB-7b55e895$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Text 1
Some animal species, like the leopard, can be found in many kinds of areas. On the other hand, tropical mountain bird species tend to be limited
in the types of spaces they can call home. This is because many mountain bird species are only able to survive at very specific elevations. Over
time, these species have likely become used to living at a specific temperature. Therefore, these species struggle to survive at elevations that are
warmer or colder than they are used to.
Text 2
A new study reviewed observations of nearly 3,000 bird species to understand why tropical mountain bird species live at specific elevations.
They noted that when a mountain bird species was found in an area with many other bird species, it tended to inhabit much smaller geographic
areas. It is thus likely that competition for resources with other species, not temperature, limits where these birds can live.
Based on the texts, both authors would most likely agree with which statement?$qb$, null, $qb$[{"label": "A", "body": "Tropical mountain bird species are restricted in where they can live."}, {"label": "B", "body": "Scientists have better tools to observe tropical mountain birds than they did in the past."}, {"label": "C", "body": "Little is known about how tropical mountain birds build their nests."}, {"label": "D", "body": "Tropical mountain bird species that live at high elevations tend to be genetically similar."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. Both texts state that tropical mountain bird species have limited ranges or habitats, although they disagree on the
reason for this. Text 1 claims that temperature is the main factor that determines where these birds can live, while Text 2 claims that competition
with other species is the main factor. However, both texts agree that these birds are not able to survive in many kinds of areas.
Choice B is incorrect. Neither text mentions the tools or methods that scientists use to observe these birds, either now or in the past. Choice C is
incorrect. Neither text mentions anything about how these birds build their nests. Choice D is incorrect. Neither text provides any information
about the genetic similarity of these birds, so we have no evidence that either author would agree with this statement.$qb$);
select seed_pool_question($qb$CB-8bc66f89$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Part of the Atacama Desert in Peru has surprisingly rich plant life despite receiving almost no rainfall. Moisture from winter fog sustains plants
once they’re growing, but the soil’s tough crust makes it hard for seeds to germinate in the first place. Local birds that dig nests in the ground
seem to be of help: they churn the soil, exposing buried seeds to moisture and nutrients. Indeed, in 2016 Cristina Rengifo Faiffer found that-
mounds of soil dug up by birds were far more fertile and supported more seedlings than soil in undisturbed areas.
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It elaborates on the idea that the top layer of Atacama Desert soil forms a tough crust."}, {"label": "B", "body": "It describes the process by which seeds are deposited into Atacama Desert soil."}, {"label": "C", "body": "It identifies the reason particular bird species dig nests in Atacama Desert soil."}, {"label": "D", "body": "It explains how certain birds promote seed germination in Atacama Desert soil."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes how the underlined portion functions in the text as a whole. The first two
sentences establish a natural phenomenon: there is a richness of plant life found in the Atacama Desert despite the hard soil that makes it
challenging for seeds to germinate. The next sentence, which contains the underlined portion, offers a potential explanation for the
phenomenon: local birds dig ground nests exposing seeds to moisture and materials in the soil necessary for germination. The last sentence
summarizes a study that compared the fertileness of mounds of dirt dug up by birds to mounds that were undisturbed to support the
explanation in the underlined portion. Thus, the underlined portion mainly functions to explain how certain birds promote seed germination in the
Atacama Desert soil.
Choice A is incorrect because the underlined portion doesn’t address the topic of the soil’s tough crust or its formation. Instead, the text
elaborates on the idea that local birds that build ground nests may help seeds germinate in the hard soil. Choice B is incorrect because the
underlined portion describes how some birds may support seed germination in Atacama Desert soil but doesn’t describe how the seeds are
deposited into the soil before germination begins. Choice C is incorrect because neither the underlined portion nor the text as a whole identifies
a reason that a particular bird species may choose to dig ground nests in the Atacama Desert soil.$qb$);
select seed_pool_question($qb$CB-2c82068f$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is from Mark Oshiro’s 2018 novel Anger Is a Gift. In the novel, Moss and his friends are on a subway train in Northern
California.
Lights from the outside world then filled the train car as it rose out of the ground and climbed the elevated track. As long as Moss
had lived in West Oakland, he’d never tired of this specific view, so he pointed toward the windows. - “Check it,” he said, and the Port
of Oakland began to pass by them.
©2018 by Mark Oshiro
As used in the text, what does the word “specific” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Imaginary"}, {"label": "B", "body": "Energetic"}, {"label": "C", "body": "Correct"}, {"label": "D", "body": "Particular"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because as used in the text, "specific" most nearly means particular. The text is referring to the particular view of the
Port of Oakland as seen from a subway train as it rises from underground. This specific, or particular, view has always been special to Moss, a
lifetime resident of West Oakland.
Choice A is incorrect. Although the text itself is a work of fiction, the view is something Moss can point out to his companions on the train, so the
view itself is presumably not imaginary. Choice B is incorrect. Although this view of the Port of Oakland is significant to Moss, nothing in the text
describes the view as particularly energetic as opposed to calming, for example. Choice C is incorrect. The point of the text is that the view of the
Port of Oakland from the subway train as it rises from underground is significant to Moss, not whether it is described as being correct, which the
text does not address.$qb$);
select seed_pool_question($qb$CB-b93428a6$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Animal researcher Amalia P.M. Bastos led a 2021 study about a wild kea parrot that used small stones as tools to preen its feathers. Skeptical
colleagues had initially suggested to Bastos that the kea’s interactions with the stones might simply be ______, but Bastos and her team showed
that the kea was using the stones deliberately.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "intriguing"}, {"label": "B", "body": "obvious"}, {"label": "C", "body": "accidental"}, {"label": "D", "body": "observable"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of Bastos’s study of a wild kea parrot. In this context,
"accidental" means unplanned or unintentional. The text first describes Bastos’s study, which concerns a kea that is observed using small stones
to preen its feathers. The text then mentions colleagues who are skeptical (that is, they have doubt) about Bastos’s findings, and finally describes
how Bastos and her team responded to the skepticism of those colleagues. Given that the colleagues mentioned in the text expressed
skepticism regarding Bastos’s findings, the best answer choice must be one that completes the text in a manner such that the skeptics’ opinion
regarding the kea’s use of stones disagrees with that held by Bastos and her team. Since Bastos and her team showed that the kea’s use of
stones was deliberate (that is, intentional), the skeptics’ opinion in this context must be that the kea’s use of stones was unintentional, or
accidental.
Choice A is incorrect because the best answer choice is one that portrays skepticism, or doubt, of Bastos’s claim that the kea’s usage of stones
was deliberate, or intentional. If the skeptics found the kea’s usage of stones "intriguing," or fascinating, this would not be at odds with the
position of Bastos and her team; in fact, it is reasonable to believe that someone who agreed that the kea’s stone usage was deliberate would
also find it intriguing. Choice B is incorrect because if the skeptics believed that the kea’s usage of small stones was "obvious," or evident, this
would not be contrary to the observation of Bastos and her team that the kea’s usage of stones was deliberate: in fact, these opinions would be
consistent with each other. Choice D is incorrect because if the skeptics believed that the kea’s usage of small stones was "observable," or
visible, this would not conflict with the claim of Bastos and her team that the kea’s usage of stones was deliberate: instead, these positions
would agree.$qb$);
select seed_pool_question($qb$CB-c106b9f7$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
American sculptor Edmonia Lewis is best known for her sculptures that represent figures from history and mythology, such as The Death of
Cleopatra and Hagar. Although Lewis sculpted other subjects, her career as a sculptor is best represented by the works in which she depicted
these historical and mythical themes.
Text 2
Art historians have typically ignored the many portrait busts Edmonia Lewis created. Lewis likely carved these busts (sculptures of a person’s
head) frequently throughout her long career. She is known for her sculptures that represent historical figures, but Lewis likely supported herself
financially by carving portrait busts for acquaintances who paid her to represent their features. Thus, Lewis’s portrait busts are a central aspect
of her career as a sculptor.
Based on the texts, both authors would most likely agree with which statement?$qb$, null, $qb$[{"label": "A", "body": "Lewis’s portrait busts have overshadowed her other work."}, {"label": "B", "body": "The Death of Cleopatra is Lewis’s most famous piece."}, {"label": "C", "body": "Sculpting representations of historical figures was a short-lived trend."}, {"label": "D", "body": "Lewis’s works are varied in the subjects they depict."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. Author 1 acknowledges that Lewis sculpted other subjects besides historical and mythical figures, suggesting a
variety of subjects depicted. Author 2 mentions that Lewis carved portrait busts as well as historical sculptures, which also implies variation
among Lewis’s subjects.
Choice A is incorrect. Neither text suggests that Lewis’s portrait busts have received more attention or appreciation than her other work. Author 1
briefly mentions her “other works,” but mostly focuses on her historical and mythical works. Author 2 states that art historians have typically
ignored her portrait busts, which suggests that they haven’t overshadowed her other work. Choice B is incorrect. Neither text explicitly states that
The Death of Cleopatra is Lewis’s most famous piece. Author 1 mentions it as one example of her historical works, but does not single it out as
being more important or influential than Hagar. Author 2 does not mention it at all, focusing instead on her portrait busts. Choice C is incorrect.
This choice isn’t supported by the texts. Neither text suggests that sculpting historical figures was a trend that faded quickly.$qb$);
select seed_pool_question($qb$CB-7a0e31ea$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from Betty Smith’s 1943 novel A Tree Grows in Brooklyn. Francie, a young girl, visits the library often.
Francie thought that all the books in the world were in that library and she had a plan about reading all the books in the world. She
was reading a book a day in alphabetical order and not skipping the dry ones. She remembered that the first author had been
Abbott. She had been reading a book a day for a long time now and she was still in the B’s. Already she had read about bees and
buffaloes, Bermuda vacations and Byzantine architecture. For all her enthusiasm, she had to admit that some of the B’s had been
hard going. But Francie was a reader.
©1947 by Betty Smith
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To illustrate Francie’s enjoyment of an unusual topic"}, {"label": "B", "body": "To explain why Francie prefers reading over other activities"}, {"label": "C", "body": "To portray Francie’s determination to meet a goal"}, {"label": "D", "body": "To describe a book that Francie greatly admires"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most accurately describes the main purpose of the text, which is to portray Francie’s determination to
reach her goal of reading all the books in the world. The text indicates that to achieve this aim, Francie works systematically and persistently: she
reads all the books in the library in alphabetical order and devotes much time and effort to the project, finishing one book per day over a long
period of time. The text then suggests that even though she progresses slowly ("she was still in the B’s") and that she struggled with some books
("some of the B’s had been hard going"), she doesn’t give up because she thinks of herself as "a reader." These details show Francie’s resolve.
Choice A is incorrect. Although the text mentions several topics (bees and buffaloes, Bermuda vacations, and Byzantine architecture) that
Francie has read about, it doesn’t indicate that any of these topics are unusual or that she especially enjoyed reading about one of these topics in
particular. If anything, the text suggests that she may have found some of these topics to be dull, saying that she even read the "dry ones"—that
is, the boring books—and that some of the books were "hard going," meaning they were difficult to get through. Choice B is incorrect because the
text doesn’t discuss Francie’s involvement in other activities, only her dedication to reading. Although it’s possible that Francie dedicates herself
to reading because she prefers it to other activities, the text doesn’t indicate whether this is the case. Choice D is incorrect. Although the text
mentions one author (Abbott) whose book Francie has read as well as several topics (bees and buffaloes, Bermuda vacations, and Byzantine
architecture) she has encountered, the text doesn’t say whether Francie admires any of the books she’s read so far. Instead, the text focuses on
the time and effort she devotes to reaching her goal of reading all the books in the world—even ones she doesn’t enjoy.$qb$);
select seed_pool_question($qb$CB-cce2f8dc$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 2023 literary scholar Jeremy Douglass cautioned technology investors and enthusiasts who predict conventional books’ ultimate
displacement by newer forms of media. Douglass observed that the concept of an -“interactive” text is much older than technologists assume,
extending back to the first time readers scratched notes into a text-’s margins. In addition, newer media, such as video games, haven’t replaced
older forms of entertainment, such as comic books, but rather exist alongside them. Douglass believes that rather than supplanting books,
technology is simply making new forms of expression possible.
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It challenges the stance of the investors and enthusiasts who are mentioned earlier in the text."}, {"label": "B", "body": "It explains the basis for the claim made by the technologists mentioned in the text."}, {"label": "C", "body": "It suggests that academics are better suited than investors to see the potential uses of contemporary interactive texts."}, {"label": "D", "body": "It provides a historical anecdote about the technological challenges involved in reading the earliest interactive texts."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes how the underlined portion functions in the text as a whole. The first sentence
of the text introduces literary scholar Jeremy Douglass’s warning to technology investors and enthusiasts against predicting the displacement of
conventional books by newer media forms. The next sentence, which is underlined in part, presents Douglass’s observation that interactive texts
are hardly new; they have been available for longer than technologists assume, beginning with the first time readers wrote notes in texts’
margins. Thus, the function of the underlined portion is to challenge the stance of the technology investors and enthusiasts mentioned earlier in
the text. As the remainder of the text points out, newer media doesn’t necessarily replace older media, but rather, as Douglass believes, leads to
new forms of expression.
Choice B is incorrect because the underlined portion challenges the position taken by investors and enthusiasts; it doesn’t provide context for
their claims. Choice C is incorrect because the underlined portion doesn’t mention academics or compare them to investors regarding their
ability to see potential in using contemporary interactive texts; instead, the underlined portion challenges the position of investors and
enthusiasts who predict that conventional books will be replaced by newer forms of media. Choice D is incorrect because the underlined portion
doesn’t address technological challenges; instead, it disputes the stance taken by investors and enthusiasts, suggesting that conventional books
haven’t been displaced by traditional interactions with texts, such as writing in the margins, and won’t be supplanted by newer forms of media
either.$qb$);
select seed_pool_question($qb$CB-7b43c0cc$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Steiger Butte Drum, a family ensemble from the Klamath Tribes of the Pacific Northwest, collaborated with composer Michael Gordon to create
Natural History, a work featuring traditional drumming and vocals alongside an orchestra and chorus. Steiger Butte Drum’s participation is ______
to the piece: members not only contributed to its composition but also must be included in all performances.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "tangential"}, {"label": "B", "body": "subsequent"}, {"label": "C", "body": "analogous"}, {"label": "D", "body": "integral"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of Steiger Butte Drum’s contributions to the musical work
Natural History. In this context, “integral” means essential or necessary to the whole. The text states that Steiger Butte Drum not only took part in
the piece’s creation, collaborating with composer Michael Gordon on it, but also “must be included in all performances.” This context clearly
indicates that the ensemble’s participation is essential, or integral, to the piece, both in its creation and its performance.
Choice A is incorrect because in this context, “tangential” would mean peripheral or of little relevance to something. The text emphasizes the
importance of Steiger Butte Drum’s involvement in both the composition and performance of Natural History, indicating their role is central, not
tangential. Choice B is incorrect because in this context, “subsequent” would mean following after or coming later than something else. The text
doesn’t establish a temporal sequence where the participation of Steiger Butte Drum followed after the creation of Natural History; rather, it
indicates that the ensemble was involved with the piece from the beginning, having worked with Michael Gordon during the creation process.
Choice C is incorrect because in this context, “analogous” would mean similar or comparable to something else, and the text doesn’t compare
Steiger Butte Drum’s participation in the creation and performances of Natural History to anything else; instead, it describes the nature and
importance of the ensemble’s involvement.$qb$);
select seed_pool_question($qb$CB-6977d22b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Ecologists have long wondered how thousands of microscopic phytoplankton species can live together near ocean surfaces competing for the
same resources. According to conventional wisdom, one species should emerge after outcompeting the rest. So why do so many species-
remain? Ecologists’ many efforts to explain this phenomenon still haven’t uncovered a satisfactory explanation.
Text 2
Ecologist Michael Behrenfeld and colleagues have connected phytoplankton’s diversity to their microscopic size. Because these organisms are
so tiny, they are spaced relatively far apart from each other in ocean water and, moreover, experience that water as a relatively dense substance.
This in turn makes it hard for them to move around and interact with one another. Therefore, says Behrenfeld’s team, direct competition among
phytoplankton probably happens much less than previously thought.
Based on the texts, how would Behrenfeld and colleagues (Text 2) most likely respond to the “conventional wisdom” discussed in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By arguing that it is based on a misconception about phytoplankton species competing with one another"}, {"label": "B", "body": "By asserting that it fails to recognize that routine replenishment of ocean nutrients prevents competition between phytoplankton species"}, {"label": "C", "body": "By suggesting that their own findings help clarify how phytoplankton species are able to compete with larger organisms"}, {"label": "D", "body": "By recommending that more ecologists focus their research on how competition among phytoplankton species is increased with water density"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because based on Text 2, it represents how Behrenfeld and colleagues would most likely respond to the
“conventional wisdom” discussed in Text 1. The conventional wisdom cited holds the opinion that when there is species diversity within a
phytoplankton population, “one species should emerge after outcompeting the rest”—that is, after being so successful in competing for
resources that the other species vanish from the population. However, Text 2 explains that according to Behrenfeld and colleagues,
phytoplankton are so small and spaced so far apart in the water that there is “much less” direct competition for resources within phytoplankton
populations than scientists had previously thought.
Choice B is incorrect because Text 2 never discusses whether routine replenishment of ocean nutrients affects competition between
phytoplankton species. Choice C is incorrect because the interspecies competition discussed in both texts is specifically between phytoplankton
species, and neither text considers whether phytoplankton compete for resources with larger nonphytoplankton species. Choice D is incorrect
because according to Text 2, Behrenfeld and colleagues argue that water density decreases, not increases, competition between phytoplankton
species.$qb$);
select seed_pool_question($qb$CB-213248f7$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Lewis Carroll’s 1865 novel Alice’s Adventures in Wonderland.
“The second thing is to find my way into that lovely garden. I think that will be the best plan.” It sounded like an excellent plan, no
doubt, and very neatly and simply arranged; the only difficulty was, that Alice had not the smallest idea how to set about it.-
As used in the text, what does the word “simply” most nearly mean?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-213248f7.png$qb$, $qb$[{"label": "A", "body": "Faintly"}, {"label": "B", "body": "Hastily"}, {"label": "C", "body": "Easily"}, {"label": "D", "body": "Foolishly"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because as used in the text, “simply” most nearly means easily, or involving minimal difficulty or effort. The text first
provides Alice’s reflections on her plan to gain access to a garden and then offers commentary on her plan by the novel’s narrator. The text
indicates that a reason Alice likes her plan despite not being fully thought through is that she nonetheless believes it can be efficiently arranged.
In other words, the text indicates that one of the supposed benefits of Alice’s plan is that it can be easily arranged.
Choice A is incorrect because the text describes how Alice’s plan can be arranged, and it wouldn’t make sense to say that it can be arranged
“faintly,” or with little strength or not strongly. Instead, the text indicates that the plan can be arranged with little difficulty. Choice B is incorrect.
Although in some contexts “simply” can mean quickly, hastily, or hurriedly, the word “hastily” indicates that something is done too quickly.
Although it may be true that Alice’s plan was made in haste, the text doesn’t focus on this aspect of her plan. Instead, the text focuses on the
plan’s seemingly good qualities, saying that Alice thinks of it as “the best,” and the narrator refers to it as “excellent” and “neatly,” or efficiently,
arranged. Choice D is incorrect. Although in some contexts “simply” can mean foolishly, or lacking good sense, it doesn’t have this meaning in
this context. Although the text says that Alice doesn’t know how to go about her plan, it begins by presenting her plan in a positive light: Alice
describes her plan as “the best,” and the narrator refers to the plan as “excellent” and “neatly,” or efficiently, arranged.$qb$);
select seed_pool_question($qb$CB-6bc0ba75$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The mimosa tree evolved in East Asia, where the beetle Bruchidius terrenus preys on its seeds. In 1785, mimosa trees were introduced to North
America, far from any B. terrenus. But evolutionary links between predators and their prey can persist across centuries and continents. Around-
2001, B. terrenus was introduced in southeastern North America near where botanist Shu-Mei Chang and colleagues had been monitoring
mimosa trees. Within a year, 93 percent of the trees had been attacked by the beetles.
Which choice best describes the function of the third sentence in the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It states the hypothesis that Chang and colleagues had set out to investigate using mimosa trees and B. terrenus."}, {"label": "B", "body": "It presents a generalization that is exemplified by the discussion of the mimosa trees and B. terrenus."}, {"label": "C", "body": "It provides context that clarifies why the species mentioned spread to new locations."}, {"label": "D", "body": "It offers an alternative explanation for the findings of Chang and colleagues."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes the function of the third sentence within the overall structure of the text. The
third sentence makes a generalization, asserting that evolutionary links between predators and prey can persist across great expanses of time
and distance. This generalization is exemplified by the text’s discussion of the relationship between mimosa trees and B. terrenus beetles. When
mimosa trees were introduced to North America in 1785, no B. terrenus beetles were present, so the relationship between the trees and the
beetles that exists in their native East Asia was disrupted. When the beetles were introduced to North America more than 200 years later,
however, they quickly attacked mimosa trees, illustrating the generalization that links between predators and prey "can persist across centuries
and continents."
Choice A is incorrect because the third sentence doesn’t indicate that Chang and colleagues were investigating any hypothesis. According to the
text, Chang and colleagues were simply monitoring mimosa trees when the beetles happened to be introduced to the area. Choice C is incorrect
because the third sentence doesn’t discuss any particular species, let alone the species mentioned elsewhere in the text, nor does the sentence
explain why species spread to new locations. Choice D is incorrect because the third sentence offers a generalization about the relationship
between predators and prey, not an explanation for the findings by Chang and colleagues that’s an "alternative" to an explanation presented
elsewhere in the text.$qb$);
select seed_pool_question($qb$CB-b4d29611$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Michelene Pesantubbee, a historian and citizen of the Choctaw Nation, has identified a dilemma inherent to research on the status of women in
her tribe during the 1600s and 1700s: the primary sources from that era, travel narratives and other accounts by male European colonizers,
underestimate the degree of power conferred on Choctaw women by their traditional roles in political, civic, and ceremonial life. Pesantubbee
argues that the Choctaw oral tradition and findings from archaeological sites in the tribe’s homeland supplement the written record by providing
crucial insights into those roles.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It details the shortcomings of certain historical sources, then argues that research should avoid those sources altogether."}, {"label": "B", "body": "It describes a problem that arises in research on a particular topic, then sketches a historian’s approach to addressing that problem."}, {"label": "C", "body": "It lists the advantages of a particular research method, then acknowledges a historian’s criticism of that method."}, {"label": "D", "body": "It characterizes a particular topic as especially challenging to research, then suggests a related topic for historians to pursue instead."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The text begins by stating a problem with research on the status of Choctaw women in the 1600s and 1700s:
written primary sources underestimate the power they had in their traditional roles. Then it presents one historian’s solution: looking to oral
tradition and archeological findings for more insight into these roles.
Choice A is incorrect. This isn’t the overall structure. The text never says that research should avoid written primary sources, just that research
should also use oral tradition and archeological sites as sources. Choice C is incorrect. This isn’t the overall structure. The text never mentions
the advantages of using written primary sources. Choice D is incorrect. This isn’t the overall structure. The text never says that the status of
Choctaw women during the 1600s and 1700s is too challenging to research. And it doesn’t mention any other topics to research instead.$qb$);
select seed_pool_question($qb$CB-fdca960a$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Yanzhe Fu et al. suggest that the extinct aquatic insect Karataviella popovi utilized a brood care strategy that mitigated the risk of oxygen
deficiency. This determination rests on the researchers’ analysis of fossils uncovered at a particularly ______ site: China’s Haifanggou Formation,
which has yielded a vast diversity of fossils, including those of long-proboscid scorpionflies.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "fruitful"}, {"label": "B", "body": "unassailable"}, {"label": "C", "body": "obscure"}, {"label": "D", "body": "quantified"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of the fossil site from which the evidence about brood care
in K. popovi was recovered. In this context, “fruitful” means abundantly productive. The text indicates that the researchers drew their evidence
from fossils found in China’s Haifanggou Formation, a location that has yielded a vast diversity of fossils. The information about the site yielding
a vast diversity of fossils supports the characterization of the Haifanggou Formation as particularly productive, or fruitful.
Choice B is incorrect because there is nothing in the text to support characterizing the Haifanggou Formation as a site that is particularly
“unassailable,” or not open to attack, question, or criticism. The text emphasizes that the site has yielded a vast diversity of fossils, suggesting
that it is a particularly productive location for fossil hunters, not that it cannot be challenged. Choice C is incorrect because there is nothing in the
text to support characterizing the Haifanggou Formation as a site that is particularly “obscure,” or poorly understood or relatively unknown. In
fact, the text notes that the Haifanggou Formation has yielded a vast diversity of fossils, suggesting that the site is not an obscure one. Choice D
is incorrect because “quantified” means expressed or measured as a quantity, which does not describe the productiveness the context calls for.
Although the text indicates that the Haifanggou Formation has yielded a vast diversity of fossils, that fact suggests that the site can be
characterized as particularly productive, not as particularly quantified.$qb$);
select seed_pool_question($qb$CB-d3104a68$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Birds sing to communicate over potentially great distances. For this reason, many researchers believe that birds in densely vegetated habitats
generally sing at lower frequencies than birds living in comparatively sparse habitats, since dense vegetation tends to ______ the distance that
high-frequency sounds can travel.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "exceed"}, {"label": "B", "body": "diminish"}, {"label": "C", "body": "encompass"}, {"label": "D", "body": "conceal"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of birdsong. In this context, "diminish" means reduce or
lessen. The text establishes that birds sing to communicate over potentially large distances and that researchers believe that birds that live in
densely vegetated habitats sing at lower frequencies than birds that live in comparatively sparsely vegetated habitats. The text then explains that
researchers hold this belief due to some effect of dense vegetation on the distance that high-frequency sounds can travel. If birds sing to
communicate over long distances, it would be logical to conclude that researchers believe that birds in densely vegetated habitats sing at lower
frequencies than birds in relatively sparse habitats do because dense vegetation diminishes the distance that high-frequency sounds can travel.
Choice A is incorrect because nothing in the text suggests that dense vegetation can "exceed," or surpass or go beyond, the distance that high-
frequency sounds can travel. The text suggests that dense vegetation reduces the distance that high-frequency sounds can travel, not that dense
vegetation goes farther than that distance. Choice C is incorrect because it would not be sensible to say that dense vegetation can "encompass,"
or enclose or encircle, the distance that high-frequency sounds can travel. The distance that sounds can travel is not an object that can be
enclosed or encircled by vegetation. Choice D is incorrect because there is no information in the text indicating that dense vegetation can
"conceal," or hide or keep from being observed, the distance that high-frequency sounds travel. Instead, the text suggests that dense vegetation
reduces the distance that high-frequency sounds can travel.$qb$);
select seed_pool_question($qb$CB-4ce8e2fa$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Players of online games are largely aware that the games collect their data, and they’re often willing to trade some privacy for a fun experience.
But the games are often quite ______ about what data they collect and why. Because of this, data-privacy advocates are seeking to expand online
players’ knowledge of data collection practices and improve their ability to navigate privacy-setting features in games.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "opaque"}, {"label": "B", "body": "abrasive"}, {"label": "C", "body": "ambivalent"}, {"label": "D", "body": "outspoken"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of how online games disclose information about their data
collection practices. In this context, “opaque” means that games deliberately avoid sharing clear information about data collection. The text
indicates that data-privacy advocates are working to “expand online players’ knowledge of data collection practices” and improve players’ ability
to navigate privacy settings. The fact that advocates are working to expand players’ knowledge about data collection and privacy settings implies
that players currently lack clear information about these aspects of the games. This context therefore supports the idea that online games are
often quite unclear, or opaque, about what data they collect and why.
Choice B is incorrect because describing online games as being “abrasive,” or harsh and irritating, about their data collection practices wouldn’t
make sense in context. The text focuses on the clarity of the information about data collection that games share with players, not on the tone or
manner in which this information is communicated. Choice C is incorrect because describing the games as “ambivalent,” or having mixed
feelings, about their data collection practices wouldn’t make sense in context. The text isn’t discussing the game companies’ attitudes toward
their own practices; it’s discussing the extent to which information about those practices is communicated to players. Choice D is incorrect
because describing online games as “outspoken,” or frank and forthright, about their data collection practices would contradict the text. If the
games were forthright about data collection, data-privacy advocates wouldn’t need to work to expand players’ awareness of this aspect of
gaming. Instead, the text emphasizes the challenge of obtaining clear information about data collection in online games.$qb$);
select seed_pool_question($qb$CB-f6352bd3$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Many archaeologists assume that large-scale engineering projects in ancient societies required an elite class to plan and direct the necessary
labor. However, recent discoveries, such as the excavation of an ancient canal near the Gulf Coast of Alabama, have complicated this picture.
Using radiocarbon dating, a team of researchers concluded that the 1.39-kilometer-long canal was most likely constructed between 576 and 650
CE by an Indigenous society that was relatively free of social classes.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It describes a common view among archaeologists, then discusses a recent finding that challenges that view."}, {"label": "B", "body": "It outlines a method used in some archaeological fieldwork, then explains why an alternative method is superior to it."}, {"label": "C", "body": "It presents contradictory conclusions drawn by archaeologists, then evaluates a study that has apparently resolved that contradiction."}, {"label": "D", "body": "It identifies a gap in scientific research, then presents a strategy used by some archaeologists to remedy that gap."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes the overall structure of the text. The text begins by introducing an assumption
held by some archaeologists that in the past large-scale engineering projects would have needed an elite class to organize the projects and the
labor. Next, the text indicates that there have been some discoveries that complicate this assumption and provides an ancient canal near the
Alabama Gulf Coast as an example. Finally, the text presents research findings that an ancient canal—a large-scale project—was most likely
made by an Indigenous society that didn’t have an elite class. Thus, the text describes a common view held by archaeologists and then presents
a recent finding that challenges that view.
Choice B is incorrect. Although the text mentions that researchers used radiocarbon dating, this occurs in the last sentence and there are no
other methods mentioned or evaluated. Instead, the text presents an assumption about large-scale engineering projects and then introduces
research into an ancient canal off the coast of Alabama that challenges the assumption. Choice C is incorrect because the study doesn’t present
multiple contradictions that are later resolved; instead, it introduces an assumption about a society’s need for elite classes to oversee large-scale
engineering projects and then later challenges that assumption by introducing a study that found that a large-scale engineering project was
successfully undertaken by an Indigenous society known to have been “relatively free of social classes.” Choice D is incorrect because the text
doesn’t mention a gap in scientific research. Instead, it identifies an assumption made by many archaeologists about the conditions needed for
societies to undertake large-scale engineering projects and then presents an example of an ancient project that undermines that assumption.$qb$);
select seed_pool_question($qb$CB-5fa165f7$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the 1960s, Sam Gilliam, a Black painter from the southern United States, became the first artist to drape painted canvases into flowing shapes.
He later explored a different style, ______ quilt-like paintings inspired by the patchwork quilting tradition of Black communities in the South.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "predicting"}, {"label": "B", "body": "refusing"}, {"label": "C", "body": "hiding"}, {"label": "D", "body": "creating"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of Sam Gilliam’s artworks. As used in this context,
“creating” means producing or bringing something into existence. The text indicates that Gilliam is an artist who made draped canvases and,
later, quilt-like paintings. This context supports the idea that Gilliam explored different styles in his art by creating special types of paintings.
Choice A is incorrect because the text indicates that Gilliam actually explored and pursued the creation of quilt-like paintings; he wasn’t just
“predicting,” or declaring in advance, the existence of these paintings. Choice B is incorrect because in this context “refusing” would mean
rejecting, and there is nothing in the text to suggest that Gilliam rejected his quilt-like paintings. Instead, the text indicates that he was exploring
and pursuing a new art style in these paintings. Choice C is incorrect because in this context “hiding” would mean concealing from view, and
there is nothing in the text to suggest that Gilliam attempted to conceal his quilt-like paintings. Instead, the text indicates that he was exploring
and pursuing a new art style in these paintings.$qb$);
select seed_pool_question($qb$CB-3e63fce0$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A team of researchers discovered that Matabele ants can identify an infected wound in a member of the colony and then treat the infection by
covering the wound with antimicrobial secretions that the ants produce. The team found that the mortality rate for Matabele ants with infected
injuries was reduced by 90% with this treatment, and they are hopeful that this discovery could aid in the development of new antibiotics for
human use.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It summarizes research findings on Matabele ants and then identifies an area for further research."}, {"label": "B", "body": "It introduces a study of Matabele ants and then explains the research methods used in the study."}, {"label": "C", "body": "It describes unique properties of Matabele ants and then speculates on how those properties evolved."}, {"label": "D", "body": "It identifies an issue concerning Matabele ants and then proposes a solution to address the issue."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes the overall structure of the text. The text first presents what researchers found
from studying Matabele ants: the ants can tell when colony members have infected wounds and can largely successfully treat those infections
with their antimicrobial secretions. The text then indicates that the findings about the ants could help with the future development of antibiotics
for humans. Thus, the text summarizes research findings and then identifies an area for further research.
Choice B is incorrect. Although the text introduces a study about Matabele ants, it never discusses how the researchers did their work or any
methods they used to produce their findings. Choice C is incorrect. Although the text does describe properties of Matabele ants—their ability to
detect and largely successfully treat infected wounds in colony members—it never addresses evolution or how these properties might have
changed. Choice D is incorrect because the text doesn’t present anything about Matabele ants as an issue or problem to be solved. Instead, it
discusses beneficial abilities the ants have (detecting and treating infected wounds) and suggests that understanding those abilities might be
useful for human medicine.$qb$);
select seed_pool_question($qb$CB-d5600e74$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Pam Muñoz Ryan’s 2020 novel Mañanaland. In the village where Max lives, there is an old fortress called La
Reina. Children in the village say that the fortress is haunted.
For as long as he could remember, Max had begged Papá [his father] to take him to see La Reina and the ruins up close. He’d be a
hero among his friends if he was the first boy to cross the haunted gates! Just because Papá didn’t believe in ghosts didn’t mean
they weren’t there. Maybe this summer Papá would finally take him. He was almost twelve.
©2020 by Pam Muñoz Ryan
Which choice best describes the overall purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To portray how proud Max’s father is of Max"}, {"label": "B", "body": "To explain why Max doesn’t want to grow up yet"}, {"label": "C", "body": "To criticize Max for disliking summer"}, {"label": "D", "body": "To show how much Max wants to visit La Reina"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes the overall purpose of the text. The text indicates that "for as long as he could
remember," Max had "begged" his father to take him to La Reina. This point is later emphasized in the text by indicating that "this summer" his
father might "finally take" Max to visit La Reina. Thus, the purpose of the text as a whole is to show how much Max wants to visit La Reina.
Choice A is incorrect. The text does not discuss Papa’s feelings toward Max. Rather, it mentions that Max has long wanted Papa to take him to
La Reina and that, unlike Max and some other children, Papa does not believe that La Reina is haunted. Choice B is incorrect. The text mentions
that Max is "almost twelve" at the time, which suggests anticipation of growing up rather than refusal to. Choice C is incorrect. The text indicates
that Max hopes to visit La Reina during the current summer, but nothing suggests that Max dislikes summer.$qb$);
select seed_pool_question($qb$CB-86fbc64d$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Domesticated thousands of years ago by Indigenous people in South America, cacao, the plant from which chocolate is made, deviates
structurally from the wild plant it is descended from. Maize (corn), another crop domesticated by Indigenous Americans, shows so little
resemblance to any wild plant that genetic research was necessary to ______ teosinte grass as its ancestor.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "acquire"}, {"label": "B", "body": "develop"}, {"label": "C", "body": "attract"}, {"label": "D", "body": "confirm"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of the identification of maize’s wild ancestor. In this
context, to "confirm" means to establish the truth or correctness of something. The text explains that maize "shows so little resemblance to any
wild plant that genetic research was necessary" to establish its ancestry, which was ultimately traced to teosinte grass. This context conveys the
idea that scientific verification was required to establish an ancestral relationship with certainty—that is, to confirm teosinte grass as maize’s
ancestor.
Choice A is incorrect because to "acquire" means to obtain or gain possession of something. Although their research likely required scientists to
acquire samples of maize and teosinte grass, the text does not suggest that this was the ultimate goal of their work, which instead probed the
connection between the two plants. Choice B is incorrect because to "develop" means to create something or to promote the growth of
something, and the ancestral relationship between teosinte grass and maize already existed as a biological fact in the deep past, which
scientists then verified through research; because this relationship already existed, the scientists can’t be said to have either created it or
encouraged its growth. Choice C is incorrect because to "attract" means to entice something or to bring about a relationship or connection
between two things, while the ancestral relationship between teosinte grass and maize already existed as a biological fact; rather than bringing
about the relationship between the two plants, the scientists instead verified the prior existence of it.$qb$);
select seed_pool_question($qb$CB-5444db38$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To demonstrate that the integrity of underground metal pipes can be assessed without unearthing the pipes, engineer Aroba Saleem and
colleagues ______ the tendency of some metals’ internal magnetic fields to alter under stress: the team showed that such alterations can be
measured from a distance and can reveal concentrations of stress in the pipes.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "hypothesized"}, {"label": "B", "body": "discounted"}, {"label": "C", "body": "redefined"}, {"label": "D", "body": "exploited"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of using magnetism to detect stress in buried metal pipes.
In this context, "exploited" means made productive use of. The text indicates that the magnetic fields of some metals change under stress and
that Saleem and colleagues showed that it is possible to measure those changes from a distance, thereby demonstrating that the integrity of
underground metal pipes can be evaluated without having to unearth them. This context thus indicates that Saleem and colleagues made
productive use of, or exploited, this tendency of the metals’ magnetic fields.
Choice A is incorrect because in this context, "hypothesized" would mean made a tentative assumption to be evaluated in a study or experiment.
Although Saleem and colleagues may have had one or more hypotheses for these experiments, the text presents the information about the
tendency of some metals’ magnetic fields to change under stress as a known fact that the researchers made productive use of, not as a
hypothesis to be evaluated. The text after the colon indicates that the researchers were not evaluating whether such changes occur but whether
those changes can be measured at a distance. Choice B is incorrect because in this context, "discounted" would mean downplayed or ignored,
but the text does not suggest that Saleem and colleagues minimized or ignored the tendency of the magnetic fields of some metals to change
under stress. Rather, the text indicates that this tendency is the basis for Saleem and colleagues’ method of assessing the pipes’ integrity.
Choice C is incorrect because nothing in the text indicates that Saleem and colleagues "redefined," or reevaluated or reformulated, the tendency
of some metals’ magnetic fields to change under stress. Instead, the text indicates that the researchers made use of that tendency to
demonstrate that it is possible to evaluate the integrity of underground pipes without unearthing them.$qb$);
select seed_pool_question($qb$CB-6017ae31$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 2016, Gabriela González and team announced that a chirping sound captured by Laser Interferometer Gravitational-Wave Observatory
antennas was direct evidence of gravitational waves, which skeptics had argued would be too faint for detection. Detailed statistical analysis
helped preclude claims of the event’s ______, confirming the signal at a confidence level of over 99%.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "inconspicuousness"}, {"label": "B", "body": "discretion"}, {"label": "C", "body": "ambiguity"}, {"label": "D", "body": "probability"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of Gabriela González and team’s detection of gravitational
waves. In this context, "ambiguity" means uncertainty or doubtfulness. The text explains that although skeptics had thought that direct evidence
of gravitational waves would be too faint to be detected, researchers led by González claimed that a chirping sound captured by Laser
Interferometer Gravitational-Wave Observatory antennas nevertheless provided such evidence. The text goes on to say that detailed statistical
analysis confirmed the observation of gravitational waves with a high degree of confidence—that is, with near certainty—a finding that helped to
preclude, or rule out, any claims that the signal’s attribution to gravitational waves might be ambiguous or doubtful.
Choice A is incorrect. In this context, "inconspicuousness" would mean the quality of being unnoticeable or difficult to detect. Although the text
indicates that skeptics had doubted whether gravitational waves could be observed directly because of their presumed faintness (which
suggests that gravitational waves were expected to be difficult to detect), the blank portion of the text isn’t referring to the possibility that
gravitational waves are unnoticeable or undetectable. Instead, the focus of the last sentence is González’s team’s observation of a chirping
sound that they attributed to gravitational waves, and it wouldn’t make sense to say that through statistical analysis, they ruled out the possibility
that the sound they observed was undetectable. Rather, the skeptical view presented in the text suggests that there could be some ambiguity
about the source of the chirping, but statistical analysis virtually eliminated this uncertainty. Choice B is incorrect because in this context,
"discretion" would mean good judgment, and it wouldn’t make sense to say that an event, such as the detection of gravitational waves, would
show judgment, much less that the event’s capacity to exercise good judgment would be precluded by statistical analysis confirming its
attribution. Choice D is incorrect because in this context, "probability" would mean likelihood, and the text states that statistical analysis, which
confirmed the signal with a high degree of confidence, suggests the likelihood that the chirping sound was produced by gravitational waves, not
that the analysis helped to preclude this likelihood.$qb$);
select seed_pool_question($qb$CB-571cf537$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The author’s claim about the relationship between Neanderthals and Homo sapiens is ______, as it fails to account for several recent
archaeological discoveries. To be convincing, his argument would need to address recent finds of additional hominid fossils, such as the latest
Denisovan specimens and Homo longi.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "disorienting"}, {"label": "B", "body": "tenuous"}, {"label": "C", "body": "nuanced"}, {"label": "D", "body": "unoriginal"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of the author’s claim about the relationship between
Neanderthals and Homo sapiens. As used in this context, “tenuous” means lacking substance. The end of the first sentence states that the
author’s claim didn’t consider certain key pieces of evidence—“recent archaeological discoveries”—and is therefore weak.
Choice A is incorrect because it wouldn’t make sense in context to refer to the author’s claim as “disorienting,” or confusing. The text suggests
that the author’s claim is insubstantial, not that it’s difficult to grasp. Choice C is incorrect because referring to the claim as “nuanced,” or subtle,
wouldn’t make sense in context. According to the text, the claim is incomplete because it didn’t consider certain key information about recent
archaeological finds; it doesn’t suggest that what’s in the claim lacks precision. Choice D is incorrect because saying that the claim is
“unoriginal,” or imitative, wouldn’t make sense in context. The text faults the claim because it doesn’t consider certain key information about
recent archaeological finds; it doesn’t suggest that the author’s claim lacks originality.$qb$);
select seed_pool_question($qb$CB-764331f8$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is from Louise Erdrich’s 1986 novel The Beet Queen. The narrator discusses her relationship with her young niece, Dot.
Celestine, the narrator’s sister-in-law, is Dot’s mother.
Dot was as impatient with babyhood as I. She tried at once to grow out of it. Celestine never saw that, because she, and only she,
took pleasure in Dot’s helpless softness. Only Celestine was saddened by her daughter’s fierce progress. Day by day, Dot grew
stronger. In her shopping-cart stroller she exercised to exhaustion, bouncing for hours to develop her leg muscles.-
©1986 by Louise Erdrich
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It offers a detail that shows how Dot is growing stronger."}, {"label": "B", "body": "It expresses hope that Celestine will mature psychologically."}, {"label": "C", "body": "It explores some of the narrator’s psychological characteristics."}, {"label": "D", "body": "It indicates how sad Celestine is by describing a behavior she engages in."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most accurately describes how the underlined sentence functions in the text as a whole. In the text, the
narrator makes observations about her young niece, Dot, noting that Dot is making progress toward outgrowing babyhood and is growing
stronger "day by day." The description of Dot purposefully exercising by "bouncing for hours" reinforces the narrator’s earlier characterization of
Dot. The underlined sentence thus offers a detail that shows how Dot is growing stronger.
Choice B is incorrect. While a sentence earlier in the text mentions Celestine’s psychological state (sadness because Dot is growing fast), the
underlined sentence doesn’t focus on Celestine at all. Instead, the sentence focuses on Dot’s physical activities to show that she is getting
stronger. Choice C is incorrect because the underlined sentence describes Dot’s behavior, not the narrator’s psychological characteristics. While
a sentence earlier in the text establishes that the narrator, like Dot, was "impatient with babyhood," the underlined sentence specifically
addresses Dot’s physical activities in her stroller. Choice D is incorrect. While an earlier sentence in the text mentions that Celestine is sad, the
underlined sentence doesn’t focus on how Celestine feels nor does it describe a behavior that Celestine engages in. The sentence focuses
entirely on Dot’s actions, describing her as "bouncing for hours" to show that she is growing stronger.$qb$);
select seed_pool_question($qb$CB-dba9eaf8$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Within baleen whale species, some individuals develop an accessory spleen—a seemingly functionless formation of splenetic tissue outside the
normal spleen. Given the formation’s greater prevalence among whales known to make deeper dives, some researchers hypothesize that its role
isn’t ______; rather, the accessory spleen may actively support diving mechanisms.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "replicable"}, {"label": "B", "body": "predetermined"}, {"label": "C", "body": "operative"}, {"label": "D", "body": "latent"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of baleen whale accessory spleens. In this context, “latent”
means dormant or functionless. The text sets up a contrast between the idea that baleen whale accessory spleens appear not to have a function
and the research indicating that the accessory spleen may actually have a role in supporting the whales’ diving mechanisms. This context
therefore conveys the idea that the assumption that baleen whale accessory spleens are latent may be incorrect.
Choice A is incorrect because it wouldn’t make sense to say that the role of the accessory spleen is “replicable,” or capable of being reproduced.
The text indicates that the role of the accessory spleen seems to have no function, but some researchers think it does have a role; the text
doesn’t address whether the role of the accessory spleen could or couldn’t be reproduced. Choice B is incorrect because suggesting that the role
of the accessory spleen is “predetermined,” or decided in advance, wouldn’t make sense in context. Although the researchers may agree that the
role of the accessory spleen or any other organ hasn’t been determined in advance, the text focuses on the idea that the accessory spleen was
thought to have been functionless but may in fact serve an active role for baleen whales. Choice C is incorrect because it’s the opposite of what
the context of the text is conveying. The second sentence of the text indicates that baleen whale accessory spleens may not be useless, not that
they aren’t “operative,” or functional.$qb$);
select seed_pool_question($qb$CB-a756aa95$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The province of Xoconochco was situated on the Pacific coast, hundreds of kilometers southeast of Tenochtitlan, the capital of the Aztec
Empire. Because Xoconochco’s location within the empire was so ______, cacao and other trade goods produced there could reach the capital
only after a long overland journey.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "unobtrusive"}, {"label": "B", "body": "concealed"}, {"label": "C", "body": "approximate"}, {"label": "D", "body": "peripheral"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most logically completes the text’s discussion of the location of the province of Xoconochco within the
Aztec Empire. As used in this context, “peripheral” means situated toward the outer bounds rather than the center. The text indicates that
Xoconochco was located on a coast, hundreds of kilometers away from the capital of the Aztec Empire. The text also states that trade between
the province and the capital required “a long overland journey.” This context suggests that Xoconochco was situated toward an edge of the
empire’s territory rather than near its center.
Choice A is incorrect because it wouldn’t make sense in context to refer to Xoconochco’s location within the Aztec Empire as “unobtrusive,” or
not blatant or undesirably prominent; it’s not clear how a province’s physical location would or wouldn’t be blatant. Instead of focusing on how
noticeable Xoconochco’s location was, the text emphasizes the province’s distance from the capital of the empire, pointing out that because of
this distance trade between the two required “a long overland journey.” Choice B is incorrect because the text indicates that the province of
Xoconochco was located on a coast far from the capital of the Aztec Empire, not that it was “concealed,” or kept out of sight or hidden from view.
Nothing in the text suggests that Xoconochco was actually hidden such that people couldn’t see it, and being hidden wouldn’t necessarily result
in trade between the province and the capital requiring “a long overland journey.” Choice C is incorrect because to say that Xoconochco’s location
within the Aztec Empire was “approximate” would mean that the location either wasn’t precisely correct or was close to some other location.
Neither of these meanings would make sense in context because the text indicates that Xoconochco’s location is known and that it was far from
the empire’s capital, so there’s no reason to characterize the location as either not precisely correct or close to another location.$qb$);
select seed_pool_question($qb$CB-0ed8f24f$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$K.D. Leka and colleagues found that the Sun’s corona provides an advance indication of solar flares—intense eruptions of electromagnetic
radiation that emanate from active regions in the Sun’s photosphere and can interfere with telecommunications on Earth. Preceding a flare, the
corona temporarily exhibits increased brightness above the region where the flare is ______.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "antecedent"}, {"label": "B", "body": "impending"}, {"label": "C", "body": "innocuous"}, {"label": "D", "body": "perpetual"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of advance indications of solar flares. In this context the
word "impending" means imminent or approaching. The text mentions a study by Leka and colleagues that found that the Sun’s corona provides
an advance indication of solar flares. The text then points out why such an advance indication would be useful—solar flares can interfere with
communications on Earth—and concludes by describing the characteristic of the corona that gives warning of a solar flare. The text indicates
that this characteristic—increased brightness in a particular region of the corona—comes before the appearance of the flare. Therefore, in
context, the best answer would indicate that the flare is approaching, or impending.
Choice A is incorrect. The best answer would be one that indicates that the increased brightness of the Sun’s corona precedes the appearance of
the flare. But if the flare were "antecedent," or previous, then the flare would instead precede the appearance of the increased brightness of the
corona, a statement that is logically inconsistent. Choice C is incorrect. The word "innocuous," or harmless, does not logically complete the text;
since solar flares can interfere with communications on Earth, they cannot reasonably be described as innocuous. Choice D is incorrect. If the
solar flares have an advance indication of their appearance, then there must therefore be a time before the appearance of the flares when they
do not exist. But the word "perpetual," or never-ending, would in context indicate that the flare exists at the same time as the advance indication
provided by the Sun’s corona, which would not make logical sense.$qb$);
select seed_pool_question($qb$CB-8889d6e2$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
An excavation in Chiquihuite Cave in central Mexico has upended the belief that approximately 13,000 years ago, a group known as the Clovis
people were the first human inhabitants of North America. More than 200 crude stone tools were found embedded in a layer of earth that is up to
33,150 years old, revealing that humans occupied the cave thousands of years before the Clovis people reached the continent.-
Text 2
The objects uncovered in Chiquihuite Cave are intriguing, but it is premature to characterize them as tools. The stone pieces are so roughly
shaped that they may have simply fractured from rocks during natural geological activity in the cave. Moreover, their unearthing has thus far not
been accompanied by discoveries of other signs of human activity or even traces of human DNA from surfaces.
Based on the texts, how would the author of Text 2 most likely respond to the underlined claim in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By suggesting that it draws a plausible connection between two groups of people but will need to be confirmed with further study"}, {"label": "B", "body": "By asserting that it rests on an assumption about the stone pieces that is not sufficiently supported by available evidence"}, {"label": "C", "body": "By acknowledging that it will most likely be proved correct when the stone pieces undergo more detailed analysis"}, {"label": "D", "body": "By pointing out that it fails to account for evidence that the Clovis people were active on the continent as early as is commonly thought"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it reflects how the author of Text 2 would most likely respond to the underlined claim about the Clovis
people in Text 1. Text 1 explains that the idea that the Clovis people were the first human inhabitants of North America has been overturned by
the unearthing of stone tools in Chiquihuite Cave in Mexico. The tools were found in a layer of earth that is over 33,000 years old—much older
than the Clovis people’s arrival 13,000 years ago. The text ends with the claim that the tools reveal that humans lived in the cave long before the
Clovis people reached the continent. Text 2, on the other hand, disputes the idea that the stone pieces are definitely tools. Text 2 states that the
pieces are so roughly shaped that they may have simply naturally broken off from rocks and, moreover, that no other signs of human activity
have been found in the cave. In other words, Text 2 argues that there is no proof yet that humans made the pieces as tools or were even present
in the cave. Therefore, the author of Text 2 would most likely say that the claim that humans occupied Chiquihuite Cave long before the Clovis
people reached North America rests on an assumption about the stone pieces—that they are human-made tools—that is not sufficiently
supported by available evidence.
Choice A is incorrect because Text 1 doesn’t claim that human inhabitants of Chiquihuite Cave and the Clovis people had any connection; the
author of Text 1 focuses only on the timing of each group’s presence in North America. Further, the author of Text 2 makes no mention of the
Clovis people and indicates that it isn’t clear yet that any human group did inhabit Chiquihuite Cave. Choice C is incorrect because nothing in Text
2 suggests that the author believes the stone pieces probably are human-made tools and will be confirmed as such by further analysis; instead,
the author of Text 2 emphasizes the current lack of evidence of human activity in the cave. Choice D is incorrect because Text 2 focuses on the
issue of characterizing the stone pieces as tools made by humans, not on the timing of any particular group’s activity in North America; further,
Text 1 seems to support the common belief that the Clovis people reached North America 13,000 years ago and challenges only the idea that
they were the continent’s first inhabitants. Therefore, there’s no reason to think the author of Text 2 would say that the author of Text 1 overlooks
evidence that the Clovis people were active as early as is commonly thought.$qb$);
select seed_pool_question($qb$CB-03eeecf3$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from H.D.’s 1916 poem “Mid-Day.” In the poem, the speaker is on a path in an outdoor setting.
A slight wind shakes the seed-pods-—
my thoughts are spent
as the black seeds.
My thoughts tear me,
I dread their fever.
I am scattered in its whirl.
I am scattered like
the hot shrivelled seeds.
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It illustrates a change in the natural environment that the speaker implies is responsible for the growing misgivings described in the text."}, {"label": "B", "body": "It establishes an example of consistency in the natural landscape that the speaker then contrasts with the unpredictability of human emotions."}, {"label": "C", "body": "It presents an observation of an occurrence in the natural world that the speaker then expands on to convey a sense of a turbulent interior state."}, {"label": "D", "body": "It evokes the ordinariness of an event in nature to suggest that the critical self-evaluation the speaker engages in is a common pursuit."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it best describes the function of the underlined portion in the text as a whole. In the text, the speaker
mentions the occurrence in nature of seedpods being shaken by a slight wind. The speaker then goes on to compare the black seeds to
thoughts, using language that indicates that the speaker’s state of mind is unsettled (e.g., "my thoughts are spent"; "My thoughts tear me, I dread
their fever"). The text concludes with a comparison between the speaker’s "scattered" state of mind and the "hot shrivelled seeds." Thus, the
underlined portion of the text presents an observation of an occurrence in the natural world that the speaker then expands on to convey a sense
of a turbulent interior state.
Choice A is incorrect because the text does not indicate that the seedpods are the cause of the speaker’s state of mind; thus, they could not be
responsible for any misgivings the speaker has. Choice B is incorrect because the text does not contrast the natural landscape with the speaker’s
state of mind or describe the wind shaking the seedpods as consistent; rather, the text suggests that the state of the natural world and the
speaker’s state of mind are similar in that both are unsettled. Choice D is incorrect because there is no indication in the text that the speaker
regularly engages in critical self-evaluation, only that in this particular instance the speaker’s state of mind is turbulent.$qb$);
select seed_pool_question($qb$CB-441e2b9e$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Researchers and conservationists stress that biodiversity loss due to invasive species is ______. For example, people can take simple steps such
as washing their footwear after travel to avoid introducing potentially invasive organisms into new environments.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "preventable"}, {"label": "B", "body": "undeniable"}, {"label": "C", "body": "common"}, {"label": "D", "body": "concerning"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of how biodiversity loss due to invasive species can be
avoided. As used in this context, “preventable” means able to be stopped or kept from happening. The text indicates that “people can take simple
steps” to avoid bringing possible invasive species into new environments. It presents these steps as an example of how biodiversity loss due to
invasive species is preventable.
Choice B is incorrect because it wouldn’t make sense to say that a simple step like washing your shoes after traveling is an example of
biodiversity loss due to invasive species being “undeniable,” or something that can’t be proved to be wrong. Although the text may suggest that
biodiversity loss due to invasive species is something that really happens, the word that completes the text must make the first sentence into an
assertion that is illustrated by the second sentence, and the second sentence illustrates the idea that biodiversity loss due to invasive species is
preventable, not undeniable. Choice C is incorrect because it wouldn’t make sense to say that a simple step like washing your shoes after
traveling is an example of biodiversity loss due to invasive species being “common,” or something that happens regularly. Additionally, the text
doesn’t provide any information about how frequently invasive species cause biodiversity loss. Choice D is incorrect because it wouldn’t make
sense to say that a simple step like washing your shoes after traveling is an example of biodiversity loss due to invasive species being
“concerning,” or something that is troubling or causes worry. Although the text implies that the phenomenon of biodiversity loss due to invasive
species is itself a concerning phenomenon, the word that completes the text must make the first sentence into an assertion that is illustrated by
the second sentence, and the second sentence illustrates the idea that biodiversity loss due to invasive species is preventable, not concerning.$qb$);
select seed_pool_question($qb$CB-88bb0f6f$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
A team led by Bernardo Strassburg has found that rewilding farmland (returning the land to its natural state) could help preserve biodiversity and
offset carbon emissions. The amount of farmland that would need to be restored, they found, is remarkably low. Rewilding a mere 15% of the
world’s current farmland would prevent 60% of expected species extinctions and help absorb nearly 299 gigatons of carbon dioxide—a clear win
in the fight against the biodiversity and climate crises.
Text 2
While Strassburg’s team’s findings certainly offer encouraging insight into the potential benefits of rewilding, it’s important to consider potential
effects on global food supplies. The researchers suggest that to compensate for the loss of food-producing land, remaining farmland would
need to produce even more food. Thus, policies focused on rewilding farmland must also address strategies for higher-yield farming.
Which choice best describes a difference in how the author of Text 1 and the author of Text 2 view Strassburg’s team’s study?$qb$, null, $qb$[{"label": "A", "body": "The author of Text 2 approaches the study’s findings with some caution, whereas the author of Text 1 is optimistic about the reported potential environmental benefits."}, {"label": "B", "body": "The author of Text 2 claims that the percentage of farmland identified by Strassburg’s team is too low for rewilding to achieve meaningful results, whereas the author of Text 1 thinks the percentage is sufficient."}, {"label": "C", "body": "The author of Text 2 believes that the results described by Strassburg’s team are achievable in the near future, whereas the author of Text 1 argues that they likely aren’t."}, {"label": "D", "body": "The author of Text 2 focuses on rewilding’s effect on carbon emissions, whereas the author of Text 1 focuses on its effect on biodiversity."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. Text 1 is extremely positive about Strassburg’s team’s findings, calling the potential results "a clear win in the fight
against the biodiversity and climate crises." Text 2 is not as positive, arguing that while the findings point to "potential benefits," we also need to
consider the "potential effects on global food supplies."
Choice B is incorrect. This isn’t a difference between the two views. Text 1 does present the 15% number as enough to achieve meaningful
results, but that’s not what Text 2 takes issue with: rather, Text 2 argues that we need to consider the effect that rewilding this much farmland
would have on food supplies. Choice C is incorrect. This isn’t a difference between the two views. Neither text mentions the timeline for
achieving the results described by Strassburg’s team. Choice D is incorrect. This isn’t a difference between the two views. Text 1 focuses on
rewilding’s effects on both carbon emissions and biodiversity. Text 2 doesn’t focus on rewilding’s effect on carbon emissions at all. Instead, it
focuses on a third factor: global food supplies.$qb$);
select seed_pool_question($qb$CB-f878693b$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
In 1954 George Balanchine choreographed a production of The Nutcracker, a ballet by Pyotr Ilyich Tchaikovsky. It has since become a tradition
for hundreds of dance companies in North America to stage The Nutcracker each year. But the show is stuck in the past, with an old-fashioned-
story and references, so it should no longer be produced. Ballet needs to create new traditions if it wants to stay relevant to contemporary-
audiences.
Text 2
The Nutcracker is outdated, but it should be kept because it’s a holiday favorite and provides substantial income for some dance companies.
Although it can be behind the times, there are creative ways to update the show. For example, Debbie Allen successfully modernized the story.
Her show Hot Chocolate Nutcracker combines ballet, tap, hip-hop, and other styles, and it has been gaining in popularity since it opened in 2009.
Based on the texts, how would the author of Text 2 most likely respond to the underlined claim in Text 1?$qb$, null, $qb$[{"label": "A", "body": "By questioning the idea that the story of The Nutcracker is stuck in the past and by rejecting the suggestion that contemporary audiences would enjoy an updated version"}, {"label": "B", "body": "By agreeing that contemporary audiences have largely stopped going to see performances of The Nutcracker because it’s so old-fashioned"}, {"label": "C", "body": "By pointing out that most dance companies could increase their incomes by offering modernized versions of The Nutcracker"}, {"label": "D", "body": "By suggesting that dance companies should consider offering revised versions of The Nutcracker instead of completely rejecting the show"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it reflects how the author of Text 2 would most likely respond to the underlined claim in Text 1. Text 1
begins by noting the success of The Nutcracker but then claims that the ballet is "stuck in the past" and should "no longer be produced." Text 2
begins by conceding that The Nutcracker is indeed outdated but argues that it should continue to be performed, states that the show can be
updated to include more contemporary dance styles, and provides an example of one such modernized version, Hot Chocolate Nutcracker.
Hence, the author of Text 2 would most likely respond to the underlined claim in Text 1 by suggesting that dance companies should consider
offering revised versions of The Nutcracker instead of completely rejecting the show.
Choice A is incorrect because the author of Text 2 advocates for using creative ways to update The Nutcracker and therefore wouldn’t respond to
the underlined claim by rejecting the suggestion that contemporary audiences would enjoy an updated version. Choice B is incorrect because
although the authors of both texts claim that The Nutcracker is outdated, neither text suggests that contemporary audiences have largely
stopped attending productions of the show. On the contrary, Text 2 states that The Nutcracker is a holiday favorite and generates substantial
income for some dance companies. Choice C is incorrect because although Text 2 provides an example of a contemporized version of The
Nutcracker, the text doesn’t suggest that offering modernized versions is a way to increase income for most dance companies. Rather, the author
of Text 2 suggests that offering modernized versions is a way to make the ballet discussed in Text 1 feel less outdated.$qb$);
select seed_pool_question($qb$CB-ad4f7362$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The following text is from John Dryden’s 1697 translation of Virgil’s poem the Aeneid, written in the first century BCE. Queen Dido has just heard
the Trojan hero Aeneas recount a sad tale.
But anxious cares already seiz’d the queen:
She fed within her veins a flame unseen;
The hero’s valor, acts, and birth inspire
Her soul with love, and fan the secret fire.
His words, his looks, imprinted in her heart,
Improve the passion, and increase the smart.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To indicate that Dido is hiding her skepticism of Aeneas’s account"}, {"label": "B", "body": "To emphasize that Dido has been deeply affected by Aeneas’s story"}, {"label": "C", "body": "To imply that Dido engages both emotionally and intellectually with Aeneas"}, {"label": "D", "body": "To suggest that Dido is worried that Aeneas might discover a secret she is keeping from him"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most accurately describes the main purpose of the text, which is to foreground Queen Dido’s strong
emotional response to Aeneas’s story. Throughout, the text emphasizes how deeply the queen is affected by both Aeneas’s tale and persona. At
the outset, the speaker explicitly states that "anxious cares...seiz’d the queen" and then uses the metaphor of fire ("within her veins a flame
unseen" and "secret fire") to evoke the warmth of Dido’s feelings for Aeneas. In addition, the line "His words, his looks, imprinted in her heart"
suggests the deep impression that Aeneas’s story makes on Dido, eliciting passion for him ("improv[ing] the passion") and empathy for his
suffering ("increas[ing] the smart").
Choice A is incorrect because there’s no indication in the text that Dido is skeptical of Aeneas’s account, much less that she’s trying to conceal
that skepticism. On the contrary, the text shows her being moved by his words and developing feelings for him. Choice C is incorrect. While the
text mentions that Dido is impressed by Aeneas’s "valor, acts, and birth," which might suggest (but doesn’t necessarily entail) intellectual
engagement, the text doesn’t represent Dido’s engagement with Aeneas in a manner that suggests a balance between emotion and intellect.
Rather, the text primarily emphasizes her emotional response—specifically her attraction to Aeneas and her emotional investment in his story,
indicating that his "valor, acts, and birth inspire / Her soul with love, and fan the secret fire" and that his words and looks elicit passion and
empathy. Choice D is incorrect because the text doesn’t suggest that Dido is worried about Aeneas discovering a secret she is concealing from
him. Though the text begins by mentioning Dido’s "anxious cares," this refers to her growing passion for Aeneas and pity for his suffering, not to
worry about a secret she is concealing. The text’s reference to a "flame unseen" and "secret fire" points to Dido’s growing feelings for Aeneas that
develop as he recounts his tale, not to a secret that existed before their encounter; moreover, the text provides no indication that Dido is worried
Aeneas might discover these feelings.$qb$);
select seed_pool_question($qb$CB-35e21b06$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1
Dominique Potvin and colleagues captured five Australian magpies (Gymnorhina tibicen) to test a new design for attaching tracking devices to
birds. As the researchers fitted each magpie with a tracker attached by a small harness, they noticed some magpies without trackers pecking at
another magpie’s tracker until it broke off. The researchers suggest that this behavior could be evidence of magpies attempting to help another
magpie without benefiting themselves.
Text 2
It can be tempting to think that animals are deliberately providing help when we see them removing trackers and other equipment from one
another, especially when a species is known to exhibit other cooperative behaviors. At the same time, it can be difficult to exclude the possibility
that individuals are simply interested in the equipment because of its novelty, curiously pawing or pecking at it until it detaches.
Based on the texts, how would the author of Text 2 most likely respond to the researchers’ perspective in Text 1 on the behavior of the magpies
without trackers?$qb$, null, $qb$[{"label": "A", "body": "That behavior might have been due to the novelty of the magpies’ captive setting rather than to the novelty of the tracker."}, {"label": "B", "body": "That behavior likely indicates that the magpies were deliberately attempting to benefit themselves by obtaining the tracker."}, {"label": "C", "body": "That behavior may not be evidence of selflessness in Gymnorhina tibicen because not all the captured magpies demonstrated it."}, {"label": "D", "body": "That behavior might be adequately explained without suggesting that the magpies were attempting to assist the other magpie."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it reflects how the author of Text 2 would most likely respond to the researchers’ perspective in Text 1 on
the behavior of the magpies without trackers. According to Text 1, Dominique Potvin and colleagues observed magpies without trackers pecking
at a tracker on another magpie until the device fell off. The researchers suggested that the birds might have been attempting to help the other
bird, with no benefit to themselves. Text 2 generally discusses scenarios in which animals have been observed removing trackers from each
other. The text cautions that it shouldn’t be assumed that these animals are helping one another deliberately, since they might simply be pecking
at trackers out of curiosity, causing them to fall off eventually. Therefore, the author of Text 2 would most likely respond to Potvin and colleagues’
perspective in Text 1 by saying that the behavior of the magpies without trackers could be adequately explained without suggesting that they
were attempting to assist the other magpie.
Choice A is incorrect because Text 2 never discusses the novelty, or the newness and unusual quality, of the captive settings in which animals
have been observed to remove trackers from other animals, nor does it suggest that such novelty might account for this behavior. Instead, the
text suggests that it’s the novelty of the tracking equipment itself that might cause the behavior: interested in the trackers because they’re
unusual, animals might paw or peck at them until they fall off. Choice B is incorrect because Text 2 never suggests that when animals remove
trackers from other animals, they do so because they wish to obtain the trackers for themselves. Instead, Text 2 argues that animals paw or peck
at trackers because they are merely curious about them. Choice C is incorrect because Text 2 doesn’t argue that when captured animals are
observed removing trackers from each other, their behavior should be regarded as selfless only if all of them participate in it. Instead, the text
argues that the behavior may not be selfless at all and may instead be attributed to animals’ curiosity about the new and unusual trackers.$qb$);
select seed_pool_question($qb$CB-9b01bcf4$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The 1967 release of Harold Cruse’s book The Crisis of the Negro Intellectual isolated him from almost all other scholars and activists of the
American Civil Rights Movement—though many of those thinkers disagreed with each other, he nonetheless found ways to disagree with them
all. He thought that activists who believed that Black people such as himself should culturally assimilate were naïve. But he also sharply-
criticized Black nationalists such as Marcus Garvey who wanted to establish independent, self-contained Black economies and societies, even-
though Cruse himself identified as a Black nationalist.-
Which choice best describes the function of the underlined sentence in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It describes a direction that Cruse felt the Civil Rights Movement ought to take."}, {"label": "B", "body": "It indicates that Cruse’s reputation as a persistent antagonist of other scholars is undeserved."}, {"label": "C", "body": "It describes a controversy that Cruse’s work caused within the Black nationalist movement."}, {"label": "D", "body": "It helps explain Cruse’s position with respect to the community of civil rights thinkers."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The text as a whole claims that Cruse disagreed with virtually all other Civil Rights scholars and activists. The
underlined sentence describes one way that Cruse both did and didn’t fit in with those thinkers: he criticized Black nationalists, even though he
identified as one.
Choice A is incorrect. The underlined sentence doesn’t do this. It describes Cruse’s criticisms—it never mentions what Cruse did want the
movement to do instead. Choice B is incorrect. This conflicts with the text, which argues that Cruse did disagree with almost all other scholars of
the Civil Rights Movement. Choice C is incorrect. This is a step too far. The text never says that Cruse’s work caused controversy within the Black
nationalist movement.$qb$);
select seed_pool_question($qb$CB-f52cc78c$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Text 1
Polar bears sustain themselves primarily by hunting seals on the Arctic sea ice, but rising ocean temperatures are causing the ice to diminish,
raising concerns about polar bear population declines as these large predators’ seal-hunting habitats continue to shrink. A 2020 study examining
polar bear populations across the Arctic concluded that populations affected by sea-ice loss are at great risk of extinction by the end of the-
twenty-first century.-
Text 2
Monitoring carried out by researchers from the Norwegian Polar Institute shows that the polar bear population on the Arctic archipelago of
Svalbard remains stable and well nourished despite rapidly declining sea ice in recent years. The researchers attribute this population’s resilience
in part to a shift in feeding strategies: in addition to hunting seals, the Svalbard polar bears have begun relying on a diet of reindeer meat and
birds’ eggs.
Based on the texts, how would the researchers in Text 2 most likely respond to the conclusion presented in the underlined portion of Text 1?$qb$, null, $qb$[{"label": "A", "body": "By noting that it neglects the possibility of some polar bear populations adapting to changes in their environment"}, {"label": "B", "body": "By suggesting that it is likely incorrect about the rates at which warming ocean temperatures have caused sea ice to melt in the Arctic"}, {"label": "C", "body": "By asserting that it overlooks polar bear populations that have not yet been affected by loss of seal-hunting habitats"}, {"label": "D", "body": "By arguing that it fails to account for polar bears’ reliance on a single seal-hunting strategy"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. Text 2 describes how the Svalbard polar bears have adapted to the loss of sea ice by diversifying their diet and
feeding on reindeer and seabird eggs, resulting in a “stable and well nourished” population despite environmental challenges. This counters the
underlined claim that polar bears facing a loss of sea ice are at “great risk of extinction” by the end of the century.
Choice B is incorrect. Text 2 does not challenge the fact that sea ice is rapidly declining in the Arctic due to warming ocean temperatures. In fact,
it states that the Svalbard polar bears have faced “rapidly declining sea ice in recent years.” Choice C is incorrect. The claim in Text 1 is specific
to polar bear populations affected by the loss of seal hunting habitats, so unaffected populations are irrelevant to the claim. Also, Text 2 doesn’t
mention any polar bear populations that haven’t yet been affected by loss of seal hunting habitats. It focuses on a population that has been
affected by sea-ice loss but has managed to survive and thrive nevertheless. Choice D is incorrect. Text 2 doesn’t imply that polar bears rely on a
single seal-hunting strategy. In fact, the researcher in Text 2 would say that Text 1 fails to account for polar bears’ ability to develop other hunting
strategies and food sources.$qb$);
select seed_pool_question($qb$CB-8634bf4a$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Diego Velázquez was the leading artist in the court of King Philip IV of Spain during the seventeenth century, but his influence was hardly ______
Spain: realist and impressionist painters around the world employed his techniques and echoed elements of his style.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "derived from"}, {"label": "B", "body": "recognized in"}, {"label": "C", "body": "confined to"}, {"label": "D", "body": "repressed by"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the discussion of the artist Diego Velázquez’s influence outside Spain. As used
in this context, “confined to” means restricted to. The text says that Velázquez was the leading artist in the Spanish court during the seventeenth
century, but it also notes that other painters around the world were influenced by his techniques and style. Thus, Velázquez’s influence was
hardly (or almost not) confined to, or restricted to, Spain.
Choice A is incorrect because if Velázquez was a leading artist in Spain, it doesn’t make logical sense to claim that his influence was hardly (or
almost not) derived from, or obtained from, Spain. Moreover, the other painters around the world who employed Velázquez’s techniques would by
definition be influenced by Spanish style. Choice B is incorrect because if Velázquez was a leading artist in the court of King Philip IV of Spain,
then his influence must have been widely recognized, or acknowledged, rather than being hardly (or almost not) recognized. Choice D is incorrect
because the text gives no indication that deliberately limiting Velázquez’s influence outside Spain was ever considered by anyone. Thus, even if it
is true that his influence was not repressed, or restrained, it doesn’t make logical sense to say so in this context.$qb$);
select seed_pool_question($qb$CB-b35e2fdc$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A casual description of Scherezade García’s 2019 mural Blame It on the Bean: The Power of Coffee can make the work seem ______—a painting
that is housed in a coffee shop and that depicts three women drinking coffee may not sound particularly ambitious—but in fact the work is a
complex, dynamic meditation on gender and the legacy of colonialism that demands serious attention.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "unassuming"}, {"label": "B", "body": "shrewd"}, {"label": "C", "body": "incongruous"}, {"label": "D", "body": "pretentious"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of Scherezade García’s mural Blame It on the Bean: The
Power of Coffee. In this context, “unassuming” means ordinary or unremarkable. The text draws a contrast between a “casual description” of the
mural’s ordinary location (a coffee shop) and subject matter (three women drinking coffee)—details that would make it seem relatively
unambitious—and a characterization of the painting as a “dynamic meditation” on gender and colonialism deserving of “serious attention.” This
context suggests that the mural has significant depth and complexity, but a superficial description of it might make the mural seem ordinary and
unremarkable—that is, unassuming.
Choice B is incorrect because in this context, “shrewd” would mean clever or astute, and there’s nothing in the text to suggest that a casual yet
misleading description that only mentions the apparent simplicity of the mural’s location and subject matter would make the mural seem
particularly clever or astute. Though it’s possible that the text’s assertion that the mural is a “complex, dynamic meditation” demanding “serious
attention” might convey the idea that it’s a particularly clever or astute—that is, shrewd—artwork, the text wouldn’t suggest that a casual
description that fails to account for the work’s complexity would likewise characterize the work as shrewd. Choice C is incorrect because in this
context, “incongruous” would mean unsuitable for its surroundings or internally inconsistent. The “casual description” presented in the text
indicates that the painting is housed in a coffee shop and depicts women drinking coffee, which would imply that the mural may in fact be well
suited to its surroundings, not that it’s ill suited to its location. Moreover, none of the details mentioned in this description would suggest that the
painting contains internal inconsistencies of any kind. Choice D is incorrect because in this context, “pretentious” would mean expressive of
exaggerated importance, which wouldn’t fit the contrast established in the text between a “casual description” of the painting and the work’s
deeper themes. Though the text argues that the painting is worthy of “serious attention,” which would suggest its importance, the text doesn’t
suggest that the casual description would by contrast imply that the painting’s importance is exaggerated. Rather, by merely mentioning the
mural’s relatively ordinary location and subject matter without reference to this complexity, the casual description conveys that the painting is
more unassuming and understated than it actually is, not that it expresses an exaggerated self-importance.$qb$);
select seed_pool_question($qb$CB-9828ab3d$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$cross_text_connections$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Text 1 is adapted from E.M. Forster’s 1910 novel Howards End. Text 2 discusses Howards End. King’s Cross and St. Pancras are adjacent railway
terminals in London from which trains travel to the countryside.
Text 1
To Margaret the station of King’s Cross had always suggested Infinity. Its very situation—withdrawn a little behind the facile splendours of St.
Pancras—implied a comment on the materialism of life. Those two great arches, colourless, indifferent, shouldering between them an unlovely
clock, were fit portals for some eternal adventure, whose issue might be prosperous, but would certainly not be expressed in the ordinary
language of prosperity.
Text 2
The interplay between opposing ideological positions in Howards End is broadly articulated in the novel’s organization of geographic space. On
the one hand, the modern metropolis of London represents capitalism’s emphasis on pragmatism and the accumulation of material wealth; on
the other, the English countryside, accessible via King’s Cross, fosters an idealism that values tradition, authentic personal connection, and the
aesthetic—what the novel calls “the infinite.”
Based on the texts, the author of Text 2 would most likely agree with which statement about King’s Cross, as it is depicted in Text 1?$qb$, null, $qb$[{"label": "A", "body": "King’s Cross has a relatively unassuming appearance whose sharp contrast with the more aesthetically pleasing appearance of St. Pancras suggests to Margaret the ascendancy of the pragmatic capitalistic outlook among London’s inhabitants."}, {"label": "B", "body": "Because it is situated at the beginning of Margaret’s journey from the city to the country, King’s Cross emblematizes the intrusion of the forces of materialism and modernity into the rural spaces that the novel associates with idealism and tradition."}, {"label": "C", "body": "The austerity conveyed by King’s Cross’s appearance mirrors Margaret’s disillusionment with the prospect of having authentic connections with other people in a world that chiefly values more conventional forms of prosperity."}, {"label": "D", "body": "As a point of connection between London and the countryside, King’s Cross suggests to Margaret the possibility of experiencing the intangible abundance promised by the kinds of authentic engagements that the novel’s rural spaces seem to offer."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it presents a statement about King’s Cross, as depicted in Text 1, that the author of Text 2 would most likely
agree with. In Text 1, Margaret associates King’s Cross with “Infinity” and sees its arches as portals for an adventure whose value transcends
London’s mundane materialism. The author of Text 2 provides an interpretation of the novel’s geography that is consistent with Margaret’s vision,
explaining that London represents capitalist materialism while the countryside—“accessible via King’s Cross”—fosters idealism, authentic
connection, and the aesthetic (“the infinite”). By characterizing King’s Cross as a “point of connection between London and the countryside” that
offers access to the “intangible abundance” promised by “the novel’s rural spaces,” choice D provides a reading of the railway terminal that aligns
with the interpretive framework set up by the author of Text 2.
Choice A is incorrect because Margaret views King’s Cross positively—as evoking infinity and eternal adventure—not as a sign of capitalism’s
dominance. Text 1 characterizes St. Pancras’s splendors as “facile,” or superficial, so that the contrast elevates King’s Cross rather than signaling
materialism’s ascendancy. Choice B is incorrect because the author of Text 2 positions King’s Cross as a gateway to the countryside’s idealism,
not as a vehicle for materialism intruding into rural spaces. Margaret’s sense of wonder at the station arises from her sense that it offers access
to the countryside’s idealism rather than to London’s materialism. Choice C is incorrect because nothing in Text 1 suggests Margaret is
disillusioned; her perception of King’s Cross is defined by expansive possibility, not resignation. Moreover, Margaret finds the austerity of King’s
Cross (relative to St. Pancras) appealing—its unpretentious appearance resonates with her attitude toward the “materialism of life.”$qb$);
select seed_pool_question($qb$CB-1090b367$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Today composer Scott Joplin is mainly celebrated for his catchy ragtime pieces “Maple Leaf Rag” and “The Entertainer.” However, by overlooking
his less famous works, listeners will miss the full range of Joplin’s creativity. For instance, his waltz “Pleasant Moments” and his opera
Treemonisha skillfully blend ragtime and classical music. These masterpieces deserve as much fame as Joplin’s biggest hits.
Which choice best states the main purpose of the text?$qb$, null, $qb$[{"label": "A", "body": "To describe the similarities and differences between ragtime music and opera"}, {"label": "B", "body": "To argue that more attention should be given to Joplin’s lesser-known works"}, {"label": "C", "body": "To encourage music lovers to listen to music by many different composers"}, {"label": "D", "body": "To explain how Joplin learned to compose and perform ragtime music"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it best states the main purpose of the text, which is to make a case for the importance of Scott Joplin’s less
famous works. The text begins by introducing Joplin’s most popular works and then goes on to assert that gaining a full understanding of
Joplin’s creativity requires a consideration of his lesser-known pieces as well. The text concludes by characterizing the lesser-known works
"Pleasant Moments" and Treemonisha as masterpieces that deserve to be famous. These details indicate that the text’s main purpose is to argue
that more attention should be given to Joplin’s lesser-known works.
Choice A is incorrect. Although the text discusses some of the ragtime music and an opera that Joplin composed, it does not compare the two
types of music in general. Instead, the text argues that Joplin’s lesser-known works, including his opera, deserve as much attention as his more
famous ragtime pieces receive. Choice C is incorrect because the text discusses only Joplin’s music and does not ask music lovers to listen to a
variety of composers. Instead, the text encourages listeners to pay attention to Joplin’s lesser-known works in order to gain a full understanding
of his creativity. Choice D is incorrect because the text does not discuss how Joplin learned to compose and perform ragtime music. Instead, the
text focuses on Joplin’s less famous works and makes a case for their importance.$qb$);
select seed_pool_question($qb$CB-40270820$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Catherine L. Cardelús is a researcher who studies canopy soil. Canopy soil is formed in a tree’s branches (its canopy) when dead leaves and
other falling things collect. This material breaks down, becoming canopy soil. Canopy soil helps preserve a healthy water cycle (how water
moves through the environment) in rainforests. This benefit is one reason Cardelús is interested in the canopy soils in large choibá trees in
rainforests in Costa Rica.
Which choice best describes the text’s overall structure?$qb$, null, $qb$[{"label": "A", "body": "It explains a disagreement between researchers and how it was resolved."}, {"label": "B", "body": "It presents an idea and mentions a researcher who disagrees with that idea."}, {"label": "C", "body": "It compares the sizes of two types of trees over several years."}, {"label": "D", "body": "It introduces a researcher and gives information about what she researches."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it most accurately describes the overall structure of the text. The text begins by mentioning Catherine L.
Cardelús, "a researcher who studies canopy soil." The text then provides information about her chosen research topic: the formation of canopy
soil in tree branches, the role of canopy soil in preserving a healthy water cycle in rainforests, and Cardelús’s specific interest in "the canopy soils
in large choibá trees in rainforests in Costa Rica." Thus, the text introduces a researcher and then gives information about what she researches.
Choice A is incorrect because the text doesn’t mention any disagreement between researchers, nor does it describe how such a disagreement
was resolved. Choice B is incorrect because the text doesn’t present an idea that Cardelús disagrees with; rather, it describes her research
interests and the significance of canopy soil. Choice C is incorrect because the text doesn’t compare the sizes of different types of trees over
time. While the text mentions "large choibá trees," it doesn’t compare them to any other tree type or discuss changes in tree size over several
years.$qb$);
select seed_pool_question($qb$CB-b507f90f$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Latro, the main character of Gene Wolfe’s novel Soldier of the Mist, is a man in ancient Greece. He completely loses his memory whenever he
sleeps. So, before sleeping, Latro records the important experiences of each day on a scroll, carefully choosing which ones to ______.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "suspect"}, {"label": "B", "body": "preserve"}, {"label": "C", "body": "suggest"}, {"label": "D", "body": "imagine"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text about Latro, the main character in Gene Wolfe’s novel Soldier of the
Mist. In this context, "preserve" means save or keep from destruction or loss. The text describes Latro as a character who loses his memory
whenever he sleeps. The text goes on to explain that before going to sleep, Latro records his most important memories to prevent him from
forgetting, or losing, them. The context therefore supports the idea that Latro records his most important experiences in an effort to save, or
preserve, his memory of them from loss.
Choice A is incorrect because "suspect" would mean mistrust, which wouldn’t make sense in this context. The text emphasizes that in writing
down his experiences, Latro carefully chooses those which are most important to him and thus worth remembering later, not that he is
mistrustful or has reason to doubt the experiences he records. Choice C is incorrect because in this context, "suggest" would mean propose for
consideration. The text emphasizes the fact that Latro actually records those experiences that he has decided are most important to him, not
that he merely proposes which experiences to consider for inclusion in his scroll. Choice D is incorrect because in this context, "imagine" would
either mean form a mental image of or fabricate, neither of which would logically complete the text. Although it’s possible that reviewing records
from previous days might enable Latro to reconstruct mental images of what has happened to him in the past, the text emphasizes the fact that
Latro carefully selects and writes down his experiences so he will remember them in the future, not so that he can form mental pictures of them
as he writes them down. In a similar vein, the text emphasizes that Latro is recording experiences that have actually happened to him, not that
he’s fabricating the experiences he records.$qb$);
select seed_pool_question($qb$CB-dcd9ad50$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is adapted from George Eliot’s 1857 short story “The Sad Fortunes of the Rev. Amos Barton.” Mr. Ely is a clergyman in the town
of Milby.
By the laity of Milby and its neighbourhood [Mr. Ely] was regarded as a man of quite remarkable powers and learning, who must
make a considerable sensation in London pulpits and drawing-rooms on his occasional visit to the metropolis; and by his brother
clergy he was regarded as a discreet and agreeable fellow. Mr. Ely never got into a warm discussion; he suggested what might be
thought, but rarely said what he thought himself; he never let either men or women see that he was laughing at them, and he never
gave any one an opportunity of laughing at him.
Which choice best describes the overall structure of the text?$qb$, null, $qb$[{"label": "A", "body": "It shows that Mr. Ely had originally been held in high regard by his friends and then details the events that caused their regard for him to subside."}, {"label": "B", "body": "It implies that Mr. Ely’s neighbors are more naïve in their estimation of him than people in London are and then explains why his neighbors have been so easily misled."}, {"label": "C", "body": "It stresses the discrepancy between Mr. Ely’s public and private conduct and then alludes to his motivation for hiding his true personality."}, {"label": "D", "body": "It presents the favorable opinion of Mr. Ely that other people hold and then describes the behaviors of Mr. Ely that enable him to maintain that favorable opinion."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because it best describes the overall structure of the text. The first part of the text presents the favorable opinions
that others hold of Mr. Ely: the laity of Milby regard him as having "remarkable powers and learning" and assume that he also impresses people in
London, while his fellow clergy see him as "a discreet and agreeable fellow." The text then goes on to describe Mr. Ely’s behaviors that enable him
to cultivate and preserve his positive reputation. The text conveys that he avoids confrontations, abstaining from "warm discussion[s]" (that is,
heated or contentious ones); that he avoids offending anyone by "rarely [saying] what he thought himself" and by refraining from openly ridiculing
anyone; and that he doesn’t give anyone any reason to ridicule or belittle his own character ("he never gave any one an opportunity of laughing at
him"). In other words, these are all behaviors that suggest that Mr. Ely avoids doing anything that might make people dislike him or think poorly of
him. Thus, the text begins by presenting the favorable view that people have of Mr. Ely and then describes the behaviors that enable him to
maintain that favorable view.
Choice A is incorrect because the text doesn’t describe any events that caused people’s regard for Mr. Ely to diminish. Instead, the text explains
that the people of Milby hold him in high regard and describes behaviors that suggest how he cultivates that regard. Choice B is incorrect
because the text doesn’t suggest that Mr. Ely’s neighbors are more naïve than Londoners are or that they’ve been misled. Although the text
suggests that Mr. Ely is very guarded in his outward behavior and conceals from people when he may be internally mocking them, which might
suggest that people know him less well than they think they do, there’s nothing in the text to suggest that Londoners are less naïve and therefore
less easily misled than Mr. Ely’s neighbors are. The text states that the people of Milby believe Mr. Ely to be "remarkable" and that they assume
that people in London must find him so, too; it doesn’t say anything about what Londoners actually think of him. Choice C is incorrect. While the
text discusses Mr. Ely’s public conduct at length, describing the ways in which he carefully cultivates an agreeable public persona, the text
doesn’t discuss how Mr. Ely behaves in private at all; it therefore wouldn’t be accurate to say that the text begins by emphasizing a discrepancy
between his public and private conduct. Furthermore, although the text concludes with examples illustrating that Mr. Ely typically doesn’t share
his true thoughts, indicating that he may be hiding aspects of his true personality when in public, and although the text as a whole conveys the
idea that Mr. Ely benefits from this behavior, which might hint at his motives for doing so, the text doesn’t conclude by alluding to those motives.
Instead, the text merely concludes with a description of the behaviors he engages in to win his neighbors’ and colleagues’ approval.$qb$);
select seed_pool_question($qb$CB-5d48f889$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The following text is adapted from Mercedes de Acosta’s 1921 poem “Spring and You.”
Now, Love and April, and the gold of your
hair,
Are all mingled together-
Like the blending of an exotic dream plant
With the fragrant perfume of a strange, frail
flower.
As used in the text, what does the word “mingled” most nearly mean?$qb$, null, $qb$[{"label": "A", "body": "Identified"}, {"label": "B", "body": "Combined"}, {"label": "C", "body": "Remembered"}, {"label": "D", "body": "Celebrated"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because as used in the text, "mingled" most nearly means combined. In the text, the speaker refers to several
concepts mingling together and then compares this to "the blending of" two other things (an exotic plant and the fragrance of a strange flower).
This comparison conveys that the speaker views the concepts of love, April, and the gold of someone’s hair as being blended together, or
combined.
Choice A is incorrect because "mingled" means combined, not identified. The speaker names several concepts (love, April, and the gold color of
someone’s hair) and then moves to a comparison of their mingling together to "the blending of" a plant and the scent of a flower, conveying the
idea that the speaker views the concepts as blended together, or combined. Choice C is incorrect. The text as a whole may refer to a memory, but
the comparison of the mingling of several concepts (love, April, and the gold color of someone’s hair) to "the blending of" a plant and the scent of
a flower conveys that the speaker views those concepts as actually blended together, or combined, and not simply remembered at the same
time. Choice D is incorrect. The speaker refers to several concepts (love, April, and the gold color of someone’s hair) and then compares the
mingling together of those concepts to "the blending of" a plant and the scent of a flower; rather than suggesting that the concepts are
celebrated, this comparison conveys that the speaker views the concepts as blended together, or combined.$qb$);
select seed_pool_question($qb$CB-d168e7c5$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$text_structure_and_purpose$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The following text is from Annie Dillard’s 1987 autobiographical novel An American Childhood. The narrator is a young girl living in Pittsburgh.
I walked. My mother had given me the freedom of the streets as soon as I could say our telephone number. I walked and
memorized the neighborhood. I made a mental map and located myself upon it. At night in bed I rehearsed the small world’s
scheme and set challenges: Find the store using backyards only. Imagine a route from the school to my friend-’s house.
©1987 by Annie Dillard
Which choice best describes the function of the underlined portion in the text as a whole?$qb$, null, $qb$[{"label": "A", "body": "It describes the narrator trying to memorize her telephone number."}, {"label": "B", "body": "It provides examples of what the narrator thinks about at night."}, {"label": "C", "body": "It gives directions to the narrator’s favorite local store."}, {"label": "D", "body": "It portrays the narrator’s relationship with her mother."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it accurately describes how the underlined portion functions in the text as a whole. In the text, the narrator
explains that she walks around her neighborhood, making a "mental map" of the area that she imagines herself navigating through. She then
states that she rehearses "the small world’s scheme"—that is, imagines moving through her mental map—and challenges herself to use the map
in her mind while lying in bed at night. The underlined portion presents two such challenges (getting to the store through backyards and traveling
from school to a friend’s house) and thus provides examples of what the narrator thinks about at night.
Choice A is incorrect because the underlined portion makes no mention of memorizing a telephone number. Although the narrator mentions that
she had to learn the home telephone number before her mother would give her permission to walk around the neighborhood, there is nothing in
the underlined portion or the rest of the text about memorizing the telephone number. Choice C is incorrect. Although the underlined portion
refers to navigation tasks like finding a route to a store only through backyards, the text contains no specific directions to any store, nor is any
store identified as the narrator’s favorite. Choice D is incorrect because the underlined portion makes no mention of the narrator’s mother and
doesn’t address the narrator’s relationship with her. Although the narrator mentions that her mother gave her permission as a child to walk
around the neighborhood, there is nothing in the underlined portion or the rest of the text about the mother or her relationship to her child.$qb$);
select seed_pool_question($qb$CB-e8fb0744$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$hard$qb$::difficulty_level, null, $qb$As an undergraduate researcher in anthropology, Jennifer C. Chen contributed to a groundbreaking study challenging the accepted view that
among prehistoric peoples, female participation in hunting was ______. The research team’s review of data from late Pleistocene and early
Holocene burials in the Americas revealed that, in fact, as many as half of the hunters in those populations were female.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "inevitable"}, {"label": "B", "body": "satisfactory"}, {"label": "C", "body": "negligible"}, {"label": "D", "body": "commonplace"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because it most logically completes the text’s discussion of the study of female participation in hunting among
prehistoric peoples. In this context, “negligible” means not significant enough to be worth considering. The text says that the study challenged
the accepted view of female participation in hunting among prehistoric peoples. The text goes on to say that the researchers found that “in fact,
as many as half” the hunters in the groups studied were female. The phrase “in fact” establishes a contrast indicating that the finding that as
many as half the hunters were female differs from the accepted view. This context suggests, then, that the accepted view is that female
participation in hunting was negligible.
Choice A is incorrect because the text indicates that the study challenged the accepted view by showing that as many as half of hunters among
prehistoric peoples were female, which suggests that the accepted view is that female participation was low, not that female participation was
“inevitable,” or unavoidable. Nothing in the text suggests that the accepted view is that prehistoric peoples could not avoid female participation in
hunting. Choice B is incorrect because nothing in the text suggests that the accepted view of female participation in hunting among prehistoric
peoples is that such participation was “satisfactory,” or sufficient to meet a requirement or demand. There is no information in the text about any
demands or requirements regarding female participation in hunting, let alone any information about how much female participation in hunting
would be enough to satisfy those demands or requirements. Instead, the text indicates that the study challenged the accepted view by showing
that as many as half the hunters in the groups studied were female, suggesting that the accepted view is that female participation in hunting was
low. Choice D is incorrect because the text indicates that the study challenged the accepted view by showing that as many as half of hunters
among the prehistoric peoples studied were female, which suggests that the accepted view is that female participation was low, not that female
participation was “commonplace,” or ordinary or unremarkable. Although the study under discussion suggests that female participation may
have been commonplace, that study is presented as challenging the accepted view, not as reinforcing the accepted view.$qb$);
select seed_pool_question($qb$CB-c843d63c$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The artisans of the Igun Eronmwon guild in Benin City, Nigeria, typically ______ the bronze- and brass-casting techniques that have been passed
down through their families since the thirteenth century, but they don’t strictly observe every tradition; for example, guild members now use air-
conditioning motors instead of handheld bellows to help heat their forges.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "experiment with"}, {"label": "B", "body": "adhere to"}, {"label": "C", "body": "improve on"}, {"label": "D", "body": "grapple with"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of bronze- and brass-casting techniques used by the Igun
Eronmwon guild. In this context “adhere to” would mean to act in accordance with. The text states that although members of the Igun Eronmwon
guild typically do something with techniques that have been passed down since the thirteenth century, they “don’t strictly observe every tradition.”
By establishing a contrast with not always following traditions, the context suggests that guild members do typically adhere to traditional
techniques.
Choice A is incorrect because in this context “experiment with” would mean to do something new with. Although using motors rather than
manual bellows is presented as a new approach, the text establishes a contrast between what the guild members typically do with techniques
that have been passed down over centuries and the idea that the members “don’t strictly observe every tradition.” The phrase “experiment with”
wouldn’t support the contrast because regularly trying new things with the techniques would be an example of not strictly following all traditions.
Choice C is incorrect because in this context “improve on” would mean to make better. Although using motors rather than manual bellows might
be an improved approach, the text establishes a contrast between what the guild members typically do with techniques that have been passed
down over centuries and the idea that the members “don’t strictly observe every tradition.” The phrase “improve on” wouldn’t support the contrast
because regularly making changes to the techniques would be an example of not strictly following all traditions. Choice D is incorrect because in
this context “grapple with” would mean to try hard to solve a difficult problem. Although bronze- and brass-casting are likely challenging tasks,
nothing in the text suggests that the guild members have any particular difficulties with the techniques passed down since the thirteenth
century.$qb$);
select seed_pool_question($qb$CB-2390e956$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Ronyoung Kim creatively captures the Korean American immigrant experience in her novel Clay Walls by writing about a family from three ______
perspectives. The first section of the novel is from the mother Haesu’s perspective, the second is from the father Chun’s perspective, and the last
is from the daughter Faye’s perspective.
Which choice completes the text with the most logical and precise word?$qb$, null, $qb$[{"label": "A", "body": "distinct"}, {"label": "B", "body": "required"}, {"label": "C", "body": "unintended"}, {"label": "D", "body": "unknown"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer because it most logically completes the text’s discussion of Ronyoung Kim’s novel Clay Walls. In this context,
"distinct" means clearly separate and different. The text indicates that the novel consists of three sections and that each section is narrated from
the perspective of a different character. This context supports the idea that Kim’s novel features three distinct perspectives.
Choice B is incorrect because describing the three perspectives in Kim’s novel as "required," or demanded as necessary to be done or provided,
wouldn’t make sense in context. When writing a novel, a novelist is free to choose to narrate the story from any number of perspectives. There’s
nothing in the text to indicate that providing three perspectives was demanded of Kim. Instead, the text focuses on identifying the three different
perspectives featured in Kim’s novel. Choice C is incorrect because describing the three perspectives in Kim’s novel as "unintended," or not
planned as a purpose or goal, wouldn’t make sense in context. Authors make deliberate choices about the perspectives they feature in their
works, and the text indicates that Kim chose to incorporate three different perspectives in her novel. Choice D is incorrect because describing the
three perspectives in Kim’s novel as "unknown," or not revealed, wouldn’t make sense in context. The text directly identifies the three perspectives
that appear in her novel as those of Faye and her two parents, Haesu and Chun, which indicates that the novel’s perspectives are in fact known.$qb$);
select seed_pool_question($qb$CB-2a6c71a4$qb$, $qb$english$qb$, $qb$craft_and_structure$qb$, $qb$words_in_context$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the search for new impact craters on Mars, the roles of seismic monitoring and orbital imaging as data sources are ______: when vibrations
detected with seismic monitoring indicate roughly where an impact has occurred, researchers can use orbital images of that relatively limited
area of the rocky surface to precisely locate a new crater.
Which choice completes the text with the most logical and precise word or phrase?$qb$, null, $qb$[{"label": "A", "body": "interchangeable"}, {"label": "B", "body": "complementary"}, {"label": "C", "body": "exhaustive"}, {"label": "D", "body": "redundant"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer because it most logically completes the text’s discussion of how seismic monitoring and orbital imaging are used to
find impact craters on Mars. In this context, “complementary” means combining in such a way that each contributes something the other lacks.
The text describes how two data sources work together: seismic monitoring detects vibrations that indicate the rough location of an impact, and
orbital imaging is then used to examine that limited area in detail to pinpoint the exact location of the crater. Each method does something the
other does not—seismic monitoring narrows the search area, while orbital imaging provides the precise location—and together they accomplish
what neither could alone. This context supports the idea that the two methods’ roles are complementary.
Choice A is incorrect because describing the roles of seismic monitoring and orbital imaging as “interchangeable,” or able to be substituted for
each other, would contradict the text. The text indicates that the two methods perform different functions in sequence (seismic monitoring
narrows the area; orbital imaging pinpoints the crater), so they cannot be substituted for each other. Choice C is incorrect because describing the
roles of seismic monitoring and orbital imaging as “exhaustive,” or comprehensive in covering all possibilities, wouldn’t be logical in context. The
text describes how the two methods work together to perform a particular two-step task (locating new impact craters), not whether they
collectively address every possible aspect of Mars research. Choice D is incorrect because describing the roles of seismic monitoring and orbital
imaging as “redundant,” or unnecessarily duplicative, would contradict the text. The text indicates that each method performs a distinct function
in finding impact craters on Mars—rough localization versus precise localization—so neither method duplicates the other’s contribution.$qb$);
select seed_pool_question($qb$CB-2b08f514$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The prime meridian, the global indicator of zero degrees longitude established in 1884, was originally determined using astronomically derived
coordinates. ______ as decades passed, new calculations would reveal increasingly precise coordinates, yet the prime meridian remained
unchanged; it wasn’t until the 1980s that, spurred by improved geodetic data, the prime meridian was officially moved—roughly one hundred
meters east.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Specifically,"}, {"label": "B", "body": "To that end,"}, {"label": "C", "body": "Again and again,"}, {"label": "D", "body": "Granted,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "Again and again" logically signals that the information in this sentence—that new calculations revealed increasingly
precise coordinates for the location of the prime meridian—refers to events that occurred multiple times in the decades after the establishment
of the prime meridian in 1884 (which is described in the preceding sentence).
Choice A is incorrect because "specifically" illogically signals that the information in this sentence provides specific, precise details elaborating
on the description of the prime meridian’s establishment in the previous sentence. Instead, the sentence indicates that increasingly precise
coordinates were revealed on multiple occasions in the decades following the meridian’s establishment. Choice B is incorrect because "to that
end" illogically signals that the information in this sentence is a means of accomplishing a goal established in the previous sentence about the
prime meridian’s establishment. Instead, the sentence indicates that increasingly precise coordinates were revealed on multiple occasions in the
decades following the meridian’s establishment. Choice D is incorrect because "granted" illogically signals that the information in this sentence
is in opposition to the information about the prime meridian’s establishment in the previous sentence. Instead, the sentence indicates that
increasingly precise coordinates were revealed on multiple occasions in the decades following the meridian’s establishment.$qb$);
select seed_pool_question($qb$CB-afec1a70$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? As engineered structures, many bird nests are uniquely flexible yet cohesive.
· A research team led by Yashraj Bhosale wanted to better understand the mechanics behind these structural properties.
? Bhosale’s team used laboratory models that simulated the arrangement of flexible sticks into nest-like structures.
? The researchers analyzed the points where sticks touched one another.
? When pressure was applied to the model nests, the number of contact points between the sticks increased, making the structures stiffer.
The student wants to present the primary aim of the research study. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-afec1a70.png$qb$, $qb$[{"label": "A", "body": "Bhosale’s team wanted to better understand the mechanics behind bird nests’ uniquely flexible yet cohesive structural properties."}, {"label": "B", "body": "The researchers used laboratory models that simulated the arrangement of flexible sticks and analyzed the points where sticks touched one another."}, {"label": "C", "body": "After analyzing the points where sticks touched, the researchers found that the structures became stiffer when pressure was applied."}, {"label": "D", "body": "As analyzed by Bhosale’s team, bird nests are uniquely flexible yet cohesive engineered structures."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. It describes the reason Bhosale’s team wanted to study the structures of bird nests—that is to say, the study’s
primary aim.
Choice B is incorrect. This choice doesn’t present the primary aim of the research study. It describes how the study worked, but not why it was
done. Choice C is incorrect. This choice doesn’t present the primary aim of the research study. It describes a result of the experiment, but not
why it was carried out. Choice D is incorrect. This choice doesn’t present the primary aim of the research study.$qb$);
select seed_pool_question($qb$CB-e0bd4f8a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1942, the 1,500-mile Alaska Highway was constructed in under nine months, largely due to the skilled work of nearly 4,000 African American
soldiers from US Army engineering regiments. The soldiers’ contribution was overlooked for decades. ______ in 2017, lawmakers declared
October 25 a day of recognition—“Alaska Highway Day”—for the troops who helped build this critical roadway.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Lastly,"}, {"label": "B", "body": "Then,"}, {"label": "C", "body": "Similarly,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Then" logically signals that the event described in this sentence—lawmakers’ 2017 declaration of Alaska Highway
Day—is part of a chronological sequence of events, occurring after the decades-long period in which the soldiers’ contribution was overlooked.
Choice A is incorrect because "lastly" illogically signals that this sentence presents the last of a series of points or reasons. Instead, it describes
a later event occurring in a chronological sequence of events. Choice C is incorrect because "similarly" illogically signals that the information in
this sentence is similar to the previous information about the soldiers’ contribution being overlooked for decades. Instead, it describes an event
occurring after that decades-long period. Choice D is incorrect because "for example" illogically signals that this sentence provides an example
illustrating the previous information about the soldiers’ contribution being overlooked for decades. Instead, it describes an event occurring after
that decades-long period.$qb$);
select seed_pool_question($qb$CB-660d50dc$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Samuel Coleridge-Taylor was a prominent classical music composer from England who toured the US three times in the early 1900s. The child of
a West African father and an English mother, Coleridge-Taylor emphasized his mixed-race ancestry. For example, he referred to himself as Anglo-
African. ______ he incorporated the sounds of traditional African music into his classical music compositions.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In addition,"}, {"label": "B", "body": "Actually,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "Regardless,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “In addition” logically signals that the detail in this sentence—that Coleridge-Taylor included traditional African
music in his classical compositions—adds to the information in the previous sentence. Specifically, the previous sentence indicates one way in
which Coleridge-Taylor emphasized his mixed-race ancestry, and the claim that follows indicates a second, additional way.
Choice B is incorrect because “actually” illogically signals that the detail in this sentence is surprising in light of the information in the previous
sentence. Instead, the detail adds to the information, indicating a second, additional way in which Coleridge-Taylor emphasized his mixed-race
ancestry. Choice C is incorrect because “however” illogically signals that the detail in this sentence contrasts with the information in the previous
sentence. Instead, the detail adds to the information, indicating a second, additional way in which Coleridge-Taylor emphasized his mixed-race
ancestry. Choice D is incorrect because “regardless” illogically signals that the detail in this sentence is true despite the information in the
previous sentence. Instead, the detail adds to the information, indicating a second, additional way in which Coleridge-Taylor emphasized his
mixed-race ancestry.$qb$);
select seed_pool_question($qb$CB-4d2736f0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In her poetry collection Thomas and Beulah, Rita Dove interweaves the titular characters’ personal stories with broader historical narratives. She
places Thomas’s journey from the American South to the Midwest in the early 1900s within the larger context of the Great Migration. ______ Dove
sets events from Beulah’s personal life against the backdrop of the US Civil Rights Movement.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Specifically,"}, {"label": "B", "body": "Thus,"}, {"label": "C", "body": "Regardless,"}, {"label": "D", "body": "Similarly,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Similarly” logically signals that the information in the sentence—that Dove situates Beulah’s life in the context of the
US Civil Rights Movement—is similar to the previous information about Thomas and the Great Migration. Both sentences support the first
sentence’s claim that Dove portrays her characters in the context of broader historical narratives.
Choice A is incorrect because “specifically” illogically signals that the information about Beulah in this sentence provides specific details
elaborating on the previous information about Thomas. Instead, it’s similar to the previous information about Thomas. Choice B is incorrect
because “thus” illogically signals that the information about Beulah in this sentence is a result or consequence of the previous information about
Thomas. Instead, it’s similar to the previous information about Thomas. Choice C is incorrect because “regardless” illogically signals that the
information about Beulah in this sentence is true despite the previous information about Thomas. Instead, it’s similar to the previous information
about Thomas.$qb$);
select seed_pool_question($qb$CB-d3b7d7a3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Many historical accounts of the 1930s focus on the widespread movement of people from dust bowl–ravaged Great Plains states to faraway
California. However, a 2016 study of 1940 census data complicates this popular narrative; ______ researchers determined, migrants in states
hardest hit by prolonged droughts and dust storms—Colorado, Kansas, Oklahoma, and Texas—merely relocated within the region.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "for this reason,"}, {"label": "B", "body": "more often,"}, {"label": "C", "body": "additionally,"}, {"label": "D", "body": "nevertheless,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “More often” logically signals that the historical outcome in this clause—dust bowl migrants’ relocation within the
Great Plains region—was more common than the movement to California described in many historical accounts.
Choice A is incorrect because “for this reason” illogically signals that the historical outcome in this clause was caused by either the narrative
about widespread movement to California or the 2016 study’s complication of that narrative. Instead, dust bowl migrants’ regional relocation was
found to be more common than the movement to California described in many historical accounts. Choice C is incorrect because “additionally”
illogically signals that the historical outcome in this clause merely adds to either the narrative about widespread movement to California or the
2016 study’s complication of that narrative. Instead, dust bowl migrants’ regional relocation was found to be more common than the movement
to California described in many historical accounts. Choice D is incorrect because “nevertheless” illogically signals that the historical outcome in
this clause is true despite either the narrative about widespread movement to California or the 2016 study’s complication of that narrative. While
the findings about dust bowl migrants’ regional relocation did challenge the previous narrative, they did not challenge the study’s findings, and
this choice creates a confusing ambiguity. Instead, dust bowl migrants’ regional relocation was found to be more common than the movement to
California described in many historical accounts.$qb$);
select seed_pool_question($qb$CB-39ccb463$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Atlantic Monthly magazine was first published in 1857.
· The magazine focused on politics, art, and literature.
? In 2019, historian Cathryn Halverson published the book Faraway Women and the “Atlantic Monthly.”
? Its subject is female authors whose autobiographies appeared in the magazine in the early 1900s.
? One of the authors discussed is Juanita Harrison.
The student wants to introduce Cathryn Halverson’s book to an audience already familiar with the Atlantic Monthly. Which choice most effectively
uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-39ccb463.png$qb$, $qb$[{"label": "A", "body": "Cathryn Halverson’s Faraway Women and the “Atlantic Monthly” discusses female authors whose autobiographies appeared in the magazine in the early 1900s."}, {"label": "B", "body": "A magazine called the Atlantic Monthly, referred to in Cathryn Halverson’s book title, was first published in 1857."}, {"label": "C", "body": "Faraway Women and the “Atlantic Monthly” features contributors to the Atlantic Monthly, first published in 1857 as a magazine focusing on politics, art, and literature."}, {"label": "D", "body": "An author discussed by Cathryn Halverson is Juanita Harrison, whose autobiography appeared in the Atlantic Monthly in the early 1900s."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence effectively introduces Cathryn Halverson’s book to an audience already familiar with the Atlantic
Monthly, noting the title of Halverson’s book and describing its content without providing background information about the Atlantic Monthly.
Choice B is incorrect. The sentence introduces the Atlantic Monthly and mentions that it’s referred to in Cathryn Halverson’s book title; it doesn’t
effectively introduce Halverson’s book. Choice C is incorrect. The sentence assumes that the audience is unfamiliar with the Atlantic Monthly,
providing background information about the magazine; it doesn’t effectively introduce Halverson’s book to an audience already familiar with the
Atlantic Monthly. Choice D is incorrect. While the sentence assumes that the audience is familiar with the Atlantic Monthly, it doesn’t effectively
introduce Cathryn Halverson’s book.$qb$);
select seed_pool_question($qb$CB-af76771f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Sue is the nickname of a dinosaur fossil specimen housed at the Field Museum of Natural History.
· The Field Museum of Natural History is located in Chicago, Illinois.
? Sue is a member of the genus Tyrannosaurus.
? Big Mike is the nickname of a dinosaur fossil specimen housed at the Museum of the Rockies.
? The Museum of the Rockies is located in Bozeman, Montana.
? Big Mike is a member of the genus Tyrannosaurus.
The student wants to emphasize a similarity between the two specimens. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-af76771f.png$qb$, $qb$[{"label": "A", "body": "The Field Museum of Natural History, where Sue is housed, is located in Chicago, Illinois."}, {"label": "B", "body": "Big Mike is the nickname of a Tyrannosaurus fossil specimen housed at the Museum of the Rockies in Bozeman, Montana."}, {"label": "C", "body": "The dinosaur fossil specimens Sue and Big Mike are both members of the genus Tyrannosaurus."}, {"label": "D", "body": "While Sue is housed at the Field Museum of Natural History, Big Mike is housed at the Museum of the Rockies."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes a similarity between the two specimens, noting that Sue and Big Mike are members of
the same genus: Tyrannosaurus.
Choice A is incorrect. The sentence only provides information about where one of the specimens (Sue) can be found; it doesn’t emphasize a
similarity between the two specimens. Choice B is incorrect. The sentence only provides information about one specimen (Big Mike); it doesn’t
emphasize a similarity between the two specimens. Choice D is incorrect. The sentence contrasts the locations of Sue and Big Mike; it doesn’t
emphasize a similarity between the two specimens.$qb$);
select seed_pool_question($qb$CB-064c8999$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Haber-Bosch process is an industrial process used to manufacture ammonia (NH3).
? It was invented by chemists Fritz Haber and Carl Bosch in 1910.
? The process’s primary reaction combines nitrogen (N2) from the air with hydrogen (H2).
? It requires an iron catalyst and high temperatures and pressures.
? Most of the ammonia produced by this process is used in fertilizers.
The student wants to provide an overview of the Haber-Bosch process. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-064c8999.png$qb$, $qb$[{"label": "A", "body": "The Haber-Bosch process needs nitrogen, hydrogen, and an iron catalyst."}, {"label": "B", "body": "The Haber-Bosch process uses an iron catalyst along with high temperatures and pressures to manufacture ammonia from nitrogen and hydrogen."}, {"label": "C", "body": "Chemists Fritz Haber and Carl Bosch invented an industrial process to manufacture ammonia to be used in fertilizers."}, {"label": "D", "body": "In 1910, chemists Fritz Haber and Carl Bosch invented the Haber-Bosch process, which requires high temperatures and pressures."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence provides an overview of the Haber-Bosch process, explaining that it uses an iron catalyst, high
temperatures, and high pressures to manufacture ammonia from nitrogen and hydrogen.
Choice A is incorrect. While the sentence identifies some of the process’s required components (nitrogen, hydrogen, and an iron catalyst), the
overview is incomplete; it doesn’t explain what the process does (produces ammonia) or mention the conditions needed for it to function (high
temperatures and pressures). Choice C is incorrect. While the sentence indicates who invented the process (Fritz Haber and Carl Bosch) and that
it produces ammonia, the overview is incomplete; it doesn’t mention any of the necessary ingredients or conditions. Choice D is incorrect. While
the sentence mentions the inventors of the process along with the required conditions (high temperatures and pressures), it doesn’t explain that
the process produces ammonia or indicate what components are needed.$qb$);
select seed_pool_question($qb$CB-b46e0c8a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Organisms release cellular material into their environment by shedding substances such as hair or skin.
· The DNA in these substances is known as environmental DNA, or eDNA.
? Researchers collect and analyze eDNA to detect the presence of species that are difficult to observe.
? Geneticist Sara Oyler-McCance’s research team analyzed eDNA in water samples from the Florida Everglades to detect invasive
constrictor snake species in the area.
? The study determined a 91% probability of detecting Burmese python eDNA in a given location.
The student wants to present the study to an audience already familiar with environmental DNA. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b46e0c8a.png$qb$, $qb$[{"label": "A", "body": "Sara Oyler-McCance’s researchers analyzed eDNA in water samples from the Florida Everglades for evidence of invasive constrictor snakes, which are difficult to observe."}, {"label": "B", "body": "An analysis of eDNA can detect the presence of invasive species that are difficult to observe, such as constrictor snakes."}, {"label": "C", "body": "Researchers found Burmese python eDNA, or environmental DNA, in water samples; eDNA is the DNA in released cellular materials, such as shed skin cells."}, {"label": "D", "body": "Sara Oyler-McCance’s researchers analyzed environmental DNA (eDNA)—that is, DNA from cellular materials released by organisms—in water samples from the Florida Everglades."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice presents the study in a way that assumes the audience is already familiar with eDNA.
Choice B is incorrect. This choice doesn’t present the study. It only states a general fact about eDNA analysis. Choice C is incorrect. This choice
isn’t suited for an audience already familiar with eDNA. A familiar audience wouldn’t need to have the term defined or explained. Choice D is
incorrect. This choice isn’t suited for an audience already familiar with eDNA. A familiar audience wouldn’t need to have the term defined or
explained. It also doesn’t present the study.$qb$);
select seed_pool_question($qb$CB-48d0bb34$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Sam Maloof (1916–2009) was an American woodworker and furniture designer.
· He was the son of Lebanese immigrants.
? He received a “genius grant” from the John D. and Catherine T. MacArthur Foundation in 1985.
? The Museum of Fine Arts in Boston, Massachusetts, owns a rocking chair that Maloof made from walnut wood.
? The armrests and the seat of the chair are sleek and contoured, and the back consists of seven spindle-like slats.
The student wants to describe the rocking chair to an audience unfamiliar with Sam Maloof. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-48d0bb34.png$qb$, $qb$[{"label": "A", "body": "With its sleek, contoured armrests and seat, the walnut rocking chair in Boston’s Museum of Fine Arts is just one piece of furniture created by American woodworker Sam Maloof."}, {"label": "B", "body": "Sam Maloof was born in 1916 and died in 2009, and during his life, he made a chair that you can see if you visit the Museum of Fine Arts in Boston."}, {"label": "C", "body": "Furniture designer Sam Maloof was a recipient of one of the John D. and Catherine T. MacArthur Foundation’s “genius grants.”"}, {"label": "D", "body": "The rocking chair is made from walnut, and it has been shaped such that its armrests and seat are sleek and contoured."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence effectively describes the rocking chair to an audience unfamiliar with Sam Maloof, noting its sleek,
contoured armrests and seat and explaining that Sam Maloof (the walnut chair’s creator) was an American woodworker.
Choice B is incorrect. While the sentence explains who Sam Maloof was and mentions a chair, it doesn’t describe the chair. Choice C is incorrect.
While the sentence explains who Sam Maloof was, it doesn’t describe the rocking chair. Choice D is incorrect. While the sentence describes the
rocking chair, it doesn’t explain who Sam Maloof was.$qb$);
select seed_pool_question($qb$CB-aa7e10d0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Species belonging to the Orchidaceae (orchid) family can be found in both tropical and temperate environments.
· Orchidaceae species diversity has not been well studied in temperate forests, such as those in Oaxaca, Mexico.
? Arelee Estefanía Muñoz-Hernández led a study to determine how many different Orchidaceae species are present in the forests of
Oaxaca.
? Muñoz-Hernández and her team collected orchids each month for a year at a site in Oaxaca.
? Seventy-four Orchidaceae species were present at the site.
The student wants to present the study and its findings. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-aa7e10d0.png$qb$, $qb$[{"label": "A", "body": "A study led by Arelee Estefanía Muñoz-Hernández identified a total of 74 Orchidaceae species in the temperate forests of Oaxaca, Mexico."}, {"label": "B", "body": "There are orchids in many environments, but there are 74 Orchidaceae species in Oaxaca, Mexico."}, {"label": "C", "body": "Oaxaca, Mexico, is home to temperate forests containing 74 Orchidaceae species."}, {"label": "D", "body": "Arelee Estefanía Muñoz-Hernández and her team wanted to know how many different Orchidaceae species are present in the forests of Oaxaca, Mexico, so they conducted a study to collect orchids."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice most effectively presents the study and its findings. It opens with the study and names its lead
researcher, then tells us its finding: that they identified 74 Orchidaceae species in the temperate forests of Oaxaca, Mexico.
Choice B is incorrect. This choice doesn’t include the study’s findings, so it fails to achieve the goal. It doesn’t mention that there was a study at
all. Choice C is incorrect. This choice doesn’t present the study, so it fails to achieve the goal. It doesn’t mention that there was a study at all.
Choice D is incorrect. This choice doesn’t include the study’s findings, so it fails to achieve the goal.$qb$);
select seed_pool_question($qb$CB-be44fea0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While studying jorō spiders, a large species originally from East Asia, University of Georgia researchers wondered if the spiders’ rapid spread
throughout the southeastern US was a result of aggressive behavior. ______ they discovered that jorō spiders are gentle giants who react to even
minor disturbances by “freezing” in place for an hour or more.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Therefore,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Instead” logically signals that the information about the researchers’ discovery in this sentence—that jorō spiders
are gentle giants who “freeze” in place when disturbed—contradicts their initial hypothesis about the spiders’ aggressiveness described in the
previous sentence.
Choice A is incorrect because “therefore” illogically signals that the discovery about jorō spiders’ gentleness is a result of the initial hypothesis
about their aggressive behavior. Instead, the sentence presents information that contradicts the initial hypothesis. Choice C is incorrect because
“for example” illogically signals that the discovery about jorō spiders’ gentleness exemplifies the initial hypothesis about their aggressive
behavior. Instead, the sentence presents information that contradicts the initial hypothesis. Choice D is incorrect because “in other words”
illogically signals that the discovery about jorō spiders’ gentleness is merely restating or rephrasing the initial hypothesis about their aggressive
behavior. Instead, the sentence presents information that contradicts the initial hypothesis.$qb$);
select seed_pool_question($qb$CB-264e7415$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Philadelphia and Lancaster Turnpike was a road built between 1792 and 1794.
· It was the first private turnpike in the United States.
? It connected the cities of Philadelphia and Lancaster in the state of Pennsylvania.
? It was sixty-two miles long.
The student wants to emphasize the distance covered by the Philadelphia and Lancaster Turnpike. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-264e7415.png$qb$, $qb$[{"label": "A", "body": "The sixty-two-mile-long Philadelphia and Lancaster Turnpike connected the Pennsylvania cities of Philadelphia and Lancaster."}, {"label": "B", "body": "The Philadelphia and Lancaster Turnpike was the first private turnpike in the United States."}, {"label": "C", "body": "The Philadelphia and Lancaster Turnpike, which connected two Pennsylvania cities, was built between 1792 and 1794."}, {"label": "D", "body": "A historic Pennsylvania road, the Philadelphia and Lancaster Turnpike was completed in 1794."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the distance covered by the Philadelphia and Lancaster Turnpike, noting that the turnpike,
which connected the two Pennsylvania cities in its name, was sixty-two miles long.
Choice B is incorrect. The sentence emphasizes the significance of the turnpike; it doesn’t emphasize the distance that the turnpike covered.
Choice C is incorrect. While the sentence mentions that the turnpike connected two Pennsylvania cities, it doesn’t emphasize the specific
distance covered by the turnpike. Choice D is incorrect. The sentence emphasizes when the turnpike was built; it doesn’t emphasize the distance
that the turnpike covered.$qb$);
select seed_pool_question($qb$CB-25a197dd$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The human body requires magnesium for over 300 essential processes.
· Magnesium is a mineral present in many foods.
? Peanuts contain 49 milligrams per ounce (mg/oz) of magnesium.
? Almonds contain 80 mg/oz.
? Chia seeds contain 150 mg/oz.
The student wants to identify which of the three foods has the highest magnesium content. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-25a197dd.png$qb$, $qb$[{"label": "A", "body": "At 80 mg/oz, almonds contain more magnesium than peanuts (49 mg/oz)."}, {"label": "B", "body": "Chia seeds contain 150 mg/oz of magnesium, which is more than peanuts and almonds."}, {"label": "C", "body": "Magnesium is present in many foods, including peanuts, almonds, and chia seeds."}, {"label": "D", "body": "Peanuts contain 49 mg/oz of magnesium, a mineral the human body requires for over 300 essential processes."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence identifies chia seeds as having the highest magnesium content of the three foods, noting that they
contain 150 mg/oz, which is more than both peanuts and almonds.
Choice A is incorrect. The sentence compares the magnesium content of almonds and peanuts; it doesn’t identify which of the three foods has
the highest magnesium content. Choice C is incorrect. The sentence merely mentions the three foods; it doesn’t identify which one has the
highest magnesium content. Choice D is incorrect. The sentence identifies the magnesium content of peanuts; it doesn’t identify which of the
three foods has the highest magnesium content.$qb$);
select seed_pool_question($qb$CB-e3edc138$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In a heated debate in biogeography, the field is divided between dispersalists and vicariancists. ______ there are those who argue that dispersal is
the most crucial determining factor in a species’ distribution, and those who insist that vicariance (separation due to geographic barriers) is.
Biogeographer Isabel Sanmartín counts herself among neither.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Furthermore,"}, {"label": "B", "body": "By contrast,"}, {"label": "C", "body": "Similarly,"}, {"label": "D", "body": "That is,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “That is” logically signals that the information in this sentence, which explains the difference between the
dispersalists’ position and the vicariancists’ position, clarifies the terms of the debate between dispersalists and vicariancists introduced in the
previous sentence.
Choice A is incorrect because “furthermore” illogically signals that the information in this sentence is merely additional to (and separate from)
the information in the previous sentence about the debate between dispersalists and vicariancists. Instead, the sentence clarifies the terms of
the debate, explaining the difference between the dispersalists’ position and the vicariancists’ position. Choice B is incorrect because “by
contrast” illogically signals that the information in this sentence contrasts with the information in the previous sentence. Instead, the sentence
clarifies the terms of the debate between dispersalists and vicariancists introduced in the previous sentence. Choice C is incorrect because
“similarly” illogically signals that the information in this sentence is merely similar to (and separate from) the information in the previous
sentence about the debate between dispersalists and vicariancists. Instead, the sentence clarifies the terms of the debate, explaining the
difference between the dispersalists’ position and the vicariancists’ position.$qb$);
select seed_pool_question($qb$CB-cf11282b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Scientists were able to isolate a relatively pure sample of selenium in 1817, the same year they first discovered the element’s existence. ______
the isolation process took longer for molybdenum, which was isolated in its pure form three years after scientists first discovered it.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "By contrast,"}, {"label": "B", "body": "Thus,"}, {"label": "C", "body": "Similarly,"}, {"label": "D", "body": "For instance,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "By contrast" logically signals that the information in this sentence—that isolating molybdenum was a relatively long
process—contrasts with the previous information that isolating selenium was a short process.
Choice B is incorrect because "thus" illogically signals that the information in this sentence is a result of the previous information about
selenium’s short isolation process. Instead, the sentence presents contrasting information about molybdenum’s longer isolation process. Choice
C is incorrect because "similarly" illogically signals that the information in this sentence is similar to the previous information about selenium’s
short isolation process. Instead, the sentence presents contrasting information about molybdenum’s longer isolation process. Choice D is
incorrect because "for instance" illogically signals that the information in this sentence exemplifies the previous information about selenium’s
short isolation process. Instead, the sentence presents contrasting information about molybdenum’s longer isolation process.$qb$);
select seed_pool_question($qb$CB-a40c7aa3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Most of the planets that have been discovered outside our solar system orbit G-type stars, like our Sun. In 2014, ______ researchers identified a
planet orbiting KELT-9, a B-type star more than twice as massive and nearly twice as hot as the Sun. Called KELT-9b, it is one of the hottest
planets ever discovered.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "likewise,"}, {"label": "B", "body": "however,"}, {"label": "C", "body": "therefore,"}, {"label": "D", "body": "for example,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The word “however” logically signals that the information in this sentence about the planet KELT-9b—that it orbits a
B-type star—contrasts with the previous information about planets discovered outside our solar system. Most of these planets orbit G-type stars,
not B-type stars.
Choice A is incorrect because “likewise” illogically signals that the information about the planet KELT-9b is similar to the previous information
about most planets outside our solar system. Instead, it contrasts with that information. Choice C is incorrect because “therefore” illogically
signals that the information about the planet KELT-9b is a result of the previous information about most planets outside our solar system.
Instead, it contrasts with that information. Choice D is incorrect because “for example” illogically signals that the information about the planet
KELT-9b is an example of the previous information about most planets outside our solar system. Instead, it contrasts with that information.$qb$);
select seed_pool_question($qb$CB-00221c00$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1815, while in exile in Jamaica, Venezuelan revolutionary Simón Bolívar penned a letter praising England’s republican government and
expressing hope that Latin American nations seeking independence from Spain might achieve something similar. The letter was addressed to a
local merchant, Henry Cullen; ______ though, Bolívar’s goal was to persuade political leaders from England and Europe to support his cause.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "additionally,"}, {"label": "B", "body": "ultimately,"}, {"label": "C", "body": "accordingly,"}, {"label": "D", "body": "consequently,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Ultimately” means “in the long run” or “at the highest level.” Although Bolívar wrote to a local merchant, his ultimate
goal was to send a message to political leaders in Europe. Therefore, “ultimately” fits perfectly in this context.
Choice A is incorrect. This choice uses a transition that indicates the addition of an agreeing idea. However, the second part of the sentence
actually disagrees with the first part. Bolívar addressed the letter to Cullen, but he was really sending a message to someone else. Notice how
the contrast word “though” also acts as a transition between these ideas. Choice C is incorrect. This choice uses a cause-and-effect transition.
Bolívar’s writing of the letter to Cullen would not cause him to have a goal of persuading European powers to support him. Choice D is incorrect.
This choice uses a cause-and-effect transition. Bolívar’s writing of the letter to Cullen would not cause him to have a goal of persuading
European powers to support him.$qb$);
select seed_pool_question($qb$CB-8a1ad52b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A research team led by Gal Badihi has discovered that chimpanzees communicate through exchanges of gestures occurring at a pace similar to
that of human conversations. ______ chimpanzee gesture exchanges have short pauses of about 120 milliseconds between communications,
comparable to the 200-millisecond average pause between turns in human speech.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "As a result,"}, {"label": "B", "body": "Specifically,"}, {"label": "C", "body": "By contrast,"}, {"label": "D", "body": "Nevertheless,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Specifically” logically signals that the information in this sentence—that pauses between chimpanzee gestures
average about 120 milliseconds, comparable to the 200-millisecond average pause in human speech—provides specific, precise details
elaborating on the previous sentence’s claim about the pace of chimpanzee communication being similar to that of human conversations.
Choice A is incorrect because “as a result” illogically signals that this sentence presents a result or consequence of the claim about chimpanzee
communication described in the previous sentence. Instead, the sentence provides specific details elaborating on that claim. Choice C is
incorrect because “by contrast” illogically signals that the information about chimpanzee gesture exchanges in this sentence contrasts with the
previous sentence’s claim about the pace of chimpanzee communication being similar to that of human conversations. Instead, the sentence
provides specific details elaborating on that claim. Choice D is incorrect because “nevertheless” illogically signals that the information about
chimpanzee gesture exchanges in this sentence is true despite the previous claim about the pace of chimpanzee communication. Instead, the
sentence provides specific details elaborating on that claim.$qb$);
select seed_pool_question($qb$CB-af89fa02$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Babylonian king Hammurabi achieved much during his forty-year reign. He conquered all of Mesopotamia and built Babylon into one of the
most powerful cities of the ancient world. Today, ______ he is mainly remembered for a code of laws inscribed on a seven-foot-tall block of stone:
the Code of Hammurabi.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "therefore,"}, {"label": "B", "body": "likewise,"}, {"label": "C", "body": "however,"}, {"label": "D", "body": "for instance,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “However” logically signals that the information in this sentence—that Hammurabi is mainly remembered for just a
single achievement, the Code of Hammurabi—is contrary to what might be assumed from the previous information about Hammurabi’s many
achievements.
Choice A is incorrect because “therefore” illogically signals that the information in this sentence is a result of the previous information about
Hammurabi’s many achievements. Instead, this sentence makes a point that is contrary to what might be assumed from the previous
information. Choice B is incorrect because “likewise” illogically signals that the information in this sentence is similar to the previous information
about Hammurabi’s many achievements. Instead, this sentence makes a point that is contrary to what might be assumed from the previous
information. Choice D is incorrect because “for instance” illogically signals that this sentence exemplifies the previous information about
Hammurabi’s many achievements. Instead, this sentence makes a point that is contrary to what might be assumed from the previous
information.$qb$);
select seed_pool_question($qb$CB-4c43bf61$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The International Center for the Arts of the Americas (ICAA) is directed by Mari Carmen Ramírez.
· Ramírez oversaw an initiative to create an online archive of historical documents related to the history of Latin American and Latino
visual art.
? The ICAA digitized over 10,000 documents, including the writings of Latin American and Latino artists and critics.
? The creation of the archive didn’t require historical documents to be removed from their countries of origin.
? Scholars now have more access to these documents.
The student wants to explain an advantage of the ICAA’s archive being digital. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4c43bf61.png$qb$, $qb$[{"label": "A", "body": "Over 10,000 documents related to the history of Latin American and Latino visual art are part of the ICAA archive."}, {"label": "B", "body": "By offering online versions of historical documents, the ICAA’s archive provides more access to these materials without removing them from their countries of origin."}, {"label": "C", "body": "Among the historical documents in the ICAA’s archive are the writings of Latin American and Latino artists and critics."}, {"label": "D", "body": "The ICAA’s director, Mari Carmen Ramírez, oversaw the creation of an online archive of historical documents related to Latin American and Latino visual art."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence explains an advantage of the ICAA’s archive being digital, noting that the archive provides more
access to historical documents since they don’t have to be removed from their countries of origin.
Choice A is incorrect. The sentence emphasizes the number of documents in the ICAA archive; it doesn’t explain an advantage of the archive
being digital. Choice C is incorrect. The sentence notes the types of historical documents the ICAA’s archive contains; it doesn’t explain an
advantage of the archive being digital. Choice D is incorrect. The sentence identifies who oversaw the creation of the ICAA’s online archive; it
doesn’t explain an advantage of the archive being digital.$qb$);
select seed_pool_question($qb$CB-16631d34$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Million Song Dataset (MSD) includes main audio features and descriptive tags for popular songs.
· Audio features include acoustic traits such as loudness and pitch intervals.
? Many algorithms use these audio features to predict a new song’s popularity.
? These algorithms may fail to accurately identify main audio features of a song with varying acoustic traits.
? Algorithms based on descriptive tags that describe fixed traits such as genre are more reliable predictors of song popularity.
The student wants to explain a disadvantage of relying on audio features to predict a song’s popularity. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-16631d34.png$qb$, $qb$[{"label": "A", "body": "Many popularity-predicting algorithms are based on a song’s audio features, such as loudness and pitch intervals."}, {"label": "B", "body": "Algorithms based on audio features may misidentify the main features of a song with varying acoustic traits, making such algorithms less reliable predictors of popularity than those based on fixed traits."}, {"label": "C", "body": "Audio features describe acoustic traits such as pitch intervals, which may vary within a song, whereas descriptive tags describe fixed traits such as genre, which are reliable predictors of popularity."}, {"label": "D", "body": "The MSD’s descriptive tags are reliable predictors of a song’s popularity, as the traits they describe are fixed."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. This choice uses relevant information from the notes to explain a disadvantage of relying on audio features to
predict a song’s popularity—namely, that it may misidentify features of certain songs. It also contrasts audio features with descriptive tags, which
are more reliable predictors.
Choice A is incorrect. This choice only states a fact about the algorithms without evaluating their reliability or accuracy. Choice C is incorrect.
This choice only describes the difference between audio features and descriptive tags without indicating why this difference matters for
predicting popularity. Choice D is incorrect. This choice only mentions descriptive tags, which are not the focus of the student’s rhetorical goal.$qb$);
select seed_pool_question($qb$CB-d9dad012$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Inca of South America used intricately knotted string devices called quipus to record countable information, like population data and
payments. ______ they may have used quipus to record more complex information, like stories and myths, according to researchers.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "As a result,"}, {"label": "B", "body": "In other words,"}, {"label": "C", "body": "In addition,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "In addition" logically signals that the claim in this sentence—that the Inca of South America may have used quipus
to record more complex information—is an additional point related to the previous statement about the Inca using quipus to record countable
information.
Choice A is incorrect because "as a result" illogically signals that the claim in the sentence is a consequence or result of the previous statement
about the Inca using quipus to record countable information. Instead, the possibility that the Inca used quipus to record more complex
information is an additional point about how the quipus were used. Choice B is incorrect because "in other words" illogically signals that the
claim in the sentence is merely a paraphrase or restatement of the previous statement about the Inca using quipus to record countable
information. Instead, the possibility that the Inca used quipus to record more complex information is an additional point about how the quipus
were used. Choice D is incorrect because "for example" illogically signals that the claim in the sentence exemplifies the previous statement
about the Inca using quipus to record countable information. Instead, the possibility that the Inca used quipus to record more complex
information is an additional point about how the quipus were used.$qb$);
select seed_pool_question($qb$CB-e2693197$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Oracles of the Pink Universe was a 2021 exhibition at the Denver Museum of Art in Colorado.
· It featured eight artworks by South African artist Simphiwe Ndzube.
? One of these works is a painting titled Assertion of Will.
? Assertion of Will depicts three standing figures.
? The figures wear clothing made of fabric pieces stitched to the painting’s canvas.
The student wants to describe how fabric is used in Assertion of Will. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e2693197.png$qb$, $qb$[{"label": "A", "body": "In Assertion of Will, the figures’ clothing is made of fabric pieces stitched to the painting’s canvas."}, {"label": "B", "body": "The exhibition Oracles of the Pink Universe featured artworks by artist Simphiwe Ndzube."}, {"label": "C", "body": "Depicting three standing, clothed figures, Assertion of Will is a painting by Simphiwe Ndzube."}, {"label": "D", "body": "Simphiwe Ndzube’s Assertion of Will was one of eight artworks exhibited in Oracles of the Pink Universe at the Denver Museum of Art."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice directly describes how fabric is used in Assertion of Will, by explaining that the fabric pieces are part of
the painting itself.
Choice B is incorrect. This choice provides contextual information about the exhibition, but it doesn’t mention anything about the painting or the
fabric. Choice C is incorrect. This choice mentions that the figures are clothed, but it doesn’t explain how the fabric is integrated into the
painting. Choice D is incorrect. This choice provides contextual information about the painting, but it doesn’t mention anything about the fabric or
how it is used.$qb$);
select seed_pool_question($qb$CB-601b9d18$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Some members of the US Supreme Court have resisted calls to televise the court’s oral arguments, concerned that the participants would be
tempted to perform for the cameras (and thus lower the quality of the discourse). ______ the justices worry that most viewers would not even
watch the full deliberations, only short clips that could be misinterpreted and mischaracterized.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "Additionally,"}, {"label": "C", "body": "In comparison,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Additionally” logically signals that the claim in this sentence—that some Supreme Court justices worry that viewers
(of televised court arguments) would watch only short, misleading clips—adds to the information in the previous sentence. Specifically, the
previous sentence indicates one concern raised by those opposed to televising the court’s oral arguments, and the claim that follows indicates a
second, additional concern.
Choice A is incorrect because “however” illogically signals that the claim in this sentence contrasts with the information in the previous
sentence. Instead, the claim adds to the information, indicating a second, additional concern that some Supreme Court justices have about
televising the court’s arguments. Choice C is incorrect because “in comparison” illogically signals that the claim in this sentence is being
compared to the information in the previous sentence. Instead, the claim adds to the information, indicating a second, additional concern that
some Supreme Court justices have about televising the court’s arguments. Choice D is incorrect because “for example” illogically signals that the
claim in this sentence exemplifies the information in the previous sentence. Instead, the claim adds to the information, indicating a second,
additional concern that some Supreme Court justices have about televising the court’s arguments.$qb$);
select seed_pool_question($qb$CB-60917233$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the 1880s, inventor Lewis Latimer improved upon Thomas Edison’s design for the electric light bulb. ______ Latimer made the light bulb more
durable by placing cardboard around its carbon filament. With this innovation, Latimer became the first Black inventor to contribute to the
electrification of the world.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Soon,"}, {"label": "B", "body": "Regardless,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "Specifically,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Specifically" logically signals that the information in this sentence—Latimer making the light bulb more durable—
provides a specific detail elaborating on the more general claim in the previous sentence that Latimer improved the light bulb.
Choice A is incorrect because "soon" illogically signals that the information in this sentence occurred shortly after Latimer improved the light
bulb. Instead, Latimer making the bulb more durable was the specific improvement. Choice B is incorrect because "regardless" illogically signals
that the information in this sentence is true despite the previous claim about Latimer. Instead, the information about Latimer making the bulb
more durable provides a specific detail elaborating on that claim. Choice C is incorrect because "however" illogically signals that the information
in this sentence contrasts with the previous claim about Latimer. Instead, the information about Latimer making the bulb more durable provides
a specific detail elaborating on that claim.$qb$);
select seed_pool_question($qb$CB-1d79a59d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Leaders of the Province of Guatemala proclaimed independence for Central America from the Spanish Empire on September 15, 1821.
? The accompanying Declaration of Independence was written by Honduran scholar and politician José Cecilio del Valle.
· The 1812 Spanish Constitution had provided some degree of independence for Central America, but it was repealed by the Spanish king
in 1814.
· Valle, a loyal advisor to the Spanish Empire’s administrators in Central America, had long opposed independence.
? He changed his mind after Colonel Rafael del Riego’s 1820 revolt, which demanded the return of rights lost in 1814.
The student wants to place the 1821 Declaration of Independence in the context of Valle’s changing political beliefs. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1d79a59d.png$qb$, $qb$[{"label": "A", "body": "Colonel Riego’s revolt was the inspiration that Valle, a long-standing opponent of Central American independence, needed to change his political beliefs."}, {"label": "B", "body": "Long an opponent of Central American independence, Valle changed his mind after an 1820 revolt and wrote the 1821 declaration."}, {"label": "C", "body": "A change in Valle’s political beliefs that occurred when the Spanish king repealed the 1812 constitution led to Valle writing Central America’s Declaration of Independence."}, {"label": "D", "body": "The writing of Central America’s Declaration of Independence may not have happened were it not for Colonel Riego’s 1820 revolt."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence places the Declaration of Independence in the context of Valle’s changing political beliefs, noting that
Valle was long an opponent of Central American independence but changed his mind after an 1820 revolt and then wrote the Declaration of
Independence in 1821.
Choice A is incorrect. The sentence states that Valle’s political beliefs changed after Riego’s revolt but doesn’t indicate how these changed
beliefs provide context for the 1821 Declaration of Independence. Choice C is incorrect because it misrepresents information from the notes.
Valle’s political beliefs changed after Riego’s 1820 revolt, not when the Spanish king repealed the 1812 constitution. Choice D is incorrect. While
the sentence indicates a relationship between Colonel Riego’s 1820 revolt and Central America’s Declaration of Independence, it doesn’t mention
Valle’s changing political beliefs.$qb$);
select seed_pool_question($qb$CB-ec3d7605$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Award-winning travel writer Linda Watanabe McFerrin considers the background research she conducts on destinations featured in her travel
books to be its own reward. ______ McFerrin admits to finding the research phase of her work just as fascinating and engaging as exploring a
location in person.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "By contrast,"}, {"label": "B", "body": "Likewise,"}, {"label": "C", "body": "Besides,"}, {"label": "D", "body": "In fact,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “In fact” logically signals that the information in this sentence—that McFerrin finds the research phase of her work
to be just as fascinating as travel—emphasizes and elaborates on the previous sentence’s point that McFerrin regards background research as a
rewarding activity.
Choice A is incorrect because “by contrast” illogically signals that the information in this sentence contrasts with the previous sentence’s point
about McFerrin’s attitude toward background research. Instead, it emphasizes and elaborates on that point. Choice B is incorrect because
“likewise” illogically signals that this sentence merely adds a second, similar point to the previous sentence’s point about McFerrin’s attitude
toward background research. Instead, it emphasizes and elaborates on that point. Choice C is incorrect because “besides” illogically signals that
this sentence provides a separate point in addition to, or apart from, the previous sentence’s point about McFerrin’s attitude toward background
research. Instead, it emphasizes and elaborates on that point.$qb$);
select seed_pool_question($qb$CB-54227b8e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The mountain pygmy possum is a mammal species.
· Up until 1966, it was believed to be extinct.
? That year, a live mountain pygmy possum was identified in the wild in Australia.
? The mountain pygmy possum is considered a Lazarus species.
? “Lazarus species” is a term for living species of organisms that were once believed to be extinct.
The student wants to define the term “Lazarus species” and provide an example of one. Which choice most effectively uses relevant information
from the notes to accomplish these goals?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-54227b8e.png$qb$, $qb$[{"label": "A", "body": "The term “Lazarus species” describes a living species of organism, such as the mountain pygmy possum, that was once believed to be extinct."}, {"label": "B", "body": "One example of a Lazarus species is the mountain pygmy possum, a mammal species that was identified in the wild in Australia in 1966."}, {"label": "C", "body": "The mountain pygmy possum, a species of mammal, was identified in the wild in 1966."}, {"label": "D", "body": "Sometimes, a species once believed to be extinct is later found living in the wild."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence defines the term "Lazarus species" and provides an example of one, explaining that a Lazarus species
is a living organism that was once believed to be extinct and providing the mountain pygmy possum as an example.
Choice B is incorrect. While the sentence provides an example of a Lazarus species, it doesn’t define the term "Lazarus species." Choice C is
incorrect. The sentence provides information about the mountain pygmy possum; it doesn’t define the term "Lazarus species" or explicitly
identify the mountain pygmy possum as a Lazarus species. Choice D is incorrect. While the sentence describes the concept of a Lazarus
species, it doesn’t define the term or provide an example of a Lazarus species.$qb$);
select seed_pool_question($qb$CB-a819d8b6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 1873, Spanish scientist Santiago Ramón y Cajal observed that brain fibers have distinct boundaries with clear end points, a finding that went
against earlier assumptions about the brain. ______ scientists had assumed that the brain was a continuous web of fused fibers, not a vast
network of distinct, individual cells.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "Previously,"}, {"label": "C", "body": "As a result,"}, {"label": "D", "body": "Likewise,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Previously” logically signals that the fused fiber theory came before Ramón y Cajal’s discovery.
Choice A is incorrect. “However” illogically signals that the fused fiber theory in this sentence contrasts with the information in the previous
sentence. While this theory does contrast with Ramón y Cajal’s discovery, the previous sentence concludes by stating that his discovery went
against prior assumptions about the brain. The fact that the fused fiber theory was one of those earlier assumptions makes “however” an
illogical choice. Choice C is incorrect because “as a result” illogically signals that the fused fiber theory in this sentence was a result of the
discovery in the previous sentence. Instead, the fused fiber theory came before Ramón y Cajal’s discovery. Choice D is incorrect because
“likewise” illogically signals that the fused fiber theory in this sentence was similar to the discovery in the previous sentence. Instead, the fused
fiber theory, which came before Ramón y Cajal’s discovery, was very different from it.$qb$);
select seed_pool_question($qb$CB-84e108cf$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Platinum is a rare and expensive metal.
· It is used as a catalyst for chemical reactions.
? Platinum catalysts typically require a large amount of platinum to be effective.
? Researcher Jianbo Tang and his colleagues created a platinum catalyst that combines platinum with liquid gallium.
? Their catalyst was highly effective and required only trace amounts of platinum (0.0001% of the atoms in the mixture).
The student wants to explain an advantage of the new platinum catalyst developed by Jianbo Tang and his colleagues. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-84e108cf.png$qb$, $qb$[{"label": "A", "body": "Researcher Jianbo Tang and his colleagues created a platinum catalyst that combines platinum, a rare and expensive metal, with liquid gallium."}, {"label": "B", "body": "Like other platinum catalysts, the new platinum catalyst requires a particular amount of the metal to be effective."}, {"label": "C", "body": "Platinum is a rare and expensive metal that is used as a catalyst for chemical reactions; however, platinum catalysts typically require a large amount of platinum to be effective."}, {"label": "D", "body": "While still highly effective, the new platinum catalyst requires far less of the rare and expensive metal than do other platinum catalysts."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence explains an advantage of Tang and his colleagues’ platinum catalyst, noting that it requires far less
platinum (which is rare and expensive) than other platinum catalysts do.
Choice A is incorrect. The sentence describes the platinum catalyst that Tang and his colleagues created; it doesn’t explain an advantage of their
platinum catalyst. Choice B is incorrect. The sentence emphasizes a similarity between the new platinum catalyst and other platinum catalysts; it
doesn’t explain an advantage of the new platinum catalyst. Choice C is incorrect. The sentence connects the metal platinum to the functioning of
platinum catalysts, noting that large amounts of platinum are typically required for platinum catalysts to be effective; it doesn’t explain an
advantage of Tang and his colleagues’ platinum catalyst.$qb$);
select seed_pool_question($qb$CB-42e6cc83$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In hindsight, given the ideas about the natural world circulating among British scientists in the 1800s, the theory of natural selection was an
obvious next step. It may not have been a coincidence, ______ that Charles Darwin and Alfred Wallace arrived at the concept independently.
Indeed, contrary to the popular myth of the lone genius, theirs is not the first paradigm-shifting theory to have emerged from multiple scholars
working in parallel.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "however,"}, {"label": "B", "body": "then,"}, {"label": "C", "body": "moreover,"}, {"label": "D", "body": "for example,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Then" signals that this sentence’s claim about Darwin and Wallace follows logically from the previous information.
In other words, both scientists independently arriving at the theory of natural selection was, arguably, an expected outcome of the circumstances
mentioned in the previous sentence.
Choice A is incorrect because "however" illogically signals that the claim in this sentence contrasts with the previous information about the ideas
circulating among British scientists in the 1800s. Instead, this claim follows logically from that information. Choice C is incorrect because
"moreover" illogically signals that the claim in this sentence merely adds to the previous information about the ideas circulating among British
scientists in the 1800s. Instead, this claim follows logically from that information. Choice D is incorrect because "for example" illogically signals
that this sentence provides an example supporting the previous information about the ideas circulating among British scientists in the 1800s.
Instead, it presents a claim that follows logically from that information.$qb$);
select seed_pool_question($qb$CB-326017ce$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For years, biologists have experimented with using grime-eating bacteria rather than harsh chemicals to clean artworks, and results have been
impressive overall. ______ these bacterial strains—which can metabolize centuries’ worth of oil, glue, dirt, and other surface impurities without
creating harmful byproducts—have proven more effective than traditional chemical cleaning methods.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "In many cases,"}, {"label": "C", "body": "As a result,"}, {"label": "D", "body": "Additionally,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “In many cases” logically links the information that follows to the previous sentence’s claim that the results of
bacterial cleaning “have been impressive overall.” This sentence supports that claim by indicating that the bacteria “have proven more effective
than traditional chemical cleaning methods.” Noting that this is true “in many cases” appropriately frames the information in the sentence and
thus completes the text with the most logical transition.
Choice A is incorrect because “however” illogically signals that the information in this sentence contrasts with the previous information. Instead,
this sentence supports the previous sentence’s claim that the results of bacterial cleaning “have been impressive overall,” noting that the bacteria
“have proven more effective than traditional chemical cleaning methods.” Choice C is incorrect because “as a result” illogically signals that the
information in this sentence is a consequence of the claim about the results of bacterial cleaning. Instead, this sentence supports the previous
sentence’s claim that the results of bacterial cleaning “have been impressive overall,” noting that the bacteria “have proven more effective than
traditional chemical cleaning methods.” Choice D is incorrect because “additionally” illogically signals that the information in this sentence is
merely additional to (and separate from) the previous information about the results of bacterial cleaning. Instead, this sentence supports the
previous sentence’s claim that the results of bacterial cleaning “have been impressive overall,” noting that the bacteria “have proven more
effective than traditional chemical cleaning methods.”$qb$);
select seed_pool_question($qb$CB-c78620ba$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1968, US Congressman John Conyers introduced a bill to establish a national holiday in honor of Dr. Martin Luther King Jr. The bill didn’t make
it to a vote, but Conyers was determined. He teamed up with Shirley Chisholm, the first Black woman to be elected to Congress, and they
resubmitted the bill every session for the next fifteen years. ______ in 1983, the bill passed.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Instead,"}, {"label": "B", "body": "Likewise,"}, {"label": "C", "body": "Finally,"}, {"label": "D", "body": "Additionally,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Finally” logically signals that the bill passing—following many attempts between 1968 and 1983—is the final,
concluding event in the sequence described in the previous sentences.
Choice A is incorrect because “instead” illogically signals that the bill passing is an alternative to one of the events described in the previous
sentences. Instead, it is the final event in the sequence. Choice B is incorrect because “likewise” illogically signals that the bill passing is similar
to one of the events described in the previous sentences. Instead, it is the final event in the sequence. Choice D is incorrect because
“additionally” illogically signals that the bill passing is merely another event described along with the events of the previous sentences. Instead, it
is the final, concluding event in the sequence.$qb$);
select seed_pool_question($qb$CB-20733eac$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$It has long been thought that humans first crossed a land bridge into the Americas approximately 13,000 years ago. ______ based on radiocarbon
dating of samples uncovered in Mexico, a research team recently suggested that humans may have arrived more than 30,000 years ago—much
earlier than previously thought.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "As a result,"}, {"label": "B", "body": "Similarly,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "In conclusion,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “However” logically signals that the theory discussed in this sentence—that humans may have arrived in the
Americas over 30,000 years ago—contrasts with the previously discussed theory that humans arrived around 13,000 years ago.
Choice A is incorrect because “as a result” illogically signals that the theory in this sentence is the result of the theory discussed in the previous
sentence. Instead, this theory contrasts with the previous one. Choice B is incorrect because “similarly” illogically signals that the theory in this
sentence is similar to the theory discussed in the previous sentence. Instead, this theory contrasts with the previous one. Choice D is incorrect
because “in conclusion” illogically signals that the theory in this sentence concludes or summarizes the discussion of the previous theory.
Instead, this theory contrasts with the previous one.$qb$);
select seed_pool_question($qb$CB-94c9788e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Brain imaging research led by neuroscientist Dwaynica Greaves found that actors showed suppressed responses in the left anterior prefrontal
cortex (the portion of the brain associated with self-awareness) when their names were called during performances; ______ the actors’ responses
were normal in nonacting contexts. These findings suggest that when embodying characters, performers may temporarily set aside their
personal identities.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "specifically,"}, {"label": "B", "body": "conversely,"}, {"label": "C", "body": "likewise,"}, {"label": "D", "body": "thus,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Conversely” logically signals that the information in this sentence—that the actors’ responses were normal in
nonacting contexts—presents the opposite of the previous finding that actors showed suppressed responses when their names were called
during performances.
Choice A is incorrect because “specifically” illogically signals that the information about the actors’ normal responses in nonacting contexts
provides specific details elaborating on the previous finding of suppressed responses during performances. Instead, the sentence presents the
responses as opposites. Choice C is incorrect because “likewise” illogically signals that the actors’ normal responses in nonacting contexts are
similar to the suppressed responses observed during performances. Instead, the sentence presents the responses as opposites. Choice D is
incorrect because “thus” illogically signals that the actors’ normal responses in nonacting contexts are a result or consequence of the
suppressed responses observed during performances. Instead, the sentence presents the responses as opposites.$qb$);
select seed_pool_question($qb$CB-e1079609$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1845, the United States District Court for the state of Iowa was established. Initially, the court’s jurisdiction was a single district that
encompassed the entire state, but as Iowa’s population grew, this single district began to struggle to serve the needs of everyone in the state.
______ the court’s jurisdiction was subdivided into two districts, each with its own district court.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Nevertheless,"}, {"label": "B", "body": "Ultimately,"}, {"label": "C", "body": "Additionally,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Ultimately” logically signals that the information in this sentence—that the court’s jurisdiction was subdivided into
two districts—was the eventual outcome or resolution of the previously described struggle of the single district to serve the needs of everyone in
the state.
Choice A is incorrect because “nevertheless” illogically signals that the information in the sentence is true despite the single district’s struggle to
serve the state’s needs. Instead, the sentence describes the eventual resolution of that struggle. Choice C is incorrect because “additionally”
illogically signals that the information in the sentence is merely an additional fact related to the single district’s struggle. Instead, the sentence
describes the eventual resolution of that struggle. Choice D is incorrect because “for example” illogically signals that the information in the
sentence provides a specific example of the single district’s struggle to serve the state’s needs. Instead, the sentence describes the eventual
resolution of that struggle.$qb$);
select seed_pool_question($qb$CB-ca4ff52d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Muslins are woven cotton fabrics with a variety of uses.
· Dhaka muslin is a handmade fabric produced in Dhaka, Bangladesh.
? It has an extremely fine weave and is primarily used to make luxury clothing.
? Sheeting muslin is a machine-made fabric produced in factories.
? It has a coarse weave and is primarily used to upholster furniture and create backdrops for theater sets.
The student wants to emphasize a difference between the two muslins. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ca4ff52d.png$qb$, $qb$[{"label": "A", "body": "Dhaka muslin is a handmade fabric with an extremely fine weave, while sheeting muslin is machine made with a coarse weave."}, {"label": "B", "body": "Dhaka muslin and sheeting muslin are two different types of woven cotton fabrics."}, {"label": "C", "body": "Muslins can be used in a variety of ways, from making luxury clothing to upholstering furniture and creating backdrops for theater sets."}, {"label": "D", "body": "Sheeting muslin is machine made, has a coarse weave, and is used for furniture and theater sets."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The difference between the two different kinds of muslin is emphasized.
Choice B is incorrect. This choice lists two kinds of muslins, but does not say how they are different from one another. Choice C is incorrect. This
choice does not emphasize a difference between the two muslins. Choice D is incorrect. This choice does not emphasize a difference between
the two muslins. It only describes sheeting muslin.$qb$);
select seed_pool_question($qb$CB-7298633c$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Grimanesa Amoros is a Peruvian American artist well known for her LED light sculptures.
· Her sculpture Uros Island is made of smooth multicolored LED domes.
? It occupies 335 cubic feet of space.
? Her sculpture Fortuna is made of entangled blue and white LED tubes.
? It occupies 19,950 cubic feet of space.
The student wants to emphasize a similarity between Uros Island and Fortuna. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7298633c.png$qb$, $qb$[{"label": "A", "body": "The smooth LED domes of Grimanesa Amoros’s Uros Island stand in contrast to the tangled LED tubes of Fortuna."}, {"label": "B", "body": "At 19,950 cubic feet in size, Grimanesa Amoros’s Fortuna cuts a larger figure than the 335-cubic-foot Uros Island."}, {"label": "C", "body": "Grimanesa Amoros is the artist behind Uros Island—a sculpture made of smooth multicolored LED domes."}, {"label": "D", "body": "Uros Island is an LED light sculpture made by Grimanesa Amoros, as is Fortuna."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence emphasizes a similarity between the sculptures, noting that both Uros Island and Fortuna are LED light
sculptures created by Grimanesa Amoros.
Choice A is incorrect. Noting that Uros Island’s smooth LED domes contrast with Fortuna’s tangled LED tubes, the sentence emphasizes a
difference between the two sculptures rather than a similarity. Choice B is incorrect. Contrasting the respective sizes of Uros Island and Fortuna,
the sentence emphasizes a difference between the two sculptures rather than a similarity. Choice C is incorrect. While the sentence describes
Uros Island, it doesn’t mention Fortuna or emphasize any similarity between the two sculptures.$qb$);
select seed_pool_question($qb$CB-441f0505$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? A lever is a simple machine consisting of a rigid beam and a fulcrum.
· The fulcrum is the point about which the beam pivots.
? The input force (effort) is the force applied to the lever.
? The output force (load) is the force that the lever exerts on another object.
? In first-class levers, the fulcrum is located between the effort and the load.
? In second-class levers, the load is located between the effort and the fulcrum.
The student wants to contrast first-class levers and second-class levers. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-441f0505.png$qb$, $qb$[{"label": "A", "body": "In levers, the effort is the force applied to the lever; the load, in contrast, is the force that the lever exerts on another object."}, {"label": "B", "body": "In first-class and second-class levers, the fulcrum and the load are in different locations."}, {"label": "C", "body": "First-class levers are simple machines consisting of a rigid beam and a fulcrum, but then again, the same is true of second-class levers."}, {"label": "D", "body": "In first-class levers, the fulcrum is located between the effort and the load, but in second-class levers, the load is located between the effort and the fulcrum."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence contrasts first-class levers and second-class levers, explaining that the fulcrum in a first-class lever is
between the effort and the load, whereas in a second-class lever the load is between the effort and the fulcrum.
Choice A is incorrect. The sentence defines two terms associated with levers; it doesn’t contrast first-class levers and second-class levers.
Choice B is incorrect. While the sentence seems to acknowledge a general difference in fulcrum and load locations between first-class and
second-class levers, it does not specify what this difference is. Moreover, the sentence could be read as emphasizing a similarity—that in both
types of levers, the fulcrum and load are in different locations. The sentence thus fails to effectively contrast the two types of levers. Choice C is
incorrect. The sentence describes a similarity between first-class and second-class levers; it doesn’t contrast them.$qb$);
select seed_pool_question($qb$CB-6c9df5d1$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Some powerful works of literature have so influenced readers that new legislation has been passed as a result.
· The Interesting Narrative of the Life of Olaudah Equiano (1789) is the autobiography of a man who endured slavery on both sides of the
Atlantic.
? Equiano’s book contributed to the passage of the Slave Trade Act of 1807.
? The Jungle (1906) is a fictional work by Upton Sinclair that describes unsanitary conditions in US meatpacking plants.
? Sinclair’s book contributed to the passage of the Pure Food and Drug Act in 1906.
The student wants to emphasize a difference between the two books. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6c9df5d1.png$qb$, $qb$[{"label": "A", "body": "Although both are powerful works of literature that contributed to new legislation, Equiano’s book is an autobiography, while Sinclair’s is fictional."}, {"label": "B", "body": "They may have written about different topics, but Equiano and Sinclair both influenced readers."}, {"label": "C", "body": "The 1807 Slave Trade Act resulted in part from a book by Equiano, while the 1906 Pure Food and Drug Act resulted in part from a book by Sinclair."}, {"label": "D", "body": "The Interesting Narrative of the Life of Olaudah Equiano and The Jungle are two works of literature that contributed to new legislation (concerning the slave trade and food safety, respectively)."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice emphasizes a difference between the two books by using relevant information from the notes to
contrast their genres.
Choice B is incorrect. This choice mentions a difference between the books (their different topics), but it emphasizes a similarity between the
books (their influence on readers). Choice C is incorrect. This choice provides information about the books that reflects both a similarity (both
resulted in new laws) and a difference (the specific laws that resulted), without emphasizing either. Choice D is incorrect. This choice doesn’t
emphasize a difference between the two books. Instead, it emphasizes a similarity.$qb$);
select seed_pool_question($qb$CB-e6b1e12c$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Long thought to be sessile (immobile), adult Chelonibia testudinaria, barnacles that adhere to sea turtle shells, have been observed to shift
slightly in position over time—a phenomenon that has been attributed to the barnacles’ passive displacement by water currents. ______ a
research team found that adult C. testudinaria moved toward the heads of their sea turtle hosts and thus against the prevailing water flow,
behavior consistent with self-initiated locomotion.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Contrary to this phenomenon,"}, {"label": "B", "body": "Undermining this explanation,"}, {"label": "C", "body": "Drawing a similar conclusion,"}, {"label": "D", "body": "Confirming this hypothesis,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Undermining this explanation” logically signals that the information in this sentence—that adult Chelonibia
testudinaria showed behavior consistent with self-initiated locomotion—undermines or weakens the previous explanation that barnacle
movement was a result of passive displacement by water currents.
Choice A is incorrect because “contrary to this phenomenon” illogically signals that the information in this sentence about barnacles exhibiting
behavior consistent with self-initiated locomotion opposes the previous information about barnacles shifting slightly in position over time.
Instead, the sentence undermines or weakens the previous claim about passive displacement. That is, the sentence doesn’t oppose the fact that
the barnacles shifted position: it challenges the previous sentence’s explanation for the movement. Choice C is incorrect because “drawing a
similar conclusion” illogically signals that the information in this sentence about barnacles exhibiting behavior consistent with self-initiated
locomotion is similar to the previous conclusion that barnacle movement is the result of passive displacement. Instead, the sentence
undermines or weakens the previous sentence’s explanation for how the barnacles moved. Choice D is incorrect because “confirming this
hypothesis” illogically signals that the information in this sentence about barnacles exhibiting behavior consistent with self-initiated locomotion
confirms the hypothesis in the previous sentence that the barnacle movement was the result of passive displacement. Instead, the sentence
undermines or weakens the previous sentence’s explanation for how the barnacles moved.$qb$);
select seed_pool_question($qb$CB-f07570bb$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Researchers believe that pieces of hull found off Oregon’s coast are from a Spanish cargo ship that was lost in 1697. Stories passed down
among the area’s Confederated Tribes of Siletz Indians support this belief. ______ Siletz stories describe how blocks of beeswax, an item the ship
had been carrying, began washing ashore after the ship was lost.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For this reason,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "Likewise,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “For example” logically signals that the Siletz beeswax stories mentioned in this sentence are examples consistent
with the previous claim that Siletz stories support the shipwreck theory.
Choice A is incorrect because “for this reason” illogically signals that the Siletz stories about the beeswax were caused by the previous claim that
Siletz stories support the shipwreck theory. Instead, the beeswax stories are examples consistent with the claim. Choice C is incorrect because
“however” illogically signals that the Siletz stories about the beeswax contrast with the previous claim that Siletz stories support the shipwreck
theory. Instead, the beeswax stories are examples consistent with the claim. Choice D is incorrect because “likewise” illogically signals that the
Siletz stories about the beeswax are similar to the previous claim that Siletz stories support the shipwreck theory. Instead, the beeswax stories
are examples consistent with the claim.$qb$);
select seed_pool_question($qb$CB-4b99b481$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Scientists have developed a “freeze-thaw” battery that can retain 92% of its charge after twelve weeks.
· The battery contains molten salt (a type of salt that liquifies when heated and solidifies at room temperature).
? When the salt is in a liquid state, energy flows through the battery.
? When the salt is in a solid state, energy stops flowing and is stored in the battery.
? The stored (frozen) energy can be used by reheating (thawing) the battery.
The student wants to specify how the salt enables energy storage. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4b99b481.png$qb$, $qb$[{"label": "A", "body": "Scientists have developed a freeze-thaw battery that contains molten salt, which liquifies when heated and solidifies at room temperature."}, {"label": "B", "body": "The stored energy in a freeze-thaw battery, which contains molten salt, can be used by reheating the battery."}, {"label": "C", "body": "When the molten salt in a freeze-thaw battery solidifies at room temperature, energy stops flowing and can be stored in the battery."}, {"label": "D", "body": "Molten salt allows a freeze-thaw battery to retain 92% of its charge after twelve weeks."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence specifies how the salt in a freeze-thaw battery enables energy storage, explaining that energy stops
flowing and can be stored when the salt solidifies at room temperature.
Choice A is incorrect. The sentence explains some properties of molten salt; it doesn’t specify how that salt enables energy storage. Choice B is
incorrect. The sentence indicates how the energy in a freeze-thaw battery can be released; it doesn’t specify how the salt in the battery enables
energy storage. Choice D is incorrect. The sentence specifies how much charge the freeze-thaw battery retains when storing energy; it doesn’t
specify how the salt in the battery enables energy storage.$qb$);
select seed_pool_question($qb$CB-221ecf0f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Alexander Lawrence Posey (1873–1908) varied his focus and tone depending on the genre in which he was writing. In his poetry, he used
heartfelt language to evoke the beauty and peacefulness of his natural surroundings; in his journalism, ______ he employed humor and satire to
comment on political issues affecting his Muskogee Creek community.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "that is,"}, {"label": "B", "body": "granted,"}, {"label": "C", "body": "similarly,"}, {"label": "D", "body": "by contrast,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This sentence compares two examples of Posey’s tone: the “heartfelt language” he used in his poetry versus the
“humor and satire” he used in his journalism. We know from these descriptions and from the claim in the previous sentence that the two tones
are very different from each other. So the transition “by contrast” fits the context perfectly.
Choice A is incorrect. This choice uses a transition that indicates a restatement of the same idea in other words. But the text isn’t restating the
first example here. Instead, it’s offering a second, totally different example. Choice B is incorrect. This choice uses a transition that means
“admittedly.” But the text isn’t admitting or conceding anything here. Instead, these two examples work together to support the claim made in the
first sentence. Choice C is incorrect. This choice uses a transition that indicates the addition of an agreeing idea. But these two examples are
intentionally very different from each other, so “similarly” doesn’t make sense here.$qb$);
select seed_pool_question($qb$CB-a4366255$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Musicians around the world have used protest songs to raise awareness about human rights violations.
· US folk singer Aunt Molly Jackson released the protest song “Poor Miner’s Farewell” in 1932.
? It exposed the unlivable wages and dangerous working conditions coal miners faced in Kentucky during the 1920s and 1930s.
? South African singer-songwriter Hugh Masekela released the protest song “Bring Him Back Home” in 1987.
? It called on the South African government to free Nelson Mandela, an anti-apartheid leader who’d been unjustly imprisoned.
The student wants to contrast the song “Poor Miner’s Farewell” with the song “Bring Him Back Home.” Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a4366255.png$qb$, $qb$[{"label": "A", "body": "The songs “Poor Miner’s Farewell” and “Bring Him Back Home” both raised awareness about human rights violations."}, {"label": "B", "body": "While both are protest songs, “Poor Miner’s Farewell” is about coal miners in Kentucky, whereas “Bring Him Back Home” is about the anti- apartheid leader Nelson Mandela."}, {"label": "C", "body": "Hugh Masekela’s song “Bring Him Back Home,” released in 1987, called on the South African government to free Nelson Mandela."}, {"label": "D", "body": "Released in 1932 by Aunt Molly Jackson, the song “Poor Miner’s Farewell” was a protest against the unlivable wages and dangerous working conditions faced by Kentucky coal miners."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence contrasts the two songs, noting that "Poor Miner’s Farewell" is about coal miners in Kentucky, whereas
"Bring Him Back Home" is about Nelson Mandela.
Choice A is incorrect. The sentence emphasizes a similarity between "Poor Miner’s Farewell" and "Bring Him Back Home"; it doesn’t contrast the
two songs. Choice C is incorrect. While the sentence provides a description of the song "Bring Him Back Home," it doesn’t mention "Poor Miner’s
Farewell" or contrast the two songs. Choice D is incorrect. While the sentence provides a description of the song "Poor Miner’s Farewell," it
doesn’t mention "Bring Him Back Home" or contrast the two songs.$qb$);
select seed_pool_question($qb$CB-296801d2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Azores is a group of islands about 870 miles off the coast of Portugal.
· Historians have long believed that in the fifteenth century Portuguese mariners were the first humans to populate the Azores.
? A 2015 study coauthored by Sofia Gabriel and Maria da Luz Mathias found that Vikings from Scandinavia may have populated the Azores
as early as the ninth century.
? The researchers found a genetic connection between house mice in the Azores and house mice in Scandinavia.
? House mice may have traveled from Scandinavia to the Azores on Viking ships.
The student wants to specify who may have first populated the Azores, according to the 2015 study. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-296801d2.png$qb$, $qb$[{"label": "A", "body": "Historians have long believed that the first humans to populate the Azores, a group of islands about 870 miles off the coast of Portugal, arrived in the fifteenth century."}, {"label": "B", "body": "Portuguese mariners may not have been the first humans to populate the Azores."}, {"label": "C", "body": "In their 2015 study, the researchers found a genetic connection between house mice in the Azores and those in Scandinavia."}, {"label": "D", "body": "According to a 2015 study, the first humans to populate the Azores may have been Vikings from Scandinavia, not mariners from Portugal as previously believed."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This choice effectively specifies who may have first populated the Azores, according to the 2015 study: the Vikings.
Choice A is incorrect. This choice doesn’t effectively specify who may have first populated the Azores, according to the 2015 study. It only
mentions the historical belief that the Portuguese were first. The 2015 study drew a different conclusion. Choice B is incorrect. This choice casts
doubt on the Portuguese claim but doesn’t name the group of people who may have arrived before the Portuguese. Choice C is incorrect. This
choice mentions the evidence that the researchers found but not the conclusion they drew from it. It doesn’t name the possible group of people
who may have arrived before the Portuguese.$qb$);
select seed_pool_question($qb$CB-92fe0ed7$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Geoscientists have long considered Hawaii’s Mauna Loa volcano to be Earth’s largest shield volcano by volume, measuring approximately 74,000
cubic kilometers. ______ according to a 2020 study by local geoscientist Michael Garcia, Hawaii’s Pūhāhonu shield volcano is significantly larger,
boasting a volume of about 148,000 cubic kilometers.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Secondly,"}, {"label": "B", "body": "Consequently,"}, {"label": "C", "body": "Moreover,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “However” logically signals that this sentence, which indicates that the Pūhāhonu volcano may be larger than the
Mauna Loa volcano, offers a contrast to or refutation of the previous assumption that Mauna Loa is the largest shield volcano.
Choice A is incorrect because “secondly” illogically signals that this sentence merely offers an additional or secondary point concerning the
previous assumption that Mauna Loa is the largest shield volcano. Instead, the sentence offers a contrast to or refutation of that assumption.
Choice B is incorrect because “consequently” illogically signals that this sentence offers a result or consequence of the previous assumption
that Mauna Loa is the largest shield volcano. Instead, the sentence offers a contrast to or refutation of that assumption. Choice C is incorrect
because “moreover” illogically signals that this sentence merely adds to the previous assumption that Mauna Loa is the largest shield volcano.
Instead, the sentence offers a contrast to or refutation of that assumption.$qb$);
select seed_pool_question($qb$CB-a965c6ed$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A turtle shell appears external to the animal, protecting its body like armor. ______ the shell is often incorrectly assumed to be an exoskeleton, a
rigid outer casing like that of a crustacean or an insect, when in fact it is an endoskeleton, a part of the turtle’s internal bone structure, more akin
to a spine or a pair of ribs.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "That being said,"}, {"label": "B", "body": "However,"}, {"label": "C", "body": "For instance,"}, {"label": "D", "body": "Hence,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Hence" logically signals that the information in this sentence about turtle shells—that people incorrectly assume
they are exoskeletons—is a consequence of the shells appearing external to the animal.
Choice A is incorrect because "that being said" illogically signals that this sentence qualifies or contrasts with the previous information about
turtle shells appearing external to the animal. Instead, it presents a consequence of that information. Choice B is incorrect because "however"
illogically signals that this sentence contrasts with the previous information about turtle shells appearing external to the animal. Instead, it
presents a consequence of that information. Choice C is incorrect because "for instance" illogically signals that this sentence provides an
example supporting the previous information about turtle shells appearing external to the animal. Instead, it presents a consequence of that
information.$qb$);
select seed_pool_question($qb$CB-97e2e364$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Okot p’Bitek’s poem Song of Lawino (1966) explores postcolonial Ugandan life through the eyes of a woman living in a rural village. With its
vibrant imagery, bitingly satiric tone, and dexterous use of traditional Acholi song and phraseology, the poem inspired a generation of East
African writers. ______ those who adopted its style are often referred to as Okot School poets.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Nevertheless,"}, {"label": "B", "body": "Fittingly,"}, {"label": "C", "body": "By comparison,"}, {"label": "D", "body": "Instead,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Fittingly” is a transition that means “appropriately” or “suitably,” and it is appropriate that writers who adopted their
style from Okot p’Bitek would be known as the Okot School poets.
Choice A is incorrect. This choice uses a disagreement transition. But this sentence is not disagreeing with anything—rather, it’s discussing how
it makes sense for those writers who adopted Okot’s style to be known as the Okot School poets. Choice C is incorrect. This choice uses a
transition that compares two ideas. But this sentence is not comparing the Okot School poets and their style to Okot’s style. Choice D is
incorrect. This choice uses a disagreement transition. But this sentence is not disagreeing with anything—rather, it’s discussing how it makes
sense for those writers who adopted Okot’s style to be known as the Okot School poets.$qb$);
select seed_pool_question($qb$CB-7d5c32e6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The fifth Solvay Conference on Physics was held in 1927.
· It brought together twenty-nine of the era’s preeminent scientists to discuss the emerging field of quantum theory.
? The conference famously featured a debate between physicists Albert Einstein and Niels Bohr.
· Bohr proposed that subatomic entities like electrons had only probable realities until they were observed.
? Einstein argued that subatomic entities like electrons had a reality independent of observation.
? Bohr’s position, later called the Copenhagen interpretation, remains the most widely accepted theory of quantum mechanics.
The student wants to place Einstein’s argument within its historical context. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7d5c32e6.png$qb$, $qb$[{"label": "A", "body": "During the dawn of quantum theory, Einstein maintained the independent reality of some subatomic entities, although Bohr’s opposing interpretation would become the widely accepted view."}, {"label": "B", "body": "At the 1927 Solvay Conference on Physics, Einstein disagreed with Bohr’s argument that subatomic entities like electrons had a reality independent of observation."}, {"label": "C", "body": "The attendees of the 1927 Solvay Conference were among the preeminent scientists of their era, including Einstein, who opposed Bohr’s proposal."}, {"label": "D", "body": "In 1927, Einstein and Bohr engaged in a famous debate; Bohr’s argument, later called the Copenhagen interpretation, would remain popular decades after."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence places Einstein’s argument within the historical context of the development of quantum theory, noting
that his argument—made during the dawn of the field—conflicted with Bohr’s argument, which became the widely accepted view.
Choice B is incorrect. The sentence misrepresents information from the notes, attributing the argument that electrons had a reality independent
of observation to Bohr, not Einstein. In addition, while the sentence provides the date of the conference, it doesn’t place Einstein’s argument in the
context of the development of quantum theory. Choice C is incorrect. The sentence indicates that Einstein attended the 1927 Solvay Conference;
it doesn’t identify Einstein’s argument or place it in the historical context of the development of quantum theory. Choice D is incorrect. The
sentence explains that Einstein and Bohr had a famous debate in 1927 and that Bohr’s argument remained popular decades afterward; it doesn’t
identify Einstein’s argument or place it in the context of the development of quantum theory.$qb$);
select seed_pool_question($qb$CB-01c8c433$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Before the 1847 introduction of the US postage stamp, the cost of postage was usually paid by the recipient of a letter rather than the sender,
and recipients were not always able or willing to pay promptly. ______ collecting this fee could be slow and arduous, and heaps of unpaid-for,
undeliverable mail piled up in post offices.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Regardless,"}, {"label": "B", "body": "On the contrary,"}, {"label": "C", "body": "Consequently,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Consequently” logically signals that the postal problems described in this sentence (slow fee collection, heaps of
undeliverable mail) were a consequence of the fee system described in the previous sentence.
Choice A is incorrect because “regardless” illogically signals that the postal problems described in this sentence occurred despite the fee system
described in the previous sentence. Instead, they were a consequence of that system. Choice B is incorrect because “on the contrary” illogically
signals that the postal problems described in this sentence contrast with the fee system described in the previous sentence. Instead, they were a
consequence of that system. Choice D is incorrect because “for example” illogically signals that the postal problems described in this sentence
are an example of the fee system described in the previous sentence. Instead, they were a consequence of that system.$qb$);
select seed_pool_question($qb$CB-883493d5$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Allan Houser was a Chiricahua Warm Springs Apache sculptor, illustrator, and painter.
· Many of his sculptures featured Native American figures.
? He depicted this subject matter using abstract, modernist forms, developing a distinctive style that influenced many other artists.
? His well-known sculpture Sacred Rain Arrow was pictured on the State of Oklahoma license plate.
The student wants to describe the distinctive style of Houser’s sculptures. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-883493d5.png$qb$, $qb$[{"label": "A", "body": "A sculptor, illustrator, and painter, Houser developed a distinctive style for portraying Native American figures."}, {"label": "B", "body": "Houser’s sculptures employ abstract, modernist forms to depict Native American figures."}, {"label": "C", "body": "Many other artists have been influenced by the style of Houser’s sculptures."}, {"label": "D", "body": "The sculpture Sacred Rain Arrow is a well-known example of Houser’s style."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence describes the distinctive style of Houser’s sculptures, explaining that the sculptures use abstract,
modernist forms to depict Native American figures.
Choice A is incorrect. While the sentence indicates that Houser developed a distinctive style for portraying Native American figures, it doesn’t
describe this style. Choice C is incorrect. While the sentence states that other artists have been influenced by the style of Houser’s sculptures, it
doesn’t describe this style. Choice D is incorrect. While the sentence mentions the name of a sculpture that’s a well-known example of Houser’s
style, it doesn’t describe the sculpture’s style.$qb$);
select seed_pool_question($qb$CB-1e655377$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Denali National Park and Preserve is an important tourist destination in Alaska. Many visitors assume that its $15 entry fee is charged per
vehicle. ______ that fee is charged per person.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Consequently,"}, {"label": "B", "body": "Second,"}, {"label": "C", "body": "Moreover,"}, {"label": "D", "body": "Actually,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Actually” logically signals that the information in this sentence—that the entry fee is charged per person—corrects
the assumption described in the previous sentence that the fee is charged per vehicle.
Choice A is incorrect because “consequently” illogically signals that the fee being charged per person is a consequence of visitors assuming the
fee is charged per vehicle. Instead, the sentence corrects that assumption. Choice B is incorrect because “second” illogically signals that the fee
being charged per person is a second point in a series following the previous information about what visitors assume. Instead, the sentence
corrects that assumption. Choice C is incorrect because “moreover” illogically signals that the fee being charged per person is merely an
additional fact related to the previous information about what visitors assume. Instead, the sentence corrects that assumption.$qb$);
select seed_pool_question($qb$CB-b88dad9d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Al-Andalus, the historical region of the Iberian Peninsula that includes most of modern-day Spain, was ruled by various Arabic-speaking Muslim
states between the eighth and fifteenth centuries. ______ many Arabic words, such as “alacrán”—meaning “scorpion”—made their way into the
Spanish language.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "Consequently,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Consequently” logically signals that the information in this sentence—that many Arabic words entered the Spanish
language—is a result or consequence of the previous information about Arabic-speaking Muslim states ruling Al-Andalus for centuries.
Choice A is incorrect because “for example” illogically signals that the information about Arabic words entering Spanish exemplifies the Arabic-
speaking history of Al-Andalus mentioned in the previous sentence. Instead, Arabic words entering Spanish is a consequence of that history.
Choice B is incorrect because “instead” illogically signals that the information about Arabic words entering Spanish provides an alternative to the
Arabic-speaking history of Al-Andalus mentioned in the previous sentence. The information about Arabic words entering Spanish is a
consequence of that history. Choice C is incorrect because “specifically” illogically signals that the information about Arabic words entering
Spanish provides specific details elaborating on the Arabic-speaking history of Al-Andalus mentioned in the previous sentence. Instead, Arabic
words entering Spanish is a consequence of that history.$qb$);
select seed_pool_question($qb$CB-b07a7634$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Digital Light Synthesis (DLS) is a form of additive manufacturing that utilizes light to rapidly cure liquid resin into high-quality, 3D objects.
· Step 1: Ultraviolet (UV) light images are projected up into a pool of liquid resin, where the object’s first layer takes shape.
? Step 2: The partially cured resin object is raised, leaving a thin space (a “dead zone”) beneath it for oxygen and liquid resin to flow
through.
? Step 3: The UV light passes through the dead zone—maintaining the flow of resin—and partially cures additional layers of the object.
? Step 4: When the resin object is complete, it is baked in an oven to complete the curing.
The student wants to describe how DLS cures 3D objects. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b07a7634.png$qb$, $qb$[{"label": "A", "body": "DLS is a form of additive manufacturing that creates a “dead zone” in which UV light solidifies layer by layer before being baked in an oven, creating a high-quality, 3D object."}, {"label": "B", "body": "DLS cures 3D objects by passing through a “dead zone,” adding layers to the object, then curing the object in an oven."}, {"label": "C", "body": "In DLS, UV light images are projected into a liquid resin pool to cure a 3D object layer by layer; once solidified, the object is baked in an oven."}, {"label": "D", "body": "In DLS, UV light is projected into layers of liquid resin until the resin solidifies and passes through a “dead zone,” wherein the curing is completed."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence describes how DLS cures 3D objects, noting that UV light is projected into resin to cure the object in
layers, after which the object is baked to complete the curing process.
Choice A is incorrect. While the sentence does describe some elements of the curing process, the description misrepresents information in the
notes; this sentence suggests that the UV light, rather than the 3D object, is baked in an oven. Choice B is incorrect. While the sentence does
describe some elements of the curing process, the description misrepresents information in the notes: the UV light, not DLS, passes through the
dead zone. Choice D is incorrect. While the sentence does describe some elements of the curing process, the description misrepresents
information in the notes. This sentence suggests that curing is complete when the already-solidified resin passes through the dead zone; rather,
liquid resin passes through the dead zone and is solidified in layers, after which curing is completed in the oven.$qb$);
select seed_pool_question($qb$CB-539abc58$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Ukiyo-e woodblock prints were a popular artistic form in Japan from the 1600s through the 1800s.
? Ukiyo-e prints were produced by teams of artisans that included artists, wood-carvers, printers, and publishers.
· Sōsaku-hanga was a popular Japanese printmaking movement that emerged in the early 1900s.
? Sōsaku-hanga prioritized individual artistic expression.
· An artist working in this style typically handled all aspects of print creation, from drawing to wood carving to printing.
The student wants to contrast ukiyo-e and sōsaku-hanga production methods. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-539abc58.png$qb$, $qb$[{"label": "A", "body": "One notable distinction between ukiyo-e and sōsaku-hanga prints is sōsaku-hanga’s emphasis on individual artistic expression."}, {"label": "B", "body": "Ukiyo-e prints were popular in Japan from the 1600s through the 1800s, while sōsaku-hanga prints emerged later, in the early 1900s."}, {"label": "C", "body": "Teams of artisans produced ukiyo-e prints, whereas individual artists typically handled all aspects of sōsaku-hanga printmaking themselves."}, {"label": "D", "body": "In contrast to ukiyo-e prints, sōsaku-hanga prints were produced using methods such as drawing and wood carving."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence contrasts the two production methods, noting that ukiyo-e prints are produced by teams of artisans,
whereas sōsaku-hanga prints are typically produced by an individual artist.
Choice A is incorrect. The sentence indicates a difference between the two styles, noting that sōsaku-hanga emphasizes individual artistic
expression, but it doesn’t provide sufficient information about ukiyo-e prints to contrast the two styles’ production methods. Choice B is
incorrect. The sentence contrasts when the two styles were popular; it doesn’t contrast their production methods. Choice D is incorrect. The
sentence mischaracterizes information from the notes: both styles include drawing and wood carving in their production, not just sōsaku-hanga.$qb$);
select seed_pool_question($qb$CB-db8fe023$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A potter choosing which type of clay to use for a piece considers two key factors: the desired look of the piece and its intended use. ______
earthenware clay is often used for decorative pieces because of its rustic look. This type of clay is not often used in industrial settings, though,
because it is less durable than other clays.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "Regardless,"}, {"label": "C", "body": "In conclusion,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The previous sentence tells us that potters think about the look and use of a piece when selecting clay. This
sentence provides a specific example of a type of clay selected for its appearance, so the transition "for example" fits perfectly.
Choice A is incorrect. This choice uses a transition that indicates a restatement of the same idea. But this sentence does more than just restate
the previous idea. Instead, it provides a more specific example of the idea presented in the first sentence. Choice B is incorrect. This choice uses
a disagreement transition. But this sentence actually agrees with the previous sentence. Both sentences suggest that desired look plays a role in
the selection of clay types for pottery pieces. Choice C is incorrect. This choice uses a concluding transition. But this sentence doesn’t sum up
the previous sentence. Instead, it gives a specific example of the idea presented in the previous sentence.$qb$);
select seed_pool_question($qb$CB-04ad68ca$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In Gothic architecture, flying buttresses are large arches that help support a building’s exterior walls. Before the Gothic era, cathedrals’ heavy
ceilings had to be supported by thick, short walls, but the invention of flying buttresses eliminated this need. ______ Gothic cathedrals could be
built with thinner, higher walls.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "For instance,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "As a result,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “As a result” logically signals that the thinner, higher walls in this sentence were a result of the invention of flying
buttresses in the previous sentence.
Choice A is incorrect because “similarly” illogically signals that the thinner, higher walls in this sentence are similar to the invention of flying
buttresses in the previous sentence. Instead, the walls were a result of that invention. Choice B is incorrect because “for instance” illogically
signals that the thinner, higher walls in this sentence are an example supporting the statement about the invention of flying buttresses in the
previous sentence. Instead, the walls were a result of that invention. Choice C is incorrect because “nevertheless” illogically signals that the
thinner, higher walls in this sentence occurred despite the invention of flying buttresses in the previous sentence. Instead, the walls were a result
of that invention.$qb$);
select seed_pool_question($qb$CB-fc2bcc79$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Tyrian purple was a highly prized dye among the Phoenicians (an ancient civilization located in present-day Lebanon). The Phoenicians were
famous for using this natural dye to color their clothes a distinctive purple. ______ the name “Phoenicia” itself, some historians claim, may have
originally meant “land of purple.”
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In fact,"}, {"label": "B", "body": "Regardless,"}, {"label": "C", "body": "Lastly,"}, {"label": "D", "body": "On the contrary,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “In fact” logically signals that the claim in this sentence—Phoenicia being named after the color purple—emphasizes
and supports the previous claim that Phoenicians were famous for using purple dye.
Choice B is incorrect because “regardless” illogically signals that the claim about Phoenicia’s name contrasts with the previous claim that
Phoenicians were famous for using purple dye. Instead, the naming emphasizes and supports this claim. Choice C is incorrect because “lastly”
illogically signals that the claim about Phoenicia’s name is the final step in a process or sequence. Instead, the naming emphasizes and supports
the previous claim that Phoenicians were famous for using purple dye. Choice D is incorrect because “on the contrary” illogically signals that the
claim about Phoenicia’s name directly opposes the previous claim that Phoenicians were famous for using purple dye. Instead, the naming
emphasizes and supports this claim.$qb$);
select seed_pool_question($qb$CB-f735493e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Celebrated Tewa potter Maria Martinez (1887–1980) made her signature all-black ceramic vessels using a heating technique called reduction
firing. This technique involves smothering the flame surrounding the clay vessel. ______ the vessel takes on a shiny, black hue.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "On the contrary,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "Previously,"}, {"label": "D", "body": "As a result,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "As a result" logically signals that the information in this sentence—the vessel turning black—is a result of the
heating technique discussed in the previous sentence.
Choice A is incorrect because "on the contrary" illogically signals that the information in this sentence directly opposes the heating technique in
the previous sentence. Instead, the vessel turns black as a result of that technique. Choice B is incorrect because "for example" illogically signals
that the information in this sentence is an example of the heating technique in the previous sentence. Instead, the vessel turns black as a result
of that technique. Choice C is incorrect because "previously" illogically signals that the information in this sentence occurs earlier in a
chronological series of events than does the heating technique discussed in the first two sentences. Instead, the vessel turns black as a result of
that technique.$qb$);
select seed_pool_question($qb$CB-57bcd0d6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Etched into Peru’s Nazca Desert are line drawings so large that they can only be fully seen from high above. Archaeologists have known of the
lines since the 1920s, when a researcher spotted some from a nearby foothill, and they have been studying the markings ever since. ______
archaeologists’ efforts are aided by drones that capture high-resolution aerial photographs of the lines.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Currently,"}, {"label": "B", "body": "In comparison,"}, {"label": "C", "body": "Still,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Currently” logically signals that the archaeologists’ use of drones (a current technology) to photograph the lines is
the present-day continuation of the ongoing archaeological research described in the previous sentence.
Choice B is incorrect because “in comparison” illogically signals that the action described in this sentence offers a comparison to the ongoing
archaeological research described in the previous sentence. Instead, the use of drones is the present-day continuation of that research. Choice C
is incorrect because “still” illogically signals that the action described in this sentence occurs despite the ongoing archaeological research
described in the previous sentence. Instead, the use of drones is the present-day continuation of that research. Choice D is incorrect because
“however” illogically signals that the action described in this sentence occurs either despite or in contrast to the ongoing archaeological research
described in the previous sentence. Instead, the use of drones is the present-day continuation of that research.$qb$);
select seed_pool_question($qb$CB-11df9b99$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Because an achiral molecule is symmetrical, flipping it yields a structurally identical molecule. A flipped chiral molecule, ______ can be compared
to a glove that has been turned inside out: it produces a structurally inverted molecule rather than an identical one.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in other words,"}, {"label": "B", "body": "by contrast,"}, {"label": "C", "body": "for example,"}, {"label": "D", "body": "similarly,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. This sentence compares a chiral molecule to an achiral one. It discusses how when a chiral molecule is flipped, it
results in something very different than when an achiral molecule is flipped. So the transition "by contrast" fits the context perfectly.
Choice A is incorrect. This choice uses a transition that indicates a restatement of the same idea in different words. But this sentence doesn’t
restate the same idea as the previous sentence. Instead, it makes a new point about a different type of molecule (chiral instead of achiral).
Choice C is incorrect. This choice uses a transition that introduces an example, which doesn’t make sense here. The second sentence isn’t an
example of the first sentence’s claim about achiral molecules: it actually introduces an entirely different idea that focuses on chiral molecules.
Choice D is incorrect. This choice uses a transition that indicates the addition of an agreeing idea. But this sentence shows a contrast with the
first sentence—namely, that a chiral molecule acts very differently from an achiral molecule when flipped.$qb$);
select seed_pool_question($qb$CB-3fa48bf3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? British scholar Robert Plot described fossilized dinosaur bones in his 1676 book The Natural History of Oxfordshire.
· Plot earned a reputation for being the first person to have discovered dinosaur remains.
? In 1990, archaeologists in Lesotho, in southern Africa, discovered a fossilized phalanx of a Massospondylus carinatus dinosaur in a cave
once inhabited by humans.
? Indigenous Khoesan and Basotho peoples had inhabited the cave beginning around 1100 CE.
? According to paleontologist Julien Benoit, these peoples may have found the phalanx and brought it to the cave centuries before Plot’s
descriptions.
The student wants to emphasize the significance of the 1990 discovery to Plot’s reputation. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3fa48bf3.png$qb$, $qb$[{"label": "A", "body": "Benoit challenged Plot’s reputation for being the first person to have discovered M. carinatus remains."}, {"label": "B", "body": "Evidence that Khoesan and Basotho peoples may have found an M. carinatus phalanx as long ago as 1100 CE suggests that Plot may not have been the first person to have discovered dinosaur remains."}, {"label": "C", "body": "According to Benoit’s analysis of the 1990 discovery, Indigenous peoples in southern Africa may have brought the fossilized phalanx to the cave as long ago as 1100 CE."}, {"label": "D", "body": "In 1990, more than three centuries after Plot claimed in his book that he had found fossilized dinosaur bones, archaeologists uncovered evidence in southern Africa that disproved his claims."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. Noting that the evidence suggests Indigenous peoples may have found dinosaur remains in 1100 CE, the sentence
emphasizes how the 1990 discovery challenged Plot’s reputation as the first person to discover dinosaur remains.
Choice A is incorrect. While the sentence does emphasize that Benoit challenged Plot’s reputation, it misrepresents information in the notes; Plot
was reputed to be the first person to discover dinosaur remains in general, not the first person to discover M. carinatus remains specifically.
Choice C is incorrect. The sentence only partially explains the significance of the 1990 discovery, noting that it suggests Indigenous people
brought dinosaur remains to the cave in 1100 CE; it doesn’t explain the discovery’s significance to Plot’s reputation. Choice D is incorrect. While
the sentence does emphasize that the discovery challenged Plot’s reputation, it misrepresents information in the notes. The notes don’t indicate
that the 1990 discovery cast any doubt on Plot’s claims to have found fossilized dinosaur bones; rather, the discovery challenged Plot’s
reputation for being the first to discover dinosaur bones.$qb$);
select seed_pool_question($qb$CB-2bf05ae9$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In the midst of the US Civil War, Susie Taylor escaped slavery and fled to Union-army-occupied St. Simons Island off the Georgia coast.
· She began working for an all-Black army regiment as a nurse and teacher.
? In 1902, she published a book about the time she spent with the regiment.
? Her book was the only Civil War memoir to be published by a Black woman.
? It is still available to readers in print and online.
The student wants to emphasize the uniqueness of Taylor’s accomplishment. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2bf05ae9.png$qb$, $qb$[{"label": "A", "body": "Taylor fled to St. Simons Island, which was then occupied by the Union army, for whom she began working."}, {"label": "B", "body": "After escaping slavery, Taylor began working for an all-Black army regiment as a nurse and teacher."}, {"label": "C", "body": "The book Taylor wrote about the time she spent with the regiment is still available to readers in print and online."}, {"label": "D", "body": "Taylor was the only Black woman to publish a Civil War memoir."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. By indicating that Taylor’s book was the only Civil War memoir published by a Black woman, this sentence
emphasizes the uniqueness, or one-of-a-kind nature, of Taylor’s accomplishment.
Choice A is incorrect. While the sentence describes some of Taylor’s accomplishments, it doesn’t emphasize the uniqueness of them. Choice B
is incorrect. While the sentence describes some of Taylor’s accomplishments, it doesn’t emphasize that they were unique. Choice C is incorrect.
While the sentence provides information about Taylor’s book, it doesn’t emphasize what made the book unique.$qb$);
select seed_pool_question($qb$CB-335bbe3e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In his painting At the Cycle-Race Track, Jean Metzinger aims to depict a bike race in four-dimensional space. Of course, Metzinger’s painting
doesn’t technically represent a fourth dimension; humans can only see in three dimensions. ______ by depicting the race through multiple,
simultaneous perspectives, Metzinger offers a fascinating glimpse at what this other universe might look like.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Moreover,"}, {"label": "B", "body": "That said,"}, {"label": "C", "body": "In other words,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "That said" logically signals that the statement in this sentence—that Metzinger offers a glimpse of four-dimensional
space by depicting multiple, simultaneous perspectives—is true despite the point in the previous sentence (that Metzinger’s painting doesn’t
technically represent a fourth dimension because humans can only see in three dimensions).
Choice A is incorrect because "moreover" illogically signals that the information in this sentence merely adds to the previous point about
Metzinger’s painting. Instead, it provides information that is true despite that previous point. Choice C is incorrect because "in other words"
illogically signals that the information in this sentence is a paraphrase or restatement of the previous point about Metzinger’s painting. Instead, it
provides information that is true despite that previous point. Choice D is incorrect because "for example" illogically signals that the information in
this sentence provides an example that supports the previous point about Metzinger’s painting. Instead, it provides information that is true
despite that previous point.$qb$);
select seed_pool_question($qb$CB-827afb27$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Most conifers (trees belonging to the phylum Coniferophyta) are evergreen. That is, they keep their green leaves or needles year-round. However,
not all conifer species are evergreen. Larch trees, ______ lose their needles every fall.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "for instance,"}, {"label": "B", "body": "nevertheless,"}, {"label": "C", "body": "meanwhile,"}, {"label": "D", "body": "in addition,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “For instance” logically signals that the information in this sentence—that larch trees lose their needles every fall—is
an example supporting the claim in the previous sentence (that not all conifer species keep their leaves or needles year-round).
Choice B is incorrect because “nevertheless” illogically signals that the information in this sentence is true in spite of the claim about conifer
species in the previous sentence. Instead, it’s an example supporting that claim. Choice C is incorrect because “meanwhile” illogically signals
that the information in this sentence is separate from (while occurring simultaneously with) the claim about conifer species in the previous
sentence. Instead, it’s an example supporting that claim. Choice D is incorrect because “in addition” illogically signals that the information in this
sentence is merely an additional fact related to the claim about conifer species in the previous sentence. Instead, it’s an example supporting that
claim.$qb$);
select seed_pool_question($qb$CB-e876e395$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The melting rate of glaciers varies based on air temperature.
· In the warm summer months, massive glaciers on the coast of Greenland melt into the surrounding water.
? The melting glaciers contribute to rising sea levels each summer.
? Huge icebergs also break off Greenland’s glaciers into the water and melt.
? In 2017, geoscientist Twila Moon found that the iceberg melting rate depends not on air temperature but on water temperature.
? Because water temperature is consistent, melting icebergs contribute to rising sea levels all year.
The student wants to emphasize a similarity between glaciers and icebergs in Greenland. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e876e395.png$qb$, $qb$[{"label": "A", "body": "Because icebergs break off Greenland’s glaciers into the water, their melting rate depends on water temperature."}, {"label": "B", "body": "Greenland’s glaciers and icebergs both melt during the year, contributing to rising sea levels."}, {"label": "C", "body": "Geoscientist Twila Moon found that the melting rate of Greenland’s icebergs, unlike that of glaciers, does not depend on air temperature."}, {"label": "D", "body": "Glaciers on the coast of Greenland melt during the warm summer months into the surrounding water, the temperature of which remains consistent throughout the year."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence emphasizes a similarity between glaciers and icebergs in Greenland, noting that both melt and thereby
contribute to rising sea levels.
Choice A is incorrect. The sentence provides information about the melting rate of icebergs in Greenland; it doesn’t emphasize a similarity
between glaciers and icebergs in Greenland. Choice C is incorrect. The sentence emphasizes a difference between glaciers and icebergs in
Greenland, noting that their melting rates depend on different factors; it doesn’t emphasize a similarity. Choice D is incorrect. The sentence
explains the conditions under which glaciers in Greenland melt; it doesn’t emphasize a similarity between glaciers and icebergs in Greenland.$qb$);
select seed_pool_question($qb$CB-8fe4f4ab$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? One of history’s greatest libraries was the House of Wisdom in Baghdad, Iraq.
· It was founded in the eighth century with the goal of preserving all the world’s knowledge.
? Scholars at the House of Wisdom collected ancient and contemporary texts from Greece, India, and elsewhere and translated them into
Arabic.
? Writings included those of the Greek philosopher Aristotle and the Indian mathematician Aryabhata.
? The House of Wisdom used Chinese papermaking technology to create paper versions to be studied and shared.
The student wants to explain how the House of Wisdom preserved the world’s knowledge. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8fe4f4ab.png$qb$, $qb$[{"label": "A", "body": "The House of Wisdom was known for bringing together knowledge from around the world, including from Greece, India, and China."}, {"label": "B", "body": "Founded in Iraq in the eighth century, the House of Wisdom employed many scholars as translators."}, {"label": "C", "body": "Writings from the Greek philosopher Aristotle and the Indian mathematician Aryabhata were preserved at the House of Wisdom."}, {"label": "D", "body": "The House of Wisdom collected writings from different countries and created paper versions in Arabic to be studied and shared."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence explains how the House of Wisdom preserved the world’s knowledge, noting that the library collected,
translated, and printed writings from different countries.
Choice A is incorrect. While the sentence indicates that the House of Wisdom was known for bringing together knowledge from around the
world, it doesn’t explain how the library preserved this knowledge. Choice B is incorrect. The sentence makes a generalization about the scholars
who were employed by the House of Wisdom; it doesn’t explain how the library preserved the world’s knowledge. Choice C is incorrect. The
sentence identifies two authors whose writings were preserved at the House of Wisdom; it doesn’t explain how the library preserved the world’s
knowledge.$qb$);
select seed_pool_question($qb$CB-bb275f0d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Cities tend to have a wide range of flowering vegetation in parks, yards, and gardens.
· This vegetation provides a varied diet for honeybees, strengthening bees’ immune systems.
? On average, 62.5 percent of bees in an urban area will survive a harsh winter.
? Rural areas are often dominated by monoculture crops such as corn or wheat.
? On average, only 40 percent of honeybees in a rural area will survive a harsh winter.
The student wants to make and support a generalization about honeybees. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bb275f0d.png$qb$, $qb$[{"label": "A", "body": "Cities tend to have a wider range of flowering vegetation than do rural areas, which are often dominated by monoculture crops."}, {"label": "B", "body": "In urban areas, over 60 percent of honeybees, on average, will survive a harsh winter, whereas in rural areas, only 40 percent will."}, {"label": "C", "body": "The strength of honeybees’ immune systems depends on what the bees eat, and a varied diet is more available to bees in an urban area than to those in a rural area."}, {"label": "D", "body": "Honeybees are more likely to thrive in cities than in rural areas because the varied diet available in urban areas strengthens the bees’ immune systems."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer because the sentence makes and supports a generalization about honeybees. It claims that honeybees living in
urban areas are more likely to thrive than rural bees, and it supports the claim with information about the effect of a varied diet on urban bees’
immune systems.
Choice A is incorrect. While the sentence makes a generalization, it doesn’t mention honeybees. Choice B is incorrect. While the sentence
provides data about honeybee survival, it doesn’t make a generalization about honeybees based on this information. Choice C is incorrect. While
the sentence makes a generalization about honeybees’ diets and immune systems, it doesn’t provide adequate support for this generalization.$qb$);
select seed_pool_question($qb$CB-30438650$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Jhumpa Lahiri’s story collection Interpreter of Maladies features multiple stories about romantic relationships. In “This Blessed House,”
newlyweds argue over whether to replace items left by the previous owners of their new home. ______ in “A Temporary Matter,” a husband and
wife attempt to rekindle their relationship during a four-night blackout.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Granted,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "Likewise,"}, {"label": "D", "body": "Hence,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "Likewise" is a transition that indicates the addition of a new but related idea. In this sentence, the author is
providing another similar example to that discussed in the previous sentence. Therefore, "likewise" works best in this context.
Choice A is incorrect. This choice uses a transition that means "admittedly." But the text isn’t admitting or conceding anything here. Instead,
these two examples work together to support the claim made in the first sentence. Choice B is incorrect. This choice uses an exemplification
transition, which doesn’t make sense here. The second story is not an example of the story in the previous sentence—it’s another, similar story.
And while both stories exemplify the first sentence in the text, the transition we’re looking for isn’t actually connected to that sentence. Choice D
is incorrect. This choice uses a cause-and-effect transition, which doesn’t make sense here. The first story didn’t result in the events of the
second story.$qb$);
select seed_pool_question($qb$CB-a773f069$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Small, flat structures called spatulae are found at the tips of the hairs on a spider’s leg. These spatulae temporarily bond with the atoms of
whatever they touch. ______ spiders are able to cling to and climb almost any surface.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For instance,"}, {"label": "B", "body": "However,"}, {"label": "C", "body": "Similarly,"}, {"label": "D", "body": "As a result,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “As a result” logically signals that the claim in this sentence—that spiders can cling to and climb almost any surface
—is because of the previous information about the bonding properties of spiders’ spatulae.
Choice A is incorrect because “for instance” illogically signals that the claim in this sentence exemplifies the information in the previous
sentences. Instead, the claim is because of the previous information about the bonding properties of spiders’ spatulae. Choice B is incorrect
because “however” illogically signals that the claim in this sentence contrasts with the information in the previous sentences. Instead, the claim
is because of the previous information about the bonding properties of spiders’ spatulae. Choice C is incorrect because “similarly” illogically
signals that the claim in this sentence is similar to, but separate from, the information in the previous sentences. Instead, the claim is because of
the previous information about the bonding properties of spiders’ spatulae.$qb$);
select seed_pool_question($qb$CB-6249b173$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 2018 researchers Adwait Deshpande, Shreejata Gupta, and Anindya Sinha were observing wild macaques in India’s Bandipur National
Park.
? They saw macaques calling out to and gesturing at humans who were eating or carrying food.
? They designed a study to find out if the macaques were intentionally communicating to try to persuade the humans to share their food.
? In the study trials, macaques frequently called out to and gestured at humans holding food.
? In the study trials, macaques called out to and gestured at empty-handed humans less frequently.
The student wants to present the study’s results. Which choice most effectively uses relevant information from the notes to accomplish this
goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6249b173.png$qb$, $qb$[{"label": "A", "body": "Macaques in the study called out to and gestured more frequently at humans holding food than at empty-handed humans."}, {"label": "B", "body": "In 2018, researchers who had observed macaques in India’s Bandipur National Park calling out to and gesturing at humans designed a study."}, {"label": "C", "body": "The researchers hoped to find out if the macaques were intentionally communicating to try to persuade humans to share their food."}, {"label": "D", "body": "The researchers studied how macaques behaved around both humans holding food and empty-handed humans."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice presents the study’s results from the last two bullet points.
Choice B is incorrect. This choice describes the background and motivation of the study but not the outcome or findings. Choice C is incorrect.
This choice describes the research question or hypothesis of the study but not the evidence or conclusion. Choice D is incorrect. This choice
describes the method or design of the study but not the actual results.$qb$);
select seed_pool_question($qb$CB-1b219d14$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$As a young historian in the 1950s, Alixa Naff began interviewing fellow Arab American immigrants about their experiences straddling two
cultures. Over the next few decades, Naff conducted more than 450 such interviews, also known as oral histories. ______ she collected
photographs and other artifacts that represented her subjects’ experiences.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "On the contrary,"}, {"label": "C", "body": "In addition,"}, {"label": "D", "body": "Today,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "In addition" logically signals that Naff’s artifact collecting was separate from, and in addition to, her interviewing.
Choice A is incorrect because "in other words" illogically signals that the information about Naff’s artifact collecting restates the previous
information about her interviewing. Instead, Naff collected artifacts in addition to conducting interviews. Choice B is incorrect because "on the
contrary" illogically signals that Naff’s artifact collecting was contrary to her interviewing. Instead, Naff collected artifacts in addition to
conducting interviews. Choice D is incorrect because "today" illogically signals that Naff’s artifact collecting is occurring in the present day.
Instead, this activity occurred in the past, as indicated by the past tense verb "collected."$qb$);
select seed_pool_question($qb$CB-a3204ab0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Yellowstone is a national park in the northwest United States.
· In 1995, gray wolves were reintroduced into the park.
? Since then, the number of gray wolves in the park has stabilized at roughly 100.
? This number is believed to be the park’s carrying capacity.
? Carrying capacity describes the maximum number of a species that a specific environment’s resources can sustain over time.
The student wants to specify the number of gray wolves in Yellowstone. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a3204ab0.png$qb$, $qb$[{"label": "A", "body": "Gray wolves were reintroduced into Yellowstone, a national park in the northwest United States, in 1995."}, {"label": "B", "body": "As of 1995, there were gray wolves living in Yellowstone, a national park in the northwest United States."}, {"label": "C", "body": "The carrying capacity of an environment, such as Yellowstone, describes the maximum number of species that the environment can sustain over time."}, {"label": "D", "body": "Yellowstone is a national park that has roughly 100 gray wolves living in it."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This choice uses relevant information from the third bullet point to state the approximate number of gray wolves in
Yellowstone.
Choice A is incorrect. This choice mentions the year gray wolves in Yellowstone were reintroduced but not how many there are currently. Choice
B is incorrect. This choice mentions the year gray wolves in Yellowstone were reintroduced but not how many there are currently. Choice C is
incorrect. This choice defines the term carrying capacity but doesn’t connect it to the specific number of gray wolves currently living in
Yellowstone.$qb$);
select seed_pool_question($qb$CB-6a5939c2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Paleontologists once thought that early apes lived in tropical forests, but recent research suggests that they may have actually lived in savannas.
Tropical forests are humid and have many trees spaced close together. ______ savannas are drier, and their trees are spaced further apart.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For instance,"}, {"label": "B", "body": "In comparison,"}, {"label": "C", "body": "Firstly,"}, {"label": "D", "body": "In conclusion,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "In comparison" logically signals that the description of savannas in this sentence—that they are drier and their trees
are spaced further apart—forms a comparison with the description of tropical forests in the previous sentence.
Choice A is incorrect because "for instance" illogically signals that the description of savannas in this sentence exemplifies the description of
tropical forests in the previous sentence. Instead, this description forms a comparison with the description of tropical forests. Choice C is
incorrect because "firstly" illogically signals that the description of savannas in this sentence indicates the first in a series of things. Instead, this
description forms a comparison with the description of tropical forests in the previous sentence. Choice D is incorrect because "in conclusion"
illogically signals that the description of savannas in this sentence concludes or summarizes information in the previous sentences. Instead, this
description forms a comparison with the description of tropical forests in the previous sentence.$qb$);
select seed_pool_question($qb$CB-3b02e88a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The ancient Arab dhow was a sailing vessel distinguishable by its triangular sails and stitched hull construction.
· Dhows were used primarily for trade along the coasts of Arab, South Asian, and East African countries.
? Contemporary shipbuilders in Oman use a mix of modern and traditional materials to build replicas of ancient dhows.
? Most of the materials used are traditional.
? Replica hulls are stitched together using the same traditional coconut palm fiber rope used on the hulls of ancient dhows.
The student wants to make a generalization about the materials used in dhow replicas. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3b02e88a.png$qb$, $qb$[{"label": "A", "body": "A traditional material that was used to stitch together the hulls of ancient dhows, coconut palm fiber rope is still used by shipbuilders."}, {"label": "B", "body": "The ancient Arab dhow was a sailing vessel used primarily for trade and distinguishable by its triangular sails."}, {"label": "C", "body": "Although most materials used in dhow replicas are traditional, some modern materials are used."}, {"label": "D", "body": "Contemporary shipbuilders in Oman build replicas of the dhow, which was an ancient sailing vessel with a stitched hull construction."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence makes a generalization about the materials used in dhow replicas, noting that while some modern
materials are used, most of the materials are traditional.
Choice A is incorrect. The sentence provides an example of a traditional material used in ancient dhows; it doesn’t indicate that the material is
used in dhow replicas or make any other generalization about materials used in those replicas. Choice B is incorrect. The sentence explains what
an ancient dhow was; it doesn’t make a generalization about materials used to make dhow replicas. Choice D is incorrect. The sentence
introduces the construction of dhow replicas to an audience unfamiliar with the vessel; it doesn’t make a generalization about the materials used
in those replicas.$qb$);
select seed_pool_question($qb$CB-fd24f48f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Before California’s 1911 election to approve a proposition granting women the right to vote, activists across the state sold tea to promote the
cause of suffrage. In San Francisco, the Woman’s Suffrage Party sold Equality Tea at local fairs. ______ in Los Angeles, activist Nancy Tuttle Craig,
who ran one of California’s largest grocery store firms, distributed Votes for Women Tea.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "To conclude,"}, {"label": "C", "body": "Similarly,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Similarly” logically signals that the activity described in this sentence (Nancy Tuttle Craig distributing Votes for
Women Tea in her Los Angeles grocery stores) is like the activity described in the previous sentence (the Woman’s Suffrage Party selling Equality
Tea at fairs in San Francisco). Together, the two examples support the preceding claim that “activists across the state sold tea to promote the
cause of suffrage.”
Choice A is incorrect because “for example” illogically signals that the activity described in this sentence exemplifies the activity described in the
previous sentence. Instead, the two activities are similar, and both support the preceding claim about selling tea to promote women’s right to
vote. Choice B is incorrect because “to conclude” illogically signals that the activity described in this sentence concludes or summarizes the
information in the previous sentences. Instead, the activity is similar to the one described in the previous sentence, and both support the
preceding claim about selling tea to promote women’s right to vote. Choice D is incorrect because “in other words” illogically signals that the
activity described in this sentence paraphrases the activity described in the previous sentence. Instead, the two activities are similar, and both
support the preceding claim about selling tea to promote women’s right to vote.$qb$);
select seed_pool_question($qb$CB-bc930940$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Chiura Obata was a Japanese American artist who lived in California.
· Yosemite Falls is a notable painting by Obata.
? It uses a Japanese method of black ink painting called sumi-e.
? This painting was completed in 1930.
The student wants to indicate the year Yosemite Falls was completed. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bc930940.png$qb$, $qb$[{"label": "A", "body": "While living in California, Obata created black ink paintings."}, {"label": "B", "body": "Obata, a Japanese American artist, created a notable painting."}, {"label": "C", "body": "Yosemite Falls was completed in 1930."}, {"label": "D", "body": "Obata used a Japanese painting method called sumi-e."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence indicates the year Yosemite Falls was completed, stating that it was completed in 1930.
Choice A is incorrect. The sentence indicates where Obata created black ink paintings; it doesn’t indicate when the painting was completed.
Choice B is incorrect. While the sentence identifies Obata as an artist who created a notable painting, it doesn’t indicate when that painting was
completed. Choice D is incorrect. The sentence identifies the method Obata used; it doesn’t indicate when the painting was completed.$qb$);
select seed_pool_question($qb$CB-28c7a762$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$As the Proto-Indo-European language split into different languages, many words evolved to sound very different than they had in their proto-
language—but this wasn’t always the case. ______ words retained much of their original sound. The word “father,” for instance, sounds similar in
Italian (padre), Latin (pater), and Sanskrit (pitar), three Proto-Indo-European descendants.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "Moreover,"}, {"label": "C", "body": "Thus,"}, {"label": "D", "body": "Sometimes,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Sometimes” logically signals that the information in this sentence—that words retained much of their original
sound—describes an occasional exception, elaborating on the previous statement that the evolution of words to sound very different from their
proto-language origins “wasn’t always the case.”
Choice A is incorrect because “however” illogically signals that the information about words retaining much of their original sound contrasts with
the previous statement. Instead, the sentence describes an occasional exception, elaborating on the previous statement that the evolution of
words to sound very different from their proto-language origins “wasn’t always the case.” Choice B is incorrect because “moreover” illogically
signals that the information about words retaining much of their original sound merely adds to the previous statement. Instead, the sentence
describes an occasional exception, elaborating on the previous statement that the evolution of words to sound very different from their proto-
language origins “wasn’t always the case.” Choice C is incorrect because “thus” illogically signals that the information about words retaining
much of their original sound is a result or consequence of the previous statement. Instead, the sentence describes an occasional exception,
elaborating on the previous statement that the evolution of words to sound very different from their proto-language origins “wasn’t always the
case.”$qb$);
select seed_pool_question($qb$CB-c6645cab$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Dr. Sunil Bajpai studies dinosaurs at the Indian Institute of Technology.
· Bajpai’s research team recently found a 167-million-year-old dicraeosaurid fossil.
? It is the oldest fossil from the dicraeosaurid dinosaur group ever recovered.
? It was found in the Thar Desert in western India.
The student wants to indicate where the dicraeosaurid fossil was found. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c6645cab.png$qb$, $qb$[{"label": "A", "body": "The dicraeosaurid fossil was found in western India’s Thar Desert."}, {"label": "B", "body": "Bajpai’s team recently found the oldest dicraeosaurid fossil ever recovered."}, {"label": "C", "body": "Dr. Sunil Bajpai, of the Indian Institute of Technology, is part of a research team."}, {"label": "D", "body": "The fossil, which is from the dicraeosaurid dinosaur group, is 167 million years old."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence indicates where the dicraeosaurid fossil was found: western India’s Thar Desert.
Choice B is incorrect. The sentence states that Bajpai’s team discovered the dicraeosaurid fossil; it doesn’t specify where they found it. Choice C
is incorrect. The sentence provides information about Dr. Sunil Bajpai; it doesn’t indicate where the fossil was found. Choice D is incorrect. While
the sentence provides information about the fossil, it doesn’t indicate where the fossil was found.$qb$);
select seed_pool_question($qb$CB-1a8126aa$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 2019, researcher Patricia Jurado Gonzalez and food historian Nawal Nasrallah prepared a stew from a 4,000-year-old recipe found on a
Mesopotamian clay tablet. When they tasted the dish, known as pašrūtum (“unwinding”), they found that it had a mild taste and inspired a sense
of calm. ______ the researchers, knowing that dishes were sometimes named after their intended effects, theorized that the dish’s name,
“unwinding,” referred to its function: to help ancient diners relax.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Therefore,"}, {"label": "B", "body": "Alternately,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Likewise,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "Therefore" logically signals that the action described in this sentence—the researchers theorizing that the dish was
named for its effect on diners—is a result or consequence of the previous observation that the dish had a calming effect.
Choice B is incorrect because "alternately" illogically signals that the action described in this sentence offers an alternative or contrast to the
previous observation that the dish had a calming effect. Instead, the action is a result or consequence of that observation. Choice C is incorrect
because "nevertheless" illogically signals that the action described in this sentence occurs despite the previous observation that the dish had a
calming effect. Instead, the action is a result or consequence of that observation. Choice D is incorrect because "likewise" illogically signals that
this sentence merely adds a second, similar detail to the previous observation that the dish had a calming effect. Instead, this sentence
describes an action that is a result or consequence of that observation.$qb$);
select seed_pool_question($qb$CB-63a4fa29$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 2013, archaeologists studied cat bone fragments they had found in the ruins of Quanhucun, a Chinese farming village.
· The fragments were estimated to be 5,300 years old.
? A chemical analysis of the fragments revealed that the cats had consumed large amounts of grain.
? The grain consumption is evidence that the Quanhucun cats may have been domesticated.
The student wants to present the Quanhucun study and its conclusions. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-63a4fa29.png$qb$, $qb$[{"label": "A", "body": "As part of a 2013 study of cat domestication, a chemical analysis was conducted on cat bone fragments found in Quanhucun, China."}, {"label": "B", "body": "A 2013 analysis of cat bone fragments found in Quanhucun, China, suggests that cats there may have been domesticated 5,300 years ago."}, {"label": "C", "body": "In 2013, archaeologists studied what cats in Quanhucun, China, had eaten more than 5,000 years ago."}, {"label": "D", "body": "Cat bone fragments estimated to be 5,300 years old were found in Quanhucun, China, in 2013."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence presents the study, describing it as a 2013 analysis of Quanhucun cat bone fragments, and its
conclusions, indicating what the analysis suggests about cat domestication in Quanhucun.
Choice A is incorrect because the sentence focuses on the study’s methodology; it doesn’t present conclusions from the study. Choice C is
incorrect. While the sentence provides a general overview of the study, it doesn’t present conclusions from the study. Choice D is incorrect. The
sentence describes a finding from the study; it doesn’t present conclusions from the study.$qb$);
select seed_pool_question($qb$CB-42301836$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In her 2012 analysis of tree rings from Japan’s Yaku Island, cosmic ray physicist Fusa Miyake noted an anomalous carbon-14 spike dating to
774–775 CE, indicating that a massive burst of radiation reached Earth during that time. ______ this unprecedented radiocarbon surge was
dubbed a “Miyake event” in honor of its discoverer.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Fittingly,"}, {"label": "B", "body": "Similarly,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "Fittingly" logically signals that the naming of an unprecedented radiocarbon surge for Fusa Miyake is appropriate to
the situation, since Miyake is the person who identified the surge (through her Yaku Island tree-ring analysis).
Choice B is incorrect because "similarly" illogically signals that the information in this sentence is similar to the previous information about
Miyake’s identification of a massive radiation burst through tree-ring analysis. Instead, the naming of the event for its discoverer is a fitting and
appropriate outcome. Choice C is incorrect because "however" illogically signals that the information in this sentence contrasts with the previous
information about Miyake’s identification of a massive radiation burst through tree-ring analysis. Instead, the naming of the event for its
discoverer is a fitting and appropriate outcome. Choice D is incorrect because "in other words" illogically signals that the information in this
sentence is a paraphrase or restatement of the previous information about Miyake’s identification of a massive radiation burst through tree-ring
analysis. Instead, the naming of the event for its discoverer is a fitting and appropriate outcome.$qb$);
select seed_pool_question($qb$CB-0d3ebdce$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Neuroscientist Karen Konkoly wanted to determine whether individuals can understand and respond to questions during REM sleep. She first
taught volunteers eye movements they would use to respond to basic math problems while asleep (a single left-right eye movement indicated
the number one). ______ she attached electrodes to the volunteers’ faces to record their eye movements during sleep.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Specifically,"}, {"label": "B", "body": "Next,"}, {"label": "C", "body": "For instance,"}, {"label": "D", "body": "In sum,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Next” logically signals that the action described in this sentence—Konkoly recording participants’ eye movements—
is the next step in Konkoly’s experiment.
Choice A is incorrect because “specifically” illogically signals that this sentence specifies or elaborates on an aspect of the action described in
the previous sentence. Instead, it describes the next step in Konkoly’s experiment. Choice C is incorrect because “for instance” illogically signals
that the action described in this sentence is an example of the action described in the previous sentence. Instead, it is the next step in Konkoly’s
experiment. Choice D is incorrect because “in sum” illogically signals that this sentence summarizes or concludes the action described in the
previous sentence. Instead, it describes the next step in Konkoly’s experiment.$qb$);
select seed_pool_question($qb$CB-00460c13$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Novelist Willa Cather grew up in Nebraska and attended the University of Nebraska-Lincoln.
· Some of Cather’s best-known novels are set in Nebraska.
? Two such novels are O Pioneers! (1913) and My Ántonia (1918).
? Cather’s novels describe the experiences of immigrants who settled in the Great Plains.
The student wants to identify the setting of Cather’s novel My Ántonia. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-00460c13.png$qb$, $qb$[{"label": "A", "body": "My Ántonia is set in Nebraska, where Cather grew up."}, {"label": "B", "body": "Cather, author of My Ántonia, described the experiences of immigrants in her novels."}, {"label": "C", "body": "Among Cather’s best-known novels are O Pioneers! (1913) and My Ántonia (1918)."}, {"label": "D", "body": "Cather attended the University of Nebraska-Lincoln and set some of her novels in Nebraska."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice directly identifies the setting of Cather’s novel My Ántonia as Nebraska.
Choice B is incorrect. This choice mentions that Cather wrote about immigrants, but it doesn’t indicate where they lived. Choice C is incorrect.
This choice mentions that My Ántonia is one of Cather’s best-known novels but doesn’t state where it takes place. Choice D is incorrect. This
choice mentions that some of Cather’s novels are set in Nebraska, but it doesn’t specify which ones, so we can’t be certain that My Ántonia is one
of them. It also includes irrelevant information about Cather’s education.$qb$);
select seed_pool_question($qb$CB-dd11e5ab$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Muckrakers were journalists who sought to expose corruption in US institutions during the Progressive Era (1897–1920).
· Ida Tarbell was a muckraker who investigated the Standard Oil Company.
? She interviewed Standard Oil Company executives, oil industry workers, and public officials.
? She examined thousands of pages of the company’s internal communications, including letters and financial records.
? Her book The History of the Standard Oil Company (1904) exposed the company’s unfair business practices.
The student wants to emphasize the thoroughness of Ida Tarbell’s investigation of the Standard Oil Company. Which choice most effectively
uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dd11e5ab.png$qb$, $qb$[{"label": "A", "body": "Ida Tarbell not only interviewed Standard Oil executives, oil industry workers, and public officials but also examined thousands of pages of the company’s internal communications."}, {"label": "B", "body": "Ida Tarbell, who investigated the Standard Oil Company, was a muckraker (a journalist who sought to expose corruption in US institutions during the Progressive Era, 1897–1920)."}, {"label": "C", "body": "As part of her investigation of the Standard Oil Company, muckraker Ida Tarbell conducted interviews."}, {"label": "D", "body": "Published in 1904, muckraker Ida Tarbell’s book The History of the Standard Oil Company exposed the company’s unfair business practices."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. It describes Tarbell’s investigation and the lengths she went to complete it.
Choice B is incorrect. This choice doesn’t describe how thorough Tarbell was. Instead, it gives a biographical sketch. Choice C is incorrect. This
choice doesn’t describe how thorough Tarbell was. Tarbell didn’t only conduct interviews—she also “examined thousands of pages of the
company’s internal communications.” Choice D is incorrect. This choice doesn’t describe how thorough Tarbell was. It describes her book but
doesn’t include anything about her investigation.$qb$);
select seed_pool_question($qb$CB-8112b7e3$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Ugandan American professor Peter Nazareth believed that Elvis Presley’s music is best understood not as a homogeneous collection but as an
anthology (because Elvis showcased the contributions of a wide range of gospel, blues, and rock artists). ______ Nazareth entitled his college
course on Elvis and his music, which focused on Elvis’s many musical influences, “Elvis as Anthology.”
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "To that end,"}, {"label": "B", "body": "In sum,"}, {"label": "C", "body": "That is,"}, {"label": "D", "body": "In addition,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "To that end" logically signals that the activity described in this sentence—Nazareth titling his course "Elvis as
Anthology"—is meant to further Nazareth’s goal of helping others understand Presley’s music as an anthology with a wide range of influences.
Choice B is incorrect. "In sum" illogically signals that the activity described in this sentence summarizes Nazareth’s view of Presley’s music as an
anthology. Instead, titling his course "Elvis as Anthology" is a way for him to promote this view. Choice C is incorrect. "That is" illogically signals
that the activity described in this sentence is a clarification or interpretation of Nazareth’s view of Presley’s music as an anthology. Instead, titling
his course "Elvis as Anthology" is a way for him to promote this view. Choice D is incorrect. "In addition" illogically signals that the activity
described in this sentence is merely an additional fact about Nazareth. Instead, titling his course "Elvis as Anthology" is a way for him to promote
his view of Presley’s music as an anthology.$qb$);
select seed_pool_question($qb$CB-964c6055$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Two opposing theories of vision divided scholars for many centuries.
· The ancient Greek mathematician Euclid (circa 300 BCE) supported the extramission theory.
? This theory held that the eyes emit a form of radiation that illuminates objects in its range.
? The ancient Greek philosopher Aristotle (384–322 BCE) supported the intromission theory.
? This theory held that objects emit a form of radiation that reaches the eyes.
? In the eleventh century, Arab mathematician Ibn al-Haytham (965–1040 CE) largely settled the debate with the first conclusive
experiments supporting intromission.
The student wants to provide a historical overview of the two theories. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-964c6055.png$qb$, $qb$[{"label": "A", "body": "Scholars were divided between the extramission and intromission theories of vision until Ibn al-Haytham’s eleventh-century experiments largely settled the debate in support of intromission."}, {"label": "B", "body": "Through two opposing theories of vision—extramission and intromission—Euclid, Aristotle, and Ibn al-Haytham held that a form of radiation is emitted either from objects or from the eyes."}, {"label": "C", "body": "While Ibn al-Haytham largely settled the debate in the eleventh century, Aristotle supported the theory of intromission centuries before."}, {"label": "D", "body": "Before the eleventh century, the ancient Greek philosopher Aristotle supported the intromission theory, which held that objects emit a form of radiation that reaches the eyes."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence provides a historical overview of the two theories, noting that scholars were divided between them
before Ibn al-Haytham’s experiments supporting intromission largely settled the debate in the eleventh century.
Choice B is incorrect. While the sentence identifies the two theories and the scholars that supported them, it doesn’t provide a historical overview
of the theories. Choice C is incorrect. While the sentence indicates Aristotle supported intromission theory centuries before Ibn al-Haytham
settled the debate, it doesn’t mention extramission theory or provide a historical overview of both theories. Choice D is incorrect. The sentence
provides information about intromission theory but doesn’t mention extramission theory or provide a historical overview of both theories.$qb$);
select seed_pool_question($qb$CB-fb56b593$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Despite its great distance from Earth—it is 570 light-years away—the star Shaula is one of the brightest stars in the sky, ranking 23rd. Although
not as bright as Shaula, the star Alkaid also ranks among the 50 brightest stars (40th, to be exact). ______ Alkaid’s brightness is likely due to the
star’s relative proximity: Alkaid is only 100 light-years from Earth.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Indeed,"}, {"label": "B", "body": "As a result,"}, {"label": "C", "body": "Granted,"}, {"label": "D", "body": "Similarly,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Granted” logically signals that the information in this sentence—that Alkaid’s brightness is likely due to its relative
proximity to Earth—is a concession acknowledging that the star likely appears bright for different reasons than the faraway star to which it is
compared, Shaula.
Choice A is incorrect because “indeed” illogically signals that the information in this sentence offers additional emphasis in support of the
previous information about Alkaid ranking among the 50 brightest stars. Instead, the sentence concedes that the most likely reason Alkaid is
counted among the sky’s brightest stars is its relative proximity to Earth. Choice B is incorrect because “as a result” illogically signals that
Alkaid’s brightness is caused by the previous information about Alkaid ranking among the 50 brightest stars. Instead, the sentence concedes
that the most likely reason Alkaid is counted among the sky’s brightest stars is its relative proximity to Earth. Choice D is incorrect because
“similarly” illogically signals that the information in this sentence is similar to the previous information about Alkaid ranking among the 50
brightest stars. Instead, the sentence concedes that the most likely reason Alkaid is counted among the sky’s brightest stars is its relative
proximity to Earth.$qb$);
select seed_pool_question($qb$CB-74149724$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? John Carver was one of the 41 signatories of the Mayflower Compact.
· The Mayflower Compact was a legal agreement among the pilgrims that immigrated to Plymouth Colony.
? It was created in 1620 to establish a common government.
? It states that the pilgrims who signed it wanted to “plant the first colony in the northern parts of Virginia” under King James.
? Carver became the first governor of Plymouth Colony.
The student wants to specify the reason the Mayflower Compact was created. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-74149724.png$qb$, $qb$[{"label": "A", "body": "Stating that its signatories wanted to “plant the first colony in the northern parts of Virginia,” the Mayflower Compact was a legal agreement among the pilgrims that immigrated to Plymouth Colony."}, {"label": "B", "body": "Created in 1620, the Mayflower Compact states that the pilgrims wanted to “plant the first colony in the northern parts of Virginia.”"}, {"label": "C", "body": "The Mayflower Compact was created to establish a common government among the pilgrims that immigrated to Plymouth Colony."}, {"label": "D", "body": "The Mayflower Compact had 41 signatories, including John Carver, the first governor of Plymouth Colony."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence specifies the reason the Mayflower Compact was created, noting that it was created to establish a
common government among the pilgrims that immigrated to Plymouth Colony.
Choice A is incorrect. While the sentence provides background information about the Mayflower Compact and notes the signatories’ goal for the
colony, it doesn’t specify why the compact was created. Choice B is incorrect. While the sentence provides background information about the
Mayflower Compact and notes the signatories’ goal for the colony, it doesn’t specify why the compact was created. Choice D is incorrect. The
sentence specifies the number of pilgrims that signed the Mayflower Compact; it doesn’t specify the reason the compact was created.$qb$);
select seed_pool_question($qb$CB-080a7b51$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Imagine a magazine that a reader has thrown away. This magazine is post-consumer waste, as it became waste after reaching the consumer.
______ the paper scraps left over from printing the magazine are pre-consumer waste, as they became waste before reaching the consumer.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "By contrast,"}, {"label": "B", "body": "For example,"}, {"label": "C", "body": "As a result,"}, {"label": "D", "body": "Specifically,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “By contrast” logically signals that the information in this sentence—that paper scraps left over from printing a
magazine are pre-consumer waste—contrasts with the previous information about magazines being post-consumer waste.
Choice B is incorrect because “for example” illogically signals that the information in this sentence exemplifies the previous information about
post-consumer waste. Instead, the paper scraps being pre-consumer waste contrasts with the previous information. Choice C is incorrect
because “as a result” illogically signals that the information in this sentence is a result or consequence of the previous information about post-
consumer waste. Instead, the paper scraps being pre-consumer waste contrasts with the previous information. Choice D is incorrect because
“specifically” illogically signals that the information in this sentence provides specific, precise details elaborating on the previous information
about post-consumer waste. Instead, the paper scraps being pre-consumer waste contrasts with the previous information.$qb$);
select seed_pool_question($qb$CB-25361ec6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Scientists long debated the origins of chondrules, tiny glass beads that formed in meteors billions of years ago. For decades, different theories
were proposed, from lightning strikes to powerful rock collisions, but none had sufficient evidentiary support. ______ scientists found strong
evidence that chondrules were formed by shock waves in nearby nebulae.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For example,"}, {"label": "B", "body": "Therefore,"}, {"label": "C", "body": "Similarly,"}, {"label": "D", "body": "Finally,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Finally" logically signals that the information in this sentence—that scientists found evidence that chondrules were
formed by shock waves in nearby nebulae—indicates a conclusion to the scientific debate mentioned in the previous sentences.
Choice A is incorrect because "for example" illogically signals that the information about the evidence for chondrule formation in this sentence
exemplifies the information about the scientific debate regarding chondrule formation in the previous sentences. Instead, it indicates a
conclusion to the debate. Choice B is incorrect because "therefore" illogically signals that the information in this sentence is a result of the
previous information about the scientific debate regarding chondrule formation. Instead, it indicates a conclusion to the debate. Choice C is
incorrect because "similarly" illogically signals that the information that follows is similar to the information about the scientific debate regarding
chondrule formation in the previous sentences. Instead, it indicates a conclusion to the debate.$qb$);
select seed_pool_question($qb$CB-7ce14583$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In Asiya Wadud’s 2022 poem “Shorn, Treaded Red,” the poet contemplates a painting that has inspired her: Etel Adnan’s 2020 work Satellites 27.
The painting, which features overlapping geometric shapes, fuels the poem’s exploration of temporality and identity. ______ in responding to
Adnan’s artwork, Wadud’s poem reflects on the relationship between poetry and other art forms.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "For instance,"}, {"label": "C", "body": "What’s more,"}, {"label": "D", "body": "Conversely,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "What’s more" logically signals that this sentence introduces an additional aspect of Wadud’s poem beyond what
was previously discussed. While the previous sentence establishes that Adnan’s painting has inspired "the poem’s exploration of temporality and
identity," this sentence provides a separate, additional claim about the poem: that it reflects on poetry’s relationship to other art forms.
Choice A is incorrect because "in other words" illogically signals that the information in this sentence is a paraphrase or restatement of the
previous point about how Adnan’s painting has inspired "the poem’s exploration of temporality and identity." Instead, the sentence provides a
separate, additional claim about the poem. Choice B is incorrect because "for instance" illogically signals that the information in this sentence
supports the previous point about "the poem’s exploration of temporality and identity" by providing an example. Instead, the sentence provides a
separate, additional claim about the poem. Choice D is incorrect because "conversely" illogically signals that the information in this sentence is
contrary to the previous point about how Adnan’s painting has inspired "the poem’s exploration of temporality and identity." Instead, the sentence
provides a separate, additional claim about the poem.$qb$);
select seed_pool_question($qb$CB-3fd0ab63$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Voting members of the 2002 Latin Grammys were impressed by Banda Cuisillos’s album Puras Rancheras Con Cuisillos and its contribution to the
banda genre, a form of regional Mexican music featuring large ensembles of wind instruments and drums that first developed in southern and
central Mexico in the mid-nineteenth century. ______ they awarded the group the Best Banda Album award.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In contrast,"}, {"label": "B", "body": "Meanwhile,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Accordingly,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Accordingly" logically signals that the information in this sentence—that the voting members awarded Banda
Cuisillos the Best Banda Album award—is in accordance with, or results from, the previous information about the voters being impressed by
Banda Cuisillos’s album.
Choice A is incorrect because "in contrast" illogically signals that the information in this sentence contrasts with the previous information about
voting members being impressed by Banda Cuisillos’s album. Instead, the voters’ decision to give the group the Best Banda Album award is in
accordance with, or results from, that information. Choice B is incorrect because "meanwhile" illogically signals that the information in this
sentence is separate from (while occurring simultaneously with) the previous information about the voting members being impressed by Banda
Cuisillos’s album. Instead, the voters’ decision to give the group the Best Banda Album award is in accordance with, or results from, that
information. Choice C is incorrect because "nevertheless" illogically signals that the information that follows is despite the information about the
voting members being impressed by Banda Cuisillos’s album. Instead, the voters’ decision to give the group the Best Banda Album award is in
accordance with, or results from, that information.$qb$);
select seed_pool_question($qb$CB-f1d8550e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Jordan Bennett is a Mi’Kmaq visual artist.
· The Mi’Kmaq are a First Nations people in North America.
? Bennett’s paintings pay homage to traditional Mi’Kmaq craftsmanship and have been displayed in over 75 exhibitions.
? His 2017 exhibition Wije’wi was held at the Grenfell Art Gallery.
? His 2018 exhibition Ketu’elmita’jik was held at the Art Gallery of Nova Scotia.
The student wants to emphasize the order in which two of Jordan Bennett’s exhibitions were held. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f1d8550e.png$qb$, $qb$[{"label": "A", "body": "Jordan Bennett’s 2017 exhibition Wije’wi was followed a year later by his exhibition Ketu’elmita’jik."}, {"label": "B", "body": "Jordan Bennett’s paintings, some of which appeared in 2017 and 2018 exhibitions, pay homage to traditional Mi’Kmaq craftsmanship."}, {"label": "C", "body": "Mi’Kmaq visual artist Jordan Bennett has displayed his work in over 75 exhibitions, including Wije’wi and Ketu’elmita’jik."}, {"label": "D", "body": "Jordan Bennett’s 2018 exhibition Ketu’elmita’jik was held at the Art Gallery of Nova Scotia; another was held at the Grenfell Art Gallery."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the order in which two of Jordan Bennett’s exhibitions were held, indicating that Wije’wi
took place in 2017 and Ketu’elmita’jik took place a year later (2018).
Choice B is incorrect. While the sentence mentions that exhibitions of Jordan Bennett’s paintings took place in 2017 and 2018, it doesn’t identify
the exhibitions or emphasize the order in which they were held. Choice C is incorrect. While the sentence mentions two of Jordan Bennett’s
exhibitions, it doesn’t indicate the order in which they were held. Choice D is incorrect. While the sentence mentions two of Jordan Bennett’s
exhibitions and specifies when one of them was held, it doesn’t state when the exhibition at the Grenfell Art Gallery occurred. Thus, the order in
which the two exhibitions were held isn’t clearly established in the sentence.$qb$);
select seed_pool_question($qb$CB-ff8d2125$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Crown shyness is a phenomenon in which the tops (crowns) of neighboring trees grow close together but don’t overlap.
· To explain how this happens, Australian forester M.R. Jacobs proposes the mutual abrasion theory.
? According to Jacobs’s theory, when trees brush against one another, branches break off.
? Malaysian scholar Francis S.P. Ng posits the mutual shade avoidance theory.
? According to Ng’s theory, when tree branches detect shade from nearby trees’ branches, they stop growing.
The student wants to compare the causes of crown shyness proposed in the two theories. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ff8d2125.png$qb$, $qb$[{"label": "A", "body": "While Jacobs proposes that crown shyness is caused by neighboring tree branches brushing against one another, Ng posits that it occurs when branches detect shade from nearby trees’ branches."}, {"label": "B", "body": "Both Jacobs and Ng have proposed theories to explain what causes crown shyness."}, {"label": "C", "body": "Ng posits the mutual shade avoidance theory, whereas Jacobs proposes an alternative theory."}, {"label": "D", "body": "Jacobs’s mutual abrasion theory proposes that when neighboring trees brush against one another, branches break off, resulting in a phenomenon in which the tops of trees grow close together but don’t overlap."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence compares the two proposed causes of crown shyness, noting the theories’ differences: Jacobs cites
branches brushing against one another as the cause, while Ng cites branches detecting shade from other branches as the cause.
Choice B is incorrect. The sentence merely identifies the existence of two theories for crown shyness; it doesn’t compare the causes proposed
by each theory. Choice C is incorrect. The sentence merely indicates that there are two different theories for crown shyness; it doesn’t compare
the causes proposed by each theory. Choice D is incorrect. The sentence merely explains one theory for crown shyness; it doesn’t compare two
theories.$qb$);
select seed_pool_question($qb$CB-5a2a4b36$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Pauline Hopkins (1859-1930) was an African American writer.
· In her career, she created many genre-defining stories.
? Her serialized novel Hagar’s Daughter was published from 1901 to 1902 in The Colored American Magazine.
? It is considered the first African American mystery novel.
The student wants to introduce Pauline Hopkins to an audience unfamiliar with her career. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5a2a4b36.png$qb$, $qb$[{"label": "A", "body": "Pauline Hopkins is the author of Hagar’s Daughter, a serialized novel published from 1901 to 1902."}, {"label": "B", "body": "African American writer Pauline Hopkins created many genre-defining stories during her career, including the first African American mystery novel, Hagar’s Daughter."}, {"label": "C", "body": "Published in The Colored American Magazine from 1901 to 1902, Hagar’s Daughter is a serialized novel by Pauline Hopkins."}, {"label": "D", "body": "Hagar’s Daughter by Pauline Hopkins is considered the first African American mystery novel."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence introduces Pauline Hopkins to an audience unfamiliar with her career, identifying her as a genre-
defining African American writer and noting a career accomplishment.
Choice A is incorrect. The sentence emphasizes that Pauline Hopkins wrote a serialized novel but doesn’t introduce Hopkins to an audience
unfamiliar with her career. Choice C is incorrect. The sentence introduces Hopkins’s novel; it doesn’t introduce Hopkins. Choice D is incorrect.
The sentence explains that a novel written by Hopkins is considered the first African American mystery novel; it doesn’t introduce Hopkins to an
audience unfamiliar with her career.$qb$);
select seed_pool_question($qb$CB-8b2636ee$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Angana Chaudhuri is a scientist.
· Chaudhuri studies sedimentary rocks.
? A scientist who studies sedimentary rocks is called a sedimentologist.
? Shale, chalk, and sandstone are examples of sedimentary rocks.
The student wants to identify what type of scientist Chaudhuri is. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8b2636ee.png$qb$, $qb$[{"label": "A", "body": "Chalk is a type of sedimentary rock."}, {"label": "B", "body": "Some scientists study shale, chalk, and sandstone."}, {"label": "C", "body": "There are scientists who study sedimentary rocks."}, {"label": "D", "body": "Chaudhuri is a sedimentologist."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence identifies the type of scientist Chaudhuri is, noting that she is a sedimentologist.
Choice A is incorrect. The sentence provides an example of a type of sedimentary rock; it doesn’t identify what type of scientist Chaudhuri is.
Choice B is incorrect. The sentence indicates types of rock that some scientists study; it doesn’t identify what type of scientist Chaudhuri is.
Choice C is incorrect. While the sentence states that some scientists study sedimentary rocks, it doesn’t identify Chaudhuri as this type of
scientist.$qb$);
select seed_pool_question($qb$CB-47547d07$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In June, female loggerhead sea turtles will swim back to the sandy beaches where they were born to lay eggs of their own. First, the turtle will dig
her nest in the sand. ______ she will lay up to 100 eggs in the nest. Finally, she will cover it all with sand, before returning to the ocean.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "By contrast,"}, {"label": "B", "body": "Similarly,"}, {"label": "C", "body": "Next,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Next” logically signals that the egg laying in this sentence is the next step in the sequence of events described in
the other sentences.
Choice A is incorrect because “by contrast” illogically signals that the egg laying in this sentence contrasts with the nest digging in the previous
sentence. Instead, the egg laying follows the nest digging as the next step in the sequence of events. Choice B is incorrect because “similarly”
illogically signals that the egg laying in this sentence is similar to the nest digging in the previous sentence. Though the two actions are related,
they are not similar. Instead, the egg laying follows the nest digging as the next step in the sequence of events. Choice D is incorrect because
“for example” illogically signals that the egg laying in this sentence is an example of the nest digging in the previous sentence. Instead, the egg
laying follows the nest digging as the next step in the sequence of events.$qb$);
select seed_pool_question($qb$CB-79c6a01e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The engineer Robert Fulton designed the Clermont steamboat in 1807.
· He designed it in New York City.
? Clermont was the world’s first commercially successful steamboat.
? The city of Fulton, Missouri, is named after Robert Fulton.
? New York City’s Fulton Street is named after him.
The student wants to indicate how Fulton, Missouri, got its name. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-79c6a01e.png$qb$, $qb$[{"label": "A", "body": "Fulton, Missouri, shares its name with Fulton Street in New York City."}, {"label": "B", "body": "Fulton Street is in New York City, where the steamboat Clermont was designed in 1807."}, {"label": "C", "body": "Designed in 1807 in New York City, Clermont was the first commercially successful steamboat."}, {"label": "D", "body": "Fulton, Missouri, is named after Robert Fulton, designer of the first commercially successful steamboat."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence indicates how Fulton, Missouri, got its name, noting that the city was named after the designer of the
first commercially successful steamboat, Robert Fulton.
Choice A is incorrect. The sentence indicates that Fulton, Missouri, has the same name as a street in New York City; it doesn’t indicate how the
city of Fulton got its name. Choice B is incorrect. The sentence indicates that Fulton Street is in New York City; it doesn’t indicate how Fulton,
Missouri, got its name. Choice C is incorrect. The sentence provides details about Fulton’s steamboat; it doesn’t indicate how Fulton, Missouri,
got its name.$qb$);
select seed_pool_question($qb$CB-23da9791$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Scientists have long sought to determine the origin of glass in Chile’s Atacama Desert.
· A 2017 study concluded that ancient grass fires had melted the area’s sandy soil into glass.
? In 2021, a different study revealed that the mineral signatures of glass samples were consistent with the mineral signatures of comet
samples collected by NASA.
? That study concluded that the glass had formed as a result of a cometary explosion close to the desert’s surface.
The student wants to describe how scientific understanding about the glass’s origin has evolved. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-23da9791.png$qb$, $qb$[{"label": "A", "body": "Scientists have long sought to determine the origin of the glass, with one study concluding that it formed when ancient grass fires melted the area’s sandy soil."}, {"label": "B", "body": "Studies in 2017 and 2021 offered different explanations for the origin of the glass."}, {"label": "C", "body": "Mineral signatures of glass samples are consistent with those of comet samples collected by NASA, according to new research."}, {"label": "D", "body": "A 2017 study concluded that ancient grass fires had caused the glass’s formation, but new research suggests that the glass formed as a result of a cometary explosion close to the desert’s surface."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence describes how scientific understanding of the glass’s origin has evolved, explaining that new research
suggests the glass formed as a result of a cometary explosion instead of being caused by grass fires (as was previously believed).
Choice A is incorrect. The sentence explains the conclusion of the older study; it doesn’t describe how scientific understanding of the glass’s
origin has evolved. Choice B is incorrect. While the sentence indicates that the two studies provided different explanations, it doesn’t describe
how scientific understanding of the glass’s origin has evolved. Choice C is incorrect. The sentence references a recent finding but doesn’t
effectively describe how scientific understanding of the glass’s origin has evolved.$qb$);
select seed_pool_question($qb$CB-9f7ac40d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In ArtMed inSight, a series of art-based medical education classes taught by Anne Willieme, medical students learn to use techniques more often
associated with the arts, such as slowing down interpretation and considering multiple perspectives. ______ Willieme’s students develop better
observational skills, enhancing their ability to understand and diagnose patients effectively.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "By contrast,"}, {"label": "B", "body": "In doing so,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "Nevertheless,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “In doing so” logically signals that the information in this sentence—that the medical students develop better
observational skills—is an outcome of the action described in the previous sentence (the students learning art-based techniques).
Choice A is incorrect because “by contrast” illogically signals that the students developing better observational skills contrasts with the previous
information about learning art-based techniques. Instead, the students’ improved skills are a direct result of learning those techniques. Choice C
is incorrect because “for example” illogically signals that the students developing better observational skills is a specific example of learning art-
based techniques. Instead, the students’ improved skills are a direct result of learning those techniques. Choice D is incorrect because
“nevertheless” illogically signals that the students develop better observational skills despite the previous information about learning art-based
techniques. Instead, the students’ improved skills are a direct result of learning those techniques.$qb$);
select seed_pool_question($qb$CB-878f835a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Some atoms contain an excess of neutrons.
· Often, these neutrons form a “skin” on the atom’s surface.
? An atom of lead-208 has a neutron skin.
? The thickness of its neutron skin is approximately 0.28 trillionths of a millimeter.
The student wants to emphasize the thickness of lead-208’s neutron skin. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-878f835a.png$qb$, $qb$[{"label": "A", "body": "The neutron skin surrounding an atom of lead-208 measures about 0.28 trillionths of a millimeter."}, {"label": "B", "body": "Atoms with excess neutrons will often acquire a neutron skin."}, {"label": "C", "body": "An atom of lead-208, like some other atoms, is surrounded by a neutron skin."}, {"label": "D", "body": "Neutrons surround the surface of an atom of lead-208."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the thickness of lead-208’s neutron skin, noting that it is about 0.28 trillionths of a
millimeter thick.
Choice B is incorrect. The sentence makes a generalization about atoms, stating that atoms with excess neutrons will often acquire a neutron
skin; it doesn’t emphasize the thickness of lead-208’s neutron skin. Choice C is incorrect. The sentence states that lead-208 has a neutron skin; it
doesn’t emphasize the thickness of that skin. Choice D is incorrect. The sentence indicates that lead-208 is surrounded by neutrons; it doesn’t
emphasize the thickness of lead-208’s neutron skin.$qb$);
select seed_pool_question($qb$CB-8e9677e6$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 2009, the Craft and Folk Art Museum in Los Angeles hosted a special exhibition, Sueños/Yume, showcasing the works of local sculptor Dora
de Larios. As suggested by the show’s title (sueños and yume mean “dreams” in Spanish and Japanese, respectively), de Larios’s art reflects a
mix of cultural influences. ______ her work is grounded in the artistic traditions of both Mexico and Japan.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In addition,"}, {"label": "B", "body": "In contrast,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "Therefore,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Specifically” logically signals that this sentence provides specific, precise details elaborating on the previous
sentence’s claim that de Larios’s art reflects a mix of cultures. This sentence specifies which cultures the previous sentence is referring to: the
artistic traditions of both Mexico and Japan.
Choice A is incorrect because “in addition” illogically signals that the information in this sentence is a separate point that follows the previous
claim about de Larios’s art. Instead, it provides specific details elaborating on that claim. Choice B is incorrect because “in contrast” illogically
signals that the information in this sentence contrasts with the previous claim about de Larios’s art. Instead, it provides specific details
elaborating on that claim. Choice D is incorrect because “therefore” illogically signals that the information in this sentence is a result of the
previous claim about de Larios’s art. Instead, it provides specific details elaborating on that claim.$qb$);
select seed_pool_question($qb$CB-31ac4d2c$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Hina Hanta is an online archive curated by the Choctaw Nation of Oklahoma.
· Hina Hanta means “bright path” in Choctaw.
? It features images of cultural artifacts relevant to the history of the Choctaw people.
? It includes a fanner basket (ufko tapushik in Choctaw) made from cane.
? It includes a robe (nita anchi) made from bear fur.
The student wants to specify the fanner basket’s name in Choctaw. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-31ac4d2c.png$qb$, $qb$[{"label": "A", "body": "The Hina Hanta archive features cultural artifacts, such as a fanner basket and a robe, that are relevant to the history of the Choctaw people."}, {"label": "B", "body": "The cane fanner basket, which is included in the Hina Hanta online archive, is called an ufko tapushik in Choctaw."}, {"label": "C", "body": "Hina Hanta, which means “bright path” in Choctaw, includes a fanner basket in its archive."}, {"label": "D", "body": "The name of the online archive Hina Hanta means “bright path” in Choctaw."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence specifies the fanner basket’s name in Choctaw, noting that it’s called ufko tapushik.
Choice A is incorrect. While the sentence mentions the fanner basket, it doesn’t specify its name in Choctaw. Choice C is incorrect. While the
sentence mentions the fanner basket, it doesn’t specify its name in Choctaw. Choice D is incorrect. The sentence doesn’t mention the fanner
basket or specify its name in Choctaw.$qb$);
select seed_pool_question($qb$CB-7dbcb7f4$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Karel Čapek’s 1920 play R.U.R. (Rossum’s Universal Robots), in which artificial workers overthrow their masters, left an indelible mark on the
science fiction genre, and the English language, by introducing the term “robot” (derived from the Czech word robota, meaning “indentured labor”
or “drudgery”). ______ Čapek’s play also contributed to a venerable literary and mythological tradition: using artificial beings as mirrors and foils
for humanity.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Beyond the simple coining of a term,"}, {"label": "B", "body": "By achieving such a lofty goal,"}, {"label": "C", "body": "Ultimately limited in its lasting influence,"}, {"label": "D", "body": "Despite its creation of such an iconic trope,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Beyond the simple coining of a term” logically signals that the information in this sentence—that Čapek’s play
contributed to a literary and mythological tradition of using artificial beings as mirrors and foils for humanity—describes contributions that
extend beyond the previously described achievement of introducing the term “robot” to the English language.
Choice B is incorrect because “by achieving such a lofty goal” illogically signals that the play’s contribution to a literary and mythological tradition
was accomplished through the means of the previously described achievement of introducing the term “robot.” Instead, the sentence describes
an additional contribution that goes beyond that achievement. Choice C is incorrect because “ultimately limited in its lasting influence” illogically
minimizes the play’s influence, which is inconsistent with the text’s other claims about the play. Instead, the sentence describes contributions
that go beyond the previously described achievement of introducing the term “robot.” Choice D is incorrect because “despite its creation of such
an iconic trope” illogically signals that the play’s contribution to a literary and mythological tradition is surprising given the play’s creation of an
iconic trope. Instead, the sentence describes contributions that go beyond the previously described achievement of introducing the term “robot.”$qb$);
select seed_pool_question($qb$CB-8432a140$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Marine biologist Camille Jazmin Gaynus studies coral reefs.
· Coral reefs are vital underwater ecosystems that provide habitats to 25% of all marine species.
? Reefs can include up to 8,000 species of fish, such as toadfish, seahorses, and clown triggerfish.
? The Amazon Reef is a coral reef in Brazil.
? It is one of the largest known reefs in the world.
The student wants to introduce the scientist and her field of study to a new audience. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8432a140.png$qb$, $qb$[{"label": "A", "body": "Located in Brazil, the Amazon Reef is one of the largest known coral reefs in the world."}, {"label": "B", "body": "Marine biologist Camille Jazmin Gaynus studies coral reefs, vital underwater ecosystems that provide homes to 25% of all marine species."}, {"label": "C", "body": "Providing homes to 25% of all marine species, including up to 8,000 species of fish, coral reefs are vital underwater ecosystems and thus of great interest to marine biologists."}, {"label": "D", "body": "As Camille Jazmin Gaynus knows well, coral reefs are vital underwater ecosystems, providing homes to thousands of species of fish."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. We’re asked to select the sentence that "introduce[s] the scientist and her field of study." This choice introduces
scientist Camille Jazmin Gaynus as a marine biologist and explains what marine life she studies.
Choice A is incorrect. This choice doesn’t mention Camille Jazmin Gaynus, so it fails to "introduce the scientist." Choice C is incorrect. This
choice doesn’t mention Camille Jazmin Gaynus, so it fails to "introduce the scientist." Choice D is incorrect. This choice mentions Camille Jazmin
Gaynus, but it doesn’t identify her as a marine biologist. It says she "knows well" about coral reefs, but doesn’t identify her expertise as a "field of
study."$qb$);
select seed_pool_question($qb$CB-4b7a84b0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Mountain climbing routes that incorporate metal rungs and cables are known as via ferratas, from the Italian phrase for “iron path.” As climbing
these routes has shifted from a mode of travel to a sporting activity, modern via ferratas are rarely designed to simply reach a summit. ______
new routes favor recreation over utility, aiming to provide a challenging climb or showcase dramatic scenery.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Additionally,"}, {"label": "B", "body": "On the other hand,"}, {"label": "C", "body": "More often,"}, {"label": "D", "body": "Nonetheless,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "More often" logically signals that the claim in this sentence—that new via ferratas favor recreation over utility—
explains a difference between the new "sporting activity" routes and the older "mode of travel" routes. In so doing, it emphasizes and reinforces
the previous claim ("modern via ferratas are rarely designed to simply reach a summit").
Choice A is incorrect because "additionally" illogically signals that this sentence’s claim about new via ferratas adds a new, separate point to the
previous claim ("modern via ferratas are rarely designed to simply reach a summit"). Instead, the second claim—that new routes favor recreation
over utility—emphasizes and reinforces the previous one. Choice B is incorrect because "on the other hand" illogically signals that this sentence’s
claim about new via ferratas contrasts with or opposes the previous claim ("modern via ferratas are rarely designed to simply reach a summit").
Instead, the second claim—that new routes favor recreation over utility—emphasizes and reinforces the previous one. Choice D is incorrect
because "nonetheless" illogically signals that this sentence’s claim about new via ferratas is true despite the previous claim ("modern via ferratas
are rarely designed to simply reach a summit"). Instead, the second claim—that new routes favor recreation over utility—emphasizes and
reinforces the previous one.$qb$);
select seed_pool_question($qb$CB-f5959727$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Modernista architects championed nature in their designs. ______ the wavy staircase and ornate floral tilework of Hospital de Sant Pau, a
Modernista hospital designed by Lluís Domènech i Montaner, couldn’t exactly grow in a forest. Still, one sees natural influences in Domènech i
Montaner’s penchant for curves (rather than right angles) and plant- and animal-inspired flourishes.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Furthermore,"}, {"label": "B", "body": "Similarly,"}, {"label": "C", "body": "Of course,"}, {"label": "D", "body": "Thus,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "Of course" logically signals that the information in this sentence—that "the wavy staircase and ornate floral
tilework" of the Modernista hospital couldn’t actually grow in a forest—acknowledges an obvious limitation of, or qualification to, the previous
claim that Modernista architects championed nature in their designs.
Choice A is incorrect because "furthermore" illogically signals that the information in this sentence merely adds to the previous claim that
Modernista architects championed nature in their designs. Instead, the sentence acknowledges an obvious limitation in how literally that natural
influence was expressed in the hospital’s features. Choice B is incorrect because "similarly" illogically signals that the information in this
sentence is similar to the previous claim that Modernista architects championed nature in their designs. Instead, the sentence acknowledges an
obvious limitation in how literally that natural influence was expressed in the hospital’s features. Choice D is incorrect because "thus" illogically
signals that the information in this sentence is a result of the previous claim that Modernista architects championed nature in their designs.
Instead, the sentence acknowledges an obvious limitation in how literally that natural influence was expressed in the hospital’s features.$qb$);
select seed_pool_question($qb$CB-6e0c60da$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When one looks at the dark craggy vistas in Hitoshi Fugo’s evocative photo series, one’s mind might wander off to the cratered surfaces of
faraway planets. ______ it’s the series’ title, Flying Frying Pan, that brings one back to Earth, reminding the viewer that each photo is actually a
close-up view of a familiar household object: a frying pan.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Consequently,"}, {"label": "B", "body": "Alternatively,"}, {"label": "C", "body": "Ultimately,"}, {"label": "D", "body": "Additionally,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The first sentence describes an experience that the viewer has when they’re looking at the photos: they imagine
other planets. This sentence describes an experience that the viewer has afterward: the title reminds them that the photos are of frying pans,
bringing them back to reality. “Ultimately” is a transition that means “eventually” or “in the end,” so it fits the context perfectly.
Choice A is incorrect. This choice uses a cause-and-effect transition, which doesn’t make sense here. The viewer imagining other planets when
they’re looking at the photos doesn’t cause the title to bring them back to reality. Choice B is incorrect. This choice uses a transition that
indicates another option or possibility, which doesn’t make sense here. Rather, the viewer has both experiences: first the viewer imagines that
they’re looking at another planet, and then the title reminds them that it’s just a frying pan. Choice D is incorrect. This choice uses a transition
that indicates the addition of an agreeing idea. But the viewer’s experience in the second sentence is actually the opposite of the viewer’s
experience in the first sentence. In the first sentence, the viewer is imagining that they’re seeing a landscape from another planet. In the second
sentence, the viewer is reminded that they’re looking at a frying pan.$qb$);
select seed_pool_question($qb$CB-94f48106$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 2022, University of Miami researchers discovered brine pools in the Gulf of Aqaba.
· A brine pool is an underwater lake that sits on the ocean floor.
? The water in brine pools is three to eight times saltier than the surrounding ocean.
? The extreme saltiness of this water makes it toxic to most sea life.
? Some forms of bacteria are able to survive in brine pools.
The student wants to explain why brine pools are toxic to most sea life. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-94f48106.png$qb$, $qb$[{"label": "A", "body": "Though brine pools are toxic to most sea life, some bacteria can survive there."}, {"label": "B", "body": "The water in brine pools is toxic to most sea life because it is three to eight times saltier than the surrounding ocean."}, {"label": "C", "body": "The brine pools in the Gulf of Aqaba are toxic to most sea life and were discovered by researchers in 2022."}, {"label": "D", "body": "Brine pools are salty underwater lakes that sit on the ocean floor."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence explains why brine pools are toxic to most sea life, noting that the water in the pools is three to eight
times saltier than the surrounding ocean.
Choice A is incorrect. While the sentence states that brine pools are toxic to most sea life, it doesn’t explain why the pools are toxic. Choice C is
incorrect. While the sentence states that brine pools are toxic to most sea life, it doesn’t explain why the pools are toxic. Choice D is incorrect
because the sentence describes brine pools, mentioning that they are salty, but doesn’t explain why they are toxic to most sea life.$qb$);
select seed_pool_question($qb$CB-146233fc$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Lighthouses send out crucial light signals to help ships and other watercraft navigate at night.
· Before automation, lighthouses were run by lighthouse keepers.
? Maria Younghans was the lighthouse keeper at Biloxi Light in Mississippi.
? She held this position from 1867 to 1918.
? Flora McNeil was the lighthouse keeper at Bridgeport Breakwater Light in Connecticut.
? She held this position from 1904 to 1920.
The student wants to emphasize the order in which the two lighthouse keepers began their careers. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-146233fc.png$qb$, $qb$[{"label": "A", "body": "From 1867 to 1918, the nighttime waters of Mississippi were more navigable thanks to lighthouse keepers Flora McNeil and Maria Younghans."}, {"label": "B", "body": "Before automation, lighthouse keepers like Maria Younghans and Flora McNeil were crucial to ensuring safe navigation for watercraft."}, {"label": "C", "body": "Flora McNeil began her career as a lighthouse keeper years after Maria Younghans did."}, {"label": "D", "body": "Maria Younghans’s career as a lighthouse keeper ended in 1918, whereas Flora McNeil’s ended in 1920."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes the order in which the two lighthouse keepers began their careers, noting that McNeil,
who became the keeper at Bridgeport Breakwater Light in 1904, began her career years after Younghans, who became the keeper at Biloxi Light
in 1867.
Choice A is incorrect because it makes a generalization about the effects of McNeil’s and Younghans’s work; it doesn’t emphasize the order in
which the two keepers began their careers. In addition, the sentence misrepresents information from the notes; McNeil was the keeper at a
lighthouse in Connecticut from 1904 to 1920, not at a lighthouse in Mississippi from 1867 to 1918. Choice B is incorrect. The sentence claims
that Younghans and McNeil were crucial to ensuring the safety of watercraft before lighthouses became automated; it doesn’t emphasize the
order in which the two keepers began their careers. Choice D is incorrect. The sentence emphasizes when the lighthouse keepers’ respective
careers ended; it doesn’t emphasize the order in which the two keepers began their careers.$qb$);
select seed_pool_question($qb$CB-c3b854fa$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Researchers Gwangsu Kim et al. sought to explore the relationship between the brain’s ability to process natural sounds and its ability to
process music.
· They used an artificial deep neural network (DNN) that models how the brain processes auditory information.
? The DNN had been trained to detect natural sounds (excluding music).
· Finding: The DNN spontaneously developed neurons that responded to music but not to other auditory stimuli.
? Conclusion: The brain’s ability to process music may arise as a by-product of natural sound processing.
The student wants to present the aim of the study. Which choice most effectively uses relevant information from the notes to accomplish this
goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c3b854fa.png$qb$, $qb$[{"label": "A", "body": "In their study, the researchers evaluated whether an artificial deep neural network could model how the brain processes auditory information."}, {"label": "B", "body": "By training an artificial deep neural network, the researchers aimed to establish that the brain’s ability to process natural sounds arises as a by- product of processing music."}, {"label": "C", "body": "The researchers used an artificial deep neural network, which spontaneously developed neurons that responded to music but not to other auditory stimuli."}, {"label": "D", "body": "Using an artificial deep neural network, the researchers sought to explore the relationship between the brain’s ability to process natural sounds and its ability to process music."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence presents the aim of the study, noting that the researchers sought to explore the relationship between
the brain’s ability to process natural sounds and its ability to process music.
Choice A is incorrect. The researchers used the DNN to achieve their aim of exploring the relationship between the brain’s ability to process
natural sounds and its ability to process music; evaluating the DNN itself was not their aim. Choice B is incorrect. The sentence misrepresents
the researchers’ conclusion as their aim and also misrepresents that conclusion. The researchers’ aim was to explore the relationship between
the brain’s ability to process natural sounds and its ability to process music; their conclusion was that the brain’s ability to process music arises
as a by-product of natural sound processing, not the other way around. Choice C is incorrect. The sentence merely describes a finding from the
study; it doesn’t present the aim of the study.$qb$);
select seed_pool_question($qb$CB-7f20374f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The 435 state districts in the US House of Representatives are designed to be roughly equal in population. These districts average around
760,000 people in size. However, only about 730,000 people live in the state of Alaska. ______ Alaska has just one House district, encompassing
the entire state.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "As a result,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "Finally,"}, {"label": "D", "body": "For instance,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "As a result" logically signals that the information in the sentence—that, in the US House of Representatives, the
entire state of Alaska has just one district—is the result or consequence of Alaska having only about 730,000 people. This is slightly below the
average for House districts, which are designed to have roughly equal populations.
Choice B is incorrect because "instead" illogically signals that Alaska having just one state district is an alternative to the information about the
state’s population in the previous sentence. Rather, the fact that Alaska has just one district is a result or consequence of the entire state having
slightly fewer people than an average-sized district. Choice C is incorrect because "finally" illogically signals that the information in this sentence
about Alaska having just one district indicates a last step in a process or a concluding summary. Instead, the fact that Alaska has just one
district is a result or consequence of the entire state having slightly fewer people than an average-sized district. Choice D is incorrect because
"for instance" illogically signals that the information in this sentence about Alaska having just one district exemplifies the information about the
state’s population in the previous sentence. Instead, the fact that Alaska has just one district is a result or consequence of the entire state having
slightly fewer people than an average-sized district.$qb$);
select seed_pool_question($qb$CB-64e88c58$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 1971, experimental musician Pauline Oliveros created Sonic Meditations.
· Sonic Meditations is not music but rather a series of sound-based exercises called meditations.
? Each meditation consists of instructions for participants to make, imagine, listen to, or remember sounds.
? The instructions for Meditation V state, “walk so silently that the bottoms of your feet become ears.”
? Those for Meditation XVIII state, “listen to a sound until you no longer recognize it.”
The student wants to provide an explanation and an example of Oliveros’s Sonic Meditations. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-64e88c58.png$qb$, $qb$[{"label": "A", "body": "Sonic Meditations is not music but rather a series of sound-based meditations that consist of instructions; Meditation XVIII, for instance, instructs participants to “listen to a sound until you no longer recognize it.”"}, {"label": "B", "body": "In 1971, Oliveros created Sonic Meditations, a series of meditations that consist of instructions for participants to make, imagine, listen to, or remember sounds."}, {"label": "C", "body": "“Walk so silently that the bottoms of your feet become ears” is one example of the instructions found in Oliveros’s Sonic Meditations."}, {"label": "D", "body": "While both meditations consist of instructions, Meditation XVIII instructs participants to “listen,” whereas Meditation V instructs participants to “walk.”"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. It describes what a “Sonic Meditation” is, and then gives an example in the form of Meditation XVIII.
Choice B is incorrect. This choice describes what a “Sonic Meditation” is, but doesn’t give an example of one. Choice C is incorrect. This choice
gives an example of a “Sonic Meditation,” but doesn’t explain what the meditations are. Choice D is incorrect. This choice doesn’t describe what a
“Sonic Meditation” is.$qb$);
select seed_pool_question($qb$CB-2c61e0b9$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? British musicians John Lennon and Paul McCartney shared writing credit for numerous Beatles songs.
· Many Lennon-McCartney songs were actually written by either Lennon or McCartney, not by both.
? The exact authorship of specific parts of many Beatles songs, such as the verse for “In My Life,” is disputed.
? Mark Glickman, Jason Brown, and Ryan Song used statistical methods to analyze the musical content of Beatles songs.
? They concluded that there is 18.9% probability that McCartney wrote the verse for “In My Life,” stating that the verse is “consistent with
Lennon’s songwriting style.”
The student wants to make a generalization about the kind of study conducted by Glickman, Brown, and Song. Which choice most effectively
uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2c61e0b9.png$qb$, $qb$[{"label": "A", "body": "Based on statistical analysis, Glickman, Brown, and Song claim that John Lennon wrote the verse of “In My Life.”"}, {"label": "B", "body": "There is only an 18.9% probability that Paul McCartney wrote the verse for “In My Life”; John Lennon is the more likely author."}, {"label": "C", "body": "It is likely that John Lennon, not Paul McCartney, wrote the verse for “In My Life.”"}, {"label": "D", "body": "Researchers have used statistical methods to address questions of authorship within the field of music."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence uses information from the notes to make a generalization about the kind of study Glickman, Brown,
and Song conducted. Specifically, the sentence indicates that the study was of a kind that used statistical methods to address questions of
authorship within the field of music.
Choice A is incorrect because the sentence summarizes the methodology and findings of a particular analysis of a single song; it doesn’t make a
generalization about the kind of study conducted. Choice B is incorrect because the sentence mentions the data and conclusion of a particular
analysis of a single song; it doesn’t make a generalization about the kind of study conducted. Choice C is incorrect because the sentence
focuses on a specific conclusion from a particular analysis of a single song; it doesn’t make a generalization about the kind of study conducted.$qb$);
select seed_pool_question($qb$CB-a1955620$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Edmonia Lewis (1844–1907) was an African American and Mississauga Ojibwe sculptor.
? Forever Free (1867) is a marble sculpture by Lewis.
· It depicts a male figure and a female figure gazing upward.
? It commemorates the 1863 Emancipation Proclamation.
· The phrase “forever free” from the text of the Emancipation Proclamation is inscribed on the sculpture’s base.
? Art historian Kirsten Buick describes the sculpture as a “celebration of liberty.”
The student wants to explain the sculpture’s specific historical context. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a1955620.png$qb$, $qb$[{"label": "A", "body": "According to art historian Kirsten Buick, Forever Free, which depicts a male figure and a female figure gazing upward, is a “celebration of liberty.”"}, {"label": "B", "body": "The base of Edmonia Lewis’s 1867 marble sculpture is inscribed with a historically significant phrase: “forever free.”"}, {"label": "C", "body": "Completed in 1867, Lewis’s sculpture Forever Free commemorates the Emancipation Proclamation, which had been issued four years previously."}, {"label": "D", "body": "Forever Free (1867) is a marble sculpture by Edmonia Lewis, an African American and Mississauga Ojibwe sculptor who lived from 1844 to 1907."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence explains the specific historical context of Lewis’s sculpture, noting that it commemorates the
Emancipation Proclamation, which was issued four years before the sculpture was completed in 1867.
Choice A is incorrect. The sentence quotes an art historian’s general interpretation of the sculpture’s meaning; it doesn’t explain the sculpture’s
specific historical context. Choice B is incorrect. While the sentence mentions a historically significant phrase on the sculpture’s base, it doesn’t
explain the specific historical context of the phrase or the sculpture. Choice D is incorrect. The sentence provides biographical information about
Lewis; it doesn’t explain the specific historical context of the sculpture.$qb$);
select seed_pool_question($qb$CB-14037904$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Heartbeat of Wounded Knee: Native America from 1890 to the Present is a history book by Ojibwe author David Treuer.
· In a review, a critic for The Economist noted that “Treuer’s storytelling skills shine” and that the book is an “elegant handling of [a] complex
narrative.”
? A critic for O, The Oprah Magazine called it “a marvel of research and storytelling.”
? A critic for the Missoulian dubbed it “a monumental achievement.”
The student wants to emphasize a similarity in how critics responded to Treuer’s book. Which choice most effectively uses relevant information
from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-14037904.png$qb$, $qb$[{"label": "A", "body": "Treuer’s book, which was widely reviewed, focuses on Native American history from 1890 to the present."}, {"label": "B", "body": "Dubbed “a monumental achievement” by the Missoulian, Treuer’s book documents over a century of Native American history."}, {"label": "C", "body": "Critics praised Treuer’s book for its compelling narrative, with O, The Oprah Magazine calling it “a marvel of research and storytelling” and The Economist likewise writing that “Treuer’s storytelling skills shine” and that the book is an “elegant handling of [a] complex narrative.”"}, {"label": "D", "body": "While the Missoulian focused on the book’s broader achievement, The Economist zeroed in on Treuer’s storytelling skills."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes a similarity in how critics responded to Treuer’s book, noting that the critics for O, The
Oprah Magazine and The Economist both praised the book’s storytelling.
Choice A is incorrect. The sentence provides background information about Treuer’s book; it doesn’t emphasize a similarity in how critics
responded to it. Choice B is incorrect. The sentence cites a single critic’s response to Treuer’s book; it doesn’t emphasize a similarity in the
responses of multiple critics. Choice D is incorrect. The sentence emphasizes a difference, not a similarity, in how two critics responded to
Treuer’s book.$qb$);
select seed_pool_question($qb$CB-9d4f331c$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When sculptor Frédéric Auguste Bartholdi was designing the Statue of Liberty, he sought the advice of engineer Gustave Eiffel. Eiffel suggested
that he make the statue’s arm thick and position it straight above the figure’s head. ______ Bartholdi decided to slim the arm and tilt it out at an
angle.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Additionally,"}, {"label": "B", "body": "Instead,"}, {"label": "C", "body": "Thus,"}, {"label": "D", "body": "For example,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Instead" logically signals that the information in this sentence—that Bartholdi decided to slim and tilt out the arm of
the Statue of Liberty—contrasts with Eiffel’s design suggestions for the statue.
Choice A is incorrect because "additionally" illogically suggests that the information in this sentence is merely an additional fact related to Eiffel’s
design suggestions in the previous sentence. Instead, it contrasts with those suggestions. Choice C is incorrect because "thus" illogically signals
that the information that follows is a result of Eiffel’s design suggestions in the previous sentence. Instead, it contrasts with those suggestions.
Choice D is incorrect because "for example" illogically signals that the information about Bartholdi’s design decisions in this sentence
exemplifies Eiffel’s design suggestions in the previous sentence. Instead, it contrasts with those suggestions.$qb$);
select seed_pool_question($qb$CB-29ae4d48$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the early 1970s, Albert Popa took up graffiti art, spraying his work onto what was at the time an unconventional surface: concrete. ______
Albert’s son David has chosen an unusual canvas for his new art project, Fractured. In this remarkable work, the artist draws charcoal faces onto
fragmented ice floes in Finland, creating the visual effect of a face slowly fracturing.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "Indeed,"}, {"label": "C", "body": "Second,"}, {"label": "D", "body": "Likewise,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Likewise" logically signals that the information about Albert’s son David is similar to the previous information about
Albert Popa. Both artists have used unconventional surfaces for their work: Albert used concrete, and David is using ice floes.
Choice A is incorrect because "however" illogically signals that the information about David contrasts with the previous information about Albert
Popa. Instead, it is similar to the previous information about Albert Popa. Choice B is incorrect because "indeed" illogically signals that the
information about David emphasizes or strengthens the previous point about Albert Popa. Instead, it is similar to the previous information; it
highlights a similarity between father and son. Choice C is incorrect because "second" illogically signals that the information about David is a
second point or reason separate from the previous information about Albert Popa. Instead, it is similar to the previous information; it highlights a
similarity between father and son.$qb$);
select seed_pool_question($qb$CB-9dc4e640$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The mineral mtorolite is most commonly found in Zimbabwe. Mtorolite is cryptocrystalline, meaning that its crystalline structure is so fine that
the individual crystals cannot be distinguished by the naked eye or even under a microscope. The crystals in microcrystalline minerals are also
not visible to the naked eye; ______ they can usually be seen under a microscope.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "thus,"}, {"label": "B", "body": "for example,"}, {"label": "C", "body": "that said,"}, {"label": "D", "body": "similarly,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer because "that said" logically signals that the information that follows—that the crystals of microcrystalline minerals
can be seen with a microscope—is an exception to the previous information about the crystalline structure of minerals not being visible under a
microscope.
Choice A is incorrect because "thus" illogically signals that the information that follows is a direct result or consequence of the fact that the
crystals of microcrystalline minerals aren’t visible to the naked eye. Instead, the fact that they can be seen under a microscope is an exception to
the previous information about crystalline minerals. Choice B is incorrect because "for example" illogically signals that the information that
follows exemplifies the fact that the crystals of microcrystalline minerals aren’t visible to the naked eye. Instead, the fact that they can be seen
under a microscope is an exception to the previous information about crystalline minerals. Choice D is incorrect because "similarly" illogically
signals that the information that follows is similar or comparable to the fact that the crystals of microcrystalline minerals aren’t visible to the
naked eye. Instead, the fact that they can be seen under a microscope is an exception to the previous information about crystalline minerals.$qb$);
select seed_pool_question($qb$CB-113f16da$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Some animals have evolved to physically resemble another animal, plant, or object.
· This is known as mimicry.
? Crab spiders mimic the appearance of flowers.
? This helps crab spiders ambush their prey.
? Katydids mimic the appearance of leaves.
? This helps katydids hide from their predators.
The student wants to emphasize a difference in how katydids and crab spiders use mimicry. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-113f16da.png$qb$, $qb$[{"label": "A", "body": "Katydids mimic the appearance of flowers, and crab spiders mimic that of leaves."}, {"label": "B", "body": "Katydids and crab spiders are two examples of animals that use mimicry."}, {"label": "C", "body": "Unlike crab spiders, which use mimicry to ambush prey, katydids use mimicry to hide from predators."}, {"label": "D", "body": "Animals that use mimicry have evolved to resemble another animal, plant, or object."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence uses "unlike" to emphasize a difference in how katydids and crab spiders use mimicry, noting that
crab spiders use mimicry to ambush prey while katydids use it to hide from predators.
Choice A is incorrect. While the sentence does contrast katydids and crab spiders, it misrepresents the information in the notes. Katydids mimic
the appearance of leaves (not flowers), whereas crab spiders mimic the appearance of flowers (not leaves). Choice B is incorrect. While the
sentence indicates that katydids and crab spiders use mimicry, it doesn’t emphasize a difference in how they use it. Choice D is incorrect. The
sentence describes what mimicry is; it doesn’t emphasize a difference in how katydids and crab spiders specifically use mimicry.$qb$);
select seed_pool_question($qb$CB-6081831f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When Chinese director Chloé Zhao accepted the Oscar in 2021 for her film Nomadland, she made Academy Award history. ______ only one other
woman, Kathryn Bigelow of the United States, had been named best director at the Oscars, making Zhao the second woman and the first Asian
woman to win the award.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "As a result,"}, {"label": "B", "body": "Previously,"}, {"label": "C", "body": "However,"}, {"label": "D", "body": "Likewise,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Previously” logically signals that the event described in this sentence—Bigelow being named best director—
occurred before Zhao’s win. The fact that only one other woman had won the award before puts Zhao’s win in perspective.
Choice A is incorrect because “as a result” illogically signals that the event described in this sentence occurred as a result or consequence of
Zhao’s win. Instead, it occurred before Zhao was named best director and puts Zhao’s win in perspective. Choice C is incorrect because
“however” illogically signals that the event described in this sentence occurred in spite of or in contrast to Zhao’s win. Instead, it occurred before
Zhao was named best director and puts Zhao’s win in perspective. Choice D is incorrect because “likewise” illogically signals that this sentence
merely adds a second, similar piece of information to the information about Zhao’s win. Instead, the fact that only one other woman had won the
award before puts Zhao’s win in perspective.$qb$);
select seed_pool_question($qb$CB-0c0d50e1$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Coastal Virginia Offshore Wind project is anticipated to generate 2.6 gigawatts of energy, enough to power almost one million homes. As its
name indicates, the project—currently in development—consists of wind turbines located off the Virginia coast. ______ the project plan calls for
176 large turbines to be placed at a site 27 miles east of Virginia Beach.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "To be exact,"}, {"label": "B", "body": "In conclusion,"}, {"label": "C", "body": "As a result,"}, {"label": "D", "body": "In contrast,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "To be exact" logically signals that this sentence about the Coastal Virginia Offshore Wind project plan provides
specific, precise details—number of turbines, location of site—elaborating on the more general information about the project in the previous
sentence.
Choice B is incorrect because "in conclusion" illogically signals that the information in this sentence about the Coastal Virginia Offshore Wind
project plan concludes or summarizes the discussion of the project in the previous sentences. Instead, the sentence provides specific, precise
details elaborating on the previous information. Choice C is incorrect because "as a result" illogically signals that the information in this sentence
about the Coastal Virginia Offshore Wind project plan is caused by, or occurs as a result of, the information about the project in the previous
sentence. Instead, the sentence provides specific, precise details elaborating on the previous information. Choice D is incorrect because "in
contrast" illogically signals that the information in this sentence about the Coastal Virginia Offshore Wind project plan contrasts with information
about the project in the previous sentence. Instead, the sentence provides specific, precise details elaborating on the previous information.$qb$);
select seed_pool_question($qb$CB-f5149550$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A staunch supporter of women’s voting rights, Wilhelmina Kekelaokalaninui Widemann Dowsett sought to coordinate the efforts of suffragists in
her native Hawai‘i. ______ in 1912, she founded the National Women’s Equal Suffrage Association of Hawai‘i, an organization that lobbied for
women’s voting rights in the US territory.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "In other words,"}, {"label": "B", "body": "Conversely,"}, {"label": "C", "body": "To that end,"}, {"label": "D", "body": "Alternatively,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “To that end” logically signals that the information in this sentence—that Dowsett founded the National Women’s
Equal Suffrage Association of Hawai‘i—describes an action Dowsett took to achieve the goal stated in the previous sentence: to coordinate the
efforts of suffragists in Hawai‘i.
Choice A is incorrect because “in other words” illogically signals that the information in this sentence about Dowsett founding a women’s
suffrage association is a paraphrase or restatement of the previous information about Dowsett seeking to coordinate suffragists’ efforts.
Instead, the sentence describes a specific action Dowsett took to achieve this goal. Choice B is incorrect because “conversely” illogically signals
that the information in this sentence about Dowsett founding a women’s suffrage association contrasts with the previous information about
Dowsett seeking to coordinate suffragists’ efforts. Instead, the sentence describes a specific action Dowsett took to achieve this goal. Choice D
is incorrect because “alternatively” illogically signals that the information in this sentence about Dowsett founding a women’s suffrage
association presents an alternative to her seeking to coordinate suffragists’ efforts. Instead, the sentence describes a specific action Dowsett
took to achieve this goal.$qb$);
select seed_pool_question($qb$CB-d436a2b2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Komodo dragons are the largest lizards in the world.
· They live on four islands in Komodo National Park, Indonesia.
? The park has a total of twenty-nine islands.
The student wants to emphasize how many islands in Komodo National Park have Komodo dragons living on them. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d436a2b2.png$qb$, $qb$[{"label": "A", "body": "Komodo dragons, the world’s largest lizards, live on islands in Komodo National Park, Indonesia."}, {"label": "B", "body": "The largest lizards in the world are found in Komodo National Park."}, {"label": "C", "body": "Only four of the twenty-nine islands in Komodo National Park have Komodo dragons living on them."}, {"label": "D", "body": "There are twenty-nine islands in Indonesia’s Komodo National Park."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes the number of islands in Komodo National Park that have Komodo dragons living on
them, noting that four of the park’s twenty-nine islands have Komodo dragons.
Choice A is incorrect. While the sentence does explain that Komodo dragons live on the islands of Komodo National Park, it doesn’t emphasize
how many of those islands Komodo dragons live on. Choice B is incorrect. The sentence explains that Komodo National Park contains the
world’s largest lizards; it doesn’t identify these lizards as Komodo dragons or emphasize how many of the park’s islands the lizards live on.
Choice D is incorrect. The sentence specifies the total number of islands in Komodo National Park; it doesn’t emphasize how many of those
islands have Komodo dragons.$qb$);
select seed_pool_question($qb$CB-20e4ff59$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Famous for its four-degree tilt, the leaning Garisenda Tower is a popular attraction in Bologna’s city center. However, measurements taken in
2023 showed that the tower was rotating in a concerning way. ______ city officials closed the area around the tower so experts could explore
solutions to stabilize the historical twelfth-century structure.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "As a result,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "In comparison,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "As a result" logically signals that the action described in this sentence—closing the area around Garisenda Tower to
explore stabilization solutions—occurred as a consequence or result of measurements revealing the tower’s concerning rotation.
Choice A is incorrect because "similarly" illogically signals that the action of closing the tower area is similar to the discovery of concerning
rotation described in the previous sentence. Instead, closing the area around the tower to explore solutions occurred as a result of the
measurements revealing the rotation. Choice C is incorrect because "for example" illogically signals that the action of closing the tower area
serves as an example of the tower’s concerning rotation described in the previous sentence. Instead, closing the area around the tower to
explore solutions occurred as a result of the measurements revealing the rotation. Choice D is incorrect because "in comparison" illogically
signals that the action of closing the tower area is being compared to the discovery of concerning rotation described in the previous sentence.
Instead, closing the area around the tower to explore solutions occurred as a result of the measurements revealing the rotation.$qb$);
select seed_pool_question($qb$CB-129089b5$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 1933, the Twentieth Amendment to the US Constitution was ratified. The amendment mandates that presidential inaugurations be held on
January 20, approximately ten weeks after the November election. ______ this amendment requires newly elected US senators and
representatives to be sworn into their respective offices on January 3.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Instead,"}, {"label": "B", "body": "For instance,"}, {"label": "C", "body": "Specifically,"}, {"label": "D", "body": "In addition,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “In addition” logically signals that the information in this sentence—that the Twentieth Amendment requires newly
elected US senators and representatives to be sworn in on January 3—is separate from and additional to the amendment’s mandate concerning
presidential inaugurations.
Choice A is incorrect because “instead” illogically signals that the information in the sentence presents an alternative to or substitute for the
Twentieth Amendment’s mandate concerning presidential inaugurations. Rather, the sentence presents a separate requirement in addition to that
one. Choice B is incorrect because “for instance” illogically signals that the information in the sentence exemplifies the Twentieth Amendment’s
mandate concerning presidential inaugurations. Instead, the sentence presents a separate requirement in addition to that one. Choice C is
incorrect because “specifically” illogically signals that the sentence provides specific, precise details elaborating on the Twentieth Amendment’s
mandate concerning presidential inaugurations. Instead, the sentence presents a separate requirement in addition to that one.$qb$);
select seed_pool_question($qb$CB-f4b63a04$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 2013, paleontology professor Hesham Sallam and his students from Mansoura University in Egypt made a discovery.
· The team found a partial dinosaur skeleton at a site in Egypt’s Dakhla Oasis.
? The skeleton belonged to a dinosaur species that lived approximately 80 million years ago.
? The new species was named Mansourasaurus to recognize the team that discovered it.
The student wants to explain the origin of the species’ name. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f4b63a04.png$qb$, $qb$[{"label": "A", "body": "Mansourasaurus, a new species discovered in Egypt in 2013, lived approximately 80 million years ago."}, {"label": "B", "body": "A partial dinosaur skeleton found in Egypt’s Dakhla Oasis belonged to a species named Mansourasaurus."}, {"label": "C", "body": "Mansourasaurus, a species that lived approximately 80 million years ago, was discovered in 2013 by Egyptian paleontologist Hesham Sallam and a team of university students."}, {"label": "D", "body": "The new species was named Mansourasaurus to recognize the team that discovered it, a professor and students from Mansoura University."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. It explains where the dinosaur’s name came from.
Choice A is incorrect. This choice does not explain the origin of the dinosaur’s name. Choice B is incorrect. This choice does not explain the
origin of the dinosaur’s name. Choice C is incorrect. This choice does not explain the origin of the dinosaur’s name.$qb$);
select seed_pool_question($qb$CB-af88c47a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Freddie Wong (born 1985) is a director and special effects artist from the United States.
· He is best known for the action-comedy web series Video Game High School (VGHS).
? VGHS premiered in 2012 on RocketJump, a YouTube channel that Wong cocreated.
? The series was celebrated for its inventive video game–centric world and high-quality special effects.
? VGHS was nominated for a Producers Guild Award for Outstanding Digital Series.
The student wants to begin a narrative about Wong’s award-nominated web series. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-af88c47a.png$qb$, $qb$[{"label": "A", "body": "In 2012, director and visual effects artist Freddie Wong launched a new action-comedy web series: Video Game High School."}, {"label": "B", "body": "Video Game High School was celebrated for its inventive video game–centric world and high-quality special effects, and it was nominated for a Producer’s Guild Award for Outstanding Digital Series."}, {"label": "C", "body": "Wong, cocreator of the YouTube channel RocketJump, would go on to see his web series be nominated for a Producers Guild Award."}, {"label": "D", "body": "In 2012, Video Game High School premiered on RocketJump; it would later be nominated for an award."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice introduces Wong and VGHS in an active and specific way, as if to an audience unfamiliar with the series.
It also sets up the time and genre of the web series, which are useful ways to introduce the series of events in a narrative.
Choice B is incorrect. This choice isn’t suited for beginning a narrative. A narrative is a story that follows a sequence of events and creates
interest and suspense for the reader. This choice jumps to the end, explaining the success of VGHS without explaining what it is. Choice C is
incorrect. This choice isn’t suited for beginning a narrative. It doesn’t actually introduce the web series by name. It just jumps to later in the story
without sufficient explanation. Choice D is incorrect. This choice is not very effective for beginning a narrative. It doesn’t explain what VGHS is,
and it doesn’t mention Wong.$qb$);
select seed_pool_question($qb$CB-d6dec50e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 2019, Emily Shepard and colleagues in the UK and Germany studied the effect of wind on auks’ success in landing at cliffside nesting
sites.
? They found as wind conditions intensified, the birds needed more attempts in order to make a successful landing.
? When the wind was still, almost 100% of landing attempts were successful.
? In a strong breeze, approximately 40% of attempts were successful.
? In near-gale conditions, only around 20% of attempts were successful.
The student wants to summarize the study. Which choice most effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d6dec50e.png$qb$, $qb$[{"label": "A", "body": "For a 2019 study, researchers from the UK and Germany collected data on auks’ attempts to land at cliffside nesting sites in different wind conditions."}, {"label": "B", "body": "Emily Shepard and her colleagues wanted to know the extent to which wind affected auks’ success in landing at cliffside nesting sites, so they conducted a study."}, {"label": "C", "body": "Knowing that auks often need multiple attempts to land at their cliffside nesting sites, Emily Shepard studied the birds’ success rate, which was only around 20% in some conditions."}, {"label": "D", "body": "Emily Shepard’s 2019 study of auks’ success in landing at cliffside nesting sites showed that as wind conditions intensified, the birds’ success rate decreased."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence effectively summarizes the study, noting who conducted it, when it was conducted, and what its
results showed: that auks’ landing success rate decreased as wind conditions intensified.
Choice A is incorrect. While the sentence presents the methodology of the study—that is, the approach taken by the researchers—it fails to
summarize the study as a whole. Choice B is incorrect. While the sentence presents the aim, or goal, of the study, it fails to summarize the study
as a whole. Choice C is incorrect. While the sentence indicates what Shepard studied, it fails to mention a key factor: the effect of wind. It thus
fails to summarize the study as a whole.$qb$);
select seed_pool_question($qb$CB-94cb8720$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 2020, theater students at Radford and Virginia Tech chose an interactive, online format to present a play about woman suffrage
activists.
? Their “Women and the Vote” website featured an interactive digital drawing of a Victorian-style house.
? Audiences were asked to focus on a room of their choice and select from that room an artifact related to the suffrage movement.
? One click took them to video clips, songs, artwork, and texts associated with the artifact.
? The play was popular with audiences because the format allowed them to control the experience.
The student wants to explain an advantage of the “Women and the Vote” format. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-94cb8720.png$qb$, $qb$[{"label": "A", "body": "“Women and the Vote” featured a drawing of a Victorian-style house with several rooms, each containing suffrage artifacts."}, {"label": "B", "body": "To access video clips, songs, artwork, and texts, audiences had to first click on an artifact."}, {"label": "C", "body": "The “Women and the Vote” format appealed to audiences because it allowed them to control the experience."}, {"label": "D", "body": "Using an interactive format, theater students at Radford and Virginia Tech created “Women and the Vote,” a play about woman suffrage activists."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence explains an advantage of the “Women and the Vote” format, noting that the format appealed to
audiences because it allowed them to control the experience.
Choice A is incorrect. The sentence describes a digital drawing on the “Women and the Vote” website; it doesn’t explain an advantage of the
play’s format. Choice B is incorrect. The sentence explains how audiences interacted with the “Women and the Vote” website; it doesn’t explain
an advantage of the play’s format. Choice D is incorrect. While the sentence mentions that “Women and the Vote” had an interactive format, it
doesn’t explain what advantage this format might have.$qb$);
select seed_pool_question($qb$CB-ddb77846$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$My interest in old public libraries has led me to seek them out whenever I visit a new part of the United States. ______ I could visit every state in
the US and still not find the oldest public library in the Western Hemisphere. That library, the Biblioteca Palafoxiana, is located in Puebla, Mexico.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "As a result,"}, {"label": "B", "body": "Nevertheless,"}, {"label": "C", "body": "Earlier,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Nevertheless" logically signals that the claim in the sentence—that the speaker could visit every state in the US and
not find the oldest public library in the Western Hemisphere—is true despite the previous claim about the speaker seeking out old public libraries.
Choice A is incorrect because "as a result" illogically signals that the claim in the sentence is a consequence of the previous claim about the
speaker seeking out old public libraries. Instead, the claim is true despite the previous claim. Choice C is incorrect because "earlier" illogically
signals that the claim in the sentence occurs earlier in a chronological sequence of events than the previous claim about the speaker seeking out
old public libraries. Instead, the claim is true despite the previous claim. Choice D is incorrect because "in other words" illogically signals that the
claim in the sentence is merely a paraphrase or restatement of the previous claim about the speaker seeking out old public libraries. Instead, the
claim is true despite the previous claim.$qb$);
select seed_pool_question($qb$CB-a266d876$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Upper-atmospheric jets—phenomena whereby electrical discharges cause narrow cones of blue light to briefly burst upward from the tops of
thunderclouds—have been observed reaching the ionosphere. The extreme altitudes involved (the ionosphere begins about 80 km above Earth)
mark these gigantic jets as outliers; ______ the majority of jets reach heights of only 20 to 50 km.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "nevertheless,"}, {"label": "B", "body": "consequently,"}, {"label": "C", "body": "indeed,"}, {"label": "D", "body": "in addition,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Indeed” logically signals that the information that follows—that the majority of jets reach heights of only 20 to 50
km—offers additional emphasis in support of the previous claim that jets reaching the ionosphere (about 80 km above Earth) are outliers.
Choice A is incorrect because “nevertheless” illogically signals that the information about most jets reaching heights of only 20 to 50 km
contrasts with the previous claim that jets reaching the ionosphere are outliers. Instead, it provides additional emphasis in support of that claim.
Choice B is incorrect because “consequently” illogically signals that the information about most jets reaching heights of only 20 to 50 km is a
consequence, or result, of some jets being outliers. Instead, it offers additional emphasis in support of the claim that jets reaching the
ionosphere are outliers. Choice D is incorrect because “in addition” illogically signals that the information about most jets reaching heights of
only 20 to 50 km merely adds to the previous claim that jets reaching the ionosphere are considered outliers. Instead, it provides additional
emphasis in support of that claim.$qb$);
select seed_pool_question($qb$CB-9551ef8b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The magnificent frigatebird (fregata magnificens) is a species of seabird that feeds mainly on fish, tuna, squid, and other small sea
animals.
? It is unusual among seabirds in that it doesn’t dive into the water for prey.
? One way it acquires food is by using its hook-tipped bill to snatch prey from the surface of the water.
? Another way it acquires food is by taking it from weaker birds by force.
? This behavior is known as kleptoparasitism.
The student wants to emphasize a similarity between the two ways a magnificent frigatebird acquires food. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9551ef8b.png$qb$, $qb$[{"label": "A", "body": "A magnificent frigatebird never dives into the water, instead using its hook-tipped bill to snatch prey from the surface."}, {"label": "B", "body": "Neither of a magnificent frigatebird’s two ways of acquiring food requires the bird to dive into the water."}, {"label": "C", "body": "Of the magnificent frigatebird’s two ways of acquiring food, only one is known as kleptoparasitism."}, {"label": "D", "body": "In addition to snatching prey from the water with its hook-tipped bill, a magnificent frigatebird takes food from other birds by force."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence emphasizes a similarity between the two ways a magnificent frigatebird acquires food, noting that
neither way requires the seabird to dive into the water.
Choice A is incorrect. The sentence describes how a magnificent frigatebird captures prey without diving into water; it doesn’t emphasize a
similarity between the two ways the seabird acquires food. Choice C is incorrect. The sentence notes the term used to describe one of the two
ways that magnificent frigatebirds acquire food; it doesn’t emphasize a similarity between the two ways. Choice D is incorrect. The sentence
describes the two ways that a magnificent frigatebird acquires food; it doesn’t emphasize a similarity between the two ways.$qb$);
select seed_pool_question($qb$CB-9fe7315b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Few New Yorkers have heard Thelma Pollard’s name. ______ many have seen her work in the famous Broadway musical The Phantom of the
Opera. As the musical’s longtime makeup supervisor, Pollard put the iconic makeup on the face of the Phantom himself.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "Therefore,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "However" logically signals that the claim in this sentence—that many New Yorkers have seen Pollard’s work in a
famous Broadway musical—is true despite the previous information that few New Yorkers have heard Pollard’s name.
Choice A is incorrect because "similarly" illogically signals that the claim in this sentence is similar to the previous information that few New
Yorkers have heard Pollard’s name. Instead, the claim that many New Yorkers have seen Pollard’s work is true despite the previous information.
Choice B is incorrect because "therefore" illogically signals that the claim in this sentence is a result of the previous information that few New
Yorkers have heard Pollard’s name. Instead, the claim that many New Yorkers have seen Pollard’s work is true despite the previous information.
Choice C is incorrect because "for example" illogically signals that the claim in this sentence exemplifies the previous information that few New
Yorkers have heard Pollard’s name. Instead, the claim that many New Yorkers have seen Pollard’s work is true despite the previous information.$qb$);
select seed_pool_question($qb$CB-fc5e83cc$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When following musical scores, professional opera singers like soprano Ana María Martínez take vocal directions from descriptive notations,
typically in Italian, that appear alongside the musical notes. ______ these descriptive terms might guide the performer to sing giocoso (playfully)
or lento (at a slow tempo).
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "On the other hand,"}, {"label": "B", "body": "All the same,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "In the second place,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "For example" logically signals that this sentence supports the previous information about the descriptive notations
opera singers use by providing specific examples of these notations: giocoso (playfully) and lento (at a slow tempo).
Choice A is incorrect because "on the other hand" illogically signals that the information in this sentence contrasts with the previous information
about the descriptive notations opera singers use. Instead, the sentence provides examples of these notations. Choice B is incorrect because "all
the same" illogically signals that the information in this sentence is true despite the previous information about the descriptive notations opera
singers use. Instead, the sentence provides examples of these notations. Choice D is incorrect because "in the second place" illogically signals
that the information in this sentence is a second point that is separate from the previous information about the descriptive notations opera
singers use. Instead, the sentence provides examples of these notations.$qb$);
select seed_pool_question($qb$CB-911c7a87$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$After appropriate permissions are granted, a typical archaeological dig begins with a surveyor making a detailed grid of the excavation site. Then,
the site is carefully dug, and any artifacts found are recorded and mapped onto the site grid. ______ the artifacts are removed, cataloged, and
analyzed in a laboratory.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "For instance,"}, {"label": "B", "body": "On the contrary,"}, {"label": "C", "body": "Earlier,"}, {"label": "D", "body": "Finally,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Finally" logically signals that the actions in this sentence—the removal, cataloging, and analysis of artifacts—are the
next and final steps in a process, following the previous actions of surveying, digging, recording, and mapping.
Choice A is incorrect because "for instance" illogically signals that the actions in this sentence are an example of the actions in the previous
sentence. Instead, the removal, cataloging, and analysis of artifacts are the next and final steps in a process. Choice B is incorrect because "on
the contrary" illogically signals that the actions in this sentence are directly opposed to the actions in the previous sentence. Instead, the
removal, cataloging, and analysis of artifacts are the next and final steps in a process. Choice C is incorrect because "earlier" illogically signals
that the actions in this sentence occur before the actions in the previous sentence. Instead, the removal, cataloging, and analysis of artifacts are
the next and final steps in a process.$qb$);
select seed_pool_question($qb$CB-9502ec65$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When soil becomes contaminated by toxic metals, it can be removed from the ground and disposed of in a landfill. ______ contaminated soil can
be detoxified via phytoremediation: plants that can withstand high concentrations of metals absorb the pollutants and store them in their shoots,
which are then cut off and safely disposed of, preserving the health of the plants.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Alternatively,"}, {"label": "B", "body": "Specifically,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "As a result,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “Alternatively” logically signals that the soil decontamination method described in this sentence—removing toxic
metals from the soil via phytoremediation—offers an alternative to the previously described method (removing the contaminated soil from the
ground).
Choice B is incorrect because “specifically” illogically signals that the soil decontamination method described in this sentence specifies or
elaborates on an aspect of the previously described method (removing the contaminated soil from the ground). Instead, phytoremediation is an
alternative to that method. Choice C is incorrect because “for example” illogically signals that the soil decontamination method described in this
sentence is an example of the previously described method (removing the contaminated soil from the ground). Instead, phytoremediation is an
alternative to that method. Choice D is incorrect because “as a result” illogically signals that the soil decontamination method described in this
sentence is a result or consequence of the previously described method (removing the contaminated soil from the ground). Instead,
phytoremediation is an alternative to that method.$qb$);
select seed_pool_question($qb$CB-6de02dfa$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:​
? Thailand’s annual Songkran Water Festival is held each April.
· It marks Songkran, the traditional Thai New Year.
? People splash and spray each other for fun at the festival’s community-wide water fights.
? In Bangkok, thousands gather along Silom Road for the city’s largest water fight.
? In Chiang Mai, thousands gather at a historical monument called the Tha Phae Gate for the city’s largest water fight.
The student wants to emphasize a similarity in how people in Bangkok and Chiang Mai celebrate Songkran. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6de02dfa.png$qb$, $qb$[{"label": "A", "body": "The largest water fight in Bangkok takes place along a city street, whereas the largest water fight in Chiang Mai takes place at a historical monument."}, {"label": "B", "body": "In both Bangkok and Chiang Mai, thousands gather to celebrate Songkran with water fights."}, {"label": "C", "body": "People in both Bangkok and Chiang Mai celebrate Songkran, but they don’t do so in exactly the same way."}, {"label": "D", "body": "Each April, people in Thailand celebrate Songkran, the traditional Thai New Year."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence emphasizes a similarity in how people in Bangkok and Chiang Mai celebrate Songkran, indicating that
people in both cities gather to celebrate with water fights.
Choice A is incorrect. The sentence notes the different locations of the largest water fight in Bangkok and the largest water fight in Chiang Mai; it
doesn’t emphasize a similarity in how people in Bangkok and Chiang Mai celebrate Songkran. Choice C is incorrect. The sentence indicates that
people in Bangkok and Chiang Mai don’t celebrate Songkran in exactly the same way; it doesn’t emphasize a similarity in how people in the two
cities celebrate Songkran. Choice D is incorrect. The sentence explains when people in Thailand celebrate Songkran; it doesn’t emphasize a
similarity in how people in Bangkok and Chiang Mai celebrate Songkran.$qb$);
select seed_pool_question($qb$CB-c92ea686$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Ramayana is a Sanskrit epic poem from ancient India.
· In The Ramayana, the character Kaikeyi is often portrayed as a villain.
? Kaikeyi is a 2022 novel by Vaishnavi Patel.
? The novel is a retelling of the epic poem from Kaikeyi’s point of view.
? It often portrays Kaikeyi as heroic.
The student wants to emphasize whose point of view the novel is told from. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c92ea686.png$qb$, $qb$[{"label": "A", "body": "From the point of view of The Ramayana, the character Kaikeyi is often a villain."}, {"label": "B", "body": "Vaishnavi Patel often portrays the character as heroic."}, {"label": "C", "body": "Kaikeyi is a retelling of The Ramayana from the character Kaikeyi’s point of view."}, {"label": "D", "body": "The Ramayana is an epic poem that features the character Kaikeyi."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes whose point of view the novel Kaikeyi is told from: the character Kaikeyi’s.
Choice A is incorrect. While the sentence does discuss point of view, it focuses on that of the epic poem rather than the novel. Choice B is
incorrect. While the sentence seems to be referring to Patel’s novel, it doesn’t establish whose point of view the novel is told from. Choice D is
incorrect. The sentence discusses the character Kaikeyi in the context of the epic poem; it doesn’t discuss the novel’s point of view.$qb$);
select seed_pool_question($qb$CB-2df7b582$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Plato believed material objects to be crude representations of unseen ideal forms. In his view, such abstract, nonmaterial forms are the ultimate
source of knowledge. Aristotle disagreed, positing that knowledge is best obtained through direct engagement with the material world; ______
sensory experience of the material is the ultimate source of knowledge.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "regardless,"}, {"label": "B", "body": "admittedly,"}, {"label": "C", "body": "in other words,"}, {"label": "D", "body": "meanwhile,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “In other words” logically signals that the claim about sensory experience that follows—that sensory experience is
the source of knowledge—is a restatement of Aristotle’s theory from earlier in the sentence.
Choice A is incorrect because “regardless” illogically signals that the claim about sensory experience that follows is true in spite of Aristotle’s
theory from earlier in the sentence. Instead, this claim is a restatement of his theory. Choice B is incorrect because “admittedly” illogically signals
that the claim about sensory experience that follows is an exception to Aristotle’s theory from earlier in the sentence. Instead, this claim is a
restatement of his theory. Choice D is incorrect because “meanwhile” illogically signals that the claim about sensory experience that follows is
separate from (while occurring simultaneously with) Aristotle’s theory from earlier in the sentence. Instead, this claim is a restatement of his
theory.$qb$);
select seed_pool_question($qb$CB-f8c4591b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$With their distinctive cone shapes and steeply sloping sides, the volcanoes Hverfjall (Iceland) and Toliman (Guatemala) may look similar from
afar. Tehnuka Ilanko and other volcanologists, ______ can tell by how each was formed that Hverfjall is a cinder cone volcano, while Toliman is a
composite volcano.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "for example,"}, {"label": "B", "body": "in addition,"}, {"label": "C", "body": "therefore,"}, {"label": "D", "body": "though,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "Though" logically signals that the information in this sentence—that volcanologists can distinguish the two
volcanoes by how they were formed—presents a qualification or exception to the previous statement that the volcanoes look similar. The
volcanoes are actually of two different types.
Choice A is incorrect because "for example" illogically signals that the information in this sentence exemplifies the previous information about
the volcanoes looking similar. Instead, the sentence presents a qualification to that apparent similarity—the volcanoes are actually of two
different types. Choice B is incorrect because "in addition" illogically signals that the information in this sentence merely adds to the previous
information about the volcanoes looking similar. Instead, the sentence presents a qualification to that apparent similarity—the volcanoes are
actually of two different types. Choice C is incorrect because "therefore" illogically signals that the information in this sentence is a result of the
previous information about the volcanoes looking similar. Instead, the sentence presents a qualification to that apparent similarity—the
volcanoes are actually of two different types.$qb$);
select seed_pool_question($qb$CB-42870a4e$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Marcel Duchamp intended his 1917 so-called ready-made sculpture Fountain to challenge then-prevailing conceptions about the nature of art.
______ Duchamp’s Fountain did just that, raising the question of whether displaying any object in an art gallery could be said to transform the
object—even, as Duchamp’s sculpture was, a urinal—into a legitimate work of art.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "Indeed,"}, {"label": "C", "body": "Instead,"}, {"label": "D", "body": "In addition,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "Indeed" logically signals that the information in this sentence—that the sculpture raised the question of whether
displaying any object in an art gallery transforms the object into a work of art—offers emphasis in support of the claim in the previous sentence
that the sculpture was intended to challenge conceptions about the nature of art.
Choice A is incorrect because "similarly" illogically signals that information in this sentence is similar to the claim about the sculptor’s intention in
the previous sentence. Instead, the information about the question raised by the sculpture offers emphasis in support of that claim. Choice C is
incorrect because "instead" illogically signals that the information in this sentence is an alternative to the claim about the sculptor’s intention in
the previous sentence. Rather, the information about the question raised by the sculpture offers emphasis in support of that claim. Choice D is
incorrect because "in addition" illogically signals that the information in this sentence is merely an additional fact related to the claim about the
sculptor’s intention in the previous sentence. Instead, the information about the question raised by the sculpture offers emphasis in support of
that claim.$qb$);
select seed_pool_question($qb$CB-49ecf985$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$On March 3, 1991, Switzerland’s government lowered the minimum voting age for its citizens from 20 to 18 years old. ______ many people in
Switzerland gained a new opportunity to participate in their country’s political process.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Nevertheless,"}, {"label": "B", "body": "As a result,"}, {"label": "C", "body": "By contrast,"}, {"label": "D", "body": "Similarly,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. "As a result" logically signals that the information in this sentence—that many people in Switzerland gained a new
opportunity to participate in their country’s political process—is a result or consequence of the previous information about the Swiss government
lowering the voting age.
Choice A is incorrect because "nevertheless" illogically signals that the information that follows is despite the information in the previous
sentence about the Swiss government lowering the voting age. Instead, people gained a new opportunity to participate in Switzerland’s political
process as a result or consequence of that change. Choice C is incorrect because "by contrast" illogically signals that the information in this
sentence contrasts with the information in the previous sentence about the Swiss government lowering the voting age. Instead, people gained a
new opportunity to participate in Switzerland’s political process as a result or consequence of that change. Choice D is incorrect because
"similarly" illogically signals that the information in this sentence is similar to the information about the Swiss government lowering the voting
age in the previous sentence. Instead, people gained a new opportunity to participate in Switzerland’s political process as a result or
consequence of that change.$qb$);
select seed_pool_question($qb$CB-64bcdf3d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Giant dust plumes from the Sahara Desert that blow across the Atlantic Ocean can have complex and opposing effects on tropical cyclones. On
one hand, the dust can enhance the formation of ice clouds in the cyclone’s core, increasing precipitation. ______ the dust can lower sea surface
temperatures around the cyclone’s core, weakening the storm.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Previously,"}, {"label": "B", "body": "In other words,"}, {"label": "C", "body": "For example,"}, {"label": "D", "body": "On the other hand,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “On the other hand” logically signals that the information in this sentence—that dust can lower sea surface
temperatures, weakening the storm—presents an opposing effect to the one described in the previous sentence, in which dust enhances ice
cloud formation and increases precipitation.
Choice A is incorrect because “previously” illogically signals that the information in this sentence is an event that occurred before the dust-
enhanced ice cloud formation mentioned in the previous sentence. Instead, the dust lowering surface temperatures—and weakening the storm—
is an opposing effect. Choice B is incorrect because “in other words” illogically signals that the information in this sentence is a paraphrase or
restatement of the previous information about dust enhancing ice cloud formation. Instead, the dust lowering surface temperatures—and
weakening the storm—is an opposing effect. Choice C is incorrect because “for example” illogically signals that the information in this sentence
is an example of the previous information about dust enhancing ice cloud formation. Instead, the dust lowering surface temperatures—and
weakening the storm—is an opposing effect.$qb$);
select seed_pool_question($qb$CB-1bb4aec8$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Meteorites found on Earth are divided into two categories.
· A meteorite that was observed falling to Earth before being recovered is known as a meteorite fall.
? All other meteorites found on Earth are known as meteorite finds.
? There have been about 1,200 recorded meteorite falls.
? There have been over 60,000 recorded meteorite finds.
The student wants to contrast the number of meteorite falls with the number of meteorite finds. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1bb4aec8.png$qb$, $qb$[{"label": "A", "body": "A meteorite that was observed falling to Earth before being recovered is known as a meteorite fall; all others are known as meteorite finds."}, {"label": "B", "body": "Meteorites found on Earth are divided into two categories: meteorite falls and meteorite finds."}, {"label": "C", "body": "There have been about 1,200 recorded meteorite falls, or meteorites observed falling to Earth."}, {"label": "D", "body": "While there have been only about 1,200 recorded meteorite falls, there have been over 60,000 meteorite finds."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence contrasts the number of meteorite falls with the number of meteorite finds, noting that there have
been over 60,000 meteorite finds but only about 1,200 recorded meteorite falls.
Choice A is incorrect. While the sentence explains the difference between meteorite falls and meteorite finds, it doesn’t contrast the number of
meteorite falls and meteorite finds. Choice B is incorrect. The sentence indicates the two categories of meteorites found on Earth; it doesn’t
contrast the number of meteorite falls and meteorite finds. Choice C is incorrect. While the sentence notes the number of recorded meteorite
falls, it doesn’t contrast this with the number of meteorite finds.$qb$);
select seed_pool_question($qb$CB-c7e85c0a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The envelope-shaped paper bags common in the US 150 years ago were impractical for carrying goods. ______ because they were the only paper
bags that could be mass-produced, these bags dominated the market. That all changed in the 1870s, when industrial designer Margaret Knight
patented a machine to make flat-bottomed, foldable paper bags.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "However,"}, {"label": "B", "body": "For instance,"}, {"label": "C", "body": "Thus,"}, {"label": "D", "body": "In other words,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “However” logically signals that the information in this sentence—that envelope-shaped bags dominated the market
—contrasts with the previous claim that these bags were impractical for carrying goods.
Choice B is incorrect because “for instance” illogically signals that the information in this sentence is an example supporting the previous claim
that envelope-shaped bags were impractical for carrying goods. Instead, the sentence contrasts with the previous claim about the bags. Choice
C is incorrect because “thus” illogically signals that the information in this sentence is a result of the previous claim that envelope-shaped bags
were impractical for carrying goods. Instead, the sentence contrasts with the previous claim about the bags. Choice D is incorrect because “in
other words” illogically signals that the information in this sentence is a paraphrase of the previous claim that envelope-shaped bags were
impractical for carrying goods. Instead, the sentence contrasts with the previous claim about the bags.$qb$);
select seed_pool_question($qb$CB-85c0c0f0$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Texture analysis and historical analysis are two approaches to art criticism.
· Texture analysis examines how surfaces are visually represented in an artwork.
? Such an analysis of Giorgione’s Youth Holding an Arrow might consider how the painting’s blended colors make the subject’s skin appear
smooth in texture.
? Historical analysis considers the historical context in which a work was created.
? Such an analysis of Diego Velázquez’s Las Meninas might consider how the painting’s depiction of the artist with King Philip IV
symbolizes art’s historical ties to power.
The student wants to present historical analysis to an audience unfamiliar with the concept. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-85c0c0f0.png$qb$, $qb$[{"label": "A", "body": "A texture analysis of Youth Holding an Arrow might consider how the painting’s blended colors make the subject’s skin appear smooth in texture."}, {"label": "B", "body": "Texture analysis differs from historical analysis in that texture analysis examines how surfaces are visually represented in an artwork."}, {"label": "C", "body": "An approach to art criticism, historical analysis considers the historical context in which a work was created."}, {"label": "D", "body": "Las Meninas’s depiction of the artist with King Philip IV symbolizes art’s historical ties to power."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence presents historical analysis to an audience unfamiliar with the concept by defining it as an approach
to art criticism that considers the historical context in which a work was created.
Choice A is incorrect because it provides an example of texture analysis; it doesn’t present historical analysis to an audience unfamiliar with the
concept. Choice B is incorrect. The sentence explains a difference between texture analysis and historical analysis; it doesn’t present historical
analysis to an audience unfamiliar with the concept. Choice D is incorrect. It provides an example of historical analysis; it doesn’t present
historical analysis to an audience unfamiliar with the concept.$qb$);
select seed_pool_question($qb$CB-1792fa73$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The tundra is a type of environment characterized by especially harsh winter conditions.
· Winter temperatures in the tundra average a frigid −30 degrees Fahrenheit.
? Animals that have adapted to these conditions can survive tundra winters.
? During the tundra’s short growing season, average temperatures can reach a relatively mild 54 degrees Fahrenheit.
? Around 1,700 different kinds of plants are able to grow in the tundra.
The student wants to emphasize how harsh the conditions can be in the tundra. Which choice most effectively uses relevant information from
the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1792fa73.png$qb$, $qb$[{"label": "A", "body": "Winters in the tundra are especially harsh, with temperatures averaging a frigid −30 degrees Fahrenheit."}, {"label": "B", "body": "Animals that have adapted to harsh winter conditions can survive tundra winters."}, {"label": "C", "body": "There are around 1,700 different kinds of plants that can live in the tundra, where average temperatures can reach a mild 54 degrees Fahrenheit."}, {"label": "D", "body": "Along with animals that have adapted to the tundra’s conditions, around 1,700 different kinds of plants can live in the tundra."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes how harsh the conditions in the tundra can be, noting that the winters are especially
harsh and describing the average temperatures as “frigid.”
Choice B is incorrect because the sentence explains that some animals can survive harsh tundra winters; it doesn’t emphasize how harsh the
conditions can be. Choice C is incorrect because the sentence specifies how many different kinds of plants can live in the tundra; it doesn’t
emphasize how harsh the conditions in the tundra can be. Choice D is incorrect because the sentence explains that both plants and animals can
survive in the tundra; it doesn’t emphasize how harsh the conditions in the tundra can be.$qb$);
select seed_pool_question($qb$CB-f33f0892$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Although novels and poems are considered distinct literary forms, many authors have created hybrid works that incorporate elements of both.
Bernardine Evaristo’s The Emperor’s Babe, ______ is a verse novel, a book-length narrative complete with characters and a plot but conveyed in
short, crisp lines of poetry rather than prose.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "by contrast,"}, {"label": "B", "body": "consequently,"}, {"label": "C", "body": "secondly,"}, {"label": "D", "body": "for example,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “For example” logically signals that the information in this sentence—that The Emperor’s Babe is a novel conveyed in
lines of poetry—exemplifies the claim in the previous sentence about hybrid works that incorporate elements of both novels and poems.
Choice A is incorrect because “by contrast” illogically signals that the information in this sentence contrasts with the claim about hybrid works in
the previous sentence. Instead, the information demonstrates that Evaristo’s novel is an example of a hybrid work. Choice B is incorrect because
“consequently” illogically signals that the information in this sentence is a consequence, or result, of the claim about hybrid works in the previous
sentence. Instead, the information demonstrates that Evaristo’s novel is an example of a hybrid work. Choice C is incorrect because “secondly”
illogically signals that the information in this sentence is a second, separate claim from the previous sentence’s claim about hybrid works.
Instead, the information demonstrates that Evaristo’s novel is an example of a hybrid work.$qb$);
select seed_pool_question($qb$CB-be3363dd$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Suzanne K. Birner led a study analyzing rocks on the seafloor to better understand the history of Earth’s mantle.
? Rock samples were collected from two seafloor ridges.
· The researchers determined the samples’ period of formation (the Archean eon) and oxidation level (extremely low).
? High temperatures in the Archean likely caused the rocks’ low oxidation.
· Birner’s team suggests the oxidation of Earth’s mantle has remained stable over time, contrary to previous theories.
? The findings help explain the unique conditions that allowed life to develop on Earth.
The student wants to present the study’s research methods. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-be3363dd.png$qb$, $qb$[{"label": "A", "body": "Birner led a study to better understand the history of Earth’s mantle and explain the conditions that allowed life to develop."}, {"label": "B", "body": "To further analyze the origins of Earth’s unique conditions, researchers focused on rocks from the Archean eon, when Earth’s temperatures were extremely high."}, {"label": "C", "body": "By studying these ancient rocks, the team aimed to challenge previous theories about changes in Earth’s mantle over time."}, {"label": "D", "body": "Birner’s team analyzed the age and oxidation levels of rock samples collected from two seafloor ridges."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence presents the study’s research methods, explaining that Birner’s team analyzed the age and oxidation
levels of rock samples collected from two seafloor ridges.
Choice A is incorrect. The sentence describes the purpose of the study (to understand the history of Earth’s mantle and explain conditions for
life); it doesn’t present the study’s research methods. Choice B is incorrect. The sentence notes the study’s focus on rocks from the Archean eon
and a characteristic of the eon; it doesn’t present the study’s research methods. Choice C is incorrect. The sentence indicates the goal of the
study (to challenge previous theories); it doesn’t present the study’s research methods.$qb$);
select seed_pool_question($qb$CB-7d56630a$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In studying whether jellyfish sleep, researchers Michael Abrams, Claire Bedbrook, and Ravi Nath attempted to answer three questions. ______ is
there a period each day when the pulse rates of jellyfish decline? Second, do jellyfish respond more slowly to stimuli during that period? Finally, if
prevented from sleeping, are jellyfish adversely affected?
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "As a result,"}, {"label": "B", "body": "First,"}, {"label": "C", "body": "Additionally,"}, {"label": "D", "body": "However,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “First” logically signals that the question in this sentence—whether there is a daily period during which jellyfish pulse
rates decline—is the first in a sequence of three questions the researchers attempted to answer about jellyfish sleep behavior.
Choice A is incorrect because “as a result” illogically signals that the question in this sentence is a result of the three questions the researchers
attempted to answer. Instead, it is the first of those three questions. Choice C is incorrect because “additionally” illogically signals that the
question in this sentence is an additional question related to the three questions the researchers attempted to answer. Instead, it is the first of
those three questions. Choice D is incorrect because “however” illogically signals that the question in this sentence contrasts with the three
questions the researchers attempted to answer. Instead, it is the first of those three questions.$qb$);
select seed_pool_question($qb$CB-58281fc4$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Soo Sunny Park is a Korean American artist who uses light as her primary medium of expression.
· She created her work Unwoven Light in 2013.
? Unwoven Light featured a chain-link fence fitted with iridescent plexiglass tiles.
? When light passed through the fence, colorful prisms formed.
The student wants to describe Unwoven Light to an audience unfamiliar with Soo Sunny Park. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-58281fc4.png$qb$, $qb$[{"label": "A", "body": "Park’s 2013 installation Unwoven Light, which included a chain-link fence and iridescent tiles made from plexiglass, featured light as its primary medium of expression."}, {"label": "B", "body": "Korean American light artist Soo Sunny Park created Unwoven Light in 2013."}, {"label": "C", "body": "The chain-link fence in Soo Sunny Park’s Unwoven Light was fitted with tiles made from iridescent plexiglass."}, {"label": "D", "body": "In Unwoven Light, a 2013 work by Korean American artist Soo Sunny Park, light formed colorful prisms as it passed through a fence Park had fitted with iridescent tiles."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence effectively describes Unwoven Light to an audience unfamiliar with Park, noting that Soo Sunny Park is
a Korean American artist and that the 2013 work consists of colorful prisms formed by light passing through iridescent tiles.
Choice A is incorrect. The sentence describes aspects of Unwoven Light but doesn’t mention who Park is; it thus doesn’t effectively describe the
work to an audience unfamiliar with Park. Choice B is incorrect. Although the sentence indicates when the work was created and who Park is, it
lacks descriptive details and thus doesn’t effectively describe Unwoven Light. Choice C is incorrect. The sentence mentions Park and describes
an aspect of Unwoven Light—the chain-link fence—but doesn’t effectively describe the overall work to an audience unfamiliar with the artist.$qb$);
select seed_pool_question($qb$CB-a6155e60$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Every chemical compound has a spectroscopic fingerprint, a pattern of reflected light unique to that compound. ______ upon analyzing the light
reflected by the bright regions on the surface of the dwarf planet Ceres, Maria Cristina De Sanctis of Rome’s National Institute of Astrophysics
was able to determine that the regions contain large amounts of the compound sodium carbonate.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Regardless,"}, {"label": "B", "body": "Meanwhile,"}, {"label": "C", "body": "Thus,"}, {"label": "D", "body": "In comparison,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “Thus” logically signals that the action described in this sentence—the researcher being able to determine the
chemical makeup of the planet’s bright regions based on how they reflect light—is a result or consequence of the previous information about
spectroscopic fingerprints.
Choice A is incorrect because “regardless” illogically signals that the action described in this sentence occurs despite the previous information
about spectroscopic fingerprints. Instead, the finding in this sentence is a result or consequence of that information. Choice B is incorrect
because “meanwhile” illogically signals that the action described in this sentence either occurs at the same time as or offers an alternative to the
previous information about spectroscopic fingerprints. Instead, the finding in this sentence is a result or consequence of that information.
Choice D is incorrect because “in comparison” illogically signals that the action described in this sentence is being compared with the previous
information about spectroscopic fingerprints. Instead, the finding in this sentence is a result or consequence of that information.$qb$);
select seed_pool_question($qb$CB-17ec916d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Bharati Mukherjee was an Indian-born author of novels and short stories.
· She published the novel The Holder of the World in 1993.
? A central character in the novel is a woman living in twentieth-century United States.
? Another central character is a woman living in seventeenth-century India.
The student wants to introduce the novel The Holder of the World to an audience already familiar with Bharati Mukherjee. Which choice most
effectively uses relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-17ec916d.png$qb$, $qb$[{"label": "A", "body": "Bharati Mukherjee’s settings include both twentieth-century United States and seventeenth-century India."}, {"label": "B", "body": "In addition to her novel The Holder of the World, which was published in 1993, Indian-born author Bharati Mukherjee wrote other novels and short stories."}, {"label": "C", "body": "Bharati Mukherjee’s novel The Holder of the World centers around two women, one living in twentieth-century United States and the other in seventeenth-century India."}, {"label": "D", "body": "The Holder of the World was not the only novel written by Indian-born author Bharati Mukherjee."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence effectively introduces The Holder of the World to an audience already familiar with Mukherjee,
explaining that the novel centers around two women and mentioning the author without providing any other identifying information.
Choice A is incorrect. The sentence provides a detail about Mukherjee’s settings; it doesn’t introduce, or even mention, the novel. Choice B is
incorrect. The sentence provides introductory information about Mukherjee; it doesn’t effectively introduce her novel to an audience already
familiar with the author. Choice D is incorrect. The sentence provides introductory information about Mukherjee; it doesn’t effectively introduce
her novel to an audience already familiar with the author.$qb$);
select seed_pool_question($qb$CB-459df2ba$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Modularity of mind is the notion that the mind is at least partly composed of innate neural structures (modules) that perform fast,
necessary tasks.
? 1983: cognitive scientist Jerry A. Fodor hypothesized that low-level cognitive systems (e.g., perception, language) are modular.
? In Fodorian modularity, high-level systems (e.g., reasoning) are not modular.
? 2003: cognitive scientist Peter Carruthers proposed the massive modularity hypothesis (MMH).
? MMH expands modularity to include all cognitive systems.
The student wants to compare Fodor’s hypothesis with Carruthers’s. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-459df2ba.png$qb$, $qb$[{"label": "A", "body": "In considering some but not all cognitive systems modular, Fodorian modularity is not as expansive in its definition of modularity as MMH is."}, {"label": "B", "body": "Following Fodor’s 1983 hypothesis, Carruthers proposed that modularity of mind includes all cognitive systems."}, {"label": "C", "body": "The hypotheses of Fodor and Carruthers differ in whether they consider low-level cognitive systems, such as perception and language, modular."}, {"label": "D", "body": "In 2003, Carruthers proposed the massive modularity hypothesis, disagreeing with Fodor’s earlier hypothesis that the mind is composed of innate neural structures."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence compares Fodor’s hypothesis with Carruthers’s, noting that because Fodorian modularity considers
some but not all cognitive systems modular, it is not as expansive in its definition of modularity as Carruthers’s MMH, which includes all
cognitive systems.
Choice B is incorrect. The sentence describes Carruthers’s hypothesis—that modularity of mind includes all cognitive systems—but indicates
only that this hypothesis followed Fodor’s 1983 hypothesis rather than making a comparison between the hypotheses. Choice C is incorrect. The
sentence misrepresents a difference between Fodor’s and Carruthers’s hypotheses. According to the information in the notes, both Fodor and
Carruthers consider low-level cognitive systems modular, and their difference lies in whether they also consider high-level systems modular.
Choice D is incorrect. The sentence misrepresents a difference between Fodor’s and Carruthers’s hypotheses. According to the information in
the notes, both Fodor and Carruthers consider the mind to be at least partly composed of innate neural structures (modules). Their difference
lies in whether they consider high-level systems modular.$qb$);
select seed_pool_question($qb$CB-d8aa8ba2$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In astronomy, the mass of stars can be described in units called solar masses.
· One solar mass is roughly equal to the mass of the Sun.
? The mass of the star Proxima Centauri is 0.122 solar masses.
? The mass of the star Sirius A is 2.063 solar masses.
The student wants to emphasize the mass of Sirius A. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d8aa8ba2.png$qb$, $qb$[{"label": "A", "body": "The mass of stars, like Proxima Centauri, can be described in units called solar masses."}, {"label": "B", "body": "In astronomy, the mass of stars can be described in units called solar masses, and one solar mass is roughly equal to the mass of the Sun."}, {"label": "C", "body": "The Sun is more massive than Proxima Centauri, which has a mass of 0.122 solar masses."}, {"label": "D", "body": "With a mass of 2.063 solar masses, Sirius A is more massive than the Sun."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence emphasizes the mass of Sirius A, noting that it has a mass of 2.063 solar masses and that it is larger
than the Sun.
Choice A is incorrect. The sentence makes a generalization about how the mass of stars can be measured; it doesn’t emphasize the mass of
Sirius A. Choice B is incorrect. The sentence introduces solar masses as a unit of measurement; it doesn’t emphasize the mass of Sirius A.
Choice C is incorrect. The sentence emphasizes the mass of Proxima Centauri, not the mass of Sirius A.$qb$);
select seed_pool_question($qb$CB-24014c3f$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Severo Ochoa discovered the enzyme PNPase in 1955.
· PNPase is involved in both the creation and degradation of mRNA.
? Ochoa incorrectly hypothesized that PNPase provides the genetic blueprints for mRNA.
? The discovery of PNPase proved critical to deciphering the human genetic code.
? Deciphering the genetic code has led to a better understanding of how genetic variations affect human health.
The student wants to emphasize the significance of Ochoa’s discovery. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-24014c3f.png$qb$, $qb$[{"label": "A", "body": "Ochoa’s 1955 discovery of PNPase proved critical to deciphering the human genetic code, leading to a better understanding of how genetic variations affect human health."}, {"label": "B", "body": "Ochoa first discovered PNPase, an enzyme that he hypothesized contained the genetic blueprints for mRNA, in 1955."}, {"label": "C", "body": "In 1955, Ochoa discovered the PNPase enzyme, which is involved in both the creation and degradation of mRNA."}, {"label": "D", "body": "Though his discovery of PNPase was critical to deciphering the human genetic code, Ochoa incorrectly hypothesized that the enzyme was the source of mRNA’s genetic blueprints."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The sentence emphasizes the significance of Ochoa’s discovery, noting that it proved critical to deciphering the
human genetic code, which resulted in a better understanding of how genetic variations affect human health.
Choice B is incorrect. While the sentence explains what Ochoa discovered, it doesn’t emphasize the significance of the discovery. Choice C is
incorrect. While the sentence explains what Ochoa discovered, it doesn’t emphasize the significance of the discovery. Choice D is incorrect.
While the sentence mentions that Ochoa’s discovery was crucial, it emphasizes Ochoa’s incorrect hypothesis, not the significance of the
discovery.$qb$);
select seed_pool_question($qb$CB-3067723b$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? The Seikan Tunnel is a rail tunnel in Japan.
· It connects the island of Honshu to the island of Hokkaido.
? It is roughly 33 miles long.
? The Channel Tunnel is a rail tunnel in Europe.
? It connects Folkestone, England, to Coquelles, France.
? It is about 31 miles long.
The student wants to compare the lengths of the two rail tunnels. Which choice most effectively uses relevant information from the notes to
accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3067723b.png$qb$, $qb$[{"label": "A", "body": "Some of the world’s rail tunnels, including one tunnel that extends from Folkestone, England, to Coquelles, France, are longer than 30 miles."}, {"label": "B", "body": "The Seikan Tunnel is roughly 33 miles long, while the slightly shorter Channel Tunnel is about 31 miles long."}, {"label": "C", "body": "The Seikan Tunnel, which is roughly 33 miles long, connects the Japanese islands of Honshu and Hokkaido."}, {"label": "D", "body": "Both the Seikan Tunnel, which is located in Japan, and the Channel Tunnel, which is located in Europe, are examples of rail tunnels."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence compares the lengths of the two rail tunnels, noting that the Channel Tunnel (about 31 miles long) is
slightly shorter than the Seikan Tunnel (roughly 33 miles long).
Choice A is incorrect. The sentence makes a generalization about the length of some rail tunnels; it doesn’t compare the lengths of the two rail
tunnels. Choice C is incorrect. The sentence describes a single rail tunnel; it doesn’t compare the lengths of the two rail tunnels. Choice D is
incorrect. While the sentence mentions the two rail tunnels, it doesn’t compare their lengths.$qb$);
select seed_pool_question($qb$CB-8e9e473d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? A 2024 study analyzed the facial expressions of wolves and domestic dogs.
? In the study, facial expressions were coded under 46 different facial actions.
· The “ears rotator” facial action is seen in wolves.
? Dog breeds with erect (wolf-like) ears can produce the “ears rotator” facial action.
· Dog breeds with flopped or semi-flopped (non-wolf-like) ears cannot produce the “ears rotator” facial action.
The student wants to compare dog breeds with wolf-like ears to dog breeds with non-wolf-like ears. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8e9e473d.png$qb$, $qb$[{"label": "A", "body": "In a 2024 study, dog breeds with non-wolf-like ears were able to produce the same facial movements that wolves could."}, {"label": "B", "body": "One difference between dog breeds with wolf-like ears and dog breeds without them is that wolf-like breeds cannot produce the “ears rotator” facial action."}, {"label": "C", "body": "Non-wolf-like ears are flopped or semi-flopped, but wolf-like ears are different: they are erect and can produce the “ears rotator” facial action."}, {"label": "D", "body": "Like wolves, dog breeds with erect ears can produce the “ears rotator” facial action, while those with flopped or semi-flopped ears cannot."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence compares dog breeds with wolf-like (erect) and non-wolf-like (flopped or semi-flopped) ears, noting
that breeds with erect ears are able to produce the same “ears rotator” facial action as wolves, while breeds with flopped or semi-flopped ears
cannot.
Choice A is incorrect. The sentence compares dog breeds with non-wolf-like ears to wolves, not to other dog breeds. It also misrepresents
information from the notes: breeds with non-wolf-like ears cannot produce the “ears rotator” facial action. Choice B is incorrect. While the
sentence appears to compare dog breeds with wolf-like and non-wolf-like ears, it misrepresents information from the notes: breeds with wolf-like
ears can produce the “ears rotator” facial action. Choice C is incorrect. While the sentence compares the physical characteristics of the two ear
types, it doesn’t compare the dog breeds that have these ear types.$qb$);
select seed_pool_question($qb$CB-07456405$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Malapportionment is the over- or underrepresentation (relative to population size) of electoral districts in a governing body.
· It is a common feature of representative governments.
? There are 169 seats in Norway’s supreme legislature (the Storting).
? Seats are distributed by a formula that awards 1 point per resident and 1.8 points per unit of land.
? Less populated rural districts with large tracts of land receive a disproportionate number of seats compared to smaller but more
populated urban districts.
The student wants to refute a claim that malapportionment in the Storting favors small urban districts. Which choice most effectively uses
relevant information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-07456405.png$qb$, $qb$[{"label": "A", "body": "Less populated rural districts are disproportionally underrepresented in the Storting, creating an unfair advantage for smaller but more populated urban districts."}, {"label": "B", "body": "It’s untrue that malapportionment in the 169-seat Storting favors small urban districts; rather, the formula for distributing seats overrepresents more populated districts."}, {"label": "C", "body": "A common feature of representative governments, malapportionment occurs when electoral districts are over- or underrepresented."}, {"label": "D", "body": "Awarding more points per unit of land than points per resident, the formula for distributing Storting seats overrepresents less populated rural districts with large tracts of land."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. By noting that the formula for distributing Storting seats overrepresents less populated rural districts, the sentence
effectively refutes a claim that malapportionment in the Storting favors small urban districts.
Choice A is incorrect because the sentence claims that malapportionment in the Storting favors small urban districts; it doesn’t refute such a
claim. Moreover, it misrepresents information in the notes. According to the notes, the formula for distributing seats overrepresents less
populated, not more populated, districts. Choice B is incorrect. While the sentence appears to refute a claim that malapportionment in the
Storting favors small urban districts, it misrepresents information in the notes. According to the notes, the formula for distributing seats
overrepresents less populated, not more populated, districts. Choice C is incorrect. The sentence explains what malapportionment is but doesn’t
address malapportionment in the Storting specifically.$qb$);
select seed_pool_question($qb$CB-e2d97f10$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Pterosaurs were flying reptiles that existed millions of years ago.
· In a 2021 study, Anusuya Chinsamy-Turan analyzed fragments of pterosaur jawbones located in the Sahara Desert.
? She was initially unsure if the bones belonged to juvenile or adult pterosaurs.
? She used advanced microscope techniques to determine that the bones had few growth lines relative to the bones of fully grown
pterosaurs.
? She concluded that the bones belonged to juveniles.
The student wants to present the study and its findings. Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e2d97f10.png$qb$, $qb$[{"label": "A", "body": "In 2021, Chinsamy-Turan studied pterosaur jawbones and was initially unsure if the bones belonged to juveniles or adults."}, {"label": "B", "body": "Pterosaur jawbones located in the Sahara Desert were the focus of a 2021 study."}, {"label": "C", "body": "In a 2021 study, Chinsamy-Turan used advanced microscope techniques to analyze the jawbones of pterosaurs, flying reptiles that existed millions of years ago."}, {"label": "D", "body": "In a 2021 study, Chinsamy-Turan determined that pterosaur jawbones located in the Sahara Desert had few growth lines relative to the bones of fully grown pterosaurs and thus belonged to juveniles."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence presents both the study and its findings, noting the study’s date and the researcher’s name as well as
describing what the researcher determined about the jawbones and how she determined it.
Choice A is incorrect. While the sentence describes the study and the researcher’s initial assessment, it doesn’t present the study’s findings.
Choice B is incorrect. While the sentence describes the study and its focus, it doesn’t present the study’s findings or the name of the researcher
who conducted it. Choice C is incorrect. While the sentence mentions the study’s methodology and provides information about pterosaurs, it
doesn’t present the study’s findings.$qb$);
select seed_pool_question($qb$CB-e1b00a70$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The more diverse and wide ranging an animal’s behaviors, the larger and more energy demanding the animal’s brain tends to be. ______ from an
evolutionary perspective, animals that perform only basic actions should allocate fewer resources to growing and maintaining brain tissue. The
specialized subtypes of ants within colonies provide an opportunity to explore this hypothesis.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Subsequently,"}, {"label": "B", "body": "Besides,"}, {"label": "C", "body": "Nevertheless,"}, {"label": "D", "body": "Thus,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Thus” logically signals that the claim in this sentence—that animals performing only basic actions should allocate
relatively few resources to their brain tissue—is a consequence of the previous sentence’s claim about the energy demands of animal brains
(namely, that the more diverse an animal’s behaviors, the more energy its brain needs).
Choice A is incorrect because “subsequently” illogically signals that the claim in this sentence occurs later in a chronological sequence of events
than the previous sentence’s claim about the energy demands of animal brains. Instead, the second claim is a consequence of the first. Choice B
is incorrect because “besides” illogically signals that the claim in this sentence provides a separate point in addition to, or apart from, the
previous sentence’s claim about the energy demands of animal brains. Instead, the second claim is a consequence of the first. Choice C is
incorrect because “nevertheless” illogically signals that the claim in this sentence is true in spite of the previous sentence’s claim about the
energy demands of animal brains. Instead, the second claim is a consequence of the first.$qb$);
select seed_pool_question($qb$CB-bce57278$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Some US reformers sought to improve society in the 1800s by building utopias.
· A utopia is a community intended to represent a perfect society based on a specific set of principles.
? One such community was Brook Farm near Boston, Massachusetts.
? It was founded in 1841 by writer George Ripley.
? Ripley wrote in a letter that his goal for Brook Farm was “to guarantee the highest mental freedom, by providing all with labor, adapted to
their tastes and talents, and securing to them the fruits of their industry.”
The student wants to explain the goal of Brook Farm using a quotation from George Ripley. Which choice most effectively uses relevant
information from the notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bce57278.png$qb$, $qb$[{"label": "A", "body": "In a letter, writer George Ripley explained his goal to “guarantee the highest mental freedom.”"}, {"label": "B", "body": "Utopias, such as Brook Farm, founded by George Ripley in 1841, were based on a specific set of principles intended to create a perfect society."}, {"label": "C", "body": "Founded by George Ripley near Boston, Massachusetts, Brook Farm was part of a trend in the 1800s, when reformers in the United States built utopias."}, {"label": "D", "body": "Established in 1841, Brook Farm was a utopian community created to “guarantee the highest mental freedom, by providing all with labor... [and] the fruits of their industry,” according to founder George Ripley."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This choice explains the goal of Brook Farm—to provide mental freedom to all by engaging individuals in labor
suited to their interests—using a quotation from George Ripley.
Choice A is incorrect. This choice only mentions part of Ripley’s goal, and it doesn’t mention Brook Farm at all. Choice B is incorrect. This choice
defines what a utopia is but doesn’t use Ripley’s words to describe his vision for Brook Farm. Choice C is incorrect. This choice provides some
background information about Brook Farm, but it doesn’t explain its goals or include Ripley’s words.$qb$);
select seed_pool_question($qb$CB-2b89bfe5$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 1999, astronomer Todd Henry studied the differences in surface temperature between the Sun and nearby stars.
· His team mapped all stars within 10 parsecs (approximately 200 trillion miles) of the Sun.
? The surface temperature of the Sun is around 9,800°F, which classifies it as a G star.
? 327 of the 357 stars in the study were classified as K or M stars, with surface temperatures under 8,900°F (cooler than the Sun).
? 11 of the 357 stars in the study were classified as A or F stars, with surface temperatures greater than 10,300°F (hotter than the Sun).
The student wants to emphasize how hot the Sun is relative to nearby stars. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2b89bfe5.png$qb$, $qb$[{"label": "A", "body": "At around 9,800°F, which classifies it as a G star, the Sun is hotter than most but not all of the stars within 10 parsecs of it."}, {"label": "B", "body": "Astronomer Todd Henry determined that the Sun, at around 9,800°F, is a G star, and several other stars within a 10-parsec range are A or F stars."}, {"label": "C", "body": "Of the 357 stars within ten parsecs of the Sun, 327 are classified as K or M stars, with surface temperatures under 8,900°F."}, {"label": "D", "body": "While most of the stars within 10 parsecs of the Sun are classified as K, M, A, or F stars, the Sun is classified as a G star due to its surface temperature of 9,800°F."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. Noting that the Sun (9,800°F) is hotter than most stars within 10 parsecs of it, the sentence emphasizes how hot the
Sun is relative to nearby stars.
Choice B is incorrect. The sentence explains that astronomer Todd Henry determined the classifications for the Sun and several other stars
nearby; it doesn’t emphasize how hot the Sun is relative to nearby stars. Choice C is incorrect. The sentence explains that the majority of stars
near the Sun are classified as K or M stars; it doesn’t indicate the Sun’s temperature or emphasize how hot it is relative to nearby stars. Choice D
is incorrect. While the sentence indicates that the Sun is classified differently than most nearby stars due to its surface temperature, it doesn’t
emphasize how hot the Sun is relative to nearby stars.$qb$);
select seed_pool_question($qb$CB-7572131d$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Elizabeth Catlett’s sculpture Recognition (1970) shows two African American figures with rounded, indistinct features.
· The figures reach out to each other in a pose that symbolizes a close, supportive relationship.
? Her sculpture Students Aspire (1978) shows two African American figures with sharply defined features.
? The figures hold an equal sign above their heads with one hand and embrace each other with the other hand.
? This pose symbolizes their support for each other in the pursuit of equality.
The student wants to emphasize a similarity between the two sculptures. Which choice most effectively uses relevant information from the
notes to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7572131d.png$qb$, $qb$[{"label": "A", "body": "Catlett’s Students Aspire depicts two figures supporting each other in the pursuit of equality."}, {"label": "B", "body": "Recognition and Students Aspire both show African American figures in poses that symbolize supportive relationships."}, {"label": "C", "body": "Catlett completed Recognition in 1970 and Students Aspire in 1978."}, {"label": "D", "body": "The figures in Recognition have features that are rounded and indistinct, while the figures in Students Aspire have sharply defined features."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The sentence emphasizes a similarity between the sculptures Recognition and Students Aspire, noting that both
sculptures show African American figures in poses that symbolize supportive relationships.
Choice A is incorrect. The sentence describes one of the sculptures; it doesn’t emphasize a similarity between the two sculptures. Choice C is
incorrect. The sentence specifies the different years the sculptures were completed in; it doesn’t emphasize a similarity between the two
sculptures. Choice D is incorrect. The sentence emphasizes a difference between the two sculptures, noting that the figures in the sculptures
have different feature definition; it doesn’t emphasize a similarity between the two sculptures.$qb$);
select seed_pool_question($qb$CB-74028acf$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Topographic maps show the elevation of landforms above sea level. Bathymetric maps, ______ show the elevation of landforms below the sea,
providing valuable information to marine geophysicists like Claudia Flores, who studies seismic data from the northeastern Caribbean.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "in conclusion,"}, {"label": "B", "body": "for example,"}, {"label": "C", "body": "by contrast,"}, {"label": "D", "body": "afterward,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. “By contrast” logically signals that the information about bathymetric maps in this sentence—that they show
landforms’ elevation below the sea—presents a direct contrast to the previous information about topographic maps showing landforms’
elevation above sea level.
Choice A is incorrect because “in conclusion” illogically signals that the information about bathymetric maps in this sentence concludes or
summarizes the previous information about topographic maps. Instead, the sentence provides contrasting information about bathymetric maps.
Choice B is incorrect because “for example” illogically signals that the information about bathymetric maps in this sentence exemplifies the
previous information about topographic maps. Instead, the sentence provides contrasting information about bathymetric maps. Choice D is
incorrect because “afterward” illogically signals that this sentence describes an event that chronologically follows the previous information about
topographic maps. Instead, the sentence provides contrasting information about bathymetric maps.$qb$);
select seed_pool_question($qb$CB-54c1b2dd$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? In 1851, German American artist Emanuel Leutze painted Washington Crossing the Delaware.
· His huge painting (149 × 255 inches) depicts the first US president crossing a river with soldiers in the Revolutionary War.
? In 2019, Cree artist Kent Monkman painted mistikôsiwak (Wooden Boat People): Resurgence of the People.
? Monkman’s huge painting (132 × 264 inches) was inspired by Leutze’s.
? It portrays Indigenous people in a boat rescuing refugees.
The student wants to emphasize a similarity between the two paintings. Which choice most effectively uses relevant information from the notes
to accomplish this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-54c1b2dd.png$qb$, $qb$[{"label": "A", "body": "Monkman, a Cree artist, finished his painting in 2019; Leutze, a German American artist, completed his in 1851."}, {"label": "B", "body": "Although Monkman’s painting was inspired by Leutze’s, the people and actions the two paintings portray are very different."}, {"label": "C", "body": "Leutze’s and Monkman’s paintings are both huge, measuring 149 × 255 inches and 132 × 264 inches, respectively."}, {"label": "D", "body": "Leutze’s painting depicts Revolutionary War soldiers, while Monkman’s depicts Indigenous people and refugees."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes a similarity between the two paintings, noting that Leutze’s painting (which measures 149
× 255 inches) and Monkman’s painting (which measures 132 × 264 inches) are both very large.
Choice A is incorrect. The sentence mentions that Monkman’s painting was completed in 2019 and Leutze’s was completed in 1851; it doesn’t
emphasize a similarity between the two paintings. Choice B is incorrect. While the sentence acknowledges that one painting was inspired by the
other, it emphasizes differences between the two paintings; it doesn’t emphasize a similarity between them. Choice D is incorrect. The sentence
mentions a difference between the two paintings; it doesn’t emphasize a similarity between them.$qb$);
select seed_pool_question($qb$CB-5fa51c86$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Ulaanbaatar is the capital of Mongolia.
· The city’s population is 907,802.
? Ulaanbaatar contains 31.98 percent of Mongolia’s population.
? Hanoi is the capital of Vietnam.
? The city’s population is 7,781,631.
? Hanoi contains 8.14 percent of Vietnam’s population.
The student wants to emphasize the relative sizes of the two capitals’ populations. Which choice most effectively uses information from the
given sentences to emphasize the relative sizes of the two capitals’ populations?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5fa51c86.png$qb$, $qb$[{"label": "A", "body": "Mongolia’s capital is Ulaanbaatar, which has 907,802 people, and Vietnam’s capital is Hanoi, which has 7,781,631 people."}, {"label": "B", "body": "Comparing Vietnam and Mongolia, 7,781,631 is 8.14 percent of Vietnam’s population, and 907,802 is 31.98 percent of Mongolia’s."}, {"label": "C", "body": "Even though Hanoi (population 7,781,631) is larger than Ulaanbaatar (population 907,802), Ulaanbaatar accounts for more of its country’s population."}, {"label": "D", "body": "The populations of the capitals of Mongolia and Vietnam are 907,802 (Ulaanbaatar) and 7,781,631 (Hanoi), respectively."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The sentence emphasizes the relative sizes of the capital cities’ populations, noting that even though Hanoi has
more people overall, Ulaanbaatar accounts for a larger percentage of the people in its country.
Choice A is incorrect. While the sentence indicates the population size of each capital, it fails to emphasize their sizes relative to each other or to
their countries’ overall population sizes. Choice B is incorrect. The sentence emphasizes the population sizes of the two countries; it fails to
mention the capitals. Choice D is incorrect. While the sentence indicates the population size of each capital, it fails to emphasize their sizes
relative to each other or to their countries’ overall population sizes.$qb$);
select seed_pool_question($qb$CB-4e063114$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$rhetorical_synthesis$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While researching a topic, a student has taken the following notes:
? Georeferencing is the process of assigning geographic coordinates to an image.
· This process enables mapping software to place the image in its real-world location.
? A 2017 project by Tania López Marrero and colleagues georeferenced a set of aerial photographs of Puerto Rico’s coastline taken in
1930.
? These photographs are the earliest known aerial photographs of Puerto Rico.
? López Marrero’s project provided data that can help researchers analyze changes in Puerto Rico’s coastline.
The student wants to define the term “georeferencing.” Which choice most effectively uses relevant information from the notes to accomplish
this goal?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4e063114.png$qb$, $qb$[{"label": "A", "body": "A 2017 project by Tania López Marrero and colleagues assigned geographic coordinates to photographs of Puerto Rico’s coastline and also used georeferencing."}, {"label": "B", "body": "Tania López Marrero and colleagues used georeferencing in their analysis of the earliest known aerial photographs of Puerto Rico."}, {"label": "C", "body": "Georeferenced aerial photographs from 1930 can help researchers analyze changes in Puerto Rico’s coastline."}, {"label": "D", "body": "Georeferencing is the process of assigning geographic coordinates to an image so that mapping software can place it in its real-world location."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The sentence defines the term "georeferencing," stating that it is the process of assigning geographic coordinates to
an image so that mapping software can place the image in its real-world location.
Choice A is incorrect. The sentence describes López Marrero’s team’s 2017 project; it doesn’t provide a definition of the term "georeferencing."
Moreover, it misrepresents the information in the notes by characterizing the team’s assignment of geographic coordinates to photographs as a
process distinct from georeferencing. Choice B is incorrect. The sentence states that López Marrero’s team used georeferencing, but it doesn’t
provide a definition of the term. Choice C is incorrect. The sentence explains why a particular group of georeferenced aerial photographs is
potentially useful for researchers; it doesn’t provide a definition of the term "georeferencing."$qb$);
select seed_pool_question($qb$CB-08be6347$qb$, $qb$english$qb$, $qb$expression_of_ideas$qb$, $qb$transitions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In his 1925 book The Morphology of Landscape, US geographer Carl Sauer challenged prevailing views about how natural landscapes influence
human cultures. ______ Sauer argued that instead of being shaped entirely by their natural surroundings, cultures play an active role in their own
development by virtue of their interactions with the environment.
Which choice completes the text with the most logical transition?$qb$, null, $qb$[{"label": "A", "body": "Similarly,"}, {"label": "B", "body": "Finally,"}, {"label": "C", "body": "Therefore,"}, {"label": "D", "body": "Specifically,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “Specifically” logically signals that the information in this sentence about Sauer’s argument—that, according to
Sauer, cultures play a role in their own development, as opposed to being shaped solely by natural surroundings—provides specific, precise
details elaborating on the more general information in the previous sentence about how Sauer challenged prevailing views about how natural
landscapes influence human cultures.
Choice A is incorrect because “similarly” illogically signals that the information in this sentence about Sauer’s argument is similar to, but
separate from, the more general information in the previous sentence. Instead, it provides specific, precise details elaborating on that
information. Choice B is incorrect because “finally” illogically signals that the information in this sentence about Sauer’s argument indicates a
last step in a process or a concluding summary. Instead, it provides specific, precise details elaborating on the general information in the
previous sentence. Choice C is incorrect because “therefore” illogically signals that the information in this sentence about Sauer’s argument is a
result of the more general information in the previous sentence. Instead, it provides specific, precise details elaborating on that information.$qb$);
