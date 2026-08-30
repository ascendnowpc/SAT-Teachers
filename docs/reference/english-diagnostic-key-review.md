# English diagnostic — items held back for a key ruling

The in-class paper *SAT Diagnostic Test (Reading and Writing – 25Q)* is loaded into the bank by
`supabase/migrations/0008_english_diagnostic_bank.sql`, keys included, as `ENG-DIAG-INCLASS-Q01`
… `Q25`.

**Eighteen items are `published` and usable in a live session. Seven are `draft`**, because the
supplied key disagrees with the passage. Draft items do not appear in the session picker, so a
disputed answer cannot reach a student.

Nothing here has been silently corrected. The key in the database is the key from the paper; the
column below is what the passage supports. A teacher rules on each one, edits the key if they
agree, and flips the item to `published`.

| Item | Supplied key | What the text supports | Why |
| --- | --- | --- | --- |
| **Q08** — 9 hours vs 5 hours | D · 15 points | **C · 13 points** | The table gives 85 at 9 hours and 72 at 5. 85 − 72 = 13. There is no reading of the table that gives 15. |
| **Q11** — "fragile" most nearly means | C · Precious | **D · Breakable** (or A · Weak) | "Precious" is not a sense of *fragile*; it is what the sentence implies about joy, not what the word means. A words-in-context item has to resolve to a meaning the word actually carries. |
| **Q15** — most logical transition | C · "Thus, isolation is unavoidable." | **A · "This shows that technology is not inherently harmful."** | The paragraph argues technology connects people. A conclusion that isolation is unavoidable contradicts the sentence before it. |
| **Q17** — revision emphasising positive uses | A · Delete "it can also foster connections across the globe" | **C · Add "These connections can lead to meaningful social change."** | The stated goal is to *emphasise* the positive. A deletes the only positive claim in the passage. |
| **Q18** — main purpose | C · To claim technology prevents communication | **B · To show technology has both positive and negative aspects** | The passage names the isolation view and then answers it. C states the view the passage argues against. |
| **Q20** — affective neuroscience, main purpose | B · insects expressing feelings | **C · a finding that insect brain mechanisms resemble mammalian ones** | The text reports a dopamine-based signalling process shared with mammals. It never claims bees express feelings — that is the inference the passage stops short of. (This is a released College Board item; C is the official answer.) |
| **Q22** — "______ found that…" | D · "Entomologist Heather Grab," | **C · "Entomologist Heather Grab"** | The blank is the subject of *found*. A comma between a subject and its verb is the error the item is testing. (Released College Board item; C is the official answer.) |

## Two smaller notes

**Q07 was reworded.** On the paper it reads "Which evidence from the table supports your answer
to Q6?" Bank items are staged individually and in any order, so a reference to a neighbouring
question number cannot survive. It is stored as "Which evidence supports your answer to the
previous question?" — if the pair should always be staged together, that is a sequencing feature
(an item pair), not a wording fix.

**Difficulty is ours, not the paper's.** The paper carries no difficulty labels. Each item was
levelled on the shape of the task — how many options survive a first pass, whether the answer is
stated or inferred, whether two options are defensible — and the reasoning is stored per item in
`difficulty_rationale`, which the bank shows as "Why medium". These are a starting point for the
teachers to correct, and they are exactly what the escalate/hold/drop loop runs on, so they are
worth a review pass.
