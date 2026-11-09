-- ============================================================================
--  0079 — College Board's Reading and Writing questions
--
--  244 questions from College Board's SAT Suite Question Bank, into the
--  English practice pool. Part 5 of 5.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

select seed_pool_question($qb$CB-01a32c84$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The first computerized spreadsheet, Dan Bricklin’s VisiCalc, improved financial recordkeeping not only by providing users with an easy means of
adjusting data in spreadsheets but also by automatically updating all calculations that were dependent on these ______ to VisiCalc’s release,
changing a paper spreadsheet often required redoing the entire sheet by hand, a process that could take days.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "adjustments prior"}, {"label": "B", "body": "adjustments, prior"}, {"label": "C", "body": "adjustments. Prior"}, {"label": "D", "body": "adjustments and prior"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between the first sentence (“The...adjustments”) and the second sentence (“Prior...days”). Because the adverbial phrase
beginning with “prior” indicates when changing a spreadsheet required redoing the sheet by hand, that phrase belongs with the second
sentence.
Choice A is incorrect because it results in a run-on sentence. Two sentences are fused without punctuation and/or a conjunction. Choice B is
incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice D is
incorrect. Without a comma preceding it, the conjunction “and” can’t be used in this way to join the sentences.$qb$);
select seed_pool_question($qb$CB-548f4956$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$It is generally true that technological change is a linear process, in which once-useful technologies are replaced by new and better ______ the
reawakening of interest in the steam engine (from advocates of carbon-neutral rail travel) reminds us that ostensibly obsolete technologies may
be brought back into service to address society’s changing needs.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "ones, even so;"}, {"label": "B", "body": "ones even so,"}, {"label": "C", "body": "ones; even so,"}, {"label": "D", "body": "ones, even so,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice uses a semicolon in
a conventional way to join the first main clause (“It is…ones”) and the second main clause (“even so…needs”). Furthermore, the placement of the
semicolon after “ones” indicates that the supplementary phrase “even so” modifies the following clause (“the reawakening...needs”), resulting in
the most logical and grammatically complete sentence. With this punctuation, the sentence logically indicates that the recent interest in an old
technology like steam engines is despite the fact that technological change typically seeks out new technologies.
Choice A is incorrect because it results in a confusing and illogical sentence. Placing the semicolon after “so” indicates that the supplementary
element “even so” modifies the first clause of the sentence, which doesn’t make sense in this context. Choice B is incorrect because it results in
a run-on sentence. It fails to mark the boundary between the two main clauses with appropriate punctuation. Choice D is incorrect because it
results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join the two main clauses of the sentence.$qb$);
select seed_pool_question($qb$CB-9d4a701b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Along with carbon dioxide concentration and temperature, light intensity affects the chemical reaction rate of ______ as light intensity increases,
so does the rate at which the reactants (water and carbon dioxide) are converted into their products (glucose and oxygen).
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "photosynthesis and"}, {"label": "B", "body": "photosynthesis,"}, {"label": "C", "body": "photosynthesis:"}, {"label": "D", "body": "photosynthesis"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation in a sentence. In this choice, a colon is correctly used to mark
the boundary between one main clause ("Along with...photosynthesis") and another main clause ("as light...oxygen") and to introduce the
following explanation of how light intensity affects photosynthesis.
Choice A is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction ("and"). Choice B is incorrect because it results in a comma splice. Without a coordinating conjunction following it, a
comma can’t be used in this way to join two main clauses ("Along with...photosynthesis" and "as light...oxygen"). Choice D is incorrect because it
results in a run-on sentence. The two main clauses ("Along with...photosynthesis" and "as light...oxygen") are fused without punctuation and/or a
conjunction.$qb$);
select seed_pool_question($qb$CB-2c84f96a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 2017, artists Isabel and Ruben Toledo redesigned the costumes and sets for The Miami City Ballet’s production of The ______ to reviewers, the
Toledos’ designs helped infuse the production with elements of Miami’s Latin American culture.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Nutcracker according,"}, {"label": "B", "body": "Nutcracker, according"}, {"label": "C", "body": "Nutcracker according"}, {"label": "D", "body": "Nutcracker. According"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence (“In 2017...Nutcracker”) and another (“According...culture”). The supplementary element “according to
reviewers” modifies the main clause of the second sentence (“the Toledos’...culture”).
Choice A is incorrect because it results in a run-on sentence. The sentences are fused without punctuation and/or a conjunction. Furthermore, no
punctuation is needed within the supplementary element “according to reviewers.” Choice B is incorrect because it results in a comma splice. A
comma can’t be used in this way to mark the boundary between sentences. Choice C is incorrect because it results in a run-on sentence. The
sentences are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-6181924a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Fernando Palma Rodríguez creates robotic sculptures that combine mechanical elements with materials like feathers, soil, and seeds. The artist
is from a rural farming community outside Mexico City, and he studied engineering in college. The natural and mechanical ______ highlight these
two aspects of his background.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "materials that Palma Rodríguez uses in his art,"}, {"label": "B", "body": "materials that Palma Rodríguez uses in his art"}, {"label": "C", "body": "materials, that Palma Rodríguez uses in his art,"}, {"label": "D", "body": "materials, that Palma Rodríguez uses in his art"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the punctuation of an integrated relative clause within a sentence. No punctuation is
needed between the noun phrase (“The natural and mechanical materials”) and the integrated relative clause (“that Palma Rodríguez uses in his
art”). The integrated relative clause provides essential information about the materials, so no punctuation should separate it from the noun
phrase it modifies. Additionally, no punctuation is needed between the sentence’s subject (“The natural and mechanical materials that Palma
Rodríguez uses in his art”) and its main verb (“highlight”).
Choice A is incorrect because no punctuation is needed between the sentence’s subject (“The natural...art”) and its main verb (“highlight”).
Choice C is incorrect because no punctuation is needed between the noun phrase (“The natural...materials”) and the integrated relative clause
(“that...art”) that modifies it. Additionally, no punctuation is needed between the sentence’s subject (“The natural...art”) and its main verb
(“highlight”). Choice D is incorrect because no punctuation is needed between the noun phrase (“The natural...materials”) and the integrated
relative clause (“that...art”) that modifies it.$qb$);
select seed_pool_question($qb$CB-d4f173ec$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$To illustrate Albert Einstein’s special theory of relativity, picture two jugglers: one juggling on a steadily moving parade float, the other juggling
while standing still on a sidewalk. The laws of physics are identical for both ______ motion relative to each other. But what, Einstein wondered,
about the speed of light?
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "jugglers’, regardless of they’re"}, {"label": "B", "body": "jugglers, regardless of there"}, {"label": "C", "body": "juggler’s, regardless of their"}, {"label": "D", "body": "jugglers, regardless of their"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of plural nouns and possessive determiners. The plural noun "jugglers" and
the plural possessive determiner "their" correctly indicate that there are multiple jugglers whose motion is being discussed.
Choice A is incorrect because the context requires the plural noun "jugglers" and the plural possessive determiner "their," not the plural
possessive noun "jugglers’" and the contraction "they’re." Choice B is incorrect because the context requires the plural possessive determiner
"their," not the word "there," which means "in that place." Choice C is incorrect because the context requires the plural noun "jugglers," not the
singular possessive noun "juggler’s."$qb$);
select seed_pool_question($qb$CB-dd6a0326$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$African American Percy Julian was a scientist and entrepreneur whose work helped people around the world to see. Named in 1999 as one of
the greatest achievements by a US chemist in the past hundred years, ______ led to the first mass-produced treatment for glaucoma.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Julian synthesized the alkaloid physostigmine in 1935; it"}, {"label": "B", "body": "in 1935 Julian synthesized the alkaloid physostigmine, which"}, {"label": "C", "body": "Julian’s 1935 synthesis of the alkaloid physostigmine"}, {"label": "D", "body": "the alkaloid physostigmine was synthesized by Julian in 1935 and"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “Julian’s 1935
synthesis” the subject of the sentence and places it immediately after the modifying phrase “named…years.” In doing so, this choice clearly
establishes that Julian’s 1935 synthesis of the alkaloid physostigmine—and not another noun in the sentence—was named in 1999 as one of the
greatest achievements by a US chemist in the past hundred years.
Choice A is incorrect because it results in a dangling modifier. The placement of the noun “Julian” immediately after the modifying phrase
illogically suggests that Julian himself was named as one of the greatest achievements by a US chemist in the past hundred years. Choice B is
incorrect because it results in a dangling modifier. The placement of the prepositional phrase “in 1935” immediately after the modifying phrase
illogically and confusingly suggests that “in 1935” was named as one of the greatest achievements by a US chemist in the past hundred years.
Choice D is incorrect because it results in a dangling modifier. The placement of the noun phrase “the alkaloid physostigmine” immediately after
the modifying phrase illogically and confusingly suggests that the alkaloid physostigmine itself (not the synthesis of it) was named as one of the
greatest achievements by a US chemist in the past hundred years.$qb$);
select seed_pool_question($qb$CB-4ba99a6f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Seneca sculptor Marie Watt’s blanket art comes in a range of shapes and sizes. In 2004, Watt sewed strips of blankets together to craft a 10-by-
13-inch ______ in 2014, she arranged folded blankets into two large stacks and then cast them in bronze, creating two curving 18-foot-tall blue-
bronze pillars.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "sampler later,"}, {"label": "B", "body": "sampler;"}, {"label": "C", "body": "sampler,"}, {"label": "D", "body": "sampler, later,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice uses a semicolon in
a conventional way to join the first main clause (“In 2004…sampler”) and the second main clause (“in 2014…pillars”).
Choice A is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. The word “later” is an adverb and cannot be used to join two main clauses unless it is preceded by a conjunction. Choice C is incorrect
because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main clauses. Choice D is
incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main clauses.
The word “later” is an adverb and cannot be used to join two main clauses unless it is preceded by a conjunction.$qb$);
select seed_pool_question($qb$CB-ce81d0b7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The life spans of rockfish vary greatly by species. For instance, the colorful calico rockfish (Sebastes dallii) can survive for a little over a ______
the rougheye rockfish (Sebastes aleutianus) boasts a maximum life span of about two centuries.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "decade: while"}, {"label": "B", "body": "decade. While"}, {"label": "C", "body": "decade; while"}, {"label": "D", "body": "decade, while"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation between a main clause and a subordinate clause. This choice correctly
uses a comma to mark the boundary between the main clause ("the colorful…decade") and the subordinate clause ("while…centuries") that
provides contrasting information about the life span of rougheye rockfish.
Choice A is incorrect because a colon can’t be used in this way to join a main clause and a subordinate clause. Choice B is incorrect because it
results in a rhetorically unacceptable sentence fragment beginning with "while." Choice C is incorrect because a semicolon can’t be used in this
way to join a main clause and a subordinate clause.$qb$);
select seed_pool_question($qb$CB-db24ecc9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Arctic-Alpine Botanic Garden in Norway and the Jardim Botânico of Rio de Janeiro in Brazil are two of many botanical gardens around the
world dedicated to growing diverse plant ______ fostering scientific research; and educating the public about plant conservation.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "species, both native and nonnative,"}, {"label": "B", "body": "species, both native and nonnative;"}, {"label": "C", "body": "species; both native and nonnative,"}, {"label": "D", "body": "species both native and nonnative,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the punctuation of items in a complex series (a series including internal
punctuation). The semicolon after “nonnative” is correctly used to separate the first item (“growing diverse plant species, both native and
nonnative”) and the second item (“fostering scientific research”) in the series of things that botanical gardens are dedicated to. Further, the
comma after “species” is correctly used to separate the noun phrase “diverse plant species” and the supplementary phrase “both native and
nonnative” that modifies it.
Choice A is incorrect because a comma (specifically, the comma after “nonnative”) can’t be used in this way to separate items in a complex
series. Choice C is incorrect because a semicolon can’t be used in this way to separate the noun phrase “diverse plant species” and the
supplementary phrase “both native and nonnative” that modifies it. Further, a comma can’t be used in this way to separate items in a complex
series. Choice D is incorrect because it fails to use appropriate punctuation to separate the noun phrase “diverse plant species” and the
supplementary phrase “both native and nonnative” that modifies it. Further, a comma can’t be used in this way to separate items in a complex
series.$qb$);
select seed_pool_question($qb$CB-35360da9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The US Geological Survey wants to map every human-made structure in the United States, and it is asking volunteers to help. Cassie Tammy
Wang and Ashish D’Souza are just two of the many volunteer map editors who ______ to the project since it began in 2012.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "contribute"}, {"label": "B", "body": "will contribute"}, {"label": "C", "body": "have contributed"}, {"label": "D", "body": "will be contributing"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the present perfect
tense verb “have contributed,” used in conjunction with the phrase “since it began in 2012,” correctly indicates that map editors have contributed
in the past and continue to do so in the present.
Choice A is incorrect because the present tense verb “contribute” is inconsistent with the phrase “since it began in 2012,” which suggests that the
contributions occurred in the past and continue into the present. Choice B is incorrect because the future tense verb “will contribute” is
inconsistent with the phrase “since it began in 2012,” which suggests that the contributions occurred in the past and continue into the present.
Choice D is incorrect because the future tense verb “will be contributing” is inconsistent with the phrase “since it began in 2012,” which suggests
that the contributions occurred in the past and continue into the present.$qb$);
select seed_pool_question($qb$CB-0fa289a7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 1955, Indian Bengali filmmaker Satyajit Ray released his first movie, Pather ______ quiet black-and-white drama about a family in rural India,
Ray’s film was quite different from the loud, colorful action-romance movies that were popular at the time.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Panchali a"}, {"label": "B", "body": "Panchali, which was a"}, {"label": "C", "body": "Panchali, a"}, {"label": "D", "body": "Panchali. A"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence ("In…Panchali") and another ("A quiet…time"). The phrase beginning with "a quiet" modifies the subject
of the next sentence, "Ray’s film."
Choice A is incorrect because it results in a run-on sentence. The sentences are fused without punctuation and/or a conjunction. Choice B is
incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice C is
incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences.$qb$);
select seed_pool_question($qb$CB-f0f9bf8f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Félix González-Torres debuted his sculpture “Untitled” (USA Today) in New York City in 1990. The work consists of piled candy, a material
González-Torres became known for. ______ created additional installations using a variety of sweets, like bubblegum, lollipops, and chocolates.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "They all"}, {"label": "B", "body": "Those"}, {"label": "C", "body": "Both"}, {"label": "D", "body": "He"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is pronoun-antecedent agreement. The singular pronoun "he" agrees in number with
the singular antecedent "Félix González-Torres," and it clearly indicates that González-Torres created the additional installations.
Choice A is incorrect because the plural noun phrase "they all" doesn’t agree in number with the singular antecedent "Félix González-Torres," and
it doesn’t clearly indicate that he (González-Torres) created the additional installations. Choice B is incorrect because the plural pronoun "those"
doesn’t agree in number with the singular antecedent "Félix González-Torres," and it doesn’t clearly indicate that he (González-Torres) created the
additional installations. Choice C is incorrect because the plural pronoun "both" doesn’t agree in number with the singular antecedent "Félix
González-Torres," and it doesn’t clearly indicate that he (González-Torres) created the additional installations.$qb$);
select seed_pool_question($qb$CB-ace95f84$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$By analyzing the level of radioactive decay within a fossil specimen, scientists can establish the age of that fossil with a high degree of precision.
When radioactive elements aren’t present, scientists turn to ______ analysis of Earth’s sediment layers (strata)—to estimate how old a fossil is
based on the age of the strata in which the fossil is found.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "stratigraphy—the"}, {"label": "B", "body": "stratigraphy (the"}, {"label": "C", "body": "stratigraphy: the"}, {"label": "D", "body": "stratigraphy, the"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation within a sentence. The dash after "stratigraphy" pairs with the
dash after "(strata)" to separate the supplementary element "the analysis of Earth’s sediment layers (strata)" from the rest of the sentence. This
supplementary element functions to define the term "stratigraphy," and the pair of dashes indicates that this element could be removed without
affecting the grammatical coherence of the sentence.
Choice B is incorrect because a parenthesis can’t be paired with a dash in this way to separate the supplementary element from the rest of the
sentence. Choice C is incorrect because a colon can’t be paired with a dash in this way to separate the supplementary element from the rest of
the sentence. Choice D is incorrect because a comma can’t be paired with a dash in this way to separate the supplementary element from the
rest of the sentence.$qb$);
select seed_pool_question($qb$CB-6df020e6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A study showed that a solar park caused nearby land to cool, though the ecological impact of this temperature decrease isn’t yet known. Before
the park’s construction, the surface temperature 30 meters outside of the park boundary was 0.1°C cooler than that of a control ______
construction, the temperature 30 meters outside of the boundary was 1.7°C cooler than that of the control area.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "area after"}, {"label": "B", "body": "area after,"}, {"label": "C", "body": "area. After"}, {"label": "D", "body": "area, after"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used to correctly
mark the boundary between one sentence ("Before...area") and another ("After...area"). The phrase "After construction" modifies the next
sentence to indicate that the temperature was cooler after construction.
Choice A is incorrect because it results in a run-on sentence that fuses the two sentences ("Before...area" and "after...area") without punctuation
and/or a conjunction. Choice B is incorrect because it results in a run-on sentence that connects the two sentences ("Before...area" and
"after...area") without punctuation and/or a conjunction. Additionally, no punctuation is needed between "after" and "construction." Choice D is
incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between the two sentences
("Before...area" and "after...area").$qb$);
select seed_pool_question($qb$CB-684b8bd2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Far from being modern inventions, ______ more than 5,000 years ago.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Sumerians in ancient Mesopotamia used drinking straws"}, {"label": "B", "body": "drinking straws were used by Sumerians in ancient Mesopotamia"}, {"label": "C", "body": "the use of drinking straws by Sumerians in ancient Mesopotamia happened"}, {"label": "D", "body": "ancient Mesopotamia was home to Sumerians who used drinking straws"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. Modifiers and their subjects must go next to each other. The modifier “far from being modern inventions” must be
describing “drinking straws,” because those are the only possible inventions in this sentence.
Choice A is incorrect. Modifiers and their subjects must go next to each other. The modifier “far from being modern inventions” can’t be
describing “Sumerians,” because they are a group of people, not an invention. Choice C is incorrect. Modifiers and their subjects must go next to
each other. The modifier “far from being modern inventions” can’t be describing “the use of drinking straws,” because it is not “the use” of
drinking straws that is an invention—it is the drinking straws themselves. Choice D is incorrect. Modifiers and their subjects must go next to each
other. The modifier “far from being modern inventions” can’t be describing “Ancient Mesopotamia,” because that is a place, not an invention.$qb$);
select seed_pool_question($qb$CB-f30a478e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A study published by Rice University geoscientist Ming Tang in 2019 offers a new explanation for the origin of Earth’s ______ structures called
arcs, towering ridges that form when a dense oceanic plate subducts under a less dense continental plate, melts in the mantle below, and then
rises and bursts through the continental crust above.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "continents geological"}, {"label": "B", "body": "continents: geological"}, {"label": "C", "body": "continents; geological"}, {"label": "D", "body": "continents. Geological"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between a main clause and a supplementary phrase. In this choice,
a colon is correctly used to mark the boundary between the main clause (“A study…continents”) and the supplementary phrase (“geological…
above”) and to introduce the following explanation of the origin of Earth’s continents.
Choice A is incorrect because it fails to mark the boundary between the main clause (“A study…continents”) and the supplementary phrase
(“geological…above”) with appropriate punctuation. Choice C is incorrect because a semicolon can’t be used in this way to join the main clause
(“A study…continents”) and the supplementary phrase (“geological…above”). A semicolon is conventionally used to join two main clauses,
whereas a colon is conventionally used to introduce an element that explains or amplifies the information in the preceding clause, making it the
better choice in this context. Choice D is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with
“geological.”$qb$);
select seed_pool_question($qb$CB-67667d72$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Humans were long thought to have begun occupying the Peruvian settlement of Machu Picchu between 1440 and 1450 CE. However, a team led
by anthropologist Dr. Richard Burger used accelerator mass spectrometry to uncover evidence that it was occupied ______ 1420 CE, according to
Burger, humans were likely inhabiting the area.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "earlier. In"}, {"label": "B", "body": "earlier, in"}, {"label": "C", "body": "earlier, which in"}, {"label": "D", "body": "earlier in"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence (“However...earlier”) and another (“In...area”). The supplementary phrase “in 1420 CE” modifies
“humans,” the subject of the third sentence.
Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice
C is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Moreover, the
subordinating conjunction “which” creates a confusing and illogical sentence that suggests that the supplementary phrase beginning with “in”
modifies the previous information (“However...earlier”) rather than the information that follows. Choice D is incorrect because it results in a run-
on sentence. The sentences (“However...earlier” and “in...area”) are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-80aa7690$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Austronesian language family includes Tagalog, Malagasy, and some 1,200 other languages throughout the Pacific, making it one of the
largest language families in the world and of keen interest to ______ of the University of Toronto.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "linguist, Diane Massam,"}, {"label": "B", "body": "linguist, Diane Massam"}, {"label": "C", "body": "linguist Diane Massam"}, {"label": "D", "body": "linguist: Diane Massam"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation between titles and proper nouns. No punctuation is needed to
set off the proper noun "Diane Massam" from the title that describes Massam, "linguist." Because "Diane Massam" is essential information
identifying the "linguist," no punctuation is necessary.
Choice A is incorrect because no punctuation is needed before or after the proper noun "Diane Massam." Setting the linguist’s name off with
commas suggests that it could be removed without affecting the coherence of the sentence, which isn’t the case. Choice B is incorrect because
no punctuation is needed. Choice D is incorrect because no punctuation is needed.$qb$);
select seed_pool_question($qb$CB-cd4b1a7e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How did whales, once no bigger than seals, evolve to become the largest animals on Earth? Brazilian biologist Mariana Nery believes the answer
might be found in whales’ DNA. In January 2023, Nery and her colleagues ______ a study showing changes over time in four whale genes
associated with body size.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "published"}, {"label": "B", "body": "publishing"}, {"label": "C", "body": "having published"}, {"label": "D", "body": "to publish"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject (in this case, Nery and her colleagues), and this choice supplies the finite past tense verb "published" to
indicate that these biologists shared their findings about changes in whale genes associated with body size.
Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite participle "publishing" doesn’t supply the main clause with a
finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The nonfinite participle "having published" doesn’t supply the
main clause with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive "to publish"
doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-60a4c088$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What makes the theremin a unique musical instrument? You play it without touching it. When you place your ______ the pitch will shift as your
hands move through the air.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "hand’s between the two antenna’s,"}, {"label": "B", "body": "hands between the two antennas,"}, {"label": "C", "body": "hands’ between the two antennas’,"}, {"label": "D", "body": "hands’ between the two antennas,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of plural nouns in a sentence. The plural noun "hands" and the plural noun
"antennas" correctly indicate that two hands are placed between two antennas when playing the theremin.
Choice A is incorrect because the context requires the plural nouns "hands" and "antennas," not the singular possessive nouns "hand’s" and
"antenna’s." Choice C is incorrect because the context requires the plural nouns "hands" and "antennas," not the plural possessive nouns "hands’"
and "antennas’." Choice D is incorrect because the context requires the plural noun "hands," not the plural possessive noun "hands’."$qb$);
select seed_pool_question($qb$CB-75eb5242$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Many companies have simplified their products’ packaging designs in recent years, but ______ Researcher Lan Anh Nu Ton and her colleagues
designed a research study to find out.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "consumers actually do prefer this simpler style."}, {"label": "B", "body": "do consumers actually prefer this simpler style?"}, {"label": "C", "body": "do consumers actually prefer this simpler style."}, {"label": "D", "body": "consumers actually do prefer this simpler style?"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a question mark to
punctuate the interrogative clause “do consumers actually prefer this simpler style,” which asks a direct question at the end of the sentence. This
is the question that the researchers in the next sentence were trying to investigate.
Choice A is incorrect because the context requires an interrogative clause. The declarative clause “consumers actually do prefer this simpler
style” incorrectly indicates the consumers’ preference was already known, whereas the researchers had yet to find this out. Choice C is incorrect
because a period can’t be used in this way to punctuate an interrogative clause at the end of a sentence. Choice D is incorrect because a
question mark can’t be used in this way to punctuate a declarative clause, such as “consumers actually do prefer this simpler style,” at the end of
a sentence.$qb$);
select seed_pool_question($qb$CB-dd428136$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Cheng Dang and her colleagues at the University of Washington recently ran simulations to determine the extent to which individual snow ______
affect the amount of light reflecting off a snowy surface.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "grain’s physical properties’"}, {"label": "B", "body": "grains’ physical properties"}, {"label": "C", "body": "grains’ physical property’s"}, {"label": "D", "body": "grains physical properties"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of plural and possessive nouns. The plural possessive noun “grains’” and the
plural noun “properties” correctly indicate that the simulations involved multiple snow grains and that those snow grains had several properties.
Choice A is incorrect because the context requires the plural possessive noun “grains’” and the plural noun “properties,” not the singular
possessive noun “grain’s” and the plural possessive noun “properties’.” Choice C is incorrect because the context requires the plural noun
“properties,” not the singular possessive noun “property’s.” Choice D is incorrect because the context requires the plural possessive noun
“grains’,” not the plural noun “grains.”$qb$);
select seed_pool_question($qb$CB-a94b7fd6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$With residents from Mexico, China, El Salvador, and many other countries, Los Angeles has long been a city of cultural diversity. Even back in the
1860s, nearly 30% of the city’s population ______ from outside the United States.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is being"}, {"label": "B", "body": "was"}, {"label": "C", "body": "is"}, {"label": "D", "body": "will be"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the past tense verb
"was," used in conjunction with the prepositional phrase "from outside the United States," correctly indicates that in the 1860s nearly 30% of the
population in Los Angeles wasn’t from the US.
Choice A is incorrect because the present progressive tense verb "is being" doesn’t indicate that the claim about Los Angeles’s population refers
to the population back in the 1860s. Choice C is incorrect because the present tense verb "is" doesn’t indicate that the claim about Los Angeles’s
population refers to the population back in the 1860s. Choice D is incorrect because the future tense verb "will be" doesn’t indicate that the claim
about Los Angeles’s population refers to the population back in the 1860s.$qb$);
select seed_pool_question($qb$CB-c7cb5186$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In a US national election, one might expect major-party campaigns to focus on the most populous states. However, if polls and past voting data
suggest that the outcome in a given state is a foregone conclusion, a campaign will not invest its resources there. Ultimately, a state’s voting
record and polling data, not its population size, ______ its importance to campaigns.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "determines"}, {"label": "B", "body": "determining"}, {"label": "C", "body": "has determined"}, {"label": "D", "body": "determine"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms in a sentence. The plural verb “determine” supplies the main
clause with a finite main verb and agrees in number with the plural subject “a state’s voting record and polling data.”
Choice A is incorrect because the singular verb “determines” doesn’t agree in number with the plural subject “a state’s voting record and polling
data.” Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite participle “determining” doesn’t supply the main
clause with a finite plural verb. Choice C is incorrect because the singular verb “has determined” doesn’t agree in number with the plural subject
“a state’s voting record and polling data.”$qb$);
select seed_pool_question($qb$CB-6bc907c9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Novelist Jane Austen greatly admired the work of Fanny Burney, a popular English author. In fact, scholars believe that a passage from the last
chapter of Cecilia, a 1782 novel by Burney, likely inspired the title of one of ______ Pride and Prejudice.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Austen’s most famous novels,"}, {"label": "B", "body": "Austens’ most famous novels’,"}, {"label": "C", "body": "Austens most famous novels,"}, {"label": "D", "body": "Austen’s most famous novel’s,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of plural and possessive nouns. The singular possessive proper noun
"Austen’s" and the plural noun "novels" correctly indicates that Austen wrote multiple novels that were famous.
Choice B is incorrect because the context requires the singular possessive proper noun "Austen’s" and the plural noun "novels," not the plural
possessive nouns "Austens’" and "novels’." Choice C is incorrect because the context requires the singular possessive proper noun "Austen’s," not
the plural proper noun "Austens." Choice D is incorrect because the context requires the plural noun "novels," not the singular possessive noun
"novel’s."$qb$);
select seed_pool_question($qb$CB-04bfd364$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The intense pressure found in the deep ocean can affect the structure of proteins in fish’s cells, distorting the proteins’ shape. The chemical
trimethylamine N-oxide (TMAO) counters this effect, ensuring that proteins retain their original ______ is found in high concentrations in the cells
of the deepest-dwelling fish.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "configurations. TMAO"}, {"label": "B", "body": "configurations TMAO"}, {"label": "C", "body": "configurations, TMAO"}, {"label": "D", "body": "configurations and TMAO"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period after “configurations”
is used correctly to mark the boundary between one sentence (“The intense…configurations”) and another (“TMAO…fish”). The supplementary
phrase (“ensuring…configurations”) modifies the main clause of the first sentence (“The chemical…effect”), and “TMAO” is the subject of the
second sentence.
Choice B is incorrect because it results in a run-on sentence. The sentences (“The intense…configurations” and “TMAO…fish”) are fused without
punctuation and/or a conjunction. Choice C is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the
boundary between sentences. Choice D is incorrect. Without a comma preceding it, the conjunction “and” can’t be used in this way to join
sentences.$qb$);
select seed_pool_question($qb$CB-1e274153$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$During World War II, codebreakers played an essential role in deciphering coded messages. In the US military, more than 10,000 women ______ as
codebreakers, making up nearly half of all US codebreakers.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "having served"}, {"label": "B", "body": "to serve"}, {"label": "C", "body": "served"}, {"label": "D", "body": "serving"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject (in this case, “more than 10,000 women”), and this choice supplies the finite past tense verb “served” to state
what the women did.
Choice A is incorrect because it results in an ungrammatical sentence. The nonfinite participle “having served” doesn’t supply the main clause
with a finite verb. Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive “to serve” doesn’t supply the
main clause with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite participle “serving” doesn’t
supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-36868920$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Increasing the heat on an uncovered boiling pot of water does not increase the temperature of the water. What increases is the rate at which the
water turns to ______ a pressure cooker pot, though, an airtight seal traps the vapor in the pot, creating pressure that allows the temperature of
the water to increase past its boiling point.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "vapor. With"}, {"label": "B", "body": "vapor with"}, {"label": "C", "body": "vapor, with"}, {"label": "D", "body": "vapor and with"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence ("What…vapor") and another ("With…point").
Choice B is incorrect because it results in a run-on sentence. The sentences ("What…vapor" and "with…point") are fused without punctuation
and/or a conjunction. Choice C is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary
between sentences. Choice D is incorrect. Without a comma preceding it, the conjunction "and" can’t be used in this way to join sentences.$qb$);
select seed_pool_question($qb$CB-772835db$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Most of the ice found on Earth is ice Ih, distinguished by a crystalline structure in which molecules form a hexagonal pattern. Amorphous ice, on
the other hand, constitutes most of the ice in the ultrafrigid environment of outer space. Defined by a disorganized molecular structure, ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "ice Ih contains crystals, whereas amorphous ice, which lacks the thermal energy to form them, does not."}, {"label": "B", "body": "amorphous ice lacks the thermal energy to form the crystals found in ice Ih."}, {"label": "C", "body": "the lack of thermal energy in amorphous ice explains its inability to form the crystals found in ice Ih."}, {"label": "D", "body": "ice Ih differs from amorphous ice in that it possesses the thermal energy to form crystals."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “amorphous ice” the
subject of the sentence and places it immediately after the modifying phrase “defined…structure.” In doing so, this choice clearly establishes that
amorphous ice—and not another noun in the sentence—is being described as having a disorganized molecular structure.
Choice A is incorrect because it results in a dangling modifier. The placement of the noun “ice Ih” immediately after the modifying phrase
illogically suggests that ice Ih has a disorganized molecular structure, whereas ice Ih is previously described as having molecules that form a
hexagonal pattern. Choice C is incorrect because it results in a dangling modifier. The placement of the noun phrase “the lack of thermal energy”
immediately after the modifying phrase illogically suggests that the lack of thermal energy has a disorganized molecular structure. Choice D is
incorrect because it results in a dangling modifier. The placement of “ice Ih” immediately after the modifying phrase illogically suggests that ice
Ih has a disorganized molecular structure, whereas ice Ih is previously described as having molecules that form a hexagonal pattern.$qb$);
select seed_pool_question($qb$CB-f339ee39$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Multiple newspapers ______ the Spanish-speaking population of Washington, DC, including El Tiempo Latino and Washington Hispanic.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "serve"}, {"label": "B", "body": "having served"}, {"label": "C", "body": "to serve"}, {"label": "D", "body": "serving"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject (in this case, "multiple newspapers"), and this choice supplies the finite present tense verb "serve" to indicate
that there are multiple newspapers serving the Spanish-speaking population of Washington, DC.
Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite participle "having served" doesn’t supply the main clause
with a finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive "to serve" doesn’t supply the
main clause with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite participle "serving" doesn’t
supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-ea8f4658$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When particles are suspended in liquid (like pollen in a water glass), they will zigzag randomly through the liquid and collide with one another in
perpetuity. This type of random, continuous ______ is known as Brownian motion, can be observed throughout the natural world.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "movement: which"}, {"label": "B", "body": "movement, which"}, {"label": "C", "body": "movement which"}, {"label": "D", "body": "movement. Which"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. This choice correctly uses commas to set off the nonessential relative clause "which is known as Brownian motion"
that provides extra information about the "random, continuous movement" that isn’t necessary for the function of the sentence.
Choice A is incorrect. This choice results in a punctuation error. The relative clause "which is known as Brownian motion" is a nonessential
supplement. Nonessential supplements need to be set apart from the rest of the sentence with a pair of commas, dashes, or parentheses, so we
can’t use a colon here. Also, notice that colons can only come after an independent clause, which isn’t the case here. Choice C is incorrect. This
choice results in a punctuation error. The relative clause "which is known as Brownian motion" is a nonessential supplement, so it should be
separated from the rest of the sentence by a pair of matching punctuation marks. We already have a comma after "motion," so we need to add a
comma before "which." This choice is missing that comma. Choice D is incorrect. This choice results in a sentence fragment. "This type of
random, continuous movement" is not an independent clause and can’t stand alone as a full sentence, so we can’t put a period here.$qb$);
select seed_pool_question($qb$CB-f768090a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Walt Whitman’s Leaves of Grass first appeared in 1855 as a slim collection of twelve poems, but Whitman would revise and expand it
substantially over the next four decades. These extensive ______ the addition of hundreds of new poems, the removal of some existing ones, and
the insertion of prefatory material, reflected the poet’s evolving literary perspective and experience of the US Civil War.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "changes, including"}, {"label": "B", "body": "changes would include"}, {"label": "C", "body": "changes included"}, {"label": "D", "body": "changes, include"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite present participle "including"
is correctly used to form a supplementary element that interrupts the main clause "These extensive changes…reflected the poet’s evolving
literary perspective and experience of the US Civil War." This supplementary element, offset by commas after "changes" and "material," provides
examples of the changes Whitman made to Leaves of Grass.
Choice B is incorrect because it results in an ungrammatical sentence. The finite modal verb "would include" can’t be used in this way to form a
supplementary element within the main clause. Choice C is incorrect because it results in an ungrammatical sentence. The finite past tense verb
"included" can’t be used in this way to form a supplementary element within the main clause. Choice D is incorrect because it results in an
ungrammatical sentence. The finite present tense verb "include" can’t be used in this way to form a supplementary element within the main
clause.$qb$);
select seed_pool_question($qb$CB-775f3eb9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In his groundbreaking book Bengali Harlem and the Lost Histories of South Asian America, Vivek Bald uses newspaper articles, census records,
ships’ logs, and memoirs to tell the ______ who made New York City their home in the early twentieth century.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "story’s of the South Asian immigrants"}, {"label": "B", "body": "story’s of the South Asian immigrants’"}, {"label": "C", "body": "stories of the South Asian immigrants"}, {"label": "D", "body": "stories’ of the South Asian immigrant’s"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of plural and possessive nouns. The plural nouns “stories” and “immigrants”
correctly indicate that the memoir tells multiple stories of multiple immigrants.
Choice A is incorrect because the context requires the plural noun “stories,” not the singular possessive noun “story’s.” Choice B is incorrect
because the context requires the plural nouns “stories” and “immigrants,” not the singular possessive noun “story’s” and the plural possessive
noun “immigrants’.” Choice D is incorrect because the context requires the plural nouns “stories” and “immigrants,” not the plural possessive
noun “stories’” and the singular possessive noun “immigrant’s.”$qb$);
select seed_pool_question($qb$CB-5670a657$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$During the decades-long movement to codify the rights of Latinos in the US, certain events were pivotal: the founding of social justice group the
League of United Latin American Citizens in ______ Katzenbach v. Morgan court decision in 1966, which affirmed the rights of Latino voters, is
another such event.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "1929. For one, the"}, {"label": "B", "body": "1929, for one, the"}, {"label": "C", "body": "1929 for one, the"}, {"label": "D", "body": "1929, for one. The"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The conventions being tested are punctuation use between sentences and the punctuation of a supplementary
element. This choice correctly uses a period to mark the boundary between one sentence ("During...one") and another ("The Katzenbach...event")
and uses a comma to separate the supplementary phrase "for one" from the preceding main clause. Further, placing the period after "for one"
correctly indicates that the information in the preceding main clause ("the founding...1929") is the first example provided of a pivotal event in the
Latino rights movement.
Choice A is incorrect because placing the period after "1929" illogically indicates that the information in the next main clause (describing the
Katzenbach v. Morgan court decision) is the first example provided of a pivotal event in the Latino rights movement; rather, it’s a second example.
Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way to join two main clauses. Choice C is incorrect
because it results in a comma splice. A comma can’t be used in this way to join two main clauses. Moreover, it fails to use appropriate
punctuation to separate the supplementary element "for one" from the preceding main clause.$qb$);
select seed_pool_question($qb$CB-b6560e5a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Materials scientist Marie-Agathe Charpagne and her colleagues believed they could improve on the multicomponent alloy NiCoCr, an equal-
proportions mixture of nickel (Ni), cobalt (Co), and chromium (Cr), by replacing chromium with ruthenium ______ the alloy that resulted, NiCoRu,
turned out to be an unsuitable replacement for NiCoCr.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "(Ru)"}, {"label": "B", "body": "(Ru) but"}, {"label": "C", "body": "(Ru),"}, {"label": "D", "body": "(Ru), but"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the coordination of main clauses. This choice correctly uses a comma and the
coordinating conjunction “but” to join the first main clause (“Materials…Ru”) and the second main clause (“the alloy…NiCoCr”).
Choice A is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction. Choice
B is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the coordinating
conjunction. Choice C is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to
join two main clauses.$qb$);
select seed_pool_question($qb$CB-5aa171de$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Chondrites are stony meteorites that are undifferentiated—that is, their contents have not melted and separated into distinct layers. They are
hardly ______ many chondrites experience aqueous alteration as a result of exposure to fluids, as well as fracturing, veining, and localized melting
due to collisions with other objects.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "pristine, though"}, {"label": "B", "body": "pristine, though;"}, {"label": "C", "body": "pristine; though"}, {"label": "D", "body": "pristine, though,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
separate the supplementary adverb "though" from the preceding main clause ("They are hardly pristine") and uses a semicolon to join the two
main clauses ("They…though" and "many…objects"). Further, placing the semicolon after "though" indicates that the information in the preceding
main clause (chondrites are far from pristine) is contrary to what might be assumed from the information in the previous sentence (chondrites
have been generally unaltered by their environment).
Choice A is incorrect because placing the comma after "pristine" and using "though" as a subordinating conjunction illogically indicates that the
information in the next main clause (many chondrites have experienced damage) is contrary to the information in the previous clause
(chondrites are far from pristine). Choice C is incorrect because placing the semicolon after "pristine" illogically indicates that the information in
the next main clause (many chondrites have experienced damage) is contrary to the information in the previous clause (chondrites are far from
pristine). Choice D is incorrect because it results in a comma splice. Without a conjunction following it, the comma after "though" can’t be used in
this way to join two main clauses.$qb$);
select seed_pool_question($qb$CB-5b8f9cf2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the canon of North African literature, Moroccan author Driss Chraïbi’s 1954 novel The Simple Past (Le Passé simple) looms large. A coming-of-
age story, a social meditation, and a sober gaze into the dark maw of French colonialism, ______ interrogates systemic power with memorable
intensity.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Morocco gained its independence two years before the publication of Chraïbi’s debut novel, which"}, {"label": "B", "body": "Chraïbi’s debut novel, published two years before Morocco gained its independence,"}, {"label": "C", "body": "Chraïbi wrote a debut novel that, published two years before Morocco gained its independence,"}, {"label": "D", "body": "published two years before Morocco gained its independence, Chraïbi wrote a debut novel that"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. Subject-modifier placement requires a modifier and its subject to be next to each other. The subject of the modifier
"a coming-of-age story…colonialism" is Chraïbi’s novel The Simple Past, so the subject "Chraïbi’s debut novel" fits perfectly after this introductory
modifying phrase.
Choice A is incorrect. Modifiers and their subjects must go next to each other. The introductory modifier "a coming-of-age story…colonialism" is
describing Chraïbi’s novel, not Morocco. However, this choice places Morocco directly next to that modifier. Choice C is incorrect. Modifiers and
their subjects must go next to each other. The introductory modifier "a coming-of-age story…colonialism" all describes Chraïbi’s novel, not Chraïbi
himself. However, this choice places Chraïbi directly next to that modifier. Choice D is incorrect. Modifiers and their subjects must go next to
each other. The modifier "a coming-of-age story…" is describing Chraïbi’s novel, so that needs to be the subject immediately after the modifier.
This choice adds another modifier that describes Chraïbi’s novel, but then puts "Chraïbi" himself—not the novel—right after that modifier, which
doesn’t make sense. Chraïbi wasn’t "published two years before" Moroccan independence; his novel The Simple Past was.$qb$);
select seed_pool_question($qb$CB-b5b74c3f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When writing The Other Black Girl (2021), novelist Zakiya Dalila Harris drew on her own experiences working at a publishing office. The award-
winning book is Harris’s first novel, but her writing ______ honored before. At the age of twelve, she entered a contest to have a story published in
American Girl magazine—and won.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "were"}, {"label": "B", "body": "have been"}, {"label": "C", "body": "has been"}, {"label": "D", "body": "are"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is subject-verb agreement. The singular verb “has been” agrees in number with the
singular subject “writing.”
Choice A is incorrect because the plural verb “were” doesn’t agree in number with the singular subject “writing.” Choice B is incorrect because the
plural verb “have been” doesn’t agree in number with the singular subject “writing.” Choice D is incorrect because the plural verb “are” doesn’t
agree in number with the singular subject “writing.”$qb$);
select seed_pool_question($qb$CB-432b1ede$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The forty-seven geothermal springs of Arkansas’ Hot Springs National Park are sourced via a process known as natural groundwater recharge, in
which rainwater percolates downward through the earth—in this case, the porous rocks of the hills around Hot ______ collect in a subterranean
basin.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Springs to"}, {"label": "B", "body": "Springs: to"}, {"label": "C", "body": "Springs—to"}, {"label": "D", "body": "Springs, to"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The dash after
“Springs” pairs with the dash after “earth” to separate the supplementary element “in this case, the porous rocks of the hills around Hot Springs”
from the rest of the sentence.
Choice A is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the sentence.
Choice B is incorrect because a colon can’t be paired with a dash in this way to separate the supplementary element from the rest of the
sentence. Choice D is incorrect because a comma can’t be paired with a dash in this way to separate the supplementary element from the rest of
the sentence.$qb$);
select seed_pool_question($qb$CB-c21df211$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 1959, the film industry debuted Smell-O-Vision. Theaters were fitted with specialized vents that emitted odors at specific points in a ______ as
the scent of roses when roses appeared in a scene. Smell-O-Vision failed to impress, however, with one reviewer declaring it “briefly weird and
not very interesting.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "movie such"}, {"label": "B", "body": "movie; such"}, {"label": "C", "body": "movie. Such"}, {"label": "D", "body": "movie, such"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The comma appropriately separates the nonessential descriptive aside "such as…scene" from the independent
clause "Theaters were…movie." Since the descriptive example of roses isn’t necessary for the sentence to function, it needs to be set off with
punctuation.
Choice A is incorrect. This choice results in a run-on sentence. Since the example of roses isn’t necessary for the sentence to function, the
descriptive aside "such as…scene" needs to be separated from the preceding independent clause with some sort of punctuation. Choice B is
incorrect. This choice creates a punctuation error. A semicolon can only be used to separate two independent clauses, but "such…scene" is not
an independent clause and couldn’t stand on its own as a sentence. Choice C is incorrect. This choice results in a sentence fragment. The
descriptive aside "Such…scene" is not an independent clause and can’t stand on its own as a sentence.$qb$);
select seed_pool_question($qb$CB-50445680$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In winter, the diets of Japanese macaques, also known as snow monkeys, are influenced more by food availability than by food preference.
Although the monkeys prefer to eat vegetation and land-dwelling invertebrates, those food sources may become unavailable because of
extensive snow and ice cover, ______ the monkeys to hunt for marine animals in any streams that have not frozen over.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "forces"}, {"label": "B", "body": "to force"}, {"label": "C", "body": "forcing"}, {"label": "D", "body": "forced"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of finite and nonfinite verb forms within a sentence. The nonfinite present
participle “forcing” is correctly used to form a participial phrase that supplements the main clause “those...cover,” describing the effects on
monkeys of the lack of food sources.
Choice A is incorrect because the finite present tense verb “forces” can’t be used in this way to supplement the main clause (“those...cover”).
Choice B is incorrect. While the nonfinite to-infinitive “to force” could be used to form a subordinate clause that supplements the main clause
(“those...cover”), to-infinitives conventionally express purpose, and nothing in the sentence suggests that the food sources become unavailable
for the purpose of forcing monkeys to hunt marine animals. Choice D is incorrect because the finite past tense verb “forced” can’t be used in this
way to supplement the main clause (“those...cover”).$qb$);
select seed_pool_question($qb$CB-267a13e2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 2010, archaeologist Noel Hidalgo Tan was visiting the twelfth-century temple of Angkor Wat in Cambodia when he noticed markings of red
paint on the temple ______ the help of digital imaging techniques, he discovered the markings to be part of an elaborate mural containing over
200 paintings.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "walls, with"}, {"label": "B", "body": "walls with"}, {"label": "C", "body": "walls so with"}, {"label": "D", "body": "walls. With"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period after “walls” is used
correctly to mark the boundary between the first sentence (“In...walls”) and the second sentence (“With…techniques”), which starts with a
supplementary phrase.
Choice A is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice
B is incorrect because it results in a run-on sentence. The sentences (“In...walls” and “with...paintings”) are fused without punctuation and/or a
conjunction. Choice C is incorrect. Without a comma preceding it, the conjunction “so” can’t be used in this way to join sentences.$qb$);
select seed_pool_question($qb$CB-403d7bb5$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$According to Naomi Nakayama of the University of Edinburgh, the reason seeds from a dying dandelion appear to float in the air while ______ is
that their porous plumes enhance drag, allowing the seeds to stay airborne long enough for the wind to disperse them throughout the
surrounding area.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "falling,"}, {"label": "B", "body": "falling:"}, {"label": "C", "body": "falling;"}, {"label": "D", "body": "falling"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The word “falling” occurs in the middle of a clause and isn’t part of a supplement, so we don’t need any punctuation
after it. We can see this more clearly if we simplify the rest of the sentence: “The reason seeds appear to float while falling is that their plumes
enhance drag.” .
Choice A is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. The word “falling” occurs in
the middle of a clause and isn’t part of a supplement, so we don’t need any punctuation after it. We can see this more clearly if we simplify the
sentence: “The reason seeds appear to float while falling is that their plumes enhance drag.” . Choice B is incorrect. This doesn’t complete the
text in a way that conforms to the conventions of Standard English. The word “falling” occurs in the middle of a clause and isn’t part of a
supplement, so we don’t need any punctuation after it. We can see this more clearly if we simplify the sentence: “The reason seeds appear to
float while falling is that their plumes enhance drag.” . Choice C is incorrect. This doesn’t complete the text in a way that conforms to the
conventions of Standard English. The word “falling” occurs in the middle of a clause and isn’t part of a supplement, so we don’t need any
punctuation after it. We can see this more clearly if we simplify the sentence: “The reason seeds appear to float while falling is that their plumes
enhance drag.” .$qb$);
select seed_pool_question($qb$CB-fcab3630$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In his Naturalis historia, Pliny the Elder praised Hipparchus’s star catalog, a second-century BCE list of roughly 850 different stars’ celestial
positions. For centuries, scholars dreamed about locating a copy of this legendary lost ______ fantasy (partially) became reality in 2022, when
researchers uncovered traces of the star catalog on a palimpsest, a reused parchment.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "work, that"}, {"label": "B", "body": "work that"}, {"label": "C", "body": "work. That"}, {"label": "D", "body": "work and that"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence ("For…work") and another ("That…parchment").
Choice A is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice
B is incorrect because it results in a run-on sentence. The sentences ("For…work" and "that…parchment") are fused without punctuation and/or a
conjunction. Choice D is incorrect. Without a comma preceding it, the conjunction "and" can’t be used in this way to join sentences.$qb$);
select seed_pool_question($qb$CB-a7fdf862$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Azulejos, mosaics made of glazed ceramic tiles, can be found throughout Portugal. These mosaics beautify places such as ______ stations, and
public squares.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "libraries train"}, {"label": "B", "body": "libraries: train"}, {"label": "C", "body": "libraries—train"}, {"label": "D", "body": "libraries, train"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the punctuation of items in a simple series. The comma after "libraries" is used
conventionally to separate the first and second items ("libraries" and "train stations") in the series.
Choice A is incorrect because it fails to separate the first two items ("libraries" and "train stations") in the series. Choice B is incorrect because a
colon can’t be used in this way to separate items in a simple series. Choice C is incorrect because a dash can’t be used in this way to separate
items in a simple series.$qb$);
select seed_pool_question($qb$CB-21e58a83$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Jetties—long, narrow structures that extend from a landmass into the water—are often constructed to protect coastlines from erosion. Jetties
can sometimes have the opposite ______ obstructing the natural flow of sand along the shore can lead to increased erosion in some areas.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "effect, though;"}, {"label": "B", "body": "effect, though"}, {"label": "C", "body": "effect; though"}, {"label": "D", "body": "effect, though,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
separate the supplementary adverb "though" from the preceding main clause ("Jetties can sometimes have the opposite effect") and uses a
semicolon to join the next main clause ("obstructing…areas") to the rest of the sentence. Further, placing the semicolon after "though" logically
indicates that the information earlier in this sentence (that jetties can sometimes cause erosion) is contrary to what might be assumed from the
information in the previous sentence (that jetties are often constructed for the purpose of protecting coastlines from erosion).
Choice B is incorrect because it fails to mark the boundary between the two main clauses with appropriate punctuation. With "though…areas"
functioning as a subordinate clause following the comma, this choice illogically indicates that the following information (that obstructing the
natural flow of sand along the shore can sometimes lead to erosion) is contrary to the information earlier in the sentence (that jetties can
sometimes cause erosion). Instead, the information following "though" supports the previous claim about the erosive effects of jetties. Choice C
is incorrect because it’s not conventional to use a semicolon in this way to separate a main clause from a dependent clause. Further, it illogically
indicates that the following information (that obstructing the natural flow of sand along the shore can sometimes lead to erosion) is contrary to
the information earlier in the sentence (that jetties can sometimes cause erosion). Instead, the information following "though" supports the
previous claim about the erosive effects of jetties. Choice D is incorrect because it results in a comma splice. Commas can’t be used in this way
to set off a supplementary word or phrase between two main clauses.$qb$);
select seed_pool_question($qb$CB-de3dd17d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Planetary scientist Briony Horgan and her colleagues have determined that as much as 25 percent of the sand on Mars is composed of impact
spherules. These spherical bits of glass form when asteroids collide with the planet, ejecting bits of molten rock into the atmosphere that, after
cooling and solidifying into glass, ______ back onto Mars’s surface.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "to rain"}, {"label": "B", "body": "raining"}, {"label": "C", "body": "having rained"}, {"label": "D", "body": "rain"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. "That…[rain] back onto Mars’s surface" is a relative clause that describes the "bits of molten rock." Forming the
clause requires a conjugated, finite verb, and this is the only choice that provides that.
Choice A is incorrect. "To rain" is an infinitive and can’t serve as the main verb of a clause. A conjugated verb is needed here to form the main
verb of the relative clause "that…[rain] back onto Mars’s surface," which describes the "bits of molten rock." Choice B is incorrect. "Raining" is a
present participle and, on its own, can’t serve as the main verb of a clause. A conjugated verb is needed here to form the main verb of the relative
clause "that…[rain] back onto Mars’s surface," which describes the "bits of molten rock." Choice C is incorrect. "Having rained" is a perfect
participle and can’t serve as the main verb of a clause. A conjugated verb is needed here to form the main verb of the relative clause "that…[rain]
back onto Mars’s surface," which describes the "bits of molten rock."$qb$);
select seed_pool_question($qb$CB-c102f9b0$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Lê Lương Minh became the thirteenth secretary-general of the Association of Southeast Asian Nations (ASEAN) in January 2013, making ______
the first time the organization would appoint a Vietnamese leader.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "these"}, {"label": "B", "body": "those"}, {"label": "C", "body": "this"}, {"label": "D", "body": "some"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is pronoun-antecedent agreement. The singular pronoun "this" agrees in number with
the singular antecedent "Lê Lương Minh became the thirteenth secretary-general of the Association of Southeast Asian Nations (ASEAN) in
January 2013." The pronoun "this" is referring back to the singular event described earlier in the sentence in which Minh became secretary-
general of ASEAN.
Choice A is incorrect because the plural pronoun "these" doesn’t agree in number with the singular antecedent "Lê Lương Minh became the
thirteenth secretary-general of the Association of Southeast Asian Nations (ASEAN) in January 2013." Choice B is incorrect because the plural
pronoun "those" doesn’t agree in number with the singular antecedent "Lê Lương Minh became the thirteenth secretary-general of the
Association of Southeast Asian Nations (ASEAN) in January 2013." Choice D is incorrect because the indefinite pronoun "some" is ambiguous in
this context; the resulting sentence leaves unclear what marks the first time the organization appointed a Vietnamese leader.$qb$);
select seed_pool_question($qb$CB-6b49f5f1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1727, dramatist Lewis Theobald presented a new play, Double Falsehood, at a London theater. Theobald claimed that his drama was based on
a little-known play by William Shakespeare, Cardenio. Many, including poet Alexander Pope, were ______ historians have determined that
Shakespeare’s company did perform a play called Cardenio in 1613.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "skeptical but"}, {"label": "B", "body": "skeptical, but"}, {"label": "C", "body": "skeptical,"}, {"label": "D", "body": "skeptical"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. There are two independent clauses in the sentence, each with a subject and a verb: "many...were skeptical" and
"historians have determined…." These clauses can be grammatically joined by a comma and the coordinating conjunction "but."
Choice A is incorrect. This choice results in a run-on sentence, which occurs when two independent clauses are joined without punctuation. Two
independent clauses can’t be joined by just the coordinating conjunction "but." A comma would also be required. Choice C is incorrect. This
choice creates a punctuation error called a comma splice. This sentence contains two independent clauses ("Many…were skeptical" and
"historians have determined…"). A comma alone can’t join two independent clauses. That requires a comma and a coordinating conjunction.
Choice D is incorrect. This choice results in a run-on sentence, which occurs when two independent clauses are joined without punctuation. This
sentence contains two independent clauses ("Many…were skeptical" and "historians have determined…"), which need to be either joined by a
semicolon, joined by a comma and a coordinating conjunction, or separated by a period.$qb$);
select seed_pool_question($qb$CB-ecba68b5$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Mathematician Grigori Perelman, sometimes in conjunction with mathematicians Richard S. Hamilton and Shing-Tung Yau, ______ credited with
proving the Poincaré conjecture. Having built on Hamilton’s previous work to solve the proof, Perelman has insisted that Hamilton receive credit.
Yau later found and closed gaps in Perelman’s proof, persuading some mathematicians that he deserves credit as well.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are"}, {"label": "B", "body": "have been"}, {"label": "C", "body": "are being"}, {"label": "D", "body": "is"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The singular verb "is credited" agrees in number with the
singular subject "mathematician Grigori Perelman."
Choice A is incorrect because the plural verb "are credited" doesn’t agree in number with the singular subject "mathematician Grigori Perelman."
Choice B is incorrect because the plural verb "have been credited" doesn’t agree in number with the singular subject "mathematician Grigori
Perelman." Choice C is incorrect because the plural verb "are being credited" doesn’t agree in number with the singular subject "mathematician
Grigori Perelman."$qb$);
select seed_pool_question($qb$CB-2dd1b8bf$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Compared to that of alumina glass, ______ silica glass atoms are so far apart that they are unable to re-form bonds after being separated.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "silica glass is at a significant disadvantage due to its more dispersed atomic arrangement:"}, {"label": "B", "body": "silica glass has a more dispersed atomic arrangement, resulting in a significant disadvantage:"}, {"label": "C", "body": "a significant disadvantage of silica glass is that its atomic arrangement is more dispersed:"}, {"label": "D", "body": "silica glass’s atomic arrangement is more dispersed, resulting in a significant disadvantage:"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-modifier placement. This choice makes “silica glass’s atomic arrangement”
the subject of the sentence and places it immediately after the modifying phrase “compared to that of alumina glass.” In doing so, this choice
clearly establishes that silica glass’s atomic arrangement—and not another noun in the sentence—is being compared to the atomic arrangement
(“that”) of alumina glass.
Choice A is incorrect because it results in a dangling modifier. The placement of the noun phrase “silica glass” immediately after the modifying
phrase illogically suggests that silica glass itself (rather than its atomic arrangement) is being compared to alumina glass’s atomic arrangement.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase “silica glass” immediately after the modifying
phrase illogically suggests that silica glass itself (rather than its atomic arrangement) is being compared to alumina glass’s atomic arrangement.
Choice C is incorrect because it results in a dangling modifier. The placement of the noun phrase “a significant disadvantage” immediately after
the modifying phrase illogically suggests that “a significant disadvantage” is being compared to alumina glass’s atomic arrangement.$qb$);
select seed_pool_question($qb$CB-577b09fa$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Robin Wall Kimmerer of the Citizen Potawatomi Nation is a bryologist, a plant scientist who specializes in mosses. To Kimmerer, mosses are
Earth’s most adaptable plants: they can clone ______ enter a dormant state in times of drought, and grow in areas that don’t have soil.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "themselves;"}, {"label": "B", "body": "themselves,"}, {"label": "C", "body": "themselves. And"}, {"label": "D", "body": "themselves"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the punctuation of items in a series. The comma after “themselves” is used
conventionally to separate the first item (“they can clone themselves”) and the second item (“enter a dormant state in times of drought”) in the
series of things mosses can do.
Choice A is incorrect because a semicolon can’t be used in this way to separate items in a simple series such as this. Choice C is incorrect
because it results in a rhetorically unacceptable sentence fragment beginning with “And enter.” Choice D is incorrect because it fails to use
appropriate punctuation to separate the first and second items in the series.$qb$);
select seed_pool_question($qb$CB-59094d87$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Tantaquidgeon Museum in Uncasville, Connecticut, was founded in 1931 with the goal of showcasing the culture and history of the
Mohegan ______ today, nearly a century later, it is the oldest Native-owned and -operated museum in the country.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Tribe, and"}, {"label": "B", "body": "Tribe"}, {"label": "C", "body": "Tribe and"}, {"label": "D", "body": "Tribe,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. This choice uses a comma and a coordinating conjunction (“and”) to join two independent clauses (“The
Tantaquidgeon…Tribe” and “Today…country”).
Choice B is incorrect. This choice results in a grammar error known as a run-on sentence. The clauses before and after “Tribe” are both
independent, so they need to be separated with some sort of punctuation. Choice C is incorrect. This choice results in a grammar error known as
a run-on sentence. The clauses before and after “and” are both independent, so they can’t be linked with just a conjunction. A comma would also
be required. Choice D is incorrect. This choice results in a grammar error called a comma splice. The clauses before and after “Tribe” are both
independent, so they can’t be linked with just a comma. A coordinating conjunction like “and” or “but” would also be required.$qb$);
select seed_pool_question($qb$CB-235c8338$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$That the expansionist appetites of colonial European powers had their sights set on his country was evident to Siam’s King ______ deterring those
ambitions through international diplomacy and domestic reform was perhaps his foremost achievement. Though his reign ended roughly twenty
years before Siam became known by its modern name of Thailand, King Chulalongkorn is often credited with ushering the nation into modernity.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Chulalongkorn;"}, {"label": "B", "body": "Chulalongkorn that"}, {"label": "C", "body": "Chulalongkorn,"}, {"label": "D", "body": "Chulalongkorn"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation within a sentence. This choice uses a semicolon in a
conventional way to join the first main clause (“That...Chulalongkorn”) and the second main clause (“deterring...achievement”).
Choice B is incorrect. Using the conjunction “that” to introduce “deterring...achievement” as a subordinate element of the main clause
(“That...Chulalongkorn”) results in a confusing and ungrammatical sentence. Choice C is incorrect because it results in a comma splice. Without
a conjunction following it, a comma can’t be used in this way to join two main clauses. Choice D is incorrect because it results in a run-on
sentence. The two main clauses are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-b771d175$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Scala is referred to as a compiled programming language because it typically incorporates a compiler—a tool that translates lines of code into
executable commands. Compiling isn’t exclusive to certain programming ______ any language can incorporate this tool.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "languages. However,"}, {"label": "B", "body": "languages; however,"}, {"label": "C", "body": "languages, however,"}, {"label": "D", "body": "languages, however;"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
separate the supplementary adverb “however” from the preceding main clause (“Compiling...languages”) and uses a semicolon to join the next
main clause (“any...tool”) to the rest of the sentence. Further, placing the semicolon after “however” indicates that the information in the
preceding main clause (“compiling isn’t exclusive to certain programming languages”) is contrary to what might be assumed from the
information in the previous sentence (Scala’s status as a compiled programming language might suggest that compiling is unique to certain
languages).
Choice A is incorrect because placing a period after “languages” and starting a new sentence with “however” illogically indicates that the
information in the next sentence (any language can incorporate a compiler) is contrary to the information in the previous sentence (“compiling
isn’t exclusive to certain programming languages”). Instead, the information following “however” supports the previous claim. Choice B is
incorrect because placing the semicolon after “languages” illogically indicates that the information in the next main clause (any language can
incorporate a compiler) is contrary to the information in the previous clause (“compiling isn’t exclusive to certain programming languages”).
Instead, the information following “however” supports the previous claim. Choice C is incorrect because it results in a comma splice. Commas
can’t be used in this way to punctuate a supplementary word or phrase between two main clauses.$qb$);
select seed_pool_question($qb$CB-8772475b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For thousands of years, humans have used domesticated goats (Capra hircus) to clear land of unwanted vegetation. When it comes to their diets,
goats are notoriously ______ they will devour all kinds of shrubs and weeds, leaving virtually no part of any plant unconsumed.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "indiscriminate and"}, {"label": "B", "body": "indiscriminate,"}, {"label": "C", "body": "indiscriminate"}, {"label": "D", "body": "indiscriminate:"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between two main clauses. In this choice, a colon is correctly used
to mark the boundary between one main clause ("goats are notoriously indiscriminate") and another main clause ("they will devour all kinds of
shrubs and weeds") and to introduce the following explanation of goats’ nondiscriminatory behavior when it comes to what they eat.
Choice A is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction. Furthermore, the conjunction "and" fails to indicate that what follows is an explanation of goats’ nondiscriminatory
behavior when it comes to their diets. Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way to join two
main clauses ("goats…indiscriminate" and "they…weeds"). Choice C is incorrect because it results in a run-on sentence. The two main clauses
("goats…indiscriminate" and "they…weeds") are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-eee7536f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$On March 27, 2004, after nine years as a professional boxer, Isra Girgrah retired. The Yemeni American athlete ______ her career with a record of
twenty-eight wins, three losses, and two ties.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "finish"}, {"label": "B", "body": "has been finishing"}, {"label": "C", "body": "finished"}, {"label": "D", "body": "will be finishing"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of a verb to express tense in a sentence. In this choice, the past tense verb
“finished” is consistent with the other past tense verb (“retired”) used to refer to Girgrah’s retirement in 2004.
Choice A is incorrect because the present tense verb “finish” isn’t consistent with the other past tense verb (“retired”) used to refer to Girgrah’s
retirement in 2004. Furthermore, the plural verb “finish” doesn’t agree in number with the sentence’s singular subject “The Yemeni American
athlete.” Choice B is incorrect because the present perfect progressive tense verb “has been finishing” isn’t consistent with the other past tense
verb (“retired”) used to refer to Girgrah’s retirement in 2004. Choice D is incorrect because the future progressive tense verb “will be finishing”
isn’t consistent with the other past tense verb (“retired”) used to refer to Girgrah’s retirement in 2004.$qb$);
select seed_pool_question($qb$CB-0ff8477b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Food and the sensation of taste are central to Monique Truong’s novels. In The Book of Salt, for example, the exiled character of Bình connects to
his native Saigon through the food he prepares, while in Bitter in the Mouth, the character of Linda ______ a form of synesthesia whereby the
words she hears evoke tastes.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "experienced"}, {"label": "B", "body": "had experienced"}, {"label": "C", "body": "experiences"}, {"label": "D", "body": "will be experiencing"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the present tense verb
“experiences” is consistent with the other present tense verbs (e.g., “connects” and “prepares”) used to describe the events in Truong’s novels.
Furthermore, it’s conventional to use the present tense when discussing a literary work.
Choice A is incorrect because the past tense verb “experienced” isn’t consistent with the other present tense verbs used to describe the events in
Truong’s novels. Choice B is incorrect because the past perfect tense verb “had experienced” isn’t consistent with the other present tense verbs
used to describe the events in Truong’s novels. Choice D is incorrect because the future progressive tense verb “will be experiencing” isn’t
consistent with the other present tense verbs used to describe the events in Truong’s novels.$qb$);
select seed_pool_question($qb$CB-b260c65a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Earth is not a perfect sphere. Due to the ______ gravitational pull, Earth bulges out on the sides closest to and farthest from the Moon. This
distorting pull is known as a tidal force, and it is responsible for the changes in water levels that are called high and low tides.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Moon’s"}, {"label": "B", "body": "Moons"}, {"label": "C", "body": "Moons’"}, {"label": "D", "body": "Moon"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of possessive nouns. The singular possessive noun "Moon’s" correctly
indicates that there is only one Moon, and it has a gravitational pull.
Choice B is incorrect because the context requires the singular possessive noun "Moon’s," not the plural noun "Moons." Choice C is incorrect
because the context requires the singular possessive noun "Moon’s," not the plural possessive noun "Moons’." Choice D is incorrect because the
context requires the singular possessive noun "Moon’s," not the singular noun "Moon."$qb$);
select seed_pool_question($qb$CB-83c9c503$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Nigerian American artist Toyin Ojih Odutola uses black-ink pens to create highly detailed drawings of human figures. Her portrait of novelist
Zadie ______ is displayed in the National Portrait Gallery in London.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Smith:"}, {"label": "B", "body": "Smith—"}, {"label": "C", "body": "Smith"}, {"label": "D", "body": "Smith,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between a subject and a verb. No punctuation is needed when, as in
this case, a subject ("Her portrait of novelist Zadie Smith") is immediately followed by a main verb ("is displayed").
Choice A is incorrect because no punctuation is needed between the subject and the verb. Choice B is incorrect because no punctuation is
needed between the subject and the verb. Choice D is incorrect because no punctuation is needed between the subject and the verb.$qb$);
select seed_pool_question($qb$CB-05a14e18$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While the ancient Celts—Iron Age peoples who inhabited parts of western and central Europe—weren’t a single unified group, their art often
featured common elements. These included intricate patterns of interlocking spiral lines, which often held symbolic ______ of birds, horses, and
other animals; and inlaid enamel accents.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "significance; depictions"}, {"label": "B", "body": "significance, depictions"}, {"label": "C", "body": "significance: depictions"}, {"label": "D", "body": "significance. Depictions"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the punctuation of elements in a complex series. It’s conventional to use a
semicolon to separate items in a complex series with internal punctuation, and in this choice, the semicolon after “significance” is conventionally
used to separate the first item (“intricate...significance”) and the second item (“depictions...animals”) in the series of common elements found in
Celtic art. Moreover, the semicolon after “significance” matches the semicolon used later to separate the second item (“depictions...animals”)
and the third item (“and...accents”) in the series.
Choice B is incorrect because a comma after “significance” doesn’t match the semicolon used later to separate the second and third items in the
series (“depictions...animals” and “and...accents”). Choice C is incorrect because a colon can’t be used in this way to separate items in a
complex series. Choice D is incorrect because placing a period after “significance” results in a rhetorically unacceptable sentence fragment
beginning with “depictions.”$qb$);
select seed_pool_question($qb$CB-9f737b2a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In Death Valley National Park’s Racetrack Playa, a flat, dry lakebed, are 162 rocks—some weighing less than a pound but others almost 700
pounds—that move periodically from place to place, seemingly of their own volition. Racetrack-like trails in the ______ mysterious migration.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "playas sediment mark the rock’s"}, {"label": "B", "body": "playa’s sediment mark the rocks"}, {"label": "C", "body": "playa’s sediment mark the rocks’"}, {"label": "D", "body": "playas’ sediment mark the rocks’"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of plural and possessive nouns. The singular possessive noun “playa’s” and
the plural possessive noun “rocks’” correctly indicate that the sediment is that of one playa (the Racetrack Playa) and that there are multiple
rocks that have mysteriously migrated across the sediment.
Choice A is incorrect because the context requires the singular possessive noun “playa’s” and the plural possessive noun “rocks’,” not the plural
noun “playas” and the singular possessive noun “rock’s.” Choice B is incorrect because the context requires the plural possessive noun “rocks’,”
not the plural noun “rocks.” Choice D is incorrect because the context requires the singular possessive noun “playa’s,” not the plural possessive
noun “playas’.”$qb$);
select seed_pool_question($qb$CB-c52652c9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The human brain is primed to recognize faces—so much so that, due to a perceptual tendency called pareidolia, ______ will even find faces in
clouds, wooden doors, pieces of fruit, and other faceless inanimate objects. Researcher Susan Magsamen has focused her work on better
understanding this everyday phenomenon.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "she"}, {"label": "B", "body": "they"}, {"label": "C", "body": "it"}, {"label": "D", "body": "those"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. "It" is a singular pronoun used to stand in for objects. Since the antecedent in this case is the singular noun phrase
"the human brain," "it" is a perfect pronoun to use here.
Choice A is incorrect. Although "she" is a singular pronoun, it is reserved for people and animals, not objects like "the human brain." Choice B is
incorrect. "They" is a plural pronoun, but we need a singular pronoun to represent the antecedent "the human brain." Choice D is incorrect. "Those"
is a plural pronoun, but we need a singular pronoun to represent the antecedent "the human brain."$qb$);
select seed_pool_question($qb$CB-ba8ebf49$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The poem Beowulf begins with the word “hwæt,” which is an Old English ______ as “hark!” or “listen!” in some versions, the word was playfully
rendered as “bro!” by Maria Dahvana Headley in her 2020 translation of the poem.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "exclamation, translated"}, {"label": "B", "body": "exclamation and translated"}, {"label": "C", "body": "exclamation translated"}, {"label": "D", "body": "exclamation. Translated"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence ("The poem…exclamation") and another sentence that begins with a supplementary element
("Translated…poem"). The supplementary element "translated as ‘hark!’ or ‘listen!’ in some versions" modifies the subject of the second sentence,
"the word" (referring to hwæt).
Choice A is incorrect because it results in a comma splice after "exclamation." A comma can’t be used in this way to mark the boundary between
sentences. Choice B is incorrect. Without a comma preceding it, the conjunction "and" can’t be used in this way to join sentences. Choice C is
incorrect because it results in a comma splice after "versions." A comma can’t be used in this way to mark the boundary between sentences.$qb$);
select seed_pool_question($qb$CB-188f7e3c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 2016, engineer Vanessa Galvez oversaw the installation of 164 bioswales, vegetated channels designed to absorb and divert stormwater,
along the streets of Queens, New York. By reducing the runoff flowing into city sewers, ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "the mitigation of both street flooding and the resulting pollution of nearby waterways has been achieved by bioswales."}, {"label": "B", "body": "the bioswales have mitigated both street flooding and the resulting pollution of nearby waterways."}, {"label": "C", "body": "the bioswales’ mitigation of both street flooding and the resulting pollution of nearby waterways has been achieved."}, {"label": "D", "body": "both street flooding and the resulting pollution of nearby waterways have been mitigated by bioswales."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “the bioswales” the
subject of the sentence and places it immediately after the modifying phrase “By reducing…sewers.” In doing so, this choice clearly establishes
that the bioswales—and not another noun in the sentence—are reducing runoff flowing into city sewers.
Choice A is incorrect because it results in a dangling modifier. The placement of the noun phrase “the mitigation…waterways” immediately after
the modifying phrase results in unclear modification. The resulting sentence makes it hard to determine what is responsible for “reducing the
runoff”: the bioswales or some other noun in the sentence. Choice C is incorrect because it results in a dangling modifier. The placement of the
noun phrase “the bioswales’ mitigation…waterways” immediately after the modifying phrase results in unclear modification. The resulting
sentence makes it hard to determine what is responsible for “reducing the runoff”: the bioswales or some other noun in the sentence. Choice D is
incorrect because it results in a dangling modifier. The placement of the noun phrase “street flooding and the resulting pollution” immediately
after the modifying phrase illogically suggests that the “flooding and pollution” are reducing runoff flowing into city sewers.$qb$);
select seed_pool_question($qb$CB-36944347$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Official measurements of the Mississippi River’s length vary: according to the US Geological Survey, the river is 2,300 miles long, whereas the
Environmental Protection Agency records its length as 2,320 miles. This disparity can be explained in part by the fact that rivers such as the
Mississippi expand and contract as ______ sediment.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "they accumulate"}, {"label": "B", "body": "one accumulates"}, {"label": "C", "body": "it accumulates"}, {"label": "D", "body": "we accumulate"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is pronoun-antecedent agreement. The plural pronoun “they” agrees in number with the
plural antecedent “rivers” and clearly expresses the general statement that rivers expand and contract as they accumulate sediment. Secondarily,
the plural verb “accumulate” agrees in number with the plural pronoun and its plural antecedent.
Choice B is incorrect because the singular pronoun “one” doesn’t agree in number with the plural antecedent “rivers.” Choice C is incorrect
because the singular pronoun “it” doesn’t agree in number with the plural antecedent “rivers.” Choice D is incorrect because the use of the
personal pronoun “we” is illogical in this context; it suggests that a group of people (including the speaker) accumulate sediment, which doesn’t
make sense.$qb$);
select seed_pool_question($qb$CB-a466679a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1976, the Inuit rock group Sikumiut recorded the album People of the Ice. Though only their first record, it shows a band already skilled at the
difficult task of making music that sounds easy and fun. On songs like “Utirumavunga,” Lucassie Koperqualuk’s guitar riffs effortlessly ______
Charlie Adams’s delightfully catchy vocal melodies.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "blend, with"}, {"label": "B", "body": "blend. With"}, {"label": "C", "body": "blend; with"}, {"label": "D", "body": "blend with"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation between a verb and a prepositional phrase. No punctuation is needed
between the verb “blend” and the prepositional phrase “with Charlie Adams’s delightfully catchy vocal melodies.” The prepositional phrase
completes the idea of the sentence, explaining with what Koperqualuk’s guitar riffs blend.
Choice A is incorrect because no punctuation is needed between the verb and the prepositional phrase. Choice B is incorrect because no
punctuation is needed between the verb and the prepositional phrase. Choice C is incorrect because no punctuation is needed between the verb
and the prepositional phrase.$qb$);
select seed_pool_question($qb$CB-a8fa749a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Nigerian author Buchi Emecheta’s celebrated literary oeuvre includes The Joys of Motherhood, a novel about the changing roles of women in
1950s ______ a television play about the private struggles of a newlywed couple in Nigeria; and Head Above Water, her autobiography.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Lagos, A Kind of Marriage,"}, {"label": "B", "body": "Lagos; A Kind of Marriage,"}, {"label": "C", "body": "Lagos, A Kind of Marriage:"}, {"label": "D", "body": "Lagos; A Kind of Marriage"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the punctuation of items in a complex series (a series including internal
punctuation). In this choice, the semicolon after “Lagos” is conventionally used to separate the first item (“The Joys…Lagos”) and the second
item (“A Kind…Nigeria”) in the series. Further, the comma after “Marriage” correctly separates the title “A Kind of Marriage” from the
supplementary phrase (“a television…Nigeria”) that describes it.
Choice A is incorrect because the comma after “Lagos” doesn’t match the semicolon used later in the series to separate the second item (“A
Kind…Nigeria”) from the third item (“and…autobiography”). Choice C is incorrect because the comma after “Lagos” doesn’t match the semicolon
used later in the series to separate the second item (“A Kind…Nigeria”) from the third item (“and…autobiography”). Additionally, a colon can’t be
used in this way to separate the title “A Kind of Marriage” from the supplementary phrase (“a television…Nigeria”) that describes it. Choice D is
incorrect because it fails to use appropriate punctuation to separate the title “A Kind of Marriage” from the supplementary phrase (“a television…
Nigeria”) that describes it.$qb$);
select seed_pool_question($qb$CB-898f182c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Richard Spikes was a prolific African American inventor known for his contributions to automotive engineering. Between 1907 and 1946, he
patented many inventions, ______ an automobile turn signal, a safety brake, and—most famously—the first automatic gearshift.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "included"}, {"label": "B", "body": "includes"}, {"label": "C", "body": "including"}, {"label": "D", "body": "will include"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of nonfinite verb forms within a sentence. The nonfinite present participle
"including" is correctly used to form a participial phrase that supplements the main clause "he patented many inventions," listing several of
Spikes’s patented inventions.
Choice A is incorrect because the finite past tense verb "included" can’t be used in this way to supplement the main clause "he patented many
inventions." Choice B is incorrect because the finite present tense verb "includes" can’t be used in this way to supplement the main clause "he
patented many inventions." Choice D is incorrect because the finite future tense verb "will include" can’t be used in this way to supplement the
main clause "he patented many inventions."$qb$);
select seed_pool_question($qb$CB-6e5bf3a8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Even though bats prefer very sweet nectar, the plants that attract them have evolved to produce nectar that is only moderately sweet. A recent
study ______ why: making sugar is energy-intensive, and it is more advantageous for plants to make a large amount of low-sugar nectar than a
small amount of high-sugar nectar.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "explains"}, {"label": "B", "body": "explaining"}, {"label": "C", "body": "having explained"}, {"label": "D", "body": "to explain"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of finite and nonfinite verb forms within a sentence. A main clause requires a
finite verb to perform the action of the subject (in this case, “a recent study”), and this choice supplies the finite present tense verb “explains” to
indicate that the study explains why plants that attract bats have evolved to produce moderately sweet nectar.
Choice B is incorrect because the nonfinite participle “explaining” doesn’t supply the main clause with a finite verb. Choice C is incorrect because
the nonfinite participle “having explained” doesn’t supply the main clause with a finite verb. Choice D is incorrect because the nonfinite to-
infinitive “to explain” doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-fa36d803$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Long attributed to Jacques-Louis David, the preeminent Neoclassical painter of his day, the 1801 painting Marie Joséphine Charlotte du Val
d’Ognes gained fresh attention in the 1990s when art historians discovered that the painting—which depicts a solitary young woman sketching—
was actually the work of little-known French portrait ______ Marie-Denise Villers (1774–1821).
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "artist—"}, {"label": "B", "body": "artist"}, {"label": "C", "body": "artist:"}, {"label": "D", "body": "artist,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation between titles and proper nouns. No punctuation is needed to
set off the proper noun "Marie-Denise Villers" from the title that describes Villers, "little-known French portrait artist."
Choice A is incorrect because no punctuation is needed. Choice C is incorrect because no punctuation is needed. Choice D is incorrect because
no punctuation is needed.$qb$);
select seed_pool_question($qb$CB-84658166$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 1943, in the midst of World War II, mathematics professor Grace Hopper was recruited by the US military to help the war effort by solving
complex equations. Hopper’s subsequent career would involve more than just ______ as a pioneering computer programmer, Hopper would help
usher in the digital age.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "equations, though:"}, {"label": "B", "body": "equations, though,"}, {"label": "C", "body": "equations. Though,"}, {"label": "D", "body": "equations though"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation to mark boundaries between supplements and clauses. The
comma after “equations” is used to separate the independent clause (“Hopper’s…equation”) from the supplementary adverb phrase “though.” The
colon after “though” is used to mark the boundary between the clause ending with “though” and the following clause (“as…age”). A colon used in
this way introduces information that illustrates or explains information that has come before it. In this case, the colon after “though” introduces
the following explanation of how Hopper’s subsequent career would involve more than just solving equations: she would become a pioneering
computer programmer.
Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way to join two independent clauses (“Hopper’s…
though” and “as…age”) such as these. Choice C is incorrect because it results in an illogical sequence of sentences. Placing the period after
“equations” and beginning the next sentence with “Though” illogically suggests that the following information (that Hopper would help usher in
the digital age) is contrary to the information in the previous sentence (Hopper’s subsequent career would involve more than just solving
equations). Instead, the information that follows supports the information from the previous sentence by explaining how her work and influence
extended beyond solely solving equations. Choice D is incorrect because it results in a run-on sentence. The two independent clauses
(“Hopper’s…though” and “as…age”) are fused without punctuation.$qb$);
select seed_pool_question($qb$CB-7c48a6dd$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the late 1960s, inspired in part by the sight of laundry hanging on a clothesline, African American abstract painter Sam Gilliam began to create
his iconic “Drape” paintings. He applied bold, saturated hues to large canvases and ______ them from ceilings or walls, causing the drooping
fabric to cascade in dramatic loops and curves.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "to have suspended"}, {"label": "B", "body": "suspending"}, {"label": "C", "body": "to suspend"}, {"label": "D", "body": "suspended"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms within a sentence. The past tense verb “suspended” provides a
second finite verb to complete the coordinated structure of the sentence, in which the two finite verbs (“applied” and “suspended”) are used to
describe what Gilliam did.
Choice A is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive “to have suspended” doesn’t supply a second
finite verb to complete the coordinated structure of the sentence. Choice B is incorrect because it results in an ungrammatical sentence. The
nonfinite participle “suspending” doesn’t supply a second finite verb to complete the coordinated structure of the sentence. Choice C is incorrect
because it results in an ungrammatical sentence. The nonfinite to-infinitive “to suspend” doesn’t supply a second finite verb to complete the
coordinated structure of the sentence.$qb$);
select seed_pool_question($qb$CB-e3c1b4f7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Digital artist Jung (Lulu) Chen primarily uses a suite of software tools to create illustrations for children’s books. To manifest the warm and
welcoming atmospheres that are a signature of her ______ she occasionally relies on more traditional art techniques, such as painting with
watercolors.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "work, though,"}, {"label": "B", "body": "work, though"}, {"label": "C", "body": "work; though,"}, {"label": "D", "body": "work, though;"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation within a sentence. The comma after "work" pairs with the
comma after "though" to separate the supplementary element "though" from the rest of the sentence. This supplementary element signals that
what follows is an exception to Chen using software tools to create illustrations, and the pair of commas indicates that this element could be
removed without affecting the grammatical coherence of the sentence.
Choice B is incorrect because the comma after "work" must be paired with a comma after "though" to separate the supplementary element from
the rest of the sentence. Choice C is incorrect because a semicolon can’t be paired with a comma in this way to separate the supplementary
element from the rest of the sentence. Choice D is incorrect because a semicolon can’t be paired with a comma in this way to separate the
supplementary element from the rest of the sentence.$qb$);
select seed_pool_question($qb$CB-5cc85f01$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A conceptual artist and designer embraced by both the art world and the fashion ______ Mary Ping was chosen to curate the exhibition Front Row:
Chinese American Designers for the Museum of Chinese in America.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "world"}, {"label": "B", "body": "world:"}, {"label": "C", "body": "world;"}, {"label": "D", "body": "world,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation between a supplementary phrase and a main clause. This choice
correctly uses a comma to mark the boundary between the supplementary phrase (“A conceptual artist…world”), which describes Mary Ping, and
the main clause (“Mary…America”).
Choice A is incorrect because it fails to mark the boundary between the supplementary phrase (“A conceptual artist…world”) and the main clause
(“Mary…America”) with appropriate punctuation. Choice B is incorrect because a colon can’t be used in this way to join the supplementary phrase
(“A conceptual artist…world”) and the main clause (“Mary…America”). In this context, the colon incorrectly suggests that the information in the
supplementary phrase is an explanation or amplification of the information in the main clause (Mary Ping being chosen to curate the exhibition),
which isn’t the case. Choice C is incorrect because a semicolon can’t be used in this way to join the supplementary phrase (“A conceptual artist…
world”) and the main clause (“Mary…America”). Semicolons are conventionally used to separate two main clauses or to separate items in a
complex series.$qb$);
select seed_pool_question($qb$CB-8d53e7a0$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Slam poet Elizabeth Acevedo’s debut novel The Poet X, winner of the 2018 National Book Award for Young People’s Literature, is composed of
______ protagonist, fifteen-year-old Xiomara Batista.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "poems putatively written by the novel’s"}, {"label": "B", "body": "poem’s putatively written by the novel’s"}, {"label": "C", "body": "poem’s putatively written by the novels’"}, {"label": "D", "body": "poems putatively written by the novels’"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. Nothing belongs to the “poems” in the sentence, so it should not be possessive—just a simple plural noun. The
protagonist does belong to the novel—it’s the protagonist of the novel—so “novel” needs to be a singular possessive noun.
Choice B is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. This choice uses the
singular possessive “poem’s,” but the text indicates that it should be the simple plural “poems”: there is more than one poem, and nothing
belongs to the poems. Choice C is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. This
choice uses the singular possessive “poem’s,” but the text indicates that it should be the simple plural “poems”: there is more than one poem, and
nothing belongs to the poems. This choice also uses the plural possessive “novels’,” which is incorrect because there is only one novel. Choice D
is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. This choice uses the plural possessive
“novels’,” which is incorrect because there is only one novel, so it should be the singular possessive “novel’s.” .$qb$);
select seed_pool_question($qb$CB-43b88827$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In October of 1648, representatives from 96 different parties convened to sign the final treaties of the Peace of Westphalia. The treaties, which
brought an end to the Thirty Years’ War, ______ signed in the cities of Osnabrück and Münster, both located in the Holy Roman Empire–controlled
region of Westphalia.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "were"}, {"label": "B", "body": "is"}, {"label": "C", "body": "was"}, {"label": "D", "body": "has been"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The plural verb “were signed” agrees in number with the
plural subject “the treaties.”
Choice B is incorrect because the singular verb “is signed” doesn’t agree in number with the plural subject “the treaties.” Choice C is incorrect
because the singular verb “was signed” doesn’t agree in number with the plural subject “the treaties.” Choice D is incorrect because the singular
verb “has been signed” doesn’t agree in number with the plural subject “the treaties.”$qb$);
select seed_pool_question($qb$CB-cabe71d4$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Both Sona Charaipotra, an Indian American, and Dhonielle Clayton, an African American, grew up frustrated by the lack of diverse characters in
books for young people. In 2011, these two writers joined forces to found CAKE Literary, a book packaging ______ specializes in the creation and
promotion of stories told from diverse perspectives for children and young adults.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "company,"}, {"label": "B", "body": "company that"}, {"label": "C", "body": "company"}, {"label": "D", "body": "company, that"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use and punctuation of an integrated relative clause. This choice correctly uses
the relative pronoun “that” and no punctuation to create an integrated relative clause that provides essential information about the noun phrase
(“a book packaging company”) that it modifies.
Choice A is incorrect because it doesn’t use a relative pronoun to link the verb phrase beginning with “specializes” to the noun phrase that it
modifies (“a book packaging company”). Choice C is incorrect because it doesn’t use a relative pronoun to link the verb phrase beginning with
“specializes” to the noun phrase that it modifies (“a book packaging company”). Choice D is incorrect because no punctuation is needed between
the integrated relative clause beginning with “that specializes” and the noun phrase that it modifies (“a book packaging company”).$qb$);
select seed_pool_question($qb$CB-9994ae0d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Artist Yto Barrada’s exhibition Ways to Baffle the Wind incorporates sculptures, textiles, and films. Barrada’s pieces, utilizing elements as
disparate as plant-dyed fabrics, wire crab traps filled with stones, and cotton balls dangling above a fan, ______ the ways humans attempt to
organize and regulate nature.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "explore"}, {"label": "B", "body": "has explored"}, {"label": "C", "body": "explores"}, {"label": "D", "body": "exploring"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The plural verb “explore” agrees in number with the plural
subject “Barrada’s pieces.”
Choice B is incorrect because the singular verb phrase “has explored” doesn’t agree in number with the plural subject “Barrada’s pieces.” Choice
C is incorrect because the singular verb “explores” doesn’t agree in number with the plural subject “Barrada’s pieces.” Choice D is incorrect
because the nonfinite participle “exploring” doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-99dedf36$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When a given term—“self-fulfilling prophecies” and “role models” are two well-known examples—is generally accepted and frequently used, ______
susceptible to obliteration by incorporation (OBI). In cases of OBI, widely used terms are rarely, if at all, attributed to the individuals who coined
them.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "they often become"}, {"label": "B", "body": "these often become"}, {"label": "C", "body": "this often becomes"}, {"label": "D", "body": "it often becomes"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is pronoun-antecedent agreement. The singular pronoun “it” agrees in number with the
singular antecedent “a given term” and clearly indicates that the term becomes susceptible to obliteration by incorporation.
Choice A is incorrect because the plural pronoun “they” neither agrees in number with the singular antecedent “a given term” nor clearly indicates
that the given term—not another plural noun in the sentence, such as “examples”—becomes susceptible to obliteration by incorporation. Choice B
is incorrect because the plural pronoun “these” neither agrees in number with the singular antecedent “a given term” nor clearly indicates that the
given term—not another plural noun in the sentence, such as “examples”—becomes susceptible to obliteration by incorporation. Choice C is
incorrect because the singular pronoun “this” is ambiguous in this context, leaving unclear what exactly becomes susceptible to obliteration by
incorporation.$qb$);
select seed_pool_question($qb$CB-61160f0a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Author Madeline L’Engle, ______ to create a suspenseful tone that draws the reader in, begins her novel A Wrinkle in Time with descriptions of
“wraithlike shadows” and “the frenzied lashing of the wind.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "looked"}, {"label": "B", "body": "looks"}, {"label": "C", "body": "is looking"}, {"label": "D", "body": "looking"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite present participle verb
“looking” is correctly used to form a subordinate clause that describes the intent behind how L’Engle begins her novel.
Choice A is incorrect because the finite past tense verb “looked” can’t be used in this way to form a subordinate clause. Choice B is incorrect
because the finite present tense verb “looks” can’t be used in this way to form a subordinate clause. Choice C is incorrect because the finite
present progressive tense verb “is looking” can’t be used in this way to form a subordinate clause.$qb$);
select seed_pool_question($qb$CB-7b950fc2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 2000, Nora de Hoyos Comstock, herself an owner of a successful consulting firm, sought to increase Latina representation in corporate ______
founded Las Comadres para las Americas, an international community that for over two decades has served as a resource and information
network for Latina business professionals.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "settings she"}, {"label": "B", "body": "settings, she"}, {"label": "C", "body": "settings and she"}, {"label": "D", "body": "settings. She"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. It appropriately uses a period to mark the end of one independent clause ("In 2000…settings") and the start of
another ("She founded…professionals").
Choice A is incorrect. This choice results in a run-on sentence error. Both the clause before the blank ("In 2000…settings") and the clause after
the blank ("she…professionals") are independent clauses, so they need to be separated by punctuation. Choice B is incorrect. This choice results
in a comma splice error. It incorrectly joins two independent clauses with just a comma. Linking two independent clauses with a comma also
requires the use of a coordinating conjunction (like for, and, nor, but, or, yet, or so). Choice C is incorrect. This choice results in a run-on sentence,
an error caused when two independent clauses are joined without punctuation or appropriate conjunctions. Since both the clause before the
blank ("In 2000…settings") and the clause after the blank ("she…professionals") are independent, a comma would be required in addition to the
coordinating conjunction "and."$qb$);
select seed_pool_question($qb$CB-75f49353$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Progressive Era in the United States witnessed the rise of numerous Black women’s clubs, local organizations that advocated for racial and
gender equality. Among the clubs’ leaders ______ Josephine St. Pierre Ruffin, founder of the Women’s Era Club of Boston.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "was"}, {"label": "B", "body": "were"}, {"label": "C", "body": "are"}, {"label": "D", "body": "have been"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested here is subject-verb agreement. The singular verb “was” agrees in number with the
singular subject “Josephine St. Pierre Ruffin.”
Choice B is incorrect because the plural verb “were” doesn’t agree in number with the singular subject “Josephine St. Pierre Ruffin.” Choice C is
incorrect because the plural verb “are” doesn’t agree in number with the singular subject “Josephine St. Pierre Ruffin.” Choice D is incorrect
because the plural verb “have been” doesn’t agree in number with the singular subject “Josephine St. Pierre Ruffin.”$qb$);
select seed_pool_question($qb$CB-20a6a4ed$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Anthropologist Lívia Barbosa, of the Universidade Federal Fluminense in Brazil, ______ food and sociability in contemporary Brazil—specifically,
how foods such as cabidela (a rice and rabbit dish) and churrasco (a barbeque dish) function as central mechanisms in building social
relationships, values, and identities.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "studies"}, {"label": "B", "body": "are studying"}, {"label": "C", "body": "have studied"}, {"label": "D", "body": "study"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb "studies" agrees in number with the
singular subject "anthropologist Lívia Barbosa."
Choice B is incorrect because the plural verb "are studying" doesn’t agree in number with the singular subject "anthropologist Lívia Barbosa."
Choice C is incorrect because the plural verb "have studied" doesn’t agree in number with the singular subject "anthropologist Lívia Barbosa."
Choice D is incorrect because the plural verb "study" doesn’t agree in number with the singular subject "anthropologist Lívia Barbosa."$qb$);
select seed_pool_question($qb$CB-2cb1ee22$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In premodern Europe, one could sail from the east coast of England to the Netherlands or France faster than one could travel by land to England’s
capital, London. In that era, historian Michael Pye argues in his 2015 book The Edge of the World: A Cultural History of the North Sea and the
Transformation of Europe, the North Sea did more to link the various peoples, cultures, and economies on ______ shores than to divide them.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "its"}, {"label": "B", "body": "it’s"}, {"label": "C", "body": "they’re"}, {"label": "D", "body": "their"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of possessive determiners. The singular possessive determiner “its” agrees
in number with the singular noun “the North Sea” and thus indicates that the shores are those of the North Sea.
Choice B is incorrect because “it’s” is the contraction for “it is” or “it has,” not a possessive determiner. Choice C is incorrect because “they’re” is
the contraction for “they are,” not a possessive determiner. Choice D is incorrect because the plural possessive determiner “their” doesn’t agree in
number with the singular noun “the North Sea.”$qb$);
select seed_pool_question($qb$CB-a03008de$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Proto-Nilotic language, common ancestor of fifty-five African languages with similar linguistic properties, ______ like all protolanguages,
hypothetical: there’s no direct evidence these ancestral languages actually existed.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is,"}, {"label": "B", "body": "are,"}, {"label": "C", "body": "have been,"}, {"label": "D", "body": "were,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb "is" agrees in number with the singular
subject "the Proto-Nilotic language."
Choice B is incorrect because the plural verb "are" doesn’t agree in number with the singular subject "the Proto-Nilotic language." Choice C is
incorrect because the plural verb "have been" doesn’t agree in number with the singular subject "the Proto-Nilotic language." Choice D is incorrect
because the plural verb "were" doesn’t agree in number with the singular subject "the Proto-Nilotic language."$qb$);
select seed_pool_question($qb$CB-c88ba1b7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the late nineteenth and early twentieth centuries, automobiles were commonly referred to as horseless carriages after the older technology
they still resembled. Known as the Brass Era, this period in automotive design is remembered for its grandeur and artistry, its vehicles ______ by
collectors for their ornate detailing and gleaming brass fittings.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are highly prized"}, {"label": "B", "body": "had been highly prized"}, {"label": "C", "body": "highly prized"}, {"label": "D", "body": "were highly prized"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verb forms in a sentence. The nonfinite past participle phrase "highly
prized" is correctly used to form a supplementary element that modifies the main clause "this…artistry," describing memorable features of Brass
Era automotive design.
Choice A is incorrect because it results in a comma splice. Using the finite present tense verb phrase "are highly prized" creates a second main
clause in the sentence, and two main clauses can’t be joined in this way with only a comma after "artistry." Choice B is incorrect because it
results in a comma splice. Using the finite past perfect tense verb phrase "had been highly prized" creates a second main clause in the sentence,
and two main clauses can’t be joined in this way with only a comma after "artistry." Choice D is incorrect because it results in a comma splice.
Using the finite past tense verb phrase "were highly prized" creates a second main clause in the sentence, and two main clauses can’t be joined
in this way with only a comma after "artistry."$qb$);
select seed_pool_question($qb$CB-e7afd0a1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The radial velocity method, a means of indirect planetary discovery, has detected previously unknown exoplanets at vast distances from ______
the gas giant 55 Cancri d; at 60 light-years away, the Neptune-like planet Pi Mensae d; and, as of 2023, over 1,000 other exoplanets that are too
far away and dim to be observed directly.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Earth at 41 light-years away:"}, {"label": "B", "body": "Earth: at 41 light-years away,"}, {"label": "C", "body": "Earth, at 41 light-years away,"}, {"label": "D", "body": "Earth at 41 light-years away,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation within a sentence. In this choice, a colon is correctly used
after the main clause (“The radial...Earth”) to introduce the complex series that follows. Furthermore, the comma after “away” is conventionally
used to separate the supplementary phrase “at 41 light-years away” from the noun phrase it describes (“the gas giant 55 Cancri d”), the first item
in the series.
Choice A is incorrect because placing a colon after “away” illogically separates the supplementary phrase “at 41 light-years away” from the noun
phrase it describes (“the gas giant 55 Cancri d”) and attaches it to the main clause (“The radial...away”), resulting in a confusing and illogical
sentence. Choice C is incorrect because a comma cannot be used in this way to mark the boundary between a main clause (“The radial...Earth”)
and a complex series. Choice D is incorrect because it fails to mark the boundary between the main clause (“The radial...Earth”) and the complex
series that follows with appropriate punctuation.$qb$);
select seed_pool_question($qb$CB-1b97cce9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Hegra is an archaeological site in present-day Saudi Arabia and was the second largest city of the Nabataean Kingdom (fourth century BCE to
first century CE). Archaeologist Laila Nehmé recently traveled to Hegra to study its ancient ______ into the rocky outcrops of a vast desert, these
burial chambers seem to blend seamlessly with nature.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "tombs. Built"}, {"label": "B", "body": "tombs, built"}, {"label": "C", "body": "tombs and built"}, {"label": "D", "body": "tombs built"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period after “tombs” is used
correctly to mark the boundary between one sentence (“Archaeologist...tombs”) and another (“Built...nature”).
Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice
C is incorrect. Without a comma preceding it, the conjunction “and” can’t be used in this way to join the two sentences. Choice D is incorrect
because it results in a run-on sentence. The sentences (“Archaeologist...tombs” and “Built...nature”) are fused without punctuation and/or a
conjunction.$qb$);
select seed_pool_question($qb$CB-952fd392$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Alberto Gabriele, author of Reading Popular Culture in Victorian Print, tracks the transnational dissemination of works by author Mary Elizabeth
Braddon via the magazine ______ from 1866 to 1899 and distributed throughout the Australian cities of Melbourne, Adelaide, and Hobart; the
continental European cities of Brussels, Paris, and Turin; and cities in Turkey, India, and Jamaica, this magazine helped make Braddon’s serialized
novels globally available.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Belgravia; published"}, {"label": "B", "body": "Belgravia. Published"}, {"label": "C", "body": "Belgravia published"}, {"label": "D", "body": "Belgravia, published"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between the first sentence (“Alberto...Belgravia”) and the second (“Published...available”). The participial phrase beginning
with “published” contains a complex series punctuated with commas and semicolons (“the Australian cities of Melbourne, Adelaide, and Hobart;
the continental European cities of Brussels, Paris, and Turin; and cities in Turkey, India, and Jamaica”), and this participial phrase modifies the
subject of the second sentence, “this magazine.”
Choice A is incorrect. Using a semicolon to join two main clauses in this way in combination with the semicolons that separate the items in the
complex series would result in an ambiguous and confusing sentence. Choice C is incorrect because it results in a comma splice. With no
punctuation after “Belgravia,” the participial phrase “published...Jamaica” reads as an integrated modifier within the noun phrase “the magazine
Belgravia,” and the first main clause (“Alberto...Jamaica”) is then joined to a second main clause (“this...available”) using only a comma. A
comma can’t be used in this way to join two main clauses. Choice D is incorrect because it results in a comma splice. A comma can’t be used in
this way to join two main clauses.$qb$);
select seed_pool_question($qb$CB-fff4c7f4$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$American poet Emily Dickinson wrote many of her poems on scraps of paper, but she also took steps to collect these works. From 1858 to
around 1864, for example, she copied more than 800 of ______ into forty homemade booklets (known as fascicles).
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "them"}, {"label": "B", "body": "this"}, {"label": "C", "body": "that"}, {"label": "D", "body": "it"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The pronoun "them" agrees with the plural antecedents "poems" and "works."
Choice B is incorrect. "This" is a singular pronoun, but its antecedents, "poems" and "works," are plural. Choice C is incorrect. "That" is a singular
pronoun, but its antecedents, "poems" and "works," are plural. Choice D is incorrect. "It" is a singular pronoun, but its antecedents, "poems" and
"works," are plural.$qb$);
select seed_pool_question($qb$CB-40c3589d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Luci Tapahonso is the inaugural poet laureate of the Navajo Nation. Her book Sáanii Dahataal/The Women Are Singing—a combination of fiction
and memoir, poetry and ______ serves as a testament to her versatility as a writer.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "prose;"}, {"label": "B", "body": "prose"}, {"label": "C", "body": "prose,"}, {"label": "D", "body": "prose—"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. “A combination of fiction and memoir, poetry and prose” is a nonessential supplement, so it needs to be set off from
the rest of the sentence with a pair of matching punctuation marks. We already have a dash at the beginning of the supplement, so we need to
add a dash at the end of the supplement to match.
Choice A is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. “A combination of fiction
and memoir, poetry and prose” is a nonessential supplement, so it needs to be set off from the rest of the sentence with a pair of matching
punctuation marks. We already have a dash at the beginning of the supplement, so we need to add a dash at the end of the supplement to
match. Choice B is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. “A combination of
fiction and memoir, poetry and prose” is a nonessential supplement, so it needs to be set off from the rest of the sentence with a pair of
matching punctuation marks. We already have a dash at the beginning of the supplement, so we need to add a dash at the end of the
supplement to match. Choice C is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. “A
combination of fiction and memoir, poetry and prose” is a nonessential supplement, so it needs to be set off from the rest of the sentence with a
pair of matching punctuation marks. We already have a dash at the beginning of the supplement, so we need to add a dash at the end of the
supplement to match.$qb$);
select seed_pool_question($qb$CB-b15724fc$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$American writer Edwidge Danticat, who emigrated from Haiti in 1981, has won acclaim for her powerful short stories, novels, and ______ her
lyrical yet unflinching depictions of her native country’s turbulent history, writer Robert Antoni has compared Danticat to Nobel Prize–winning
novelist Toni Morrison.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "essays, praising"}, {"label": "B", "body": "essays and praising"}, {"label": "C", "body": "essays praising"}, {"label": "D", "body": "essays. Praising"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period after “essays” is used
correctly to mark the boundary between one sentence (“American…essays”) and another (“praising…Morrison”). The participial phrase beginning
with “Praising” modifies the subject of the second sentence, “writer Robert Antoni.”
Choice A is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice
B is incorrect. Without a comma preceding it, the conjunction “and” can’t be used in this way to join sentences. Choice C is incorrect because it
results in a run-on sentence. The sentences (“American…essays” and “Praising…Morrison”) are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-c5d39bc7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Scientists believe that, unlike most other species of barnacle, turtle barnacles (Chelonibia testudinari) can dissolve the cement-like secretions
they use to attach ______ to a sea turtle shell, enabling the barnacles to move short distances across the shell’s surface.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "it"}, {"label": "B", "body": "themselves"}, {"label": "C", "body": "them"}, {"label": "D", "body": "itself"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is pronoun-antecedent agreement. The plural reflexive pronoun “themselves” agrees in
number with the plural antecedent “turtle barnacles,” correctly indicating what is attached to a sea turtle shell.
Choice A is incorrect because the singular pronoun “it” doesn’t agree in number with the plural antecedent “turtle barnacles.” Choice C is
incorrect because it results in an unclear and confusing sentence. In this context, it’s unclear what the plural pronoun “them” refers to. Choice D
is incorrect because the singular reflexive pronoun “itself” doesn’t agree in number with the plural antecedent “turtle barnacles.”$qb$);
select seed_pool_question($qb$CB-e2759b92$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Occupying a significant part of modern-day Nigeria, the Kingdom of Benin was one of the major powers in West Africa between the thirteenth
and nineteenth centuries. It ______ ruled by Oba Ewuare I from 1440 to 1473.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is"}, {"label": "B", "body": "will be"}, {"label": "C", "body": "has been"}, {"label": "D", "body": "was"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the past tense verb
“was ruled” correctly indicates that Oba Ewuare I ruled the Kingdom of Benin in the distant past (from 1440 to 1473). This past tense verb choice
is consistent with the other past tense verb (“was”) used to describe the Kingdom of Benin.
Choice A is incorrect because the present tense verb “is ruled” doesn’t indicate that Oba Ewuare I ruled the Kingdom of Benin in the distant past.
Choice B is incorrect because the future tense verb “will be ruled” doesn’t indicate that Oba Ewuare I ruled the Kingdom of Benin in the distant
past. Choice C is incorrect because the present perfect tense verb “has been ruled” doesn’t indicate that Oba Ewuare I ruled the Kingdom of
Benin in the distant past.$qb$);
select seed_pool_question($qb$CB-72b3db98$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Mia Heavener’s 2019 novel Under Nushagak Bluff, which takes place in a mid-twentieth-century rural Alaskan fishing ______ the story of three
Yup’ik women who grapple with the rise of commercial fisheries and other changes affecting their community.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "village. Tells"}, {"label": "B", "body": "village tells"}, {"label": "C", "body": "village: tells"}, {"label": "D", "body": "village, tells"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. The comma after “village” pairs with the
comma after “Under Nushagak Bluff” to separate the supplementary relative clause (“which...village”) from the rest of the sentence. This
supplementary relative clause functions to provide additional information about the setting of Heavener’s novel, and the pair of commas
indicates that this element could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because it results in two rhetorically unacceptable sentence fragments, one beginning with “Mia” and the other beginning
with “tells.” Choice B is incorrect because it fails to use appropriate punctuation to separate the supplementary relative clause (“which...village”)
from the rest of the sentence. Choice C is incorrect because a colon can’t be paired with a comma in this way to separate the supplementary
relative clause (“which...village”) from the rest of the sentence. A colon can be used between two main clauses or a main clause and
supplement, but here there is no main clause on either side of the colon.$qb$);
select seed_pool_question($qb$CB-a872c60a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The pedagogy of the Suzuki method is rooted in several central ______ by Japanese violinist Shinichi Suzuki, who sought to parallel the linguistic
learning environment, the method emphasizes playing instruments from a very young age and teaches students as young as three to play simple
classical pieces such as “March in G.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "tenets. Developed"}, {"label": "B", "body": "tenets developed"}, {"label": "C", "body": "tenets that, developed"}, {"label": "D", "body": "tenets, developed"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between sentences. This choice correctly uses a period to mark the
boundary between one sentence ("The pedagogy...tenets") and another ("Developed...‘March in G’"). The participial phrase "developed by
Japanese violinist Shinichi Suzuki" modifies the subject of the next sentence, "the method."
Choice B is incorrect because it results in a run-on sentence. The sentences ("The pedagogy...tenets" and "Developed...‘March in G’") are fused
without punctuation and/or a conjunction. Choice C is incorrect because it creates a confusing and illogical sentence structure. The relative
pronoun "that" followed by a comma can’t be used in this way to mark the boundary between sentences. Choice D is incorrect because it results
in a comma splice. A comma can’t be used in this way to mark the boundary between sentences.$qb$);
select seed_pool_question($qb$CB-615f001e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Consider the mechanics of the pinhole camera: light passes through a small hole, resulting in a focused projected image. A ray diagram reveals
how this ______ the hole’s small size restricts light to a single ray, all light passing through the hole can only arrive at a single destination,
eliminating diffraction and ensuring a clear image.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "works because"}, {"label": "B", "body": "works. Because"}, {"label": "C", "body": "works, it’s because"}, {"label": "D", "body": "works: it’s because"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used to correctly
mark the boundary between one sentence ("A ray...works") and another ("Because...image").
Choice A is incorrect because it results in a run-on sentence. The two sentences ("A ray…works" and "Because…image") are fused without
punctuation and/or a conjunction. Choice C is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the
boundary between sentences. Choice D is incorrect because it results in a comma splice. Since the contraction "it’s" creates a main clause, the
comma after "single ray" can’t be used in this way to mark the boundary between two main clauses ("it’s...ray" and "all light…image").$qb$);
select seed_pool_question($qb$CB-594b4a94$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The field of geological oceanography owes much to American ______ Marie Tharp, a pioneering oceanographic cartographer whose detailed
topographical maps of the ocean floor and its multiple rift valleys helped garner acceptance for the theories of plate tectonics and continental
drift.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "geologist,"}, {"label": "B", "body": "geologist"}, {"label": "C", "body": "geologist;"}, {"label": "D", "body": "geologist:"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. “Marie tharp” is essential information that completes the first clause — the first clause doesn’t function without it.
So we don’t want to separate it with punctuation.
Choice A is incorrect. This choice creates a punctuation error. “The field of geological oceanography owes much to American geologist” is
unclear: which geologist are we talking about? We need the “Marie Tharp” for clarity, which means it’s essential information and should not be
separated by a comma. Choice C is incorrect. This choice creates a punctuation error. “The field of geological oceanography owes much to
American geologist” is unclear: which geologist are we talking about? We need the “Marie Tharp” for clarity, which means it’s essential
information and should not be separated by a semicolon. Choice D is incorrect. This choice creates a punctuation error. “The field of geological
oceanography owes much to American geologist” is unclear: which geologist are we talking about? We need the “Marie Tharp” for clarity, which
means it’s essential information and should not be separated by a colon.$qb$);
select seed_pool_question($qb$CB-5ad2a12c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The First Folio, published in 1623, is the first collection of William Shakespeare’s plays. The collection ______ 18 plays that might otherwise have
been lost, such as Julius Caesar and Macbeth.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "to be including"}, {"label": "B", "body": "including"}, {"label": "C", "body": "to include"}, {"label": "D", "body": "includes"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject (in this case, "the collection"), and this choice supplies the finite present tense verb "includes" to indicate
what is in the collection.
Choice A is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive "to be including" doesn’t supply the main clause
with a finite verb. Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite participle "including" doesn’t supply the
main clause with a finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive "to include"
doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-02871a0d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In her large-scale sculpture Casa-Isla, artist Edra Soto included references to her childhood in Puerto Rico. For example, the sculpture’s steel
panels have a crisscrossing pattern inspired by the iron gates ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Soto would see in her neighborhood?"}, {"label": "B", "body": "Soto would see in her neighborhood."}, {"label": "C", "body": "would Soto see in her neighborhood."}, {"label": "D", "body": "would Soto see in her neighborhood?"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a period to punctuate a
declarative sentence ("For example...neighborhood").
Choice A is incorrect. It’s unconventional to use a question mark in this way to punctuate a declarative sentence. Choice C is incorrect. The
structure requires a declarative clause at the end of the sentence that states where Soto saw the steel panels, not an incomplete interrogative
clause that asks a direct question, such as "would Soto see in her neighborhood." Choice D is incorrect. The structure requires a period and a
declarative clause at the end of the sentence that states where Soto saw the steel panels, not an incomplete interrogative clause asking a direct
question, such as "would Soto see in her neighborhood?"$qb$);
select seed_pool_question($qb$CB-2fd05c15$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In crafting her fantasy fiction, Nigerian-born British author Helen Oyeyemi has drawn inspiration from the classic nineteenth-century fairy tales of
the Brothers Grimm. Her 2014 novel Boy, Snow, Bird, for instance, is a complex retelling of the story of Snow White, while her 2019 novel ______
offers a delicious twist on the classic tale of Hansel and Gretel.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "­Gingerbread—"}, {"label": "B", "body": "­Gingerbread,"}, {"label": "C", "body": "Gingerbread"}, {"label": "D", "body": "­Gingerbread:"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation between a subject and a verb. When, as in this case, a subject (“her
2019 novel Gingerbread”) is immediately followed by a verb (“offers”), no punctuation is needed.
Choice A is incorrect because no punctuation is needed between the subject and the verb. Choice B is incorrect because no punctuation is
needed between the subject and the verb. Choice D is incorrect because no punctuation is needed between the subject and the verb.$qb$);
select seed_pool_question($qb$CB-1448f43f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Unsupervised machine learning is an approach that computer scientists like Nina Miolane use to engineer artificial intelligence technologies. It
involves training computer algorithms to organize unlabeled data sets. Multitask learning is another approach. ______ involves training computer
models to perform multiple tasks at the same time.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Those"}, {"label": "B", "body": "They"}, {"label": "C", "body": "It"}, {"label": "D", "body": "Some"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is pronoun-antecedent agreement. The singular pronoun "it" agrees in number with the
singular antecedent "multitask learning" and clearly indicates what multitask learning involves.
Choice A is incorrect because the plural demonstrative pronoun "those" doesn’t agree in number with the singular antecedent "multitask
learning." Choice B is incorrect because the plural pronoun "they" doesn’t agree in number with the singular antecedent "multitask learning."
Choice D is incorrect because the indefinite pronoun "some" is ambiguous in this context; the resulting sentence leaves unclear what exactly
"involves training computer models."$qb$);
select seed_pool_question($qb$CB-175df826$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the 2011 documentary The Barber of Birmingham, civil rights activist James Armstrong recounts how his barbershop in Birmingham, Alabama,
______ as a political hub for members of the Black community during the 1950s.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "serving"}, {"label": "B", "body": "having served"}, {"label": "C", "body": "served"}, {"label": "D", "body": "to serve"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verb forms within a sentence. Relative clauses, such as the one beginning
with "how," require a finite (tensed) verb, a verb that can function as the main verb of a clause. This choice correctly supplies the clause with the
finite past tense verb "served."
Choice A is incorrect because it results in an ungrammatical sentence. The nonfinite participle "serving" doesn’t supply the clause with a finite
verb. Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite participle "having served" doesn’t supply the clause
with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive "to serve" doesn’t supply the
clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-bce9910f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Light of Truth is a bronze and marble sculpture by artist Richard Hunt. It honors civil rights icon Ida B. Wells. The sculpture ______ in a tree-lined
plaza in Chicago, just a few blocks from where Wells lived.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are standing"}, {"label": "B", "body": "have been standing"}, {"label": "C", "body": "stands"}, {"label": "D", "body": "were standing"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is subject-verb agreement. The singular verb "stands" agrees in number with the
singular subject "sculpture."
Choice A is incorrect because the plural verb "are standing" doesn’t agree in number with the singular subject "sculpture." Choice B is incorrect
because the plural verb "have been standing" doesn’t agree in number with the singular subject "sculpture." Choice D is incorrect because the
plural verb "were standing" doesn’t agree in number with the singular subject "sculpture."$qb$);
select seed_pool_question($qb$CB-c88d6301$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the 1980s, Latino filmmakers Luis Valdez, Gregory Nava, and Ramón Menéndez helped expand on-screen representation of Latino Americans
with the films Zoot Suit ______ and Stand and Deliver (1988), respectively.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "(1981) El Norte (1983),"}, {"label": "B", "body": "(1981)—El Norte (1983)—"}, {"label": "C", "body": "(1981), El Norte (1983),"}, {"label": "D", "body": "(1981) El Norte (1983)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of items in a series. The comma after “(1981)” is used
conventionally to separate the first and second items in the series, and the comma after “(1983)” is used conventionally to separate the second
and third items in the series.
Choice A is incorrect because it fails to use appropriate punctuation to separate the first and second items in the series. Choice B is incorrect
because dashes can’t be used in this way to separate items in a simple series. Choice D is incorrect because it fails to use appropriate
punctuation to separate the items in the series.$qb$);
select seed_pool_question($qb$CB-aacddbd8$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$As jazz singer Sarah Vaughan honed her vocal abilities—acquiring a sophisticated timbre and precise control over pitch, dynamics, and ______
she earned comparisons to opera icon Leontyne Price, one of her personal heroes. The comparisons highlight how Vaughan, a jazz star, had
transcended genre boundaries with her singing prowess.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "vibrato:"}, {"label": "B", "body": "vibrato,"}, {"label": "C", "body": "vibrato—"}, {"label": "D", "body": "vibrato"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation within a sentence. The dash after “vibrato” pairs with the dash
after “abilities” to separate the supplementary element (“acquiring...vibrato”) from the rest of the sentence. This supplementary element
functions to describe the vocal abilities Vaughan developed, and the pair of dashes indicates that this element could be removed without
affecting the grammatical coherence of the sentence.
Choice A is incorrect because a colon can’t be paired with a dash in this way to separate the supplementary element from the rest of the
sentence. Choice B is incorrect because a comma can’t be paired with a dash in this way to separate the supplementary element from the rest of
the sentence. Choice D is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the
sentence.$qb$);
select seed_pool_question($qb$CB-97e7bedc$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Oyster mushrooms typically get their nutrients from the damp logs on which they grow, but the fungi are also carnivorous, with the ability to kill
and consume microscopic worms known as nematodes. As researcher Yen-Ping Hsueh has shown, the mushrooms release a toxin that is deadly
to nematodes that ______ in contact with it.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has come"}, {"label": "B", "body": "comes"}, {"label": "C", "body": "is coming"}, {"label": "D", "body": "come"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The plural verb "come" agrees in number with the plural
subject "nematodes."
Choice A is incorrect because the singular verb "has come" doesn’t agree in number with the plural subject "nematodes." Choice B is incorrect
because the singular verb "comes" doesn’t agree in number with the plural subject "nematodes." Choice C is incorrect because the singular verb
"is coming" doesn’t agree in number with the plural subject "nematodes."$qb$);
select seed_pool_question($qb$CB-c8540a5b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Swedish scientists Eva Engvall and Peter Perlmann developed a method for measuring the concentration of different proteins in a biological
sample. Their ______ ELISA (enzyme-linked immunosorbent assay), is used to detect and measure proteins that indicate the presence of certain
diseases.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "method (called"}, {"label": "B", "body": "method—called"}, {"label": "C", "body": "method, called"}, {"label": "D", "body": "method called"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The comma after
“method” pairs with the comma after the closing parenthesis to separate the supplementary element “called ELISA (enzyme-linked
immunosorbent assay)” from the rest of the sentence. This supplementary element functions to identify the name of Engvall and Perlmann’s
method, and the pair of commas indicates that this element could be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because an opening parenthesis can’t be paired with a comma to separate the supplementary element from the rest of the
sentence. Choice B is incorrect because a dash can’t be paired with a comma to separate the supplementary element from the rest of the
sentence. Choice D is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the
sentence.$qb$);
select seed_pool_question($qb$CB-e15c50b2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A standard Argo float, a type of autonomous robot, measures temperature and salinity in the upper regions of ice-free oceans. More advanced
floats can measure a wider range of ______ and monitor seasonal ice zones.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "variables: travel to greater depths"}, {"label": "B", "body": "variables, travel to greater depths,"}, {"label": "C", "body": "variables travel to greater depths,"}, {"label": "D", "body": "variables, travel to greater depths;"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the punctuation of items in a series. The comma after “variables” is used
conventionally to separate the first and second items in the series, and the comma after “depths” is used conventionally to separate the second
and third items.
Choice A is incorrect because a colon can’t be used in this way to separate items in a simple series. Choice C is incorrect because a comma is
needed after “variables” to separate the first and second items in the series. Choice D is incorrect because a semicolon can’t be used in this way
to separate items in a simple series.$qb$);
select seed_pool_question($qb$CB-988c78eb$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Former First Lady of the United States Eleanor Roosevelt and Indian activist and educator Hansa Mehta were instrumental in drafting the United
Nations’ Universal Declaration of Human Rights, a document that ______ the basic freedoms to which all people are entitled.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "have outlined"}, {"label": "B", "body": "were outlining"}, {"label": "C", "body": "outlines"}, {"label": "D", "body": "outline"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is subject-verb agreement. The singular verb “outlines” agrees in number with the
singular subject “document.”
Choice A is incorrect because the plural verb “have outlined” doesn’t agree in number with the singular subject “document.” Choice B is incorrect
because the plural verb “were outlining” doesn’t agree in number with the singular subject “document.” Choice D is incorrect because the plural
verb “outline” doesn’t agree in number with the singular subject “document.”$qb$);
select seed_pool_question($qb$CB-261f4ca6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The capital city of the Aztec empire, Tenochtitlan, was built on an island in a lake. Because of the marshy conditions, the Aztec people ______
floating farms called “chinampas.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "created"}, {"label": "B", "body": "created:"}, {"label": "C", "body": "created,"}, {"label": "D", "body": "created;"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between a verb and its object. No punctuation is needed between
the verb “created” and its object “floating farms called ‘chinampas.’” The object helps complete the idea of the verb—in this case, it explains what
the Aztec people created—and any punctuation between the two results in an ungrammatical sentence.
Choice B is incorrect because no punctuation is needed between the verb and its object. Choice C is incorrect because no punctuation is needed
between the verb and its object. Choice D is incorrect because no punctuation is needed between the verb and its object.$qb$);
select seed_pool_question($qb$CB-96499989$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Fans of science fiction will ______ multiple references to classic sci-fi stories in Janelle Monáe’s song lyrics, including her recurring nods to the
plot of the 1927 sci-fi film Metropolis.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "appreciate the"}, {"label": "B", "body": "appreciate. The"}, {"label": "C", "body": "appreciate, the"}, {"label": "D", "body": "appreciate: the"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested here is punctuation between a verb and object. No punctuation is needed between the
verb ("appreciate") and its object ("the multiple references..."). The object helps complete the idea of the verb—in this case, it explains what fans
of science fiction will appreciate—and any punctuation between the two results in an ungrammatical sentence.
Choice B is incorrect because no punctuation is needed between the verb and its object. Choice C is incorrect because no punctuation is needed
between the verb and its object. Choice D is incorrect because no punctuation is needed between the verb and its object.$qb$);
select seed_pool_question($qb$CB-fdb16e20$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Quantum particles of light—photons—provide an unhackable means of transmitting encryption keys over networks, as attempts to observe
particles in quantum states will invariably alter the particles ______ dismantle any information they transmit.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "and in the process,"}, {"label": "B", "body": "and, in the process,"}, {"label": "C", "body": "and in the process—"}, {"label": "D", "body": "and, in the process"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. This choice uses paired punctuation in the form of two commas to set off the nonessential phrase "in the process."
Choice A is incorrect. The phrase "in the process" is a nonessential element and needs to be set off with paired punctuation. We need a comma
after "and" to match the one after "process." Choice C is incorrect. The phrase "in the process" is a nonessential element and needs to be set off
with paired punctuation, so we would need a dash after "and" to match the one following "process." Choice D is incorrect. The phrase "in the
process" is a nonessential element and needs to be set off with paired punctuation. We would need a comma after "process" to match the one
following "and."$qb$);
select seed_pool_question($qb$CB-7e37affc$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$That the geographic center of North America lay in the state of North Dakota was conceded by all ______ establishing its precise coordinates
proved more divisive.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "involved:"}, {"label": "B", "body": "involved,"}, {"label": "C", "body": "involved"}, {"label": "D", "body": "involved;"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. This choice uses a semicolon in a
conventional way to join the first main clause ("That the...involved") and the second main clause ("establishing...divisive"). Further, the semicolon
is the most appropriate choice when joining two separate, parallel statements, such as here, where the information following the semicolon
contrasts with the information before.
Choice A is incorrect because placing a colon after "involved" illogically indicates that the information in the second main clause (the precise
location was the subject of disagreement) explains or amplifies the information in the previous main clause (the general location was agreed
upon by all). Instead, the information in the second clause contrasts with the previous information. Choice B is incorrect because it results in a
comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main clauses. Choice C is incorrect because it
results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-28166dc6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In knot theory (the mathematical study of curved, closed loops), knots are characterized by their crossing numbers—that is, the number of times
the knotted thread crosses over itself. The trefoil knot and the figure-eight knot, each with a crossing number below five, ______ among the
simplest possible knots with the fewest number of crossings.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "was"}, {"label": "B", "body": "are"}, {"label": "C", "body": "has been"}, {"label": "D", "body": "is"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-verb agreement. The plural verb "are" agrees in number with the plural
compound subject "the trefoil knot and the figure-eight knot." The two types of knots joined by "and" function as a plural subject and thus require
a plural verb.
Choice A is incorrect because the singular verb "was" doesn’t agree in number with the plural compound subject "the trefoil knot and the figure-
eight knot." Choice C is incorrect because the singular verb "has been" doesn’t agree in number with the plural compound subject "the trefoil knot
and the figure-eight knot." Choice D is incorrect because the singular verb "is" doesn’t agree in number with the plural compound subject "the
trefoil knot and the figure-eight knot."$qb$);
select seed_pool_question($qb$CB-4565a53c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Lucía Michel of the University of Chile observed that alkaline soils contain an insoluble form of iron that blueberry plants cannot absorb, thus
inhibiting blueberry growth. If these plants were grown in alkaline soil alongside grasses that aid in iron solubilization, ______ Michel was
determined to find out.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "could the blueberries thrive."}, {"label": "B", "body": "the blueberries could thrive."}, {"label": "C", "body": "the blueberries could thrive?"}, {"label": "D", "body": "could the blueberries thrive?"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a question mark to
punctuate the interrogative clause “could the blueberries thrive,” which asks a direct question at the end of the sentence.
Choice A is incorrect because a period can’t be used in this way to punctuate an interrogative clause, such as “could the blueberries thrive,” at the
end of a sentence. Choice B is incorrect because the context requires an interrogative clause. The declarative clause “the blueberries could
thrive” incorrectly indicates that it was known that the blueberries could thrive in alkaline soil, whereas Michel had yet to find this out. Choice C is
incorrect because a question mark can’t be used in this way to punctuate a declarative clause, such as “the blueberries could thrive,” at the end of
a sentence.$qb$);
select seed_pool_question($qb$CB-f40b447c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Featuring jagged peaks of black ink surrounded by hazy swirls of blue and green paint, Zhang Daqian’s 1983 painting Panorama of Mount Lu is
inspired by the tradition of qinglü shanshui, a type of Chinese landscape painting ______ by the use of blue and green hues to depict ethereal,
otherworldly landscapes.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has been characterized"}, {"label": "B", "body": "will be characterized"}, {"label": "C", "body": "characterized"}, {"label": "D", "body": "is characterized"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite past participle "characterized"
is correctly used within a supplementary element that modifies the main clause "Zhang...shanshui," defining qinglü shanshui and explaining some
of its identifying traits.
Choice A is incorrect because it results in a comma splice. Using the finite present perfect tense verb "has been characterized" creates a second
main clause in the sentence, and the two main clauses can’t be joined in this way by only the comma before "a type." Choice B is incorrect
because it results in a comma splice. Using the finite future tense verb "will be characterized" creates a second main clause in the sentence, and
the two main clauses can’t be joined in this way by only the comma before "a type." Choice D is incorrect because it results in a comma splice.
Using the finite present tense verb "is characterized" creates a second main clause in the sentence, and the two main clauses can’t be joined in
this way by only the comma before "a type."$qb$);
select seed_pool_question($qb$CB-7a0d9031$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In many of her landscape paintings from the 1970s and 1980s, Lebanese American artist Etel Adnan worked to capture the essence of
California’s fog-shrouded Mount Tamalpais region through abstraction, using splotches of color to represent the area’s features. Interestingly, the
triangle representing the mountain itself ______ among the few defined figures in her paintings.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are"}, {"label": "B", "body": "have been"}, {"label": "C", "body": "were"}, {"label": "D", "body": "is"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject–verb agreement. The singular verb “is” agrees in number with the singular
subject “the triangle.”
Choice A is incorrect because the plural verb “are” doesn’t agree in number with the singular subject “the triangle.” Choice B is incorrect because
the plural verb “have been” doesn’t agree in number with the singular subject “the triangle.” Choice C is incorrect because the plural verb “were”
doesn’t agree in number with the singular subject “the triangle.”$qb$);
select seed_pool_question($qb$CB-91fbd59d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Award-winning cinematographer James Wong Howe was known for his innovative filming techniques. While filming a boxing match for the
movie Body and Soul ______ Howe had a handheld camera operator wear roller skates. This allowed the operator to move smoothly around actors
in a boxing ring, creating an immersive experience for viewers.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "(1947), and"}, {"label": "B", "body": "(1947),"}, {"label": "C", "body": "(1947) and"}, {"label": "D", "body": "(1947)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation between a supplementary element and a main clause. This choice
correctly uses a comma to mark the boundary between the supplementary phrase (“While...1947”), which indicates when the action occurred,
and the main clause (“Howe had a handheld camera operator wear roller skates”).
Choice A is incorrect because a comma paired with the conjunction “and” can’t be used in this way to mark the boundary between the
supplementary element (“While…1947”) and the main clause (“Howe…skates”). Choice C is incorrect because the conjunction “and” can’t be used
in this way to join the supplementary element (“While…1947”) and the main clause (“Howe…skates”). Choice D is incorrect because it fails to
mark the boundary between the supplementary element and the main clause with appropriate punctuation.$qb$);
select seed_pool_question($qb$CB-a421f749$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In Puerto Rico, it’s not unusual for a city or town to be known by a nickname that corresponds to one of its notable features, like landscape,
climate, famous residents, or chief export. For example, the Puerto Rican municipality of Aibonito is well known for its lush ______ this distinction
has earned it the fitting nickname of “the Garden of Puerto Rico.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "greenery"}, {"label": "B", "body": "greenery,"}, {"label": "C", "body": "greenery and"}, {"label": "D", "body": "greenery;"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation between two main clauses. “Aibonito is well known for its lush greenery”
and “this distinction has earned it the fitting nickname…” are both complete main clauses; a semicolon correctly joins them while signaling a
close logical connection.
Choice A is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction. Choice
B is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. Choice C is incorrect. When coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction.$qb$);
select seed_pool_question($qb$CB-d46ac7e7$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A second-generation Japanese American, Wataru Misaka ______ in World War II (1941-45) and won two amateur national basketball
championships at the University of Utah when he joined the New York Knicks for the 1947-48 season, becoming the first non-white basketball
player in the US’s top professional league.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "already served"}, {"label": "B", "body": "was already serving"}, {"label": "C", "body": "already serves"}, {"label": "D", "body": "had already served"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. Misaka served in World War II before he joined the New York Knicks in 1947. To show that a past occurrence took
place before another past occurrence, we need to use “had” + the past tense form of the verb. This is called the past perfect tense.
Choice A is incorrect. Misaka served in World War II before he joined the Knicks. Both events are in the past, but his service in World War II
happened earlier, so we need a verb that makes it clear that his service (and the two national championships) had ended by the time he joined
the Knicks. Choice B is incorrect. “Was already serving” forms the continuous past tense, which we use when we’re showing a past action that
was ongoing. Misaka served in World War II before he joined the Knicks. Both events are in the past, but they’re not happening at the same time,
so we shouldn’t use the continuous past tense here. Choice C is incorrect. Misaka served in World War II in the past, so we shouldn’t use the
present tense “serves.”$qb$);
select seed_pool_question($qb$CB-b1e8b87f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Winding through the ice atop Norway’s Jotunheim Mountains is the Lendbreen pass, an ancient route that was used by hunters, farmers, traders,
and travelers in the Middle Ages before eventually falling into disuse. Recently, archeologists have ______ knives, horseshoes, wool tunics, and
thousands of other artifacts from the icy pass.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "unearthed:"}, {"label": "B", "body": "unearthed,"}, {"label": "C", "body": "unearthed—"}, {"label": "D", "body": "unearthed"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. No punctuation should separate the verb "unearthed" and its objects (i.e, what was "unearthed"): "knives,
horseshoes, wool tunics, and thousands of other artifacts."
Choice A is incorrect. This choice creates a punctuation error, separating the verb "unearthed" from its objects (i.e, what was "unearthed") with a
colon. Choice B is incorrect. This choice creates a punctuation error, separating the verb "unearthed" from its objects (i.e, what was "unearthed")
with a comma. Choice C is incorrect. This choice creates a punctuation error, separating the verb "unearthed" from its objects (i.e, what was
"unearthed") with a dash.$qb$);
select seed_pool_question($qb$CB-2b6e1c06$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A government body officially known as the Althing, ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "the world’s oldest parliaments include one which first met in 930 CE, Iceland’s."}, {"label": "B", "body": "Iceland’s parliament is one of the oldest in the world, first meeting in 930 CE."}, {"label": "C", "body": "the first meeting of one of the oldest parliaments in the world, Iceland’s, was in 930 CE."}, {"label": "D", "body": "930 CE was the year when Iceland’s parliament, one of the oldest parliaments in the world, first met."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase "Iceland’s
parliament" the subject of the sentence and places it immediately after the modifying phrase "a government body officially known as the Althing."
In doing so, this choice clearly establishes that Iceland’s parliament—and not another noun in the sentence—is the government body known as
the Althing.
Choice A is incorrect because it results in a dangling modifier. The placement of the noun phrase "the world’s oldest parliaments" immediately
after the modifying phrase illogically suggests that the world’s oldest parliaments are a government body known as the Althing. Choice C is
incorrect because it results in a dangling modifier. The placement of the noun phrase "the first meeting" immediately after the modifying phrase
illogically suggests that the first meeting of Iceland’s parliament was a government body known as the Althing. Choice D is incorrect because it
results in a dangling modifier. The placement of the noun phrase "930 CE" immediately after the modifying phrase illogically suggests that the
year 930 CE is a government body known as the Althing.$qb$);
select seed_pool_question($qb$CB-3595a991$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 1930, Japanese American artist Chiura Obata depicted the natural beauty of Yosemite National Park in two memorable woodcuts: Evening at
Carl Inn and Lake Basin in the High Sierra. In 2019, ______ exhibited alongside 150 of Obata’s other works in a single-artist show at the
Smithsonian American Art Museum.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "it was"}, {"label": "B", "body": "they were"}, {"label": "C", "body": "this was"}, {"label": "D", "body": "some were"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is pronoun–antecedent agreement. The plural pronoun “they” agrees in number with
the plural antecedent “woodcuts” and clearly identifies what was exhibited at the Smithsonian American Art Museum.
Choice A is incorrect because the singular pronoun “it” doesn’t agree in number with the plural antecedent “woodcuts.” Choice C is incorrect
because the singular pronoun “this” doesn’t agree in number with the plural antecedent “woodcuts.” Choice D is incorrect because the plural
pronoun “some” is illogical in this context (referring to “some” of two woodcuts).$qb$);
select seed_pool_question($qb$CB-f45ae404$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The city of Amsterdam partnered with consultants to develop Public Eye—an ethical AI-powered crowd-monitoring ______ video streamed from
cameras in heavily touristed areas, the AI algorithm determines crowd sizes without, in the interest of protecting individuals’ privacy, retaining the
footage.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "system—analyzing"}, {"label": "B", "body": "system, analyzing"}, {"label": "C", "body": "system. Analyzing"}, {"label": "D", "body": "system analyzing"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence ("The city…system") and another ("Analyzing…footage"). The participial phrase beginning with
"analyzing" modifies the subject of the second sentence, "the AI algorithm."
Choice A is incorrect. Placing a dash before "analyzing" creates a confusing and ambiguous modifying element ("analyzing...areas") and a
comma splice between "areas" and "the AI algorithm." (A comma can’t be used in this way to mark the boundary between sentences.) Choice B is
incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between sentences. Choice D is
incorrect because it results in a run-on sentence. The sentences ("The city…system" and "analyzing…footage") are fused without punctuation
and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-1ee4485c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Journalists have dubbed Gil Scott-Heron the “godfather of rap,” a title that has appeared in hundreds of articles about him since the 1990s. Scott-
Heron himself resisted the godfather ______ feeling that it didn’t encapsulate his devotion to the broader African American blues music tradition
as well as “bluesologist,” the moniker he preferred.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "nickname, however"}, {"label": "B", "body": "nickname, however;"}, {"label": "C", "body": "nickname, however,"}, {"label": "D", "body": "nickname; however,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between a main clause and two supplementary elements. In this
choice, the commas after “nickname” and “however” are correctly used to separate the supplementary adverb “however” from the main clause
(“Scott-Heron…nickname”) on one side and the supplementary participial phrase (“feeling…bluesologist”) on the other.
Choice A is incorrect because it fails to mark the boundary between the supplementary adverb “however” and the supplementary phrase
(“feeling…bluesologist”). Choice B is incorrect because a semicolon can’t be used in this way to join the supplementary adverb “however” and the
supplementary phrase (“feeling…bluesologist”). Choice D is incorrect because a semicolon can’t be used in this way to join the main clause
(“Scott-Heron…nickname”) and the supplementary word and phrase (“however” and “feeling…bluesologist”). Moreover, placing the semicolon
after “nickname” illogically signals that the following information (Scott-Heron’s feeling that the nickname didn’t encapsulate his devotion to the
blues tradition) is contrary to the information in the previous clause (Scott-Heron’s resistance to the nickname).$qb$);
select seed_pool_question($qb$CB-e31b0056$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Mary Madden of Ohio ______ a fierce advocate of women’s voting rights in the late 1800s. The dedication of Madden and her fellow activists was
rewarded in 1920, when the Nineteenth Amendment to the US Constitution guaranteed American women the right to vote.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are"}, {"label": "B", "body": "was"}, {"label": "C", "body": "have been"}, {"label": "D", "body": "were"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-verb agreement. The singular verb "was" agrees in number with the singular
subject "Mary Madden of Ohio."
Choice A is incorrect because the plural verb "are" doesn’t agree in number with the singular subject "Mary Madden of Ohio." Choice C is incorrect
because the plural verb "have been" doesn’t agree in number with the singular subject "Mary Madden of Ohio." Choice D is incorrect because the
plural verb "were" doesn’t agree in number with the singular subject "Mary Madden of Ohio."$qb$);
select seed_pool_question($qb$CB-8459dc2f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$When using a search engine, many people click just the first one or two results. Click restraint is the practice of scanning a search results page
and evaluating what you see before deciding which link ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "should you choose."}, {"label": "B", "body": "you should choose?"}, {"label": "C", "body": "should you choose?"}, {"label": "D", "body": "you should choose."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a period to punctuate a
declarative sentence that ends with an indirect question (“which link you should choose.”)
Choice A is incorrect. The structure requires a declarative clause that presents an indirect question about what is evaluated in click restraint, not
an interrogative clause that presents a direct question, such as “which link should you choose.” Choice B is incorrect. It’s unconventional to use a
question mark in this way to punctuate a declarative clause that presents an indirect question, such as “which link you should choose.” Choice C
is incorrect. The structure requires a declarative clause that presents an indirect question about what is evaluated in click restraint, not an
interrogative clause that presents a direct question, such as “which link should you choose.”$qb$);
select seed_pool_question($qb$CB-31362d2d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If simple sugars such as ribose and glycolaldehyde ______ Earth from elsewhere and survived impact—a possibility astrophysicist Nicolle Zellner
outlined in a 2020 study—the sugars could have reacted with other molecules that were already present on the planet to form the nucleotides
that are the structural components of RNA and DNA.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "reach"}, {"label": "B", "body": "had reached"}, {"label": "C", "body": "will reach"}, {"label": "D", "body": "are reaching"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the past perfect verb “had reached”
is used correctly to describe a past action that was completed before another action in the past. Specifically, in this hypothetical scenario about
the origins of RNA and DNA on Earth, the simple sugars had to have reached Earth before they could react with other molecules on the planet.
Choice A is incorrect because the present tense verb “reach” doesn’t indicate that the simple sugars reached Earth before reacting with other
molecules on the planet. Choice C is incorrect because the future tense verb “will reach” doesn’t indicate that the simple sugars reached Earth
before reacting with other molecules on the planet. Choice D is incorrect because the present progressive verb “are reaching” doesn’t indicate
that the simple sugars reached Earth before reacting with other molecules on the planet.$qb$);
select seed_pool_question($qb$CB-667a0587$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In early 1700s England, it was legal for shops to sell prints of artists’ engravings without the artists’ permission. This changed in 1735 with the
passage of the Engravers’ Copyright ______ gave engravers control over the distribution and sale of all prints made from their designs.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Act, which"}, {"label": "B", "body": "Act; which"}, {"label": "C", "body": "Act. Which"}, {"label": "D", "body": "Act"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation between a main clause and a supplementary element. In this
choice, the comma is used correctly to mark the boundary between the main clause ("This...Act") and the supplementary relative clause
("which...designs") that provides additional information about the Engravers’ Copyright Act.
Choice B is incorrect because a semicolon can’t be used in this way to mark the boundary between a main clause and a supplementary relative
clause. A semicolon is conventionally used to join two main clauses, and "which...designs" isn’t a main clause. Choice C is incorrect because it
results in a rhetorically unacceptable sentence fragment. Choice D is incorrect. Joining the main clause and the additional information about the
Engravers’ Copyright Act ("gave...designs") without the comma and relative pronoun "which" results in a confusing and ungrammatical sentence.$qb$);
select seed_pool_question($qb$CB-d2cf0e11$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Inventor John Friedman created a prototype of the first flexible straw by inserting a screw into a paper straw and, using dental floss, binding the
straw tightly around the ______ When the floss and screw were removed, the resulting corrugations in the paper allowed the straw to bend easily
over the edge of a glass.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "screw’s thread’s."}, {"label": "B", "body": "screws’ threads."}, {"label": "C", "body": "screw’s threads."}, {"label": "D", "body": "screws threads’."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of plural and possessive nouns. The singular possessive noun “screw’s” and
the plural noun “threads” correctly indicate that there is only one screw and it has multiple threads.
Choice A is incorrect because the context requires the plural noun “threads,” not the singular possessive noun “thread’s.” Choice B is incorrect
because the context requires the singular possessive noun “screw’s,” not the plural possessive noun “screws’.” Choice D is incorrect because the
context requires the singular possessive noun “screw’s” and the plural noun “threads,” not the plural noun “screws” or the plural possessive noun
“threads.’”$qb$);
select seed_pool_question($qb$CB-1d971f75$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Photographer Ansel Adams’s landscape portraits are iconic pieces of American art. However, many of the ______ of landscapes were intended
not as art but as marketing; a concessions company at Yosemite National Park had hired Adams to take pictures of the park for restaurant
menus and brochures.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "photographer’s early photo’s"}, {"label": "B", "body": "photographers early photo’s"}, {"label": "C", "body": "photographer’s early photos"}, {"label": "D", "body": "photographers early photos"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. There’s only one photographer (Adams), and the photos are his, so the singular possessive "photographer’s" is
correct. There’s more than one photo, and nothing belongs to the photos, so the simple plural "photos" is correct.
Choice A is incorrect. This choice uses the singular possessive "photo’s," which isn’t correct. There’s more than one photo, and they don’t possess
anything, so the noun should be the simple plural "photos." Choice B is incorrect. This choice uses the simple plural "photographers" and the
singular possessive "photo’s," which aren’t correct. There’s only one photographer (Adams) and there’s more than one photo. Choice D is
incorrect. This choice uses the simple plural "photographers," which isn’t correct. There’s only one photographer (Adams).$qb$);
select seed_pool_question($qb$CB-2bca654a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Forming extensive networks via mycorrhizal association—that is, a symbiotic relationship between plants and fungi—______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "it is the entanglement of pine trees’ roots and the fungus Tricholoma matsutake’s fungal hyphae that makes nutrient transport possible."}, {"label": "B", "body": "the transport of nutrients is possible through the entanglement of pine trees’ roots and the fungus Tricholoma matsutake’s fungal hyphae."}, {"label": "C", "body": "nutrients can be transported through the entanglement of pine trees’ roots and the fungus Tricholoma matsutake’s fungal hyphae."}, {"label": "D", "body": "pine trees and the fungus Tricholoma matsutake can transport nutrients through their entangled tree roots and fungal hyphae."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase "pine trees and the
fungus Tricholoma matsutake" the subject of the sentence and places it immediately after the modifying phrase "forming…association." In doing
so, this choice clearly establishes that the pine trees and fungus—and not another noun in the sentence—are forming the networks.
Choice A is incorrect because it results in a dangling modifier. The placement of the it-cleft "it is" immediately after the modifying phrase
illogically and confusingly suggests that "it" is forming extensive networks. Furthermore, it’s not conventional to follow a long introductory
modifying element with an it-cleft construction because it results in an unnecessarily wordy and confusing sentence, such as this. Choice B is
incorrect because it results in a dangling modifier. The placement of "the transport of nutrients" immediately after the modifying phrase illogically
suggests that the transport of nutrients is forming extensive networks. Choice C is incorrect because it results in a dangling modifier. The
placement of "nutrients" immediately after the modifying phrase illogically suggests that nutrients are forming extensive networks.$qb$);
select seed_pool_question($qb$CB-f40ca576$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Each year in the fall, when the weather starts to cool in the northern hemisphere, millions of North American monarch butterflies journey south.
Searching for food and warmer habitats, they ______ thousands of miles—from as far north as Canada all the way down to Mexico—on this
annual migration.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "flew"}, {"label": "B", "body": "were flying"}, {"label": "C", "body": "had flown"}, {"label": "D", "body": "fly"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the present tense verb “fly” is
consistent with the other present tense verb ( “journey”) used to describe the butterflies’ yearly migration. Together, these simple present tense
verbs correctly indicate that the migration is a current, yearly occurrence.
Choice A is incorrect. The simple past tense verb “flew” isn’t consistent with the other present tense verb used to describe the butterflies’ yearly
migration. Choice B is incorrect. The past progressive tense verb “were flying” isn’t consistent with the other present tense verb used to describe
the butterflies’ yearly migration. Choice C is incorrect. The past perfect tense verb “had flown” isn’t consistent with the other present tense verb
used to describe the butterflies’ yearly migration.$qb$);
select seed_pool_question($qb$CB-c101fc44$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$How do scientists determine what foods were eaten by extinct hominins such as Neanderthals? In the past, researchers were limited to studying
the marks found on the fossilized teeth of skeletons, but in 2017 a team led by Laura Weyrich of the Australian Centre for Ancient DNA tried
something ______ the DNA found in Neanderthals’ fossilized dental plaque.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "new: sequencing"}, {"label": "B", "body": "new; sequencing"}, {"label": "C", "body": "new, sequencing:"}, {"label": "D", "body": "new. Sequencing"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “A team…tried something new” is an independent clause leading to an explanation of what the new thing was. A
colon can only be used at the end of an independent clause, and typically introduces further explanation that expands upon the first clause,
which makes a colon the perfect choice here.
Choice B is incorrect. This choice results in a punctuation error. “Sequencing…dental plaque” can’t stand on its own as a sentence, and so it can’t
be linked to the independent clause “a team…tried something new” with a semicolon. Only two independent clauses can be connected in this
way. Choice C is incorrect. This choice results in a punctuation error. If “sequencing” is included in the first clause, it can no longer stand on its
own as a complete idea. Since a colon can only come at the end of an independent clause, using one in this way creates an error. Choice D is
incorrect. This choice results in a sentence fragment. “Sequencing…dental plaque” can’t stand on its own as a sentence.$qb$);
select seed_pool_question($qb$CB-0bcb4417$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Oglala Lakota poet Layli Long Soldier’s star quilt poems offer an unusually open-ended reading experience. With ______ eight panels of text
stitched together in the shape of a traditional eight-pointed Lakota star quilt, the poems present viewers with a seemingly infinite number of
ways to read them.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "their"}, {"label": "B", "body": "it’s"}, {"label": "C", "body": "they’re"}, {"label": "D", "body": "its"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of possessive determiners. The plural possessive determiner "their" agrees
in number with the plural noun "the poems," thus indicating that the poems had eight panels of text stitched together in the shape of a traditional
eight-pointed Lakota star quilt.
Choice B is incorrect because "it’s" is the contraction for "it is" or "it has," not a possessive determiner. Choice C is incorrect because "they’re" is
the contraction for "they are," not a possessive determiner. Choice D is incorrect because the singular possessive determiner "its" doesn’t agree in
number with the plural noun "the poems."$qb$);
select seed_pool_question($qb$CB-dddfa043$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Before the Erie Canal was completed in 1825, transporting goods by wagon between New York City and the Midwest took up to forty-five days
and cost one hundred dollars per ton. By linking the Hudson River to Lake ______ canal reduced transport time to nine days and cut costs to six
dollars per ton.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Erie; the"}, {"label": "B", "body": "Erie (the"}, {"label": "C", "body": "Erie, the"}, {"label": "D", "body": "Erie: the"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation between a supplementary phrase and a main clause. This choice
correctly uses a comma to mark the boundary between the introductory supplementary phrase (“By linking the Hudson River to Lake Erie”), which
identifies how the canal reduced transport time, and the main clause (“the canal reduced transport time to nine days and cut costs to six dollars
per ton”).
Choice A is incorrect because a semicolon can’t be used in this way to mark the boundary between a supplementary phrase (“By…Erie”) and the
main clause (“the canal...ton”). Choice B is incorrect because an open parenthesis can’t be used in this way to mark the boundary between a
supplementary phrase (“By…Erie”) and the main clause (“the canal...ton”). Choice D is incorrect because a colon can’t be used in this way to mark
the boundary between an introductory supplementary phrase (“By…Erie”) and the main clause (“the canal...ton”).$qb$);
select seed_pool_question($qb$CB-be37d4ae$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$During the English neoclassical period (1660–1789), many writers imitated the epic poetry and satires of ancient Greece and Rome. They were
not the first in England to adopt the literary modes of classical ______ some of the most prominent figures of the earlier Renaissance period were
also influenced by ancient Greek and Roman literature.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "antiquity, however"}, {"label": "B", "body": "antiquity, however,"}, {"label": "C", "body": "antiquity, however;"}, {"label": "D", "body": "antiquity; however,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of a supplementary phrase following a clause. This choice uses a
comma to separate the supplementary adverb phrase "however" from the independent clause it modifies ("They...antiquity") and uses a
semicolon to join the first independent clause ("They...antiquity") and the second independent clause ("some...literature"). Further, placing the
semicolon after "however" indicates that the information in the clause that this is part of (that neoclassical writers were not the first to adopt
classical literary modes) is contrary to what might be assumed from the information in the previous sentence (that the neoclassical writers were
unique in imitating classical epic poetry and satires).
Choice A is incorrect because it fails to mark the boundary after "however" between the two independent clauses with appropriate punctuation.
Choice B is incorrect because the comma after "however" can’t be used in this way to mark the boundary between the two independent clauses.
Choice D is incorrect because placing the semicolon after "antiquity" illogically indicates that the information in the clause that this is part of
(that prominent Renaissance figures were also influenced by classical literature) is contrary to the information in the previous clause (that
neoclassical writers were not the first to adopt classical literary modes).$qb$);
select seed_pool_question($qb$CB-94de423a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In a rural area along the border between Oklahoma and Texas, amateur astronomers gather each year to observe the night sky at the Okie-Tex
Star Party. Like most star parties, Okie-Tex takes place in an area with low light pollution, ______ dark skies and ideal stargazing conditions.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "ensuring"}, {"label": "B", "body": "this will ensure"}, {"label": "C", "body": "ensures"}, {"label": "D", "body": "it ensures"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite present participle "ensuring" is
correctly used to form a supplementary element that modifies the main clause "Okie-Tex takes place in an area with low light pollution,"
describing the viewing conditions of the star party.
Choice B is incorrect because it results in a comma splice. The pronoun "this" and the finite future tense verb "will ensure" would add an
additional main clause to this sentence, and the comma after "pollution" can’t be used in this way to join two main clauses. Choice C is incorrect
because it results in an ungrammatical sentence. The finite present tense verb "ensures" can’t be used in this way to form a supplementary
element to modify the main clause. Choice D is incorrect because it results in a comma splice. The pronoun "it" and the finite present tense verb
"ensures" would add an additional main clause to this sentence, and the comma after "pollution" can’t be used in this way to join two main
clauses.$qb$);
select seed_pool_question($qb$CB-c8607bdf$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$“Praise Song for the Day,” Elizabeth Alexander’s 2009 inaugural poem, asserts that “We cross dirt roads and highways…to see what’s on the other
side.” Alexander’s use of “we” ______ Americans’ collective efforts and shared desire to seek new opportunity.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "evokes"}, {"label": "B", "body": "are evoking"}, {"label": "C", "body": "have evoked"}, {"label": "D", "body": "evoke"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb "evokes" agrees in number with the
singular subject "Alexander’s use."
Choice B is incorrect because the plural verb "are evoking" doesn’t agree in number with the singular subject "Alexander’s use." Choice C is
incorrect because the plural verb "have evoked" doesn’t agree in number with the singular subject "Alexander’s use." Choice D is incorrect
because the plural verb "evoke" doesn’t agree in number with the singular subject "Alexander’s use."$qb$);
select seed_pool_question($qb$CB-b6de636f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$At 1,280 meters, the Golden Gate Bridge in the United States is one of the longest suspension bridges in the ______ the Tsing Ma Bridge in China,
at 1,377 meters, is even longer.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "world but"}, {"label": "B", "body": "world, but,"}, {"label": "C", "body": "world,"}, {"label": "D", "body": "world, but"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and the coordinating conjunction “but” to join the first main clause (“At...world”) and the second main clause (“the...longer”).
Choice A is incorrect because when coordinating two main clauses such as these, it’s conventional to use a comma before the coordinating
conjunction. Choice B is incorrect because a comma isn’t needed after the conjunction “but.” Choice C is incorrect because it results in a comma
splice. Without a conjunction following it, a comma can’t be used in this way to join two main clauses.$qb$);
select seed_pool_question($qb$CB-c15069eb$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Latin America is known to have dozens, if not hundreds, of popular dance forms. Only five of these dances are included in international ballroom
dance ______ rumba, samba, cha-cha-cha, paso doble, and jive—the last of which is grouped with the other Latin dances despite not having Latin
roots.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "competitions, however:"}, {"label": "B", "body": "competitions, however,"}, {"label": "C", "body": "competitions, however;"}, {"label": "D", "body": "competitions; however,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the punctuation of supplementary elements within a sentence. This choice correctly
uses a comma to separate the supplementary adverb "however" from the preceding main clause ("only...competitions"), and it uses a colon to
introduce the list of dances that follows ("rumba…jive"). Further, placing the colon after "however" rather than before indicates that the
information in the preceding main clause (only...competitions) is contrary to what might be assumed from the information in the previous
sentence (Latin America has many more dance forms).
Choice B is incorrect. The comma after "however" can’t be used in this way to introduce a series ("rumba...jive"). Choice C is incorrect because it
isn’t conventional to use a semicolon in this way to introduce a series of items, such as the list of dances. Choice D is incorrect because placing
the semicolon after "competitions" illogically indicates that the following list of five Latin American dances ("rumba...jive") is contrary to the
information in the previous clause (only five Latin American dances are included in international ballroom dance competitions).$qb$);
select seed_pool_question($qb$CB-5aae2475$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Stomata, tiny pore structures in a leaf that absorb gases needed for plant growth, open when guard cells surrounding each pore swell with water.
In a pivotal 2007 article, plant cell ______ showed that lipid molecules called phosphatidylinositol phosphates are responsible for signaling guard
cells to open stomata.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "biologist, Yuree Lee"}, {"label": "B", "body": "biologist Yuree Lee,"}, {"label": "C", "body": "biologist Yuree Lee"}, {"label": "D", "body": "biologist, Yuree Lee,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation between titles and proper nouns. No punctuation is needed to
offset the proper noun "Yuree Lee" from the title "plant cell biologist" that describes Lee.
Choice A is incorrect because no punctuation is needed. Choice B is incorrect because no punctuation is needed. Choice D is incorrect because
no punctuation is needed around the proper noun "Yuree Lee." Setting the phrase off with punctuation suggests that it could be removed without
affecting the coherence of the sentence, which isn’t the case.$qb$);
select seed_pool_question($qb$CB-db2e480a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$By the time Hawaiian king Kamehameha III ______ the throne, the number of longhorn cattle, first introduced to the islands in 1793, had
drastically increased, and so too had the need for paniolo (Hawaiian cowboys) to manage the wild herds that then roamed throughout the
volcanic terrain.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "ascended"}, {"label": "B", "body": "will ascend"}, {"label": "C", "body": "ascends"}, {"label": "D", "body": "is ascending"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. "Ascended" is in the simple past tense. Since Kamehameha became king in the past, this makes the most sense.
Choice B is incorrect. "Will ascend" is in the future tense, but we wouldn’t know about Kamehameha III’s ascent if it hadn’t happened yet. The
information in the sentence, as well as the tense of other verbs, tells us that the events described happened in the past. Choice C is incorrect.
"Ascends" is in the simple present tense. However, the information in the sentence, as well as the tense of other verbs, tells us that the events
described happened in the past. Choice D is incorrect. "Is ascending" is in the continuous present tense, which we use to show that something is
ongoing, but this doesn’t make sense here—the information in the sentence, as well as the tense of other verbs, tells us that the events described
happened in the past.$qb$);
select seed_pool_question($qb$CB-4c9a2aee$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Wanda Diaz-Merced is an astrophysicist who lost her sight when she was young. Diaz-Merced’s condition inspired her to develop software that
can translate scientific data into sound. Sound-based tools ______ scientists to detect subtle patterns in data. Such patterns may not be evident
in traditional graphs.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has enabled"}, {"label": "B", "body": "enable"}, {"label": "C", "body": "is enabling"}, {"label": "D", "body": "enables"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-verb agreement. The plural verb "enable" agrees in number with the plural
subject "sound-based tools."
Choice A is incorrect because the singular verb "has enabled" doesn’t agree in number with the plural subject "sound-based tools." Choice C is
incorrect because the singular verb "is enabling" doesn’t agree in number with the plural subject "sound-based tools." Choice D is incorrect
because the singular verb "enables" doesn’t agree in number with the plural subject "sound-based tools."$qb$);
select seed_pool_question($qb$CB-b0fb36ad$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Unique among animal species, humans use our vocal apparatuses primarily for two separate communicative purposes: to talk and to sing. The
question of what cross-cultural traits distinguish these distinct modes, and secondarily what pressures led humans to develop them in the first
place, ______ neuropsychologist Daniela Sammler’s 2024 study “Signatures of Speech and Song: ‘Universal’ Links despite Cultural Diversity.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "animates"}, {"label": "B", "body": "have animated"}, {"label": "C", "body": "animate"}, {"label": "D", "body": "animating"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb "animates" agrees in number with the
singular subject "question."
Choice B is incorrect because the plural verb "have animated" doesn’t agree in number with the singular subject "question." Choice C is incorrect
because the plural verb "animate" doesn’t agree in number with the singular subject "question." Choice D is incorrect because it results in an
ungrammatical sentence. The nonfinite participle "animating" doesn’t supply the clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-a30567fd$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Nuhād al-Ḥaddād, known as Fairuz, was one of the most beloved Lebanese singers of the twentieth century. Her broad singing repertoire—which
included traditional forms, such as the Arabic qasida and maqam, alongside modern pop and jazz styles—lent Fairuz a timeless, cross-
generational appeal, ______ her the moniker “the soul of Lebanon.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "earned"}, {"label": "B", "body": "had earned"}, {"label": "C", "body": "earning"}, {"label": "D", "body": "earn"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The word "earning" is being used to introduce an additional modifying phrase, which describes how Fairuz’s
repertoire lent her cross-generational appeal. When a verb ends in -ing and doesn’t have a helper verb like "is" before it, it can be used to modify a
noun or verb. This is appropriate here.
Choice A is incorrect. The underlined verb is being used to introduce additional descriptive information, which is set off from the rest of the
sentence by a comma. Because there is no subject here, a finite form of the verb (like "earned") creates an error. We need another form of the
verb that doesn’t require a subject and can introduce descriptive information. Choice B is incorrect. The underlined verb is being used to
introduce additional descriptive information, which is set off from the rest of the sentence by a comma. Because there is no subject here, a finite
form of the verb (like "had earned") creates an error. We need another form of the verb that doesn’t require a subject and can introduce
descriptive information. Choice D is incorrect. The underlined verb is being used to introduce additional descriptive information, which is set off
from the rest of the sentence by a comma. Because there is no subject here, a finite form of the verb (like "earn") creates an error. We need
another form of the verb that doesn’t require a subject and can introduce descriptive information.$qb$);
select seed_pool_question($qb$CB-12013e06$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In rural Minnesota, ecologist Leroy Walston conducted a study to determine whether seeding solar panel fields with wildflowers could bolster
pollinator populations in nearby food crops. Walston’s findings indicate that—assuming solar panel installers’ ______ practice has the potential to
increase the number of native bees in crops near solar fields throughout the Midwest by up to 20 percent.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "cooperation, this"}, {"label": "B", "body": "cooperation—this"}, {"label": "C", "body": "cooperation: this"}, {"label": "D", "body": "cooperation this"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a dash after
“cooperation” to pair with the dash after “that” to separate the supplementary element “assuming solar panel installers’ cooperation” from the
rest of the sentence.
Choice A is incorrect because a comma can’t be paired with a dash in this way to separate the supplementary element from the rest of the
sentence. Choice C is incorrect because a colon can’t be paired with a dash in this way to separate the supplementary element from the rest of
the sentence. Choice D is incorrect because it fails to use appropriate punctuation to separate the supplemental element from the rest of the
sentence.$qb$);
select seed_pool_question($qb$CB-f1c5157d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Established in 1936 by African American novelist Richard Wright, ______ it would become a vital part of the creative movement known as the
Chicago Black Renaissance.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "the South Side Writers Group provided a valuable forum for Chicago writers to share ideas;"}, {"label": "B", "body": "Chicago writers in the South Side Writers Group had a valuable forum for sharing ideas;"}, {"label": "C", "body": "writers shared ideas at a valuable forum known as the South Side Writers Group in Chicago;"}, {"label": "D", "body": "Chicago was where the South Side Writers Group provided a valuable forum for writers to share ideas;"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “the South Side
Writers Group” the subject of the sentence and places it immediately after the modifying phrase “established in 1936 by African American
novelist Richard Wright.” In doing so, this choice clearly indicates that the South Side Writers Group—and not another noun in the sentence—was
established in 1936 by Richard Wright.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase “Chicago writers” immediately after the
modifying phrase illogically suggests that the Chicago writers were established in 1936 by Richard Wright. Choice C is incorrect because it
results in a dangling modifier. The placement of the noun phrase “writers” immediately after the modifying phrase illogically suggests that the
writers were established in 1936 by Richard Wright. Choice D is incorrect because it results in a dangling modifier. The placement of the noun
phrase “Chicago” immediately after the modifying phrase illogically suggests that Chicago was established in 1936 by Richard Wright.$qb$);
select seed_pool_question($qb$CB-96a904c5$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The musical scores of Japanese composer Hiroyuki Sawano are famous for their mysterious titles. Laden with emojis and seemingly
meaningless words, and driven largely by Sawano’s “personal feeling and mood,” ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "the listener can approach each piece free from expectations because of the titles."}, {"label": "B", "body": "the titles allow the listener to approach each piece free from expectations."}, {"label": "C", "body": "each piece can be approached by the listener free from expectations because of the titles."}, {"label": "D", "body": "the listener’s approach to each piece because of the titles can be free from expectations."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “the titles” the
subject of the sentence and places it immediately after the modifying phrases “laden with emojis and seemingly meaningless words, and driven
largely by Sawano’s ‘personal feeling and mood.’” In doing so, this choice clearly establishes that the titles—and not another noun in the sentence
—are being described as laden with emojis and driven by Sawano’s personal feeling.
Choice A is incorrect because it results in a dangling modifier. The placement of “the listener” immediately after the modifying phrases illogically
suggests that the listener, rather than the titles, is laden with emojis and driven by Sawano’s personal feeling. Choice C is incorrect because it
results in a dangling modifier. The placement of “each piece” (i.e., musical score) immediately after the modifying phrases illogically suggests
that the pieces, rather than the titles of the pieces, are laden with emojis and driven by Sawano’s personal feeling. Choice D is incorrect because
it results in a dangling modifier. The placement of “the listener’s approach” immediately after the modifying phrases illogically suggests that the
listener’s approach, rather than the titles, is laden with emojis and driven by Sawano’s personal feeling.$qb$);
select seed_pool_question($qb$CB-5cc69ee1$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Dong Lai and Diego J. Muñoz’s work on circumbinary disk accretion—a process in which, due to gravity, material from an orbiting disk spirals
inward and accumulates onto two stars or black holes—relies heavily on simulations. Lai and Muñoz recognize the need for direct ______
recommending evolving binary star systems as a promising avenue for future study.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "observation; however,"}, {"label": "B", "body": "observation, however,"}, {"label": "C", "body": "observation. However,"}, {"label": "D", "body": "observation, however;"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation within a sentence. The comma after “observation” pairs with
the comma after “however” to separate the supplementary adverb “however” from the rest of the sentence, which consists of a main clause
(“Lai...observation”) followed by a participial phrase (“recommending...study”).
Choice A is incorrect because a semicolon can’t be used in this way to join the main clause (“Lai...observation”) and the participial phrase
(“recommending...study”) that follows the supplementary adverb “however.” A semicolon is conventionally used to join two main clauses, and
“recommending...study” isn’t a main clause. Choice C is incorrect because placing a period after “observation” results in a rhetorically
unacceptable sentence fragment beginning with “however.” Choice D is incorrect because a semicolon can’t be used in this way to join the main
clause (“Lai...however”) and the participial phrase (“recommending...study”) that follows. A semicolon is conventionally used to join two main
clauses, and “recommending...study” isn’t a main clause.$qb$);
select seed_pool_question($qb$CB-329255db$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Bengali author Toru Dutt’s A Sheaf Gleaned in French Fields (1876), a volume of English translations of French poems, ______ scholars’
understanding of the transnational and multilingual contexts in which Dutt lived and worked.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has enhanced"}, {"label": "B", "body": "are enhancing"}, {"label": "C", "body": "have enhanced"}, {"label": "D", "body": "enhance"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb “has enhanced” agrees in number with the
singular subject “A Sheaf Gleaned in French Fields,” which is the title of a book of poems.
Choice B is incorrect because the plural verb “are enhancing” doesn’t agree in number with the singular subject “A Sheaf Gleaned in French
Fields.” Choice C is incorrect because the plural verb “have enhanced” doesn’t agree in number with the singular subject “A Sheaf Gleaned in
French Fields.” Choice D is incorrect because the plural verb “enhance” doesn’t agree in number with the singular subject “A Sheaf Gleaned in
French Fields.”$qb$);
select seed_pool_question($qb$CB-603755a5$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 1959, marine biologist Dr. Albert Jones founded the Underwater Adventure Seekers, a scuba diving ______ that is the oldest club for Black
divers in the United States and that has helped thousands of diving enthusiasts become certified in the field.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "club"}, {"label": "B", "body": "club,"}, {"label": "C", "body": "club—"}, {"label": "D", "body": "club, and"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. “That is…field” is an essential supplement, so we should not use punctuation to separate it from “scuba diving
club.” .
Choice B is incorrect. This choice creates a punctuation error. “That is…field” is an essential supplement, so we should not use a comma (or any
kind of punctuation) to separate it from “scuba diving club.” . Choice C is incorrect. This choice creates a punctuation error. “That is…field” is an
essential supplement, so we should not use a dash (or any kind of punctuation) to separate it from “scuba diving club.” . Choice D is incorrect.
This choice creates a run-on sentence. It makes “that is…United States” into an awkward independent clause, but it also makes “that has…field”
into its own awkward independent clause without the correct punctuation separating it.$qb$);
select seed_pool_question($qb$CB-8999c0c5$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Choreographers George Balanchine and Martha Graham both contributed sections to the dance piece Episodes, which premiered at New York’s
City Center of Music and Drama in 1959. This cross-genre collaboration brought together the distinct features of Balanchine’s neoclassical ballet
and Graham’s modern ______ the stylistic diversity and creative innovation within the dance world.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "dance, it showcased"}, {"label": "B", "body": "dance. Which showcased"}, {"label": "C", "body": "dance, showcasing"}, {"label": "D", "body": "dance. Showcasing"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The conventions being tested are the use of punctuation and verb forms within a sentence. This choice correctly
uses a comma to mark the boundary between the main clause (“This...dance”) and the supplementary element (“showcasing...world”) that
provides additional information about what the collaboration accomplished. Moreover, the nonfinite present participle “showcasing” is used
correctly to form a supplementary element that modifies the main clause (“this...dance”), describing what the collaboration demonstrated about
stylistic diversity and creative innovation in the dance world.
Choice A is incorrect because it results in a comma splice. Adding the subject “it” and the finite verb “showcased” results in a second main
clause (“it...world”), and a comma can’t be used in this way to join two main clauses. Choice B is incorrect because it results in a rhetorically
unacceptable sentence fragment beginning with “which.” Choice D is incorrect because it results in a rhetorically unacceptable sentence
fragment beginning with “showcasing.”$qb$);
select seed_pool_question($qb$CB-ad046778$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$To humans, it does not appear that the golden orb-weaver spider uses camouflage to capture its ______ the brightly colored arachnid seems to
wait conspicuously in the center of its large circular web for insects to approach. Researcher Po Peng of the University of Melbourne has
explained that the spider’s distinctive coloration may in fact be part of its appeal.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "prey, rather,"}, {"label": "B", "body": "prey rather,"}, {"label": "C", "body": "prey, rather;"}, {"label": "D", "body": "prey; rather,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the coordination of main clauses within a sentence. The semicolon is correctly used
to join the first main clause (“To humans…prey”) and the second main clause (“rather…approach”). Further, the comma after the adverb “rather” is
correctly used to separate the adverb from the main clause (“the brightly…approach”) it modifies, logically indicating that the information in this
clause (how the spider’s behavior appears to humans) is contrary to the information in the previous clause (how the spider’s behavior does not
appear to humans).
Choice A is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. Choice B is incorrect because it results in a run-on sentence. The two main clauses are fused without appropriate punctuation and/or a
conjunction. Choice C is incorrect. Placing the comma between the first main clause “To humans…prey” and the adverb “rather” illogically
indicates that the information in the first main clause is contrary to what came before, which doesn’t make sense in this context.$qb$);
select seed_pool_question($qb$CB-7ce4ee13$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$After immigrating from Mexico and obtaining U.S. citizenship, Octaviano Ambrosio Larrazolo entered politics, earning a reputation for being a
fervent defender of Hispanic civil rights. In 1919 Larrazolo was elected governor of ______ in 1928 he became the nation’s first Hispanic U.S.
Senator.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "New Mexico and"}, {"label": "B", "body": "New Mexico,"}, {"label": "C", "body": "New Mexico, and"}, {"label": "D", "body": "New Mexico"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and the coordinating conjunction "and" to join the first main clause ("In 1919 Larrazolo was elected governor of New Mexico") and the
second main clause ("in 1928 he became the nation’s first Hispanic US Senator").
Choice A is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction. Choice B is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used
in this way to join two main clauses. Choice D is incorrect because it results in a run-on sentence. The two main clauses are fused without
punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-aa443c4b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Recent pollen analyses of the Aran Islands have led some researchers to propose that the now treeless islands were once wooded. This
hypothesis ______ that certain trees, such as P. sylvestris, survived without interruption or human intervention throughout the Holocene cannot
stand, researchers Michael O’Connell and Karen Molloy counter, unless other explanations can first be ruled out.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "suggesting"}, {"label": "B", "body": "suggested"}, {"label": "C", "body": "suggests"}, {"label": "D", "body": "has suggested"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite present participle
"suggesting" is correctly used to form a restrictive participial phrase ("suggesting...Holocene") within the main clause ("This hypothesis...cannot
stand..."). This participial phrase functions as part of the sentence’s subject ("This...Holocene"), providing essential identifying information about
what the hypothesis states—namely, that certain trees survived without interruption or human intervention throughout the Holocene.
Choice B is incorrect because it results in an ungrammatical sentence. The finite verb "suggested" can’t be used in this way within the subject of
the sentence. Choice C is incorrect because it results in an ungrammatical sentence. The finite verb "suggests" can’t be used in this way within
the subject of the sentence. Choice D is incorrect because it results in an ungrammatical sentence. The finite verb "has suggested" can’t be used
in this way within the subject of the sentence.$qb$);
select seed_pool_question($qb$CB-0a114526$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 1937, Chinese American screen actor Anna May Wong, who had portrayed numerous villains and secondary characters but never a heroine,
finally got a starring role in Paramount Pictures’ Daughter of Shanghai, a film that ______ “expanded the range of possibilities for Asian images on
screen.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "critic, Stina Chyn, claims"}, {"label": "B", "body": "critic, Stina Chyn, claims,"}, {"label": "C", "body": "critic Stina Chyn claims"}, {"label": "D", "body": "critic Stina Chyn, claims,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The conventions being tested are punctuation use between titles and proper nouns and between verbs and
integrated quotations. No punctuation is needed to set off the proper noun “Stina Chyn” from the title that describes Chyn, “critic.” Because “Stina
Chyn” is essential information identifying the “critic,” no punctuation is necessary. Further, no punctuation is needed between the verb “claims”
and the following quotation because the quotation is integrated into the structure of the sentence.
Choice A is incorrect because no punctuation is needed before or after the proper noun “Stina Chyn.” Setting the critic’s name off with commas
suggests that it could be removed without affecting the coherence of the sentence, which isn’t the case. Choice B is incorrect because no
punctuation is needed before or after the proper noun “Stina Chyn.” Setting the critic’s name off with commas suggests that it could be removed
without affecting the coherence of the sentence, which isn’t the case. Additionally, no punctuation is needed between “claims” and the integrated
quotation. Choice D is incorrect because no punctuation is needed between the verb “claims” and its subject, “critic Stina Chyn.” Additionally, no
punctuation is needed between the verb “claims” and the integrated quotation.$qb$);
select seed_pool_question($qb$CB-a2293b3f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A harpsichord may look just like a piano, but the difference between the two instruments is easy to hear. When a harpsichord’s keys are pressed,
the strings inside the ______ are plucked, not struck.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "instrument:"}, {"label": "B", "body": "instrument"}, {"label": "C", "body": "instrument—"}, {"label": "D", "body": "instrument,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between a subject and a verb. When, as in this case, a subject ("the
strings inside the instrument") is immediately followed by a main verb ("are plucked"), no punctuation is needed.
Choice A is incorrect because no punctuation is needed between the subject and the verb. Choice C is incorrect because no punctuation is
needed between the subject and the verb. Choice D is incorrect because no punctuation is needed between the subject and the verb.$qb$);
select seed_pool_question($qb$CB-5aa1fffd$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Where ______ Interestingly, it was invented by an author. It first appears in the novel Through the Looking Glass by English author Lewis Carroll.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "did the word “chortle” come from."}, {"label": "B", "body": "the word “chortle” did come from?"}, {"label": "C", "body": "did the word “chortle” come from?"}, {"label": "D", "body": "the word “chortle” come from."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a question mark to
punctuate the interrogative sentence "where did the word ‘chortle’ come from," which asks a direct question.
Choice A is incorrect because a period can’t be used in this way to punctuate an interrogative sentence, such as "where did the word ‘chortle’
come from." Choice B is incorrect because "where the word ‘chortle’ did come from" does not follow the conventional structure of a direct
question in Standard English. It’s conventional in Standard English to follow the interrogative word "where" with an auxiliary verb (such as "did")
when asking a direct question. Choice D is incorrect because "where the word ‘chortle’ come from" does not follow the conventional structure of
a direct question in Standard English. It’s conventional in Standard English to follow the interrogative word "where" with an auxiliary verb (such as
"did") when asking a direct question. Furthermore, a period can’t be used in this way to punctuate an interrogative sentence.$qb$);
select seed_pool_question($qb$CB-a5079e0d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Horsepower is a unit of measurement used to determine how much power a vehicle produces. The measurement is based on how much and
how quickly weight can be ______ one unit of mechanical horsepower is equivalent to the amount of power it takes to lift 550 pounds one foot off
the ground in one second.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "moved, for example,"}, {"label": "B", "body": "moved,"}, {"label": "C", "body": "moved; for example,"}, {"label": "D", "body": "moved"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation within a sentence. This choice uses a semicolon in a
conventional way to join the first main clause ("The measurement...moved") and the second main clause ("for example...second").
Choice A is incorrect because it results in a comma splice. Without a coordinating conjunction, a comma can’t be used in this way to join the two
main clauses ("The measurement…moved" and "for example…second"). Choice B is incorrect because it results in a comma splice. Without a
conjunction following it, a comma can’t be used in this way to join the two main clauses ("The measurement…moved" and "one unit…second").
Choice D is incorrect because it results in a run-on sentence. The two main clauses ("The measurement…moved" and "one unit…second") are
fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-831b55ec$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Louise Bennett (1919–2006), also known as “Miss Lou,” was an influential Jamaican poet and folklorist. Her innovative poems ______ the use of
Jamaican Creole (a spoken language) in literature.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "popularized;"}, {"label": "B", "body": "popularized,"}, {"label": "C", "body": "popularized"}, {"label": "D", "body": "popularized:"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between a verb and an object. No punctuation is needed between
the verb "popularized" and its object "the use of Jamaican Creole." The object helps complete the idea of the verb—in this case, it explains what
Louise Bennett popularized—and any punctuation between the two results in an ungrammatical sentence.
Choice A is incorrect because no punctuation is needed between the verb and its object. Choice B is incorrect because no punctuation is needed
between the verb and its object. Choice D is incorrect because no punctuation is needed between the verb and its object.$qb$);
select seed_pool_question($qb$CB-42cc9236$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If you try on one of artist Nick Cave’s signature Soundsuits, you can expect to swish, rustle, or clang every time you move. Cave makes his suits
out of found objects, everything from ceramic birds to broken record players. He carefully considers the sound an object makes before using
______ in a suit.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "this"}, {"label": "B", "body": "that"}, {"label": "C", "body": "these"}, {"label": "D", "body": "it"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested here is pronoun-antecedent agreement. The singular pronoun "it" agrees in number
with the singular antecedent "object."
Choice A is incorrect. The singular pronoun "this" is used to refer to a specific thing, but here there is no specific object being referred to. Instead,
the sentence is referring back to a hypothetical object that Cave might use in a Soundsuit. Choice B is incorrect. The singular pronoun "that" is
used to refer to a specific thing, but here there is no specific object being referred to. Instead, the sentence is referring back to a hypothetical
object that Cave might use in a Soundsuit. Choice C is incorrect because the plural pronoun "these" doesn’t agree in number with the singular
antecedent "object."$qb$);
select seed_pool_question($qb$CB-fa07bcb6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Ganga is a folk singing tradition that originated in the Dinaric Alps in southern Europe. Ganga singers sing different melodies at the same time.
The clashing notes can echo a long way across the mountains, which is why ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "ganga has been used as a communication method?"}, {"label": "B", "body": "ganga has been used as a communication method."}, {"label": "C", "body": "has ganga been used as a communication method."}, {"label": "D", "body": "has ganga been used as a communication method?"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a period to punctuate a
declarative sentence ending with a relative clause that presents an indirect question (“why ganga has been used as a communication method.”)
Choice A is incorrect. It’s unconventional to use a question mark to punctuate a declarative sentence that presents an indirect question. Choice C
is incorrect. The structure requires a declarative clause at the end of the sentence, not an interrogative clause that asks a direct question, such
as “has ganga been used as a communication method.” Choice D is incorrect. The structure requires a declarative clause at the end of the
sentence, not an interrogative clause that asks a direct question, such as “has ganga been used as a communication method.”$qb$);
select seed_pool_question($qb$CB-81ac953e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1899, Swedish chemist Svante Arrhenius developed an equation to answer a long-standing question: why do chemical reactions speed up at
higher temperatures? The Arrhenius equation, named for its creator, ______ an important concept in modern chemistry.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "have remained"}, {"label": "B", "body": "remain"}, {"label": "C", "body": "remains"}, {"label": "D", "body": "are remaining"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. This choice uses the singular verb "remains" to match the singular subject "equation."
Choice A is incorrect. The singular noun "equation" doesn’t match with the plural verb conjugation "have remained." Choice B is incorrect. The
singular noun "equation" doesn’t match with the plural verb conjugation "remain." Choice D is incorrect. The singular noun "equation" doesn’t
match with the plural verb conjugation "are remaining."$qb$);
select seed_pool_question($qb$CB-b32eab9f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Increased gender diversity is revitalizing the field of economics, according to Harvard’s Claudia Goldin. The trailblazing accomplishments of
Goldin, winner of the 2023 Nobel Prize in Economics for her work on women in the labor force, ______ to the value of scholars of diverse
backgrounds in spurring research into previously unexplored, but vitally important, topics.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "attests"}, {"label": "B", "body": "has attested"}, {"label": "C", "body": "is attesting"}, {"label": "D", "body": "attest"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The plural verb "attest" agrees in number with the plural
subject "trailblazing accomplishments."
Choice A is incorrect because the singular verb "attests" doesn’t agree in number with the plural subject "trailblazing accomplishments." Choice B
is incorrect because the singular verb "has attested" doesn’t agree in number with the plural subject "trailblazing accomplishments." Choice C is
incorrect because the singular verb "is attesting" doesn’t agree in number with the plural subject "trailblazing accomplishments."$qb$);
select seed_pool_question($qb$CB-50801257$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1994, almost 200 years after the death of Wang Zhenyi, the International Astronomical ______ the contributions of the barrier-breaking 18th-
century astronomer and author of “Dispute of the Procession of the Equinoxes,” naming a crater on Venus after her.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Union would finally acknowledge"}, {"label": "B", "body": "Union to finally acknowledge"}, {"label": "C", "body": "Union, having finally acknowledged"}, {"label": "D", "body": "Union, finally acknowledging"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. A main clause requires a finite (tensed) verb
to perform the action of the subject (in this case “the International Astronomical Union”), and this choice supplies the finite modal verb phrase
“would finally acknowledge” to indicate what the International Astronomical Union did.
Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive “to finally acknowledge” doesn’t supply the main
clause with a finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The nonfinite participle “having finally
acknowledged” doesn’t supply the main clause with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The
nonfinite participle “acknowledging” doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-028752cd$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Dust Bowl was a period of severe drought that plagued the Great Plains of the US during the 1930s. During this time, dust storms ______ over
100 million acres of land. They even reached as far east as New York City.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are affecting"}, {"label": "B", "body": "will have affected"}, {"label": "C", "body": "will affect"}, {"label": "D", "body": "affected"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verbs to express tense in a sentence. In this choice, the past tense verb
"affected," used in conjunction with the phrase "during this time," correctly indicates that the dust storms occurred in the 1930s.
Choice A is incorrect because the present progressive tense verb "are affecting" doesn’t indicate that the dust storms occurred in the 1930s.
Choice B is incorrect because the future perfect tense verb "will have affected" doesn’t indicate that the dust storms occurred in the 1930s.
Choice C is incorrect because the future tense verb "will affect" doesn’t indicate that the dust storms occurred in the 1930s.$qb$);
select seed_pool_question($qb$CB-c9a677e9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In his 2011 book, historian Sebouh David Aslanian quantifies the reading patterns of early modern Armenian merchants from New Julfa.
Aslanian’s macroanalysis ______ nearly 1,000 book titles published between 1512 and 1800 shows not only the steady popularity of religious
texts but also a broadening interest in secular books, especially those on history and geography.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "examined"}, {"label": "B", "body": "examines"}, {"label": "C", "body": "had examined"}, {"label": "D", "body": "examining"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms within a sentence. The sentence’s subject is “Aslanian’s
macroanalysis,” and its finite main verb is “shows.” This choice correctly uses the nonfinite present participle “examining” to form an integrated
participial phrase (“examining...1800”) that describes the macroanalysis, indicating what it examined.
Choice A is incorrect because using the finite verb “examined” creates an ungrammatical sentence. The sentence already has the finite main
verb “shows,” so “examined” can’t also function as a second main verb here without additional punctuation or conjunctions. Choice B is incorrect
because using the finite verb “examines” creates an ungrammatical sentence. The sentence already has the finite main verb “shows,” so
“examines” can’t also function as a second main verb here without additional punctuation or conjunctions. Choice C is incorrect because using
the finite verb “had examined” creates an ungrammatical sentence. The sentence already has the finite main verb “shows,” so “had examined”
can’t also function as a second main verb here without additional punctuation or conjunctions.$qb$);
select seed_pool_question($qb$CB-1f39ab8b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the novel Things Fall Apart by Chinua Achebe, Okonkwo is a leader of Umuofia (a fictional Nigerian clan) and takes pride in his culture’s
traditions. However, when the arrival of European missionaries brings changes to Umuofia, the novel asks a central question: How ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Umuofia’s traditions will be affected."}, {"label": "B", "body": "will Umuofia’s traditions be affected."}, {"label": "C", "body": "Umuofia’s traditions will be affected?"}, {"label": "D", "body": "will Umuofia’s traditions be affected?"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The clause before the colon tells us that the novel “asks a question,” so the clause after the colon should be in the
conventional form of a question: with the verb before the subject, and a question mark at the end.
Choice A is incorrect. This choice ends the sentence with a period, which isn’t right. The clause before the colon tells us that the novel “asks a
question,” so the clause after the colon should be that question. Choice B is incorrect. This choice ends the sentence with a period, which isn’t
right. The clause before the colon tells us that the novel “asks a question,” so the clause after the colon should be that question. In Standard
English, questions place the verb before the subject and end with a question mark. Choice C is incorrect. This choice doesn’t conform to the
conventions of Standard English. In Standard English, questions place the verb before the subject.$qb$);
select seed_pool_question($qb$CB-a14eef71$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In 2015, a team led by materials scientists Anirudha Sumant and Diana Berman succeeded in reducing the coefficient of friction (COF) between
two surfaces to the lowest possible level—superlubricity. A nearly frictionless (and, as its name suggests, extremely slippery) state, ______
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "when their COF drops below 0.01, two surfaces reach superlubricity."}, {"label": "B", "body": "two surfaces, when their COF drops below 0.01, reach superlubricity."}, {"label": "C", "body": "reaching superlubricity occurs when two surfaces’ COF drops below 0.01."}, {"label": "D", "body": "superlubricity is reached when two surfaces’ COF drops below 0.01."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun “superlubricity” the subject
of the sentence and places it immediately after the modifying phrase “a nearly frictionless…state.” In doing so, this choice clearly establishes that
superlubricity—and not another noun in the sentence—is being described as nearly frictionless and extremely slippery.
Choice A is incorrect because it results in a dangling modifier. Regardless of the introductory “when…” clause, the main subject “two surfaces”
follows the modifying phrase (“A nearly frictionless…state”), illogically suggesting that the surfaces are the nearly frictionless, extremely slippery
state. Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase “two surfaces” immediately after the
modifying phrase illogically suggests that the surfaces are a nearly frictionless and extremely slippery state. Choice C is incorrect because it
results in a dangling modifier. The placement of the gerund phrase “reaching superlubricity” immediately after the modifying phrase illogically
suggests that the act of reaching superlubricity is the nearly frictionless, extremely slippery state.$qb$);
select seed_pool_question($qb$CB-5fd86f4b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The ghazal, a poetic form originating in seventh-century Arabic poetry, has an intricate structure. The twentieth-century Kashmiri American poet
Agha Shahid Ali explains that each one of a ghazal’s couplets, while adhering to the patterns of rhyme (qafia) and refrain (radif) established in the
poem’s opening lines (matla), ______ thematically and logically autonomous, resulting in a poem with “a stringently formal disunity.”
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is"}, {"label": "B", "body": "were"}, {"label": "C", "body": "have been"}, {"label": "D", "body": "are"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. The singular verb "is" agrees in number with
the singular subject "each one of a ghazal’s couplets." While the prepositional phrase "of a ghazal’s couplets" within the subject contains a plural
noun, the head of the subject ("each one") is singular, indicating that each individual couplet (not the couplets as a group) is "thematically and
logically autonomous," or self-standing.
Choice B is incorrect because the plural verb "were" doesn’t agree in number with the singular subject "each one of a ghazal’s couplets." Choice C
is incorrect because the plural verb "have been" doesn’t agree in number with the singular subject "each one of a ghazal’s couplets." Choice D is
incorrect because the plural verb "are" doesn’t agree in number with the singular subject "each one of a ghazal’s couplets."$qb$);
select seed_pool_question($qb$CB-f868d438$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 2018, the innovative works of Congolese sculptor and architect Bodys Isek ______ were featured in City Dreams, a solo exhibition at New York’s
Museum of Modern Art.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Kingelez;"}, {"label": "B", "body": "Kingelez,"}, {"label": "C", "body": "Kingelez"}, {"label": "D", "body": "Kingelez:"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation between a subject and a verb. No punctuation is needed when the
subject of a sentence is immediately followed by a main verb. In this case, the sentence’s subject (“the innovative works of Congolese sculptor
and architect Bodys Isek Kingelez”) is followed by the main verb “were featured,” and no punctuation should come between them.
Choice A is incorrect because no punctuation is needed between the subject and the verb. Choice B is incorrect because no punctuation is
needed between the subject and the verb. Choice D is incorrect because no punctuation is needed between the subject and the verb.$qb$);
select seed_pool_question($qb$CB-60dd03bc$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Located in the northern United States, the Great Lakes Basin contains roughly 35,000 islands. Lake Superior has Grand Island, for example. Lake
Michigan has Belle Isle. Lake Huron, though, is home ______ the largest island of them all: Manitoulin Island.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "to;"}, {"label": "B", "body": "to—"}, {"label": "C", "body": "to"}, {"label": "D", "body": "to,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between a preposition and its complement. No punctuation is
needed between the preposition "to" and its complement "the largest island of them all." The complement completes the meaning of the
preposition in the phrase "home to the largest island of them all," and any punctuation within it results in an ungrammatical sentence.
Choice A is incorrect because no punctuation is needed between the preposition and its complement. Choice B is incorrect because no
punctuation is needed between the preposition and its complement. Choice D is incorrect because no punctuation is needed between the
preposition and its complement.$qb$);
select seed_pool_question($qb$CB-6d4b2e1e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The 1977 play And the Soul Shall Dance depicts two Japanese American farming families in Depression-era Southern California. Critics have
noted the way pioneering ______ compares the experiences of issei (Japanese nationals who emigrated to America) and nisei (their American-
born children).
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "playwright, Wakako Yamauchi,"}, {"label": "B", "body": "playwright, Wakako Yamauchi"}, {"label": "C", "body": "playwright Wakako Yamauchi,"}, {"label": "D", "body": "playwright Wakako Yamauchi"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation between titles and proper nouns. No punctuation is needed to
set off the proper noun "Wakako Yamauchi" from the title that describes Yamauchi, "pioneering playwright." Because "Wakako Yamauchi" is
essential information identifying the "pioneering playwright," no punctuation is necessary.
Choice A is incorrect because no punctuation is needed before or after the proper noun "Wakako Yamauchi." Setting the playwright’s name off
with commas suggests that it could be removed without affecting the coherence of the sentence, which isn’t the case. Choice B is incorrect
because no punctuation is needed between the title "pioneering playwright" and the proper noun "Wakako Yamauchi." Choice C is incorrect
because no punctuation is needed between the proper noun "Wakako Yamauchi" and the verb "compares."$qb$);
select seed_pool_question($qb$CB-6205f7e4$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A worker cooperative is a business that is owned and operated by its workers. This model stands in contrast to traditional models in which a
smaller group of owners controls a company. Because the profits made by a cooperative are shared by all workers—who are also owners—the
workers ______ directly from its success.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "benefit"}, {"label": "B", "body": "benefited"}, {"label": "C", "body": "were benefiting"}, {"label": "D", "body": "had benefited"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the present tense verb “benefit” is
consistent with the other present tense verbs (“is,” “stands,” and “are shared”) used to describe worker cooperatives and how they function.
Choice B is incorrect because the past tense verb “benefited” isn’t consistent with the other present tense verbs used to describe worker
cooperatives and how they function. Choice C is incorrect because the past progressive tense verb “were benefiting” isn’t consistent with the
other present tense verbs used to describe worker cooperatives and how they function. Choice D is incorrect because the past perfect tense verb
“had benefited” isn’t consistent with the other present tense verbs used to describe worker cooperatives and how they function.$qb$);
select seed_pool_question($qb$CB-7c766ceb$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A popular suite of mapping and spatial analysis software, ArcGIS enables cartographers like Karachi Cartography founder Namra Khalid ______
maps by analyzing and arranging raw geospatial data.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "create"}, {"label": "B", "body": "to create"}, {"label": "C", "body": "creating"}, {"label": "D", "body": "created"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite to-infinitive verb “to create” is
correctly used to form a subordinate clause that expresses how ArcGIS facilitates the creation of maps (by analyzing and arranging certain
data).
Choice A is incorrect because it results in an ungrammatical sentence. The finite verb “create” can’t be used in this way to form a subordinate
clause that expresses how ArcGIS facilitates the creation of maps. Choice C is incorrect because it results in an ungrammatical sentence. The
nonfinite participle “creating” can’t be used in this way to form a subordinate clause that expresses how ArcGIS facilitates the creation of maps.
Choice D is incorrect because it results in an ungrammatical sentence. The finite verb “created” can’t be used in this way to form a subordinate
clause that expresses how ArcGIS facilitates the creation of maps.$qb$);
select seed_pool_question($qb$CB-39ac6498$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In forecasting weather events, meteorologists sometimes discuss the role of atmospheric rivers. What are atmospheric rivers, and how ______
Part of the water cycle, atmospheric rivers are narrow channels of moisture moving through the atmosphere. In certain conditions, these “rivers”
can release some of their moisture as precipitation.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "do they affect our weather."}, {"label": "B", "body": "they do affect our weather."}, {"label": "C", "body": "do they affect our weather?"}, {"label": "D", "body": "they do affect our weather?"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is end-of-sentence punctuation. This choice correctly uses a question mark to
punctuate the coordinated interrogative clauses "What are atmospheric rivers" and "how do they affect our weather," both of which ask direct
questions.
Choice A is incorrect because a period can’t be used in this way to punctuate an interrogative clause, such as "how do they affect our weather," at
the end of a sentence. Choice B is incorrect because the structure requires an interrogative clause and a question mark at the end of the
sentence. Choice D is incorrect because the structure requires an interrogative clause at the end of the sentence.$qb$);
select seed_pool_question($qb$CB-8d00cd7c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Within Earth’s biomes, there are four main types of desert: arid, semiarid, coastal, and cold. The roughly ______ is classified as an arid desert.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "200,000 km2 Puntland Desert,"}, {"label": "B", "body": "200,000 km2, Puntland Desert"}, {"label": "C", "body": "200,000 km2 Puntland Desert"}, {"label": "D", "body": "200,000 km2, Puntland Desert,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation between a modifier and a noun and also between a subject
and a verb. No punctuation is needed when, as in this case, a modifying phrase (“roughly 200,000 km2”) precedes the noun phrase it modifies
(“Puntland Desert”) to form the subject of the sentence. Additionally, no punctuation is needed between the subject (“The roughly...Desert”) and
the main verb (“is classified”).
Choice A is incorrect because no punctuation is needed between the subject and the main verb. Choice B is incorrect because no punctuation is
needed between the modifier and the noun phrase. Choice D is incorrect because no punctuation is needed between the modifier and the noun
phrase, nor is it needed between the subject and the main verb.$qb$);
select seed_pool_question($qb$CB-b85c19ed$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The violins handmade in the seventeenth century by Italian craftsman Antonio Stradivari have been celebrated as some of the finest in the world.
In close collaboration with musicians, Stradivari introduced changes to the shape of a traditional violin, flattening some of the instrument’s
curves and making ______ lighter overall.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "those"}, {"label": "B", "body": "one"}, {"label": "C", "body": "them"}, {"label": "D", "body": "it"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is pronoun–antecedent agreement. The singular pronoun “it” agrees in number with the
singular antecedent “violin” and thus indicates that the traditional violin (and not its curves) was made lighter.
Choice A is incorrect because the plural pronoun “those” doesn’t agree in number with the singular antecedent “violin.” Choice B is incorrect
because the singular pronoun “one” is ambiguous in this context; the resulting sentence leaves unclear what Stradivari made lighter. Choice C is
incorrect because the plural pronoun “them” doesn’t agree in number with the singular antecedent “violin.”$qb$);
select seed_pool_question($qb$CB-109d5bbb$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$With some 16,000 in attendance, the Second World Black and African Festival of Arts and ______ or FESTAC ‘77, as the event was more
commonly known—became the largest pan-African event on record. FESTAC drew people from around the world to Lagos, Nigeria, for a
monthlong celebration of Black and African art, scholarship, and activism.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Culture:"}, {"label": "B", "body": "Culture—"}, {"label": "C", "body": "Culture,"}, {"label": "D", "body": "Culture"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The text uses a dash to introduce a nonessential element that explains the acronym FESTAC. The dash matches the
dash that comes after “known,” ending the descriptive aside.
Choice A is incorrect. A colon can only come after an independent clause, which isn’t the case here. Choice C is incorrect. While punctuation is
required to set off “or FESTAC…known” from the rest of the sentence, nonessential elements must be separated from the sentence with
matching punctuation. Since a dash appears on the other side of the element, we can’t use a comma here. Choice D is incorrect. The descriptive
aside “or FESTAC…known” is a nonessential element that must be separated with punctuation from the rest of the sentence. This choice fails to
add the necessary punctuation before the nonessential element.$qb$);
select seed_pool_question($qb$CB-b5ff8f8e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The element carbon has the highest melting point ______ all the elements on the periodic table—3,500 degrees Celsius.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "of"}, {"label": "B", "body": "of—"}, {"label": "C", "body": "of,"}, {"label": "D", "body": "of:"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between a preposition and its complement. No punctuation is
needed between the preposition "of" and its complement "all the elements on the periodic table." The complement completes the meaning of the
preposition in the phrase "the highest melting point of all the elements on the periodic table," and using punctuation to separate the complement
from the preposition results in an ungrammatical sentence.
Choice B is incorrect because no punctuation is needed between the preposition and its complement. Choice C is incorrect because no
punctuation is needed between the preposition and its complement. Choice D is incorrect because no punctuation is needed between the
preposition and its complement.$qb$);
select seed_pool_question($qb$CB-505054e3$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the eastern Chinese city of Suzhou, known as a hub for silk manufacturing, a unique tradition of embroidery ______ back over two thousand
years—one that includes iconic double-sided stitching with different images on each side—remains popular with modern audiences, preserving
the city’s cultural heritage.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "dates"}, {"label": "B", "body": "date"}, {"label": "C", "body": "dating"}, {"label": "D", "body": "has dated"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verb forms within a sentence. The sentence’s subject is “a unique tradition
of embroidery,” and its finite main verb is “remains.” This choice correctly uses the nonfinite present participle “dating” to form an integrated
participial phrase (“dating...years”) that modifies the subject, providing additional information about how far back the tradition goes.
Choice A is incorrect because it results in an ungrammatical sentence. Using the finite present tense verb “dates” creates a second finite verb in
the main clause, which already has the finite verb “remains” as its main verb. Choice B is incorrect because it results in an ungrammatical
sentence. Using the finite present tense verb “date” creates a second finite verb in the main clause, which already has the finite verb “remains” as
its main verb. Furthermore, the plural verb “date” doesn’t agree in number with the singular subject, “a unique tradition of embroidery.” Choice D is
incorrect because it results in an ungrammatical sentence. Using the finite present perfect tense verb “has dated” creates a second finite verb in
the main clause, which already has the finite verb “remains” as its main verb.$qb$);
select seed_pool_question($qb$CB-18382e67$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In Marisol’s 1968 sculpture Mi Mama y Yo, gone are the types of pop culture references that made the Parisian-born Venezuelan American artist
a star at the height of the pop art movement. In ______ place is a far more personal subject: a sculptural depiction of the artist as a young girl
with her mother.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "its"}, {"label": "B", "body": "they’re"}, {"label": "C", "body": "their"}, {"label": "D", "body": "it’s"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of possessive determiners. The plural possessive determiner "their" agrees
in number with the plural noun "types" and thus indicates that the more personal subject matter of Marisol’s 1968 sculpture takes the place of
those types of pop culture references that made Marisol a star.
Choice A is incorrect because the singular possessive determiner "its" doesn’t agree in number with the plural noun "types." Choice B is incorrect
because "they’re" is the contraction for "they are," not a possessive determiner. Choice D is incorrect because "it’s" is the contraction for "it is" or
"it has," not a possessive determiner.$qb$);
select seed_pool_question($qb$CB-56770dda$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In his 1963 exhibition Exposition of Music—Electronic Television, Korean American artist Nam June Paik showed how television images could be
manipulated to express an artist’s perspective. Today, Paik ______ considered the first video artist.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "will be"}, {"label": "B", "body": "had been"}, {"label": "C", "body": "was"}, {"label": "D", "body": "is"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the present tense verb "is," used in
conjunction with the word "today," correctly indicates that Paik is currently considered the first video artist.
Choice A is incorrect because the future tense verb "will be" doesn’t indicate that Paik is currently considered the first video artist. Choice B is
incorrect because the past perfect tense verb "had been" doesn’t indicate that Paik is currently considered the first video artist. Choice C is
incorrect because the past tense verb "was" doesn’t indicate that Paik is currently considered the first video artist.$qb$);
select seed_pool_question($qb$CB-3fee46f2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Sociologist Todd Gitlin co-opted the term “recombinant,” normally used in reference to genetic engineering, to describe serialized television
shows of the 1980s. Gitlin’s use of the term referenced TV studios’ practice of repackaging successful narrative formulas as new ______ even
shows that varied only slightly from other shows still attracted sizeable audiences.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "content, in that era"}, {"label": "B", "body": "content; in that era,"}, {"label": "C", "body": "content in that era,"}, {"label": "D", "body": "content, in that era,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation within a sentence. This choice uses a semicolon in a
conventional way to join the first main clause ("Gitlin’s…content") and the second main clause beginning with a supplementary phrase ("in…
audiences"). Further, placing a comma after "era" separates the supplementary phrase "in that era" from the rest of the main clause that follows
("even…audiences").
Choice A is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. Further, this choice fails to mark the boundary between the supplementary phrase "in that era" and the rest of the main clause that
follows ("even…audiences"). Choice C is incorrect because it results in a run-on sentence. The two main clauses ("Gitlin’s…content" and "in…
audiences") are fused without punctuation and/or a conjunction. Choice D is incorrect because it results in a comma splice. Without a
conjunction following it, a comma can’t be used in this way to join two main clauses.$qb$);
select seed_pool_question($qb$CB-6174a5b6$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Many folktales that originate in the Czech language start with a phrase that roughly translates to “there was, there was not.” Many tales that
originate in English use “once upon a time.” Such phrases, known as story starters, ______ from language to language.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "vary"}, {"label": "B", "body": "has varied"}, {"label": "C", "body": "varies"}, {"label": "D", "body": "is varying"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The plural verb “vary” agrees in number with the plural
subject “such phrases.” The supplementary phrase “known as story starters,” set off by commas, doesn’t change the subject’s number.
Choice B is incorrect. The singular verb phrase “has varied” doesn’t agree in number with the plural subject “such phrases.” Choice C is incorrect.
The singular verb “varies” doesn’t agree in number with the plural subject “such phrases.” Choice D is incorrect. The singular verb phrase “is
varying” doesn’t agree in number with the plural subject “such phrases.”$qb$);
select seed_pool_question($qb$CB-d073983d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Known for her massive photorealistic paintings of African American figures floating or swimming in pools, Calida Garcia ______ was the logical
choice to design the book cover for Ta-Nehisi Coates’s The Water Dancer, a novel about an African American man who can travel great distances
through water.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Rawles—"}, {"label": "B", "body": "Rawles:"}, {"label": "C", "body": "Rawles,"}, {"label": "D", "body": "Rawles"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation between a subject and a verb. When, as in this case, a subject (“Calida
Garcia Rawles”) is immediately followed by a verb (“was”), no punctuation is needed.
Choice A is incorrect because no punctuation is needed between the subject and the verb. Choice B is incorrect because no punctuation is
needed between the subject and the verb. Choice C is incorrect because no punctuation is needed between the subject and the verb.$qb$);
select seed_pool_question($qb$CB-02913383$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$“He was just the man for such a place, and it was just the place for such a man.” This line is from Frederick Douglass’s autobiography Narrative of
the Life of Frederick Douglass (1845). It’s an example of antimetabole, a writing technique that ______ emphasis by repeating a statement in a
reversed order.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "create"}, {"label": "B", "body": "are creating"}, {"label": "C", "body": "have created"}, {"label": "D", "body": "creates"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The singular verb "creates" agrees in number with the
singular subject "technique."
Choice A is incorrect because the plural verb "create" doesn’t agree in number with the singular subject "technique." Choice B is incorrect
because the plural verb "are creating" doesn’t agree in number with the singular subject "technique." Choice C is incorrect because the plural verb
"have created" doesn’t agree in number with the singular subject "technique."$qb$);
select seed_pool_question($qb$CB-e92a7ad3$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the Inca Empire (1438–1533), ayllus ______ family clans that ranged in size from small groups to thousands of people.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is"}, {"label": "B", "body": "was"}, {"label": "C", "body": "has been"}, {"label": "D", "body": "were"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The plural verb "were" agrees in number with the plural
subject "ayllus," which are described as plural "family clans."
Choice A is incorrect because the singular verb "is" doesn’t agree in number with the plural subject "ayllus." Choice B is incorrect because the
singular verb "was" doesn’t agree in number with the plural subject "ayllus." Choice C is incorrect because the singular verb "has been" doesn’t
agree in number with the plural subject "ayllus."$qb$);
select seed_pool_question($qb$CB-c468db1c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A group of ecologists led by Axel Mithöfer at the Max Planck Institute for Chemical Ecology in Germany examined the defensive responses of
two varieties of the sweet potato ______ TN57, which is known for its insect resistance, and TN66, which is much more susceptible to pests.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "plant."}, {"label": "B", "body": "plant;"}, {"label": "C", "body": "plant"}, {"label": "D", "body": "plant:"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between a main clause and a supplementary phrase. In this choice,
a colon is correctly used to mark the boundary between the main clause (“A group…plant”) and the supplementary element (“TN57…pests”) and
to introduce the following elaboration on the specific varieties of sweet potato plants that were examined.
Choice A is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with “TN57.” Choice B is incorrect because a
semicolon can’t be used in this way to join the main clause (“A group…plant”) and the supplementary element (“TN57…pests”). A semicolon is
conventionally used to join two main clauses, whereas a colon is conventionally used to introduce an element that explains or amplifies the
information in the preceding clause. Choice C is incorrect because it fails to mark the boundary between the main clause (“A group...plant”) and
the supplementary element (“TN57...pests”) with appropriate punctuation.$qb$);
select seed_pool_question($qb$CB-ac7b8d04$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Tracy Fullerton’s Walden, a game, an unlikely fusion of the writings of nineteenth-century transcendentalist Henry David Thoreau with today’s
open-world video games, ______ players to explore a digital version of Walden Pond, the idyllic natural setting featured in Thoreau’s book Walden.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "invites"}, {"label": "B", "body": "invite"}, {"label": "C", "body": "are inviting"}, {"label": "D", "body": "have invited"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb “invites” agrees in number with the
singular subject “Tracy Fullerton’s Walden, a game.”
Choice B is incorrect because the plural verb “invite” doesn’t agree in number with the singular subject “Tracy Fullerton’s Walden, a game.” Choice
C is incorrect because the plural verb “are inviting” doesn’t agree in number with the singular subject “Tracy Fullerton’s Walden, a game.” Choice D
is incorrect because the plural verb “have invited” doesn’t agree in number with the singular subject “Tracy Fullerton’s Walden, a game.”$qb$);
select seed_pool_question($qb$CB-8a9d2f4e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Researchers studying the “terra-cotta army,” the thousands of life-size statues of warriors found interred near the tomb of Emperor Qin Shi Huang
of China, were shocked to realize that the shape of each statue’s ears, like the shape of each person’s ears, ______ unique.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are"}, {"label": "B", "body": "is"}, {"label": "C", "body": "were"}, {"label": "D", "body": "have been"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-verb agreement. The singular verb "is" agrees in number with the singular
subject "the shape."
Choice A is incorrect because the plural verb "are" doesn’t agree in number with the singular subject "the shape." Choice C is incorrect because
the plural verb "were" doesn’t agree in number with the singular subject "the shape." Choice D is incorrect because the plural verb "have been"
doesn’t agree in number with the singular subject "the shape."$qb$);
select seed_pool_question($qb$CB-576b2c70$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A member of the Cherokee Nation, Mary Golda Ross is renowned for her contributions to NASA’s Planetary Flight Handbook, which ______
detailed mathematical guidance for missions to Mars and Venus.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "provided"}, {"label": "B", "body": "having provided"}, {"label": "C", "body": "to provide"}, {"label": "D", "body": "providing"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of finite verbs in a relative clause. Relative clauses, such as the one
beginning with “which,” require a finite verb, a verb that can function as the main verb of a clause. This choice correctly supplies the clause with
the finite past tense verb “provided.”
Choice B is incorrect because the non-finite participle “having provided” doesn’t supply the clause with a finite verb. Choice C is incorrect
because the non-finite to-infinitive “to provide” doesn’t supply the clause with a finite verb. Choice D is incorrect because the non-finite participle
“providing” doesn’t supply the clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-78e978b5$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Organisation for Economic Co-operation and Development (OECD) tracks comparative price list data for its thirty-eight member countries.
For instance, in July 2021, a hypothetical basket of goods priced at 100 US dollars (USD) in the United States would have cost 62 USD and 110
USD in fellow OECD ______ and Luxembourg, respectively.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "nations, Chile"}, {"label": "B", "body": "nations; Chile"}, {"label": "C", "body": "nations: Chile"}, {"label": "D", "body": "nations Chile"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation between titles and proper nouns. No punctuation is needed to
set off the coordinated noun phrase "Chile and Luxembourg" from the title that describes the two countries, "fellow OECD nations." Because the
proper nouns "Chile and Luxembourg" are essential information identifying the "fellow OECD nations," no punctuation is necessary.
Choice A is incorrect because no punctuation is needed between the country names ("Chile and Luxembourg") and the title ("fellow OECD
nations") describing them. Further, setting the countries’ names off with commas suggests that they could be removed without affecting the
coherence of the sentence, which isn’t the case. Choice B is incorrect because no punctuation is needed between the country names ("Chile and
Luxembourg") and the title ("fellow OECD nations") describing them. Choice C is incorrect because no punctuation is needed between the
country names ("Chile and Luxembourg") and the title ("fellow OECD nations") describing them. Placing a colon after "nations" would confusingly
suggest that these were the costs of the basket of goods for "fellow OECD nations" in general, not for Chile and Luxembourg specifically.$qb$);
select seed_pool_question($qb$CB-d4fe8f03$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Paintings by the renowned twentieth-century US ______ were featured in Artist to Artist, an exhibition at the Smithsonian Art Museum that paired
the works of artists whose career trajectories intersected in meaningful ways.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "artists: Thomas Hart Benton and Jackson Pollock,"}, {"label": "B", "body": "artists Thomas Hart Benton and Jackson Pollock"}, {"label": "C", "body": "artists Thomas Hart Benton, and Jackson Pollock,"}, {"label": "D", "body": "artists, Thomas Hart Benton and Jackson Pollock"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of punctuation around noun phrases. No punctuation is needed because the
coordinated noun phrase "Thomas Hart Benton and Jackson Pollock" is a restrictive appositive, meaning that it provides essential identifying
information about the noun phrase before it, "the renowned twentieth-century US artists."
Choice A is incorrect because no punctuation is needed between the noun phrase "the renowned twentieth-century US artists" and the restrictive
appositive "Thomas Hart Benton and Jackson Pollock." Additionally, no punctuation is needed between the sentence’s subject ("paintings by the
renowned twentieth-century US artists Thomas Hart Benton and Jackson Pollock") and the main verb ("were featured"). Choice C is incorrect
because no punctuation is needed between the coordinated elements "Thomas Hart Benton" and "Jackson Pollock." Additionally, no punctuation
is needed between the sentence’s subject ("paintings by the renowned twentieth-century US artists Thomas Hart Benton and Jackson Pollock")
and the main verb ("were featured"). Choice D is incorrect because no punctuation is needed between the noun phrase "the renowned twentieth-
century US artists" and the restrictive appositive "Thomas Hart Benton and Jackson Pollock."$qb$);
select seed_pool_question($qb$CB-dfbf5d33$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 1453, English King Henry VI became unfit to rule after falling gravely ill. As a result, Parliament appointed Richard, Third Duke of York, who had
a strong claim to the English throne, to rule as Lord Protector. Upon recovering two years later, ______ forcing an angered Richard from the royal
court and precipitating a series of battles later known as the Wars of the Roses.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Henry resumed his reign,"}, {"label": "B", "body": "the reign of Henry resumed,"}, {"label": "C", "body": "Henry’s reign resumed,"}, {"label": "D", "body": "it was Henry who resumed his reign,"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-modifier placement. This choice ensures that the introductory phrase “upon
recovering two years later” appears immediately before the noun it modifies (“Henry”), clearly establishing that Henry recovered two years later.
Choice B is incorrect because it results in a dangling modifier. The placement of the noun phrase “the reign of Henry” immediately after the
introductory phrase illogically suggests that the reign of Henry recovered two years later. Choice C is incorrect because it results in a dangling
modifier. The placement of the noun phrase “Henry’s reign” immediately after the introductory phrase illogically suggests that Henry’s reign
recovered two years later. Choice D is incorrect because it results in a dangling modifier. The placement of the function word “it” immediately
after the introductory phrase illogically suggests that “it” recovered two years later.$qb$);
select seed_pool_question($qb$CB-cf08e2fd$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$From 1912 to 1951, Charlotta Bass owned and operated the newspaper The California Eagle. While it was under Bass’s leadership, The Eagle
______ one of the US’s most influential Black-owned newspapers.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "will become"}, {"label": "B", "body": "became"}, {"label": "C", "body": "is becoming"}, {"label": "D", "body": "to become"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The conventions being tested are the use of verbs to express tense and the use of verb forms within a sentence. In
this choice, the past tense verb "became" is consistent with the other past tense verbs ("owned," "operated," and "was") used to indicate that, at a
period of time in the past, Bass’s leadership resulted in her newspaper becoming one of the most influential Black-owned newspapers in the US.
In addition, "became" supplies the main clause with a finite (tensed) verb, which is required to perform the action of the subject (in this case, "The
Eagle").
Choice A is incorrect because the future tense verb "will become" isn’t consistent with the other past tense verbs used to discuss Bass and her
newspaper. Choice C is incorrect because the present progressive verb "is becoming" isn’t consistent with the other past tense verbs used to
discuss Bass and her newspaper. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive "to become"
doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-bb4557cf$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The relationship between genomes and epigenomes reveals how cells with identical DNA develop different ______ whereas the genome in each
cell contains a complete DNA sequence, the epigenome consists of chemical compounds that determine which traits in the sequence will be
expressed.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "functions"}, {"label": "B", "body": "functions,"}, {"label": "C", "body": "functions and,"}, {"label": "D", "body": "functions:"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of a colon within a sentence. In this choice, the colon correctly introduces
the following explanation of the different functions of genomes and epigenomes.
Choice A is incorrect because it results in a run-on sentence. The two main clauses ("The relationship…functions" and "whereas…expressed") are
fused without punctuation and/or a conjunction. Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way
to join two main clauses ("The relationship…functions" and "whereas…expressed"). Choice C is incorrect. Without a comma preceding it, the
conjunction "and" can’t be used in this way to join two main clauses. Furthermore, "and" fails to indicate that what follows is an explanation of
how cells with identical DNA develop different functions.$qb$);
select seed_pool_question($qb$CB-da53d726$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In February 1919, following the end of the First World War, women from ten countries around the world convened the Inter-Allied Women’s
Conference in Paris. The conference’s goals were ______ ensure women’s participation in the proceedings of the Paris Peace Conference, to
secure the right of women to serve in the League of Nations, and to advocate for human rights.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "threefold: to"}, {"label": "B", "body": "threefold. To"}, {"label": "C", "body": "threefold to"}, {"label": "D", "body": "threefold; to"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of punctuation within a sentence. In this choice, the colon correctly
introduces the series of goals held by the 1919 Inter-Allied Women’s Conference.
Choice B is incorrect because placing a period after "threefold" results in a rhetorically unacceptable sentence fragment beginning with "To."
Choice C is incorrect because it results in a run-on sentence. The main clause ("The conference’s goals were threefold") and the series
supplement ("to…rights") are fused without punctuation. Choice D is incorrect because a semicolon can’t be used in this way to introduce a
series. A semicolon is conventionally used to join two main clauses, whereas a colon is conventionally used to introduce a series, making the
colon the better choice in this context.$qb$);
select seed_pool_question($qb$CB-f2eaaf5d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$At eight paragraphs long, the preamble to the constitution of ______ country in Western Asia—is much longer than the one-paragraph preamble to
the United States Constitution.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Bahrain—a"}, {"label": "B", "body": "Bahrain, a"}, {"label": "C", "body": "Bahrain a"}, {"label": "D", "body": "Bahrain: a"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the punctuation of a supplementary element within a sentence. The dash after
“Bahrain” pairs with the dash after “Asia” to separate the supplementary element “a country in Western Asia” from the rest of the sentence.
Choice B is incorrect because a comma can’t be paired with a dash in this way to separate the supplementary element from the rest of the
sentence. Choice C is incorrect because it fails to use appropriate punctuation to separate the supplementary element from the rest of the
sentence. Choice D is incorrect because a colon can’t be paired with a dash in this way to separate the supplementary element from the rest of
the sentence.$qb$);
select seed_pool_question($qb$CB-ec08463d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Botanists recognize over fifty different species of sunflower. One species, the silverleaf sunflower, ______ both an early-flowering ecotype that
tends to grow in coastal areas and a late-flowering ecotype that grows inland.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "having included"}, {"label": "B", "body": "including"}, {"label": "C", "body": "to include"}, {"label": "D", "body": "includes"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This verb needs to function as the main verb in the sentence, with the subject “one species,” so it needs to be
conjugated. This choice gives us the singular present tense “includes,” which is the only conjugated form of the verb among the choices.
Choice A is incorrect. This doesn’t complete the text in a way that conforms to the conventions of Standard English. This verb needs to function
as the main verb in the sentence, with the subject “one species,” so it needs to be conjugated. “Having included” is a participle form of the verb:
it’s not conjugated and doesn’t function like a normal verb. Choice B is incorrect. This doesn’t complete the text in a way that conforms to the
conventions of Standard English. This verb needs to function as the main verb in the sentence, with the subject “one species,” so it needs to be
conjugated. “Including” is the gerund form of the verb: it’s not conjugated and doesn’t function like a normal verb. Choice C is incorrect. This
doesn’t complete the text in a way that conforms to the conventions of Standard English. This verb needs to function as the main verb in the
sentence, with the subject “one species,” so it needs to be conjugated. “To include” is the infinitive form of the verb: it’s not conjugated.$qb$);
select seed_pool_question($qb$CB-0b005ae2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Recently unearthed Neronian tools in France dating to 54,000 years ago and attributed to Homo sapiens may provide evidence that interactions
between Neanderthals and modern humans occurred 10,000 years earlier than was previously ______ finding that, if true, would overturn current
theories about H. sapiens migration during the Upper Paleolithic.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "supposed; a"}, {"label": "B", "body": "supposed. A"}, {"label": "C", "body": "supposed a"}, {"label": "D", "body": "supposed, a"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
mark the boundary between the main clause ("Recently...supposed") and the supplementary element ("a finding...Paleolithic") that provides
additional information about the implications of the Neronian tool discovery.
Choice A is incorrect because a semicolon can’t be used in this way to join the main clause ("Recently...supposed") and the supplementary
element ("a finding...Paleolithic"). Choice B is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with "a
finding." Choice C is incorrect because it results in a run-on sentence. The main clause ("Recently...supposed") and the supplementary element
("a finding...Paleolithic") are fused without punctuation and/or a conjunction.$qb$);
select seed_pool_question($qb$CB-4a90a978$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1990, California native and researcher Ellen Ochoa left her position as chief of the Intelligent Systems Technology Branch at a NASA research
center ______ the space agency’s astronaut training program.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "to join"}, {"label": "B", "body": "is joining"}, {"label": "C", "body": "joined"}, {"label": "D", "body": "joins"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of nonfinite verb forms in a sentence. The nonfinite to-infinitive verb "to join"
is correctly used to form a subordinate clause that expresses why Ochoa left her position (to join the training program).
Choice B is incorrect because the finite verb "is joining" can’t be used in this way to indicate Ochoa’s action of joining the training program. A
conjunction such as "and" would be needed to coordinate "is joining" with the previous finite verb, "left." Choice C is incorrect because the finite
verb "joined" can’t be used in this way to indicate Ochoa’s action of joining the training program. A conjunction such as "and" would be needed to
coordinate "joined" with the previous finite verb, "left." Choice D is incorrect because the finite verb "joins" can’t be used in this way to indicate
Ochoa’s action of joining the training program. A conjunction such as "and" would be needed to coordinate "joins" with the previous finite verb,
"left."$qb$);
select seed_pool_question($qb$CB-59e41600$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Why are Rome’s famous concrete structures, such as the Colosseum, still standing after 2,000-plus years, when modern concrete may not even
last for fifty? Scientists ______ that the secret to Roman concrete’s durability was its unique blend of ingredients, which included volcanic ash and
seawater.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "explain"}, {"label": "B", "body": "having explained"}, {"label": "C", "body": "explaining"}, {"label": "D", "body": "to explain"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. The main clause of a sentence requires a
finite (tensed) verb, and this choice supplies the finite present tense verb “explain” to indicate what the scientists do.
Choice B is incorrect because it results in an ungrammatical sentence. The nonfinite participle “having explained” doesn’t supply the main clause
with a finite verb. Choice C is incorrect because it results in an ungrammatical sentence. The nonfinite participle “explaining” doesn’t supply the
main clause with a finite verb. Choice D is incorrect because it results in an ungrammatical sentence. The nonfinite to-infinitive “to explain”
doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-eb03096e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$According to the University of Hawai i at Mānoa, aloha  āina is “a recognition, commitment, and practice sustaining the ea—or life breath”
between the Hawaiian people and their natural environments. The concept has been proudly embodied ______ Native Hawaiians for generations,
contributing to the lush flora and renowned beauty of the islands.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "by;"}, {"label": "B", "body": "by:"}, {"label": "C", "body": "by,"}, {"label": "D", "body": "by"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is punctuation use between a preposition and its complement. No punctuation is
needed between the preposition "by" and its complement "Native Hawaiians." The complement completes the meaning of the preposition in the
phrase "proudly embodied by Native Hawaiians," and any punctuation within it results in an ungrammatical sentence.
Choice A is incorrect because no punctuation is needed between the preposition and its complement. Choice B is incorrect because no
punctuation is needed between the preposition and its complement. Choice C is incorrect because no punctuation is needed between the
preposition and its complement.$qb$);
select seed_pool_question($qb$CB-d75d57a0$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$While many video game creators strive to make their graphics ever more ______ others look to the past, developing titles with visuals inspired by
the “8-bit” games of the 1980s and 1990s. (The term “8-bit” refers to a console whose processor could only handle eight bits of data at once.)
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "lifelike but"}, {"label": "B", "body": "lifelike"}, {"label": "C", "body": "lifelike,"}, {"label": "D", "body": "lifelike, but"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation between a subordinate clause and a main clause. This choice correctly
uses a comma to mark the boundary between the subordinate clause (“While…lifelike”) and the main clause (“others look to the past”).
Choice A is incorrect because it results in an incomplete sentence with no main clause. Choice B is incorrect because it fails to mark the
boundary between the subordinate clause (“While…lifelike”) and the main clause (“others…past”). Choice D is incorrect because it results in an
incomplete sentence with no main clause.$qb$);
select seed_pool_question($qb$CB-a427a52c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Lion Light system, developed by Kenyan inventor Richard Turere, consists of LED lights installed around the perimeter of livestock pastures.
Powered with ______ the blinking LEDs keep lions away at night, thus protecting the livestock without risking harm to the endangered lions.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "energy collected, by solar panels, during the day"}, {"label": "B", "body": "energy collected by solar panels during the day"}, {"label": "C", "body": "energy collected by solar panels during the day,"}, {"label": "D", "body": "energy, collected by solar panels during the day,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation between a supplementary phrase and a main clause. This choice
correctly uses a comma to mark the boundary between the supplementary phrase (“powered…day”), which describes how the LEDs are powered,
and the main clause (“the blinking…night”).
Choice A is incorrect because it fails to mark the boundary between the supplementary phrase and the main clause with appropriate
punctuation. Furthermore, placing commas around the phrase “by solar panels” suggests that it could be removed without affecting the
coherence of the sentence, which isn’t the case. Choice B is incorrect because it fails to mark the boundary between the supplementary phrase
and the main clause with appropriate punctuation. Choice D is incorrect. Placing commas around the phrase “collected by solar panels during
the day″ suggests that it could be removed without affecting the coherence of the sentence, which isn’t the case.$qb$);
select seed_pool_question($qb$CB-6997261f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 2009, researchers determined that pottery fragments from a cave in China were close to 18,000 years old. These are some of the oldest ______
of pottery ever found.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "pieces:"}, {"label": "B", "body": "pieces,"}, {"label": "C", "body": "pieces"}, {"label": "D", "body": "pieces—"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between a noun and a prepositional phrase. No punctuation is
needed between the noun "pieces" and the prepositional phrase "of pottery." The prepositional phrase provides essential information about what
kind of pieces were found, so it shouldn’t be separated from the rest of the noun phrase ("some of the oldest pieces") with punctuation.
Choice A is incorrect because no punctuation is needed between the noun phrase "some of the oldest pieces" and the prepositional phrase "of
pottery." Choice B is incorrect because no punctuation is needed between the noun phrase "some of the oldest pieces" and the prepositional
phrase "of pottery." Choice D is incorrect because no punctuation is needed between the noun phrase "some of the oldest pieces" and the
prepositional phrase "of pottery."$qb$);
select seed_pool_question($qb$CB-3daf126e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A model created by biologist Luis Valente predicts that the rate of speciation—the rate at which new species form—on an isolated island located
approximately 5,000 kilometers from the nearest mainland ______ triple the rate of speciation on an island only 500 kilometers from the
mainland.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "being"}, {"label": "B", "body": "to be"}, {"label": "C", "body": "to have been"}, {"label": "D", "body": "will be"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is finite and nonfinite verb forms within a sentence. Relative clauses, such as the one
beginning with “that,” require a finite verb, a verb that can function as the main verb of a clause. This choice correctly supplies the clause with the
finite future tense verb “will be.”
Choice A is incorrect because the nonfinite participle “being” doesn’t supply the clause with a finite verb. Choice B is incorrect because the
nonfinite to-infinitive “to be” doesn’t supply the clause with a finite verb. Choice C is incorrect because the nonfinite to-infinitive “to have been”
doesn’t supply the clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-975eda7c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For thousands of years, people in the Americas ______ the bottle gourd, a large bitter fruit with a thick rind, to make bottles, other types of
containers, and even musical instruments. Oddly, there is no evidence that any type of bottle gourd is native to the Western Hemisphere; either
the fruit or its seeds must have somehow been carried from Asia or Africa.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "to use"}, {"label": "B", "body": "have used"}, {"label": "C", "body": "having used"}, {"label": "D", "body": "using"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is finite and nonfinite verb forms within a sentence. A main clause requires a finite verb
to perform the action of the subject (in this case, “people in the Americas”), and this choice supplies the finite past perfect tense verb “have
used” to indicate what people in the Americas used the gourd for.
Choice A is incorrect because the nonfinite to-infinitive “to use” doesn’t supply the main clause with a finite verb. Choice C is incorrect because
the nonfinite participle “having used” doesn’t supply the main clause with a finite verb. Choice D is incorrect because the nonfinite participle
“using” doesn’t supply the main clause with a finite verb.$qb$);
select seed_pool_question($qb$CB-5ee7fb04$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In modern plays, actors typically won’t acknowledge the ______ do so breaks the fourth wall, a metaphorical barrier between actors and
audiences that allows viewers to suspend the knowledge that they’re watching a staged performance.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "audience. As to"}, {"label": "B", "body": "audience to"}, {"label": "C", "body": "audience. To"}, {"label": "D", "body": "audience, to"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence ("In modern…audience") and another ("To do…performance").
Choice A is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with "as." Choice B is incorrect because it
results in a run-on sentence. The sentences ("In modern…audience" and "To do…performance") are fused without punctuation and/or a
conjunction. Choice D is incorrect because it results in a comma splice. A comma can’t be used in this way to mark the boundary between
sentences.$qb$);
select seed_pool_question($qb$CB-a12e3b8a$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Customers who are satisfied with how a company resolves a service issue may regard that company more positively than they would if no such
issue had occurred. This idea is known as the service recovery ______ research suggests that it has important implications for customer loyalty
and retention.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "paradox,"}, {"label": "B", "body": "paradox"}, {"label": "C", "body": "paradox, and"}, {"label": "D", "body": "paradox and,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and the coordinating conjunction "and" to join the first main clause ("This idea…paradox") and the second main clause ("research…
retention").
Choice A is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in this way to join two main
clauses. Choice B is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation and/or a conjunction.
Choice D is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction, not after it.$qb$);
select seed_pool_question($qb$CB-c04e9136$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The 2022 Nobel Prize in Chemistry was awarded to three pioneers in the field of click chemistry: two-time Nobel laureate Barry Sharpless, who
coined the term “click chemistry” in 1998; Carolyn Bertozzi, founder of the Bertozzi Group at ______ and Morten Meldal, a professor at the
University of Copenhagen in Denmark.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Stanford"}, {"label": "B", "body": "Stanford,"}, {"label": "C", "body": "Stanford:"}, {"label": "D", "body": "Stanford;"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. This choice correctly uses a semicolon to punctuate a complex list (which is made up of items that have commas in
them).
Choice A is incorrect. This is a complex list, indicated by the semicolon between "1998" and "Carolyn Bertozzi." What comes after the blank is a
separate list item, so punctuation is needed after "Stanford." Choice B is incorrect. This is a complex list, indicated by the semicolon between
"1998" and "Carolyn Bertozzi." The items in this list have internal punctuation in the form of commas and must therefore be separated by
semicolons to avoid confusion. Choice C is incorrect. This is a complex list, indicated by the semicolon between "1998" and "Carolyn Bertozzi."
Colons aren’t used to separate items in a list.$qb$);
select seed_pool_question($qb$CB-588887b9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1881, French chemist Camille Faure redesigned the rechargeable lead-acid battery. Faure’s design greatly increased the amount of electricity
that the original battery, which the French physicist Gaston Planté ______ fifteen years earlier, could hold.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is inventing"}, {"label": "B", "body": "will invent"}, {"label": "C", "body": "invents"}, {"label": "D", "body": "had invented"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. Faure redesigned the battery in 1881, and the original battery was invented “fifteen years earlier.” Notice that this is
the only choice in the past tense. To indicate that a past occurrence took place before another past occurrence, we need to use “had” + the past
tense form of the verb. This is called the “past perfect” tense.
Choice A is incorrect. This choice creates a tense error. Planté invented the original battery in the past, so we shouldn’t use the present tense “is
inventing.” Choice B is incorrect. This choice creates a tense error. Planté invented the original battery in the past, so we shouldn’t use the future
tense “will invent.” Choice C is incorrect. This choice creates a tense error. Planté invented the original battery in the past, so we shouldn’t use the
present tense “invents.”$qb$);
select seed_pool_question($qb$CB-92f309b2$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Arms outstretched, right wrist over left with both hands dangling, South Korean musician Psy galloped from one foot to the other in the iconic
dance of his 2012 international hit song “Gangnam Style.” Later, a statue depicting Psy’s arm-positioning during the dance was erected in the
place that inspired the song’s ______ Gangnam District in Seoul, South Korea.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "name;"}, {"label": "B", "body": "name."}, {"label": "C", "body": "name"}, {"label": "D", "body": "name—"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a dash after the
main clause (“Later...name”) to introduce the supplementary element (“Gangnam...Korea”) that identifies the place that inspired the song’s name.
Choice A is incorrect because a semicolon can’t be used in this way to join the main clause (“Later...name”) and the supplementary element
(“Gangnam...Korea”). A semicolon is conventionally used to join two main clauses. Choice B is incorrect because it results in a rhetorically
unacceptable sentence fragment beginning with “Gangnam.” Choice C is incorrect because it fails to mark the boundary between the main
clause and the supplementary element with appropriate punctuation.$qb$);
select seed_pool_question($qb$CB-c49e946e$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$As the fourteenth US librarian of Congress, Carla Hayden has many responsibilities. These include overseeing the Library of Congress’s
collections, which boast more than 162 million ______ the US Copyright Office, which registers copyright claims and advises Congress on
copyright law; and appointing the US poet laureate.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "items managing"}, {"label": "B", "body": "items, managing"}, {"label": "C", "body": "items; managing"}, {"label": "D", "body": "items. Managing"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of elements in a complex series. It’s conventional to use a
semicolon to separate items in a complex series with internal punctuation, and in this choice, the semicolon after "items" is conventionally used
to separate the first item ("overseeing…items") and the second item ("managing…law") in a list of Hayden’s responsibilities.
Choice A is incorrect because it fails to use appropriate punctuation to separate the first item and the second item in the complex series. Choice
B is incorrect because a comma after "items" doesn’t match the semicolon used later to separate the second and third items in the series
("managing…law" and "and appointing the US poet laureate"). Choice D is incorrect because it results in a rhetorically unacceptable sentence
fragment beginning with "Managing."$qb$);
select seed_pool_question($qb$CB-6d247c13$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Boston Saloon was one of the most popular African American–owned establishments in nineteenth-century Nevada. ______ by businessman
William A.G. Brown, the saloon was known to offer elegant accommodations and an inclusive environment.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Created"}, {"label": "B", "body": "Creates"}, {"label": "C", "body": "Creating"}, {"label": "D", "body": "Create"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite past participle "created" is
correctly used to form a supplementary element that modifies the noun phrase "the saloon," identifying who established the Boston Saloon.
Choice B is incorrect because it results in an ungrammatical sentence. The finite present tense verb "creates" can’t be used in this way to form a
supplementary element to modify the noun phrase "the saloon." Choice C is incorrect because it results in an ungrammatical sentence. The
nonfinite present participle "creating" can’t be used in this way to form a supplementary element to modify the noun phrase "the saloon." Choice
D is incorrect because it results in an ungrammatical sentence. The finite present tense verb "create" can’t be used in this way to form a
supplementary element to modify the noun phrase "the saloon."$qb$);
select seed_pool_question($qb$CB-fe41f258$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In ancient Greece, an Epicurean was a follower of Epicurus, a philosopher whose beliefs revolved around the pursuit of pleasure. Epicurus
defined pleasure as “the absence of pain in the body and of trouble in the ______ that all life’s virtues derived from this absence.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "soul,” positing"}, {"label": "B", "body": "soul”: positing"}, {"label": "C", "body": "soul”; positing"}, {"label": "D", "body": "soul.” Positing"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is punctuation use between a main clause and a participial phrase. This choice
correctly uses a comma to mark the boundary between the main clause (“Epicurus…‘soul’”) and the participial phrase (“positing…absence”) that
provides additional information about how Epicurus defined pleasure.
Choice B is incorrect because a colon can’t be used in this way to join a main clause and a participial phrase. Choice C is incorrect because a
semicolon can’t be used in this way to join a main clause and a participial phrase. Choice D is incorrect because it results in a rhetorically
unacceptable sentence fragment beginning with “positing.”$qb$);
select seed_pool_question($qb$CB-4c06427b$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Interest in mechanotransduction, the mechanism by which cells sense and convert mechanical stimuli into biochemical signals, is expanding
because of innovative work by biomedical scientists—many of whom, like neuroscience and biophysics expert Elba Serrano, ______ this
mechanism to better understand how the body’s neurological and biomechanical systems interact.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is studying"}, {"label": "B", "body": "has studied"}, {"label": "C", "body": "study"}, {"label": "D", "body": "studies"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verb forms within a sentence. The plural verb "study" agrees in number
with the plural subject "many."
Choice A is incorrect because the singular verb "is studying" doesn’t agree in number with the plural subject "many." Choice B is incorrect
because the singular verb "has studied" doesn’t agree in number with the plural subject "many." Choice D is incorrect because the singular verb
"studies" doesn’t agree in number with the plural subject "many."$qb$);
select seed_pool_question($qb$CB-81f09e07$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Instead of sleeping on soft pillows, ancient Egyptians slept on hard, elevated headrests, their design ______ airflow, protection from insects, and
hairstyle maintenance over comfort.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "had prioritized"}, {"label": "B", "body": "was prioritizing"}, {"label": "C", "body": "prioritized"}, {"label": "D", "body": "prioritizing"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite present participle “prioritizing”
is correctly used to form a supplementary element that modifies “their design,” describing what the headrests’ design prioritized.
Choice A is incorrect because it results in a comma splice. The finite past perfect verb “had prioritized” creates a second main clause in the
sentence, and the comma after “headrests” can’t be used in this way to join two main clauses. Choice B is incorrect because it results in a
comma splice. The finite past progressive verb “was prioritizing” creates a second main clause in the sentence, and the comma after “headrests”
can’t be used in this way to join two main clauses. Choice C is incorrect because it results in a comma splice. The finite past tense verb
“prioritized” creates a second main clause in the sentence, and the comma after “headrests” can’t be used in this way to join two main clauses.$qb$);
select seed_pool_question($qb$CB-8790d061$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$While constructing the Limyra Bridge, ancient Roman builders relied on temporary wooden beams to support the stone and brick structure.
These temporary supports, a construction system known as ______ were removed when the bridge was completed.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "falsework;"}, {"label": "B", "body": "falsework"}, {"label": "C", "body": "falsework,"}, {"label": "D", "body": "falsework:"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation within a sentence. The comma after "falsework" pairs with
the comma after "supports" to separate the supplementary element "a construction system known as falsework" from the rest of the sentence.
This supplementary element functions to clarify the term "these temporary supports," and the pair of commas indicates that this element could
be removed without affecting the grammatical coherence of the sentence.
Choice A is incorrect because a semicolon can’t be paired with a comma in this way to separate the supplementary element from the rest of the
sentence. Choice B is incorrect because it fails to use appropriate punctuation to separate the supplemental element from the rest of the
sentence. Choice D is incorrect because a colon can’t be paired with a comma in this way to separate the supplementary element from the rest
of the sentence.$qb$);
select seed_pool_question($qb$CB-8a264a54$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$With a blend of traditional design elements, such as arched Gothic ceilings, and modern ones, such as floor-to-ceiling ______ design splits the
difference between old and new, a mixture that is increasingly seen in home interiors in the US.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "windows; transitional"}, {"label": "B", "body": "windows—transitional"}, {"label": "C", "body": "windows. Transitional"}, {"label": "D", "body": "windows, transitional"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
mark the boundary between the introductory subordinate clause ("With…windows") and the main clause ("transitional design splits the difference
between old and new").
Choice A is incorrect because a semicolon can’t be used in this way to separate the subordinate clause ("With…windows") from the main clause
("transitional…new"). Choice B is incorrect because a dash can’t be used in this way to separate the subordinate clause ("With…windows") from
the main clause ("transitional…new"). Choice C is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with
"with."$qb$);
select seed_pool_question($qb$CB-9902d2de$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Alvarez theory, developed in 1980 by physicist Luis Walter Alvarez and his geologist son Walter Alvarez, maintained that the secondary
effects of an asteroid impact caused many dinosaurs and other animals to die ______ it left unexplored the question of whether unrelated
volcanic activity might have also contributed to the mass extinctions.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "out but"}, {"label": "B", "body": "out, but"}, {"label": "C", "body": "out"}, {"label": "D", "body": "out,"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the coordination of main clauses within a sentence. This choice correctly uses a
comma and the coordinating conjunction “but” to join the first main clause (“the Alvarez…out”) and the second main clause (“it left…extinctions”).
Choice A is incorrect because when coordinating two longer main clauses such as these, it’s conventional to use a comma before the
coordinating conjunction. Choice C is incorrect because it results in a run-on sentence. The two main clauses are fused without punctuation
and/or a conjunction. Choice D is incorrect because it results in a comma splice. Without a conjunction following it, a comma can’t be used in
this way to join two main clauses.$qb$);
select seed_pool_question($qb$CB-1c65db8f$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A species of Byropsis algae produces toxins to avoid being eaten by predators. However, in some cases, the toxins the organism uses to protect
itself from predation actually ______ its attractiveness to predators. The Hawaiian sea slug, for example, not only tolerates Byropsis toxins but
actually uses them for protection in the same way the algae does.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "is increasing"}, {"label": "B", "body": "increase"}, {"label": "C", "body": "increases"}, {"label": "D", "body": "has increased"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-verb agreement. The plural verb "increase" agrees in number with the plural
subject "toxins."
Choice A is incorrect because the singular verb "is increasing" doesn’t agree in number with the plural subject "toxins." Choice C is incorrect
because the singular verb "increases" doesn’t agree in number with the plural subject "toxins." Choice D is incorrect because the singular verb
"has increased" doesn’t agree in number with the plural subject "toxins."$qb$);
select seed_pool_question($qb$CB-cd2443c0$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A pioneer in the field of taphonomy (the study of how organic remains become fossils), ______ may be just as prevalent in the fossil record as
those of thick-shelled organisms.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "fossils of thin-shelled organisms, Anna Behrensmeyer demonstrated in a 2005 analysis,"}, {"label": "B", "body": "Anna Behrensmeyer demonstrated in a 2005 analysis that fossils of thin-shelled organisms"}, {"label": "C", "body": "it was demonstrated in a 2005 analysis by Anna Behrensmeyer that fossils of thin-shelled organisms"}, {"label": "D", "body": "a 2005 analysis—by Anna Behrensmeyer—demonstrated that fossils of thin-shelled organisms"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is subject-modifier placement. This choice makes the noun phrase “Anna
Behrensmeyer” the subject of the sentence and places it immediately after the modifying phrase “a pioneer…fossils.” In doing so, this choice
clearly establishes that Anna Behrensmeyer—and not another noun in the sentence—is a pioneer in the field of taphonomy.
Choice A is incorrect because it results in a dangling modifier. The placement of the noun phrase “fossils of thin-shelled organisms” immediately
after the modifying phrase illogically suggests that the “fossils” are a pioneer in the field of taphonomy. Choice C is incorrect because it results in
a dangling modifier. The placement of the pronoun “it” immediately after the modifying phrase illogically suggests that “it” is a pioneer in the field
of taphonomy. Choice D is incorrect because it results in a dangling modifier. The placement of the noun phrase “a 2005 analysis” immediately
after the modifying phrase illogically suggests that “a 2005 analysis” is a pioneer in the field of taphonomy.$qb$);
select seed_pool_question($qb$CB-e44db0a0$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Because a cycle of lunar phases ______ 29.5 days to complete, it’s possible to observe two full moons in a single month, one at the beginning and
one at the end.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are taking"}, {"label": "B", "body": "have taken"}, {"label": "C", "body": "take"}, {"label": "D", "body": "takes"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is subject-verb agreement. The singular verb "takes" agrees in number with the singular
subject "a cycle of lunar phases."
Choice A is incorrect because the plural verb "are taking" doesn’t agree in number with the singular subject "a cycle of lunar phases." Choice B is
incorrect because the plural verb "have taken" doesn’t agree in number with the singular subject "a cycle of lunar phases." Choice C is incorrect
because the plural verb "take" doesn’t agree in number with the singular subject "a cycle of lunar phases."$qb$);
select seed_pool_question($qb$CB-64a40675$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 1953, a fellow performer tripped on legendary jazz musician Dizzy Gillespie’s trumpet, bending its bell upward. When Gillespie tested the
damaged instrument, he realized that he ______ sound of a bent bell over that of a straight one.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "preferred; the"}, {"label": "B", "body": "preferred the"}, {"label": "C", "body": "preferred, the"}, {"label": "D", "body": "preferred. The"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between a verb and its object. No punctuation is needed between
the verb "preferred" and its object "the sound of a bent bell over that of a straight one." The object helps complete the idea of the verb—in this
case, it explains what type of sound Gillespie preferred—and any punctuation between the two results in an ungrammatical sentence.
Choice A is incorrect because no punctuation is needed between the verb and its object. Choice C is incorrect because no punctuation is needed
between the verb and its object. Choice D is incorrect because no punctuation is needed between the verb and its object.$qb$);
select seed_pool_question($qb$CB-b8e13a74$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Josephine Paddock and Florence Esté were among the 300 artists who exhibited at the 1913 Armory Show, a groundbreaking New York City art
exhibition that introduced modernism to American audiences. Though shocking at the time, an abstract cubist painting exhibited by Marcel
Duchamp—one of several works that received scorn from critics—______ the Western art canon more than a century later.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has entered"}, {"label": "B", "body": "have entered"}, {"label": "C", "body": "were entering"}, {"label": "D", "body": "enter"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is subject-verb agreement. The singular verb "has entered" agrees in number with the
singular subject "an abstract cubist painting."
Choice B is incorrect because the plural verb "have entered" doesn’t agree in number with the singular subject "an abstract cubist painting."
Choice C is incorrect because the plural verb "were entering" doesn’t agree in number with the singular subject "an abstract cubist painting."
Choice D is incorrect because the plural verb "enter" doesn’t agree in number with the singular subject "an abstract cubist painting."$qb$);
select seed_pool_question($qb$CB-265e7f4c$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The Globe Theatre in London is a reconstruction of the famed venue where many of Shakespeare’s plays were first performed. In 1613, a prop
cannon ______ during a performance and ignited the Globe’s thatched roof. No one was hurt, but in two hours the original Globe was gone.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "malfunctions"}, {"label": "B", "body": "will malfunction"}, {"label": "C", "body": "has malfunctioned"}, {"label": "D", "body": "malfunctioned"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of verbs to express tense. In this choice, the past tense verb "malfunctioned"
is consistent with the other past tense verbs ("ignited" and "was") used to describe the destruction of the original Globe Theatre.
Choice A is incorrect because the present tense verb "malfunctions" isn’t consistent with the other past tense verbs used to describe the
destruction of the original Globe Theatre. Choice B is incorrect because the future tense verb "will malfunction" isn’t consistent with the other
past tense verbs used to describe the destruction of the original Globe Theatre. Choice C is incorrect because the present perfect tense verb "has
malfunctioned" isn’t consistent with the other past tense verbs used to describe the destruction of the original Globe Theatre.$qb$);
select seed_pool_question($qb$CB-d222f7d9$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Helical ______ widely understood to confer stability and efficiency in the locomotion of a variety of microscopic organisms—including bacteria,
eukaryotic algae, and ciliates—bestows similar advantages, albeit via different propulsive modes, to larger oceanic macroplanktons, such as
salps.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "swimming, is"}, {"label": "B", "body": "swimming is"}, {"label": "C", "body": "swimming has been"}, {"label": "D", "body": "swimming,"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of punctuation within a sentence. The comma after “swimming” pairs with
the dash after “ciliates” to offset the supplementary element (“widely…ciliates”) that interrupts the main clause of the sentence.
Choice A is incorrect. Adding the verb “is” here creates an ungrammatical sentence structure with two main verbs (“is” and “bestows”) without
appropriate punctuation and/or conjunction. Choice B is incorrect because it fails to offset the supplementary element with appropriate
punctuation. Furthermore, adding the verb “is” here creates an ungrammatical sentence that has two finite verbs (“is” and “bestows”) without
appropriate punctuation and/or conjunction. Choice C is incorrect because it fails to offset the supplementary element with appropriate
punctuation. Furthermore, adding the verb “has been” here creates an ungrammatical sentence that has two finite verbs (“has been” and
“bestows”) without appropriate punctuation and/or conjunction.$qb$);
select seed_pool_question($qb$CB-4b424102$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The Balkan nation of Bosnia and Herzegovina does not have one president but ______ as members of the office of the presidency, one
representing the nation’s Bosniaks, one its Serbs, and one its Croats, these elected officials take turns serving as the office’s chairperson.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "three, known"}, {"label": "B", "body": "three. Known"}, {"label": "C", "body": "three who are known"}, {"label": "D", "body": "three, who are known"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is punctuation use between sentences. In this choice, the period is used correctly to
mark the boundary between one sentence (“The Balkan...three”) and another (“Known...chairperson”). While the supplementary element
(“known...Croats”) could logically be attached to either the first main clause (“The Balkan...three”) or the second main clause (“these
elected...chairperson”), end-of-sentence punctuation is needed to indicate to which sentence the supplementary element belongs.
Choice A is incorrect because it results in a comma splice. In this choice, the first sentence, consisting of a main clause (“The Balkan...three”)
and supplementary element (“known...Croats”), is incorrectly joined with a second main clause (“these elected...chairperson”) using a comma. A
comma can’t be used in this way to join two sentences. Choice C is incorrect because it results in a comma splice. In this choice, the first
sentence, consisting of a main clause (“The Balkan...three”) and a relative clause (“who are...Croats”), is incorrectly joined with a second main
clause (“these elected...chairperson”) using a comma. A comma can’t be used in this way to join two sentences. Additionally, this choice omits
the comma needed after “three” to mark the beginning of the supplementary relative clause (“who are known...Croats”). Choice D is incorrect
because it results in a comma splice. In this choice, the first sentence, consisting of a main clause (“The Balkan...three”) and a supplementary
relative clause (“who are...Croats”), is incorrectly joined with a second main clause (“these elected...chairperson”) using a comma. A comma
can’t be used in this way to join two sentences.$qb$);
select seed_pool_question($qb$CB-96e5da01$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The alga species Chlorella vulgaris is very efficient at making oxygen. For this reason, scientists are currently exploring ways to use this species
in space. C. vulgaris might be used, for example, to build future biological air exchange systems that ______ oxygen for astronauts.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "are producing"}, {"label": "B", "body": "produced"}, {"label": "C", "body": "produce"}, {"label": "D", "body": "have produced"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of verbs to express tense. Simple present tense verbs can be used to
describe actions that tend to occur, including in a hypothetical or future scenario. In this case, the simple present tense verb “produce” indicates
what the air exchange systems might be able to do in the future (produce oxygen for astronauts).
Choice A is incorrect. The present progressive tense verb “are producing” suggests that the oxygen is currently being produced, not that it might
be produced in the future. Choice B is incorrect because the past tense verb “produced” suggests that the oxygen was produced in the past, not
that it might be produced in the future. Choice D is incorrect because the present perfect tense verb “have produced” suggests that the oxygen
has been produced from a point in the past up to the present, not that it might be produced in the future.$qb$);
select seed_pool_question($qb$CB-2c4cd76d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Researchers studying magnetosensation have determined why some soil-dwelling roundworms in the Southern Hemisphere move in the
opposite direction of Earth’s magnetic field when searching for ______ in the Northern Hemisphere, the magnetic field points down, into the
ground, but in the Southern Hemisphere, it points up, toward the surface and away from worms’ food sources.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "food:"}, {"label": "B", "body": "food,"}, {"label": "C", "body": "food while"}, {"label": "D", "body": "food"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is colon use within a sentence. A colon used in this way introduces information that
illustrates or explains information that has come before it. In this case, the colon introduces the following explanation of why some roundworms
in the Southern Hemisphere move in the opposite direction of Earth’s magnetic field.
Choice B is incorrect because it results in a comma splice. A comma can’t be used in this way to join two long independent clauses
(“Researchers…food” and “in…sources”) such as these. Choice C is incorrect because it results in a run-on sentence. The two clauses
(“Researchers…food” and “in…sources”) are fused without punctuation. Furthermore, the conjunction “while” fails to indicate that what follows is
an explanation of why some roundworms in the Southern Hemisphere move in the opposite direction of Earth’s magnetic field. Choice D is
incorrect because it results in a run-on sentence. The two clauses (“Researchers…food” and “in…sources”) are fused without punctuation and/or
a conjunction.$qb$);
select seed_pool_question($qb$CB-12bd5b75$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$With its towering, six-spired exterior of granitelike quartz monzonite, the Salt Lake Temple is one of the most instantly recognizable structures in
the state of Utah. However, many people do not know that ______ built over the course of forty years, with construction beginning in 1853 and
ending in 1893.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "it was"}, {"label": "B", "body": "one was"}, {"label": "C", "body": "they were"}, {"label": "D", "body": "both were"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is pronoun-antecedent agreement. The singular pronoun "it" agrees in number with the
singular antecedent "the Salt Lake Temple."
Choice B is incorrect because the singular pronoun "one" is ambiguous in this context; the resulting sentence leaves unclear whether there is only
one Salt Lake temple or multiple. Choice C is incorrect because the plural pronoun "they" doesn’t agree in number with the singular antecedent
"the Salt Lake Temple." Choice D is incorrect because the plural pronoun "both" doesn’t agree in number with the singular antecedent "the Salt
Lake Temple."$qb$);
select seed_pool_question($qb$CB-3ed5ebb4$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In her analysis of Edith Wharton’s The House of Mirth (1905), scholar Candace Waid observes that the novel depicts the upper classes of New
York society as “consumed by the appetite of a soulless ______ an apt assessment given that The House of Mirth is set during the Gilded Age, a
period marked by rapid industrialization, economic greed, and widening wealth disparities.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "materialism”; and"}, {"label": "B", "body": "materialism” and"}, {"label": "C", "body": "materialism,”"}, {"label": "D", "body": "materialism”"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is punctuation between a main clause and a supplementary noun phrase. This choice
correctly uses a comma to mark the boundary between the main clause (“scholar…materialism”) and the supplementary noun phrase (“an apt
assessment”) that describes Waid’s observation about how The House of Mirth depicts the upper classes of New York society.
Choice A is incorrect because a semicolon and the conjunction “and” can’t be used in this way to mark the boundary between a main clause and
a supplementary noun phrase. Choice B is incorrect. Joining the main clause (“scholar…materialism”) and the following noun phrase with the
conjunction “and” results in a confusing and illogical sentence that suggests that the novel depicts the upper classes of New York society as “an
apt assessment,” which doesn’t make sense in this context. Choice D is incorrect because it fails to mark the boundary between the main clause
and the supplementary noun phrase with appropriate punctuation.$qb$);
select seed_pool_question($qb$CB-67614549$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$After winning the 1860 presidential election, Abraham Lincoln appointed Edward Bates, Salmon P. Chase, and William H. Seward to his cabinet.
Lincoln’s decision was surprising, since each of these men had run against him, but historians have praised it, noting that Lincoln ______ his
rivals’ diverse talents to strengthen his administration.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has leveraged"}, {"label": "B", "body": "is leveraging"}, {"label": "C", "body": "will leverage"}, {"label": "D", "body": "leveraged"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The subject of the verb is “Lincoln,” and the first sentence tells us that we’re talking about something that Abraham
Lincoln did in 1860. So the simple past tense “leveraged” fits the logic of the text.
Choice A is incorrect. This choice creates a tense issue. “Has leveraged” is the present perfect tense, which is used for an action that began in
the past and continues into the present. Lincoln started leveraging his rivals’ talents in 1860—it’s definitely not still happening today. So the
present perfect tense isn’t appropriate. Choice B is incorrect. This choice creates a tense issue. “Is leveraging” is the present tense, but Lincoln
leveraged his rivals’ talents in 1860, so the present tense isn’t appropriate. Choice C is incorrect. This choice creates a tense issue. “Will leverage”
is the future tense, but Lincoln leveraged his rivals’ talents in 1860, so the future tense isn’t appropriate.$qb$);
select seed_pool_question($qb$CB-78b88c04$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Joshua Hinson, director of the language revitalization program of the Chickasaw Nation in Oklahoma, helped produce the world’s first
Indigenous-language instructional app, Chickasaw ______ Chickasaw TV, in 2010; and a Rosetta Stone language course in Chickasaw, in 2015.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "Basic; in 2009, an online television network;"}, {"label": "B", "body": "Basic; in 2009, an online television network,"}, {"label": "C", "body": "Basic, in 2009; an online television network,"}, {"label": "D", "body": "Basic, in 2009, an online television network,"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the punctuation of items in a complex series. It’s conventional to use a semicolon to
separate items in a complex series with internal punctuation, and in this choice, the semicolon after “2009” is conventionally used to separate
the first item (“the world’s…2009”) and the second item (“an online…2010”) in the series of things that Hinson helped create. Further, the comma
after “Basic” correctly pairs with the comma after “app,” and the comma after “network” correctly pairs with the comma after “TV” to set off the
supplemental elements (“Chickasaw Basic” and “Chickasaw TV”) that provide the names of the app and the TV network, respectively. Altogether,
the punctuation in this choice results in a sentence that clearly indicates that Hinson helped make a language app in 2009, an online TV network
in 2010, and a language course in 2015.
Choice A is incorrect because it fails to punctuate the complex series in a way that makes clear that Hinson helped make a language app in
2009, an online TV network in 2010, and a language course in 2015. Choice B is incorrect because it fails to punctuate the complex series in a
way that makes clear that Hinson helped make a language app in 2009, an online TV network in 2010, and a language course in 2015. Choice D
is incorrect because the comma after “2009” doesn’t match the semicolon used to separate the second and third items in the complex series.$qb$);
select seed_pool_question($qb$CB-d1482e27$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$One of the earliest known maps is a Babylonian clay tablet thought to be almost 4,500 years old. The map ______ the area of a plot of land, shows
a river valley, and includes the cardinal directions.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "describes"}, {"label": "B", "body": "describe"}, {"label": "C", "body": "have described"}, {"label": "D", "body": "are describing"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is the best answer. The convention being tested is the use of verb forms within a sentence. The singular verb "describes" agrees in
number with the singular subject "map."
Choice B is incorrect because the plural verb "describe" doesn’t agree in number with the singular subject "map." Choice C is incorrect because
the plural verb "have described" doesn’t agree in number with the singular subject "map." Choice D is incorrect because the plural verb "are
describing" doesn’t agree in number with the singular subject "map."$qb$);
select seed_pool_question($qb$CB-9f0ac61d$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$boundaries$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Dolores Huerta’s advocacy on behalf of farmworkers was rooted in her experience as a schoolteacher in Stockton, California, in the early 1950s.
Hoping to help her students and their families outside the ______ Huerta left teaching to start the Stockton chapter of the Community Service
Organization, a group focused on the needs of local farmworkers.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "classroom."}, {"label": "B", "body": "classroom;"}, {"label": "C", "body": "classroom,"}, {"label": "D", "body": "classroom"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is the best answer. The convention being tested is the use of punctuation within a sentence. This choice correctly uses a comma to
mark the boundary between the introductory participial phrase ("Hoping…classroom") and the main clause ("Huerta…farmworkers").
Choice A is incorrect because it results in a rhetorically unacceptable sentence fragment beginning with "hoping." Choice B is incorrect because a
semicolon can’t be used in this way to mark the boundary between the participial phrase ("Hoping…classroom") and the main clause ("Huerta…
farmworkers"). Choice D is incorrect because it fails to mark the boundary between the participial phrase ("Hoping…classroom") and the main
clause ("Huerta…farmworkers").$qb$);
select seed_pool_question($qb$CB-bd11fe93$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Dr. Rocío Paola Caballero-Gill is a paleoceanographer. This means that Dr. Caballero-Gill doesn’t just study oceans as they are today. She uses
chemistry and fossil evidence ______ oceans as they were in the past.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "has studied"}, {"label": "B", "body": "to study"}, {"label": "C", "body": "studied"}, {"label": "D", "body": "studies"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is the best answer. The convention being tested is the use of verb forms within a sentence. The nonfinite to-infinitive verb “to study” is
correctly used to form a subordinate clause that indicates what Dr. Caballero-Gill uses chemistry and fossil evidence for (to study oceans as they
were in the past).
Choice A is incorrect because it results in an ungrammatical sentence. The finite verb “has studied” can’t be used in this way to form a
subordinate clause that indicates what Dr. Caballero-Gill uses the evidence for. Choice C is incorrect because it results in an ungrammatical
sentence. The finite verb “studied” can’t be used in this way to form a subordinate clause that indicates what Dr. Caballero-Gill uses the evidence
for. Choice D is incorrect because it results in an ungrammatical sentence. The finite verb “studies” can’t be used in this way to form a
subordinate clause that indicates what Dr. Caballero-Gill uses the evidence for.$qb$);
select seed_pool_question($qb$CB-f570cece$qb$, $qb$english$qb$, $qb$standard_english_conventions$qb$, $qb$form_structure_and_sense$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Both Arteaga, in the state of Coahuila, and Lagos de Moreno, in the state of Jalisco, have been designated by Mexico as pueblos mágicos
(magical villages) to celebrate these ______ natural beauty and unique cultural traditions.
Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, null, $qb$[{"label": "A", "body": "town"}, {"label": "B", "body": "town’s"}, {"label": "C", "body": "towns"}, {"label": "D", "body": "towns’"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is the best answer. The convention being tested is the use of possessive nouns. The plural possessive noun “towns’” correctly indicates
that the natural beauty and unique cultural traditions belong to both Arteaga and Lagos de Moreno.
Choice A is incorrect because the context requires the plural possessive noun “towns’,” not the singular noun “town.” Choice B is incorrect
because the context requires the plural possessive noun “towns’,” not the singular possessive noun “town’s.” Choice C is incorrect because the
context requires the plural possessive noun “towns’,” not the plural noun “towns.”$qb$);
