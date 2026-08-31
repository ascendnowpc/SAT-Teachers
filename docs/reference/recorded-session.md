# The recorded diagnostic, as seeded data

An hour-long English diagnostic was recorded: a teacher and a student working through a 27-question
Reading & Writing module over Zoom, one question at a time, the student thinking out loud. That
transcript is the best description we have of what this product is for, so it is in the database as
data rather than sitting in a folder as a document.

`supabase/migrations/0012_recorded_session.sql` seeds it: the paper as a reusable pre-test, a
completed session, every answer with the time it took, the teacher's diagnosis on each, her note,
the student's own reasoning, and her closing summary. Open the session and its report is that
session's own numbers.

## What the recording says, and what the report says

The teacher's verbal summary at the end of the hour:

> Strong on the scientific passages and on inference. The misses were the literary ones — main
> idea, central idea — and the grammar, where she is going on what sounds right rather than on a
> rule. Two were rushing rather than not knowing.

The report is computed from the answers alone and lands in the same place:

| Skill | Score |
| --- | --- |
| Central Ideas and Details | 0/2 |
| Command of Evidence — Textual | 1/3 |
| Boundaries | 2/3 |
| Words in Context | 3/3 |
| Inferences | 3/3 |
| everything else | 1/1 each |

Weakest first is the ordering, because that is what the next session works on. The two misses the
teacher called rushing are the two the report tags: one `careless_error` where the student named
the right answer and talked herself out of it, one `misread_question` where she read past a word in
the stem.

## The keys, checked against the teaching

The recording is also the best test the bank has had. Of the 17 seeded questions that appear in it,
**16 keys matched what the teacher taught**. One did not:

**Q06, the Whitman spider poem.** The bank said C — "the speaker's observations of a spider inspire
them to reflect". The teacher works it through with the student and lands on D: main idea means the
central message, the soul seeking connection, and C describes what the poem *does* rather than what
it says. The teaching is the authority; migration `0011` corrects the key and the explanation.

## What is not in it

The module has 27 questions, the recording covers 23, and the bank holds 18 of those. Five (Module 2
Q04, Q10, Q16, Q17, Q19) appear in neither screenshot deck we were given, so they are not in the
bank and not in the session — the seeded session is 18 questions, 13 right. The student got 6 wrong
across the 23 discussed; one of those six is among the five missing, which is why the report shows
five misses rather than six.

Q01 (the hyenas item) is in the bank only because it appears in a screen recording of the session
itself, not in the deck.
