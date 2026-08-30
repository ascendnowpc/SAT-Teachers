# English diagnostic — where the keys came from

Two English papers are loaded into the bank. They needed opposite treatments, and both are
recorded here so a teacher can check the calls rather than take them on trust.

| Paper | Items | Source refs | Migration |
| --- | --- | --- | --- |
| In-class *Reading and Writing – 25Q* | 25 | `ENG-DIAG-INCLASS-Q01` … `Q25` | `0008` |
| *English Diagnostic Test 4* (screenshot deck) | 40 | `ENG-DIAG-T4-M1-Q01` … `M2-Q26` | `0009` |

All 65 are `published`.

---

## 1. The in-class paper: seven printed keys were wrong

The paper carries an answer key at the back. Seven of its answers disagree with their own
passage, so the bank carries the answer the text supports and the explanation says why. This is
the full list of what was changed:

| Item | Paper said | Bank says | Why |
| --- | --- | --- | --- |
| **Q08** — 9 hours vs 5 hours | D · 15 points | **C · 13 points** | The table gives 85 at 9 hours and 72 at 5. 85 − 72 = 13. No reading of the table gives 15. |
| **Q11** — "fragile" most nearly means | C · Precious | **D · Breakable** | "Precious" is what the sentence implies about joy, not a meaning *fragile* carries. A words-in-context answer has to be a sense of the word. |
| **Q15** — most logical transition | C · "Thus, isolation is unavoidable." | **A · "This shows that technology is not inherently harmful."** | The paragraph argues technology connects people; a conclusion that isolation is unavoidable contradicts the sentence before it. |
| **Q17** — revision emphasising positive uses | A · delete "it can also foster connections…" | **C · add "These connections can lead to meaningful social change."** | The stated goal is to *emphasise* the positive. A deletes the only positive claim in the passage. |
| **Q18** — main purpose | C · to claim technology prevents communication | **B · both positive and negative aspects** | The passage states the isolation view and then answers it. C is the view it argues against. |
| **Q20** — affective neuroscience | B · insects expressing feelings | **C · insect mechanisms resemble mammalian ones** | The text reports a shared dopamine-based signalling process and stops short of feelings. Released College Board item; C is the official answer. |
| **Q22** — "______ found that…" | D · "Entomologist Heather Grab," | **C · "Entomologist Heather Grab"** | The blank is the subject of *found*, and nothing separates a subject from its verb. Released College Board item; C is the official answer. |

The other 18 keys matched and went in unchanged.

**Q07 was reworded.** The paper reads "Which evidence from the table supports your answer to
Q6?" Bank items are staged individually and in any order, so a reference to a neighbouring
question number cannot survive; it is stored as "…your answer to the previous question". If the
pair should always be staged together, that is an item-pair feature, not a wording fix.

---

## 2. Test 4: transcribed and keyed from scratch

The deck is 40 Bluebook screenshots with no machine-readable text and no key at all — the two
gaps the [source material audit](source-material-audit.md) flagged as blocking. Both are now
closed for this file:

- **Text.** Every item was read off its screenshot and typed out: passage, stem, four options.
  `tools/pdf_extract.py` split the pages into one image per item; the transcription was done
  against those crops.
- **Keys and explanations.** Written here, since the paper has none. Each explanation names why
  the key is right and why the nearest trap is wrong.
- **Difficulty.** Module 1 Q01–Q08 use the levels the teachers had already commented on the
  source document. Everything else is levelled on the shape of the task, with the reasoning in
  `difficulty_rationale`.

Two items were built on a graphic rather than prose, and the bank is text-only, so both are
transcribed into the passage as text rows — the same shape the in-class paper's sleep table
takes:

| Item | Graphic | Stored as |
| --- | --- | --- |
| M1 Q12 | Bar chart, "Reduction in cavities compared to no tooth care" | three labelled rows (58% / 85% / 95%) |
| M1 Q13 | Five-row table of foreign-born population and share male | the five rows, pipe-separated |

Item numbers inside each module are non-contiguous exactly as printed (Module 1 runs 01–14, then
17, 19, 21, 22, 23, 25; Module 2 starts at 02). The number in each `source_ref` is the paper's,
never a position in the file.

---

## What still needs a teacher

Nothing blocks use of the bank, but two things are ours rather than Ascend Now's and are worth a
pass:

1. **The 40 Test 4 keys**, since no key existed to check them against.
2. **Difficulty on 57 of the 65 items.** It drives the escalate / hold / drop loop directly, so a
   mislevelled item sends the session the wrong way. Every one carries its reasoning in the bank
   under "Why easy / medium / hard", which is the fastest thing to review against.
