-- ============================================================================
--  0085 — a question that is a picture says so
--
--  0075–0084 put a picture on 1,194 of College Board's questions, and kept the
--  decoded stem beside it. For 743 of them that is right: the words read
--  cleanly and the picture is a chart or a diagram the words refer to, so the
--  student gets both.
--
--  For the other 451 it is not. Those are the ones the decoder could not read
--  at all — the whole question was cut out as a picture precisely because its
--  own words came out as wreckage — and the wreckage went in beside the
--  picture. A student opening one would be shown
--
--      -(10II123456?890044??669922883355II)/(-/-(?222 -1II ?- 1II 222 ...
--
--  above a perfectly good picture of the question it failed to read.
--
--  So a question whose stem is wreckage and which has a picture now says it
--  is a picture, and nothing else. The picture already carries the question,
--  its figure and its options; the options on those rows are blank bodies
--  under their A, B, C and D labels for the same reason, which is what the
--  student clicks.
--
--  WHAT COUNTS AS WRECKAGE. Two marks, both of them things the decoder writes
--  and prose does not: a pair of question marks together, which is how it
--  records shapes it could not read, and more than four vertical rules, which
--  is a table's edges or a chart's axis ticks rather than absolute value.
--  tools/questionbank/make_migration.py applies the same test, so a re-import
--  writes this directly and does not need correcting afterwards.
--
--  Only the stem is touched. No question's skill, difficulty, key, options,
--  picture or place in a pool changes, and nothing outside the imported bank
--  is looked at.
-- ============================================================================

update questions
   set stem       = 'This question is shown as a picture.',
       updated_at = now()
 where source_ref like 'CB-%'
   and image_url is not null
   and stem <> 'This question is shown as a picture.'
   and (stem like '%??%'
        or (length(stem) - length(replace(stem, '|', ''))) > 4);
