# Source Material Audit — `Ascend_Now_English_Diagnostic_Test3.pdf`

Findings from a full programmatic + visual pass over the supplied PDF. This is the ground
truth the content model is designed against.

## Structure

| Property | Value |
| --- | --- |
| Pages | 16 |
| Extractable text | **28 characters total** — literally just `Module 1` (p1) and `Module 2` (p9) |
| Embedded images | **40**, at ~1400–1600 × 500–700 px |
| Layout | 3 question screenshots per page, pages 2–8 and 10–16 |
| Modules | Module 1 = 20 items (p2–p8), Module 2 = 20 items (p10–p16) |

Every question is a **single screenshot of the Bluebook two-panel UI**: stimulus on the left,
question number + stem + options A–D on the right. There is no machine-readable text at all.

## Observed question numbering

Numbers within each module are **non-contiguous** (e.g. Module 1 jumps 23 → 25; Module 2 shows
25, 26). This is a curated selection pulled from full tests, not a complete sequential module.
The implication: **question identity must not be derived from position in a document.** Each
item gets its own stable ID and an optional "source reference" recording where it came from.

## Item types observed (mapped to the official Digital SAT R&W taxonomy)

| Domain | Skill | Seen at |
| --- | --- | --- |
| Craft and Structure | Words in Context | Q01 (`diverse`), Q02 (`catastrophic`), Q03 (`catch`), Q04 (`claim`, in an 1896 poem) |
| Craft and Structure | Text Structure and Purpose | Q05 (main purpose), Q06 (function of underlined portion), Q08 (main purpose) |
| Information and Ideas | Central Ideas and Details | Q06 M2 (main idea of a Whitman poem), Q07 M2 (what is true of a character) |
| Information and Ideas | Command of Evidence — Quantitative | Q13 (**data table** + passage: "which choice best describes data from the table which weakens the conclusion") |
| Information and Ideas | Command of Evidence — Textual | Q14 ("which choice most logically completes the text") |
| Expression of Ideas | Rhetorical Synthesis | Q23, Q25, Q26 (bulleted research notes → "the student wants to emphasise…") |
| Expression of Ideas | Transitions | Q25 M2 (`Therefore` / `Alternatively` / `Nonetheless` / `In contrast`) |
| Standard English Conventions | Boundaries | Q17 (`easy, he` / `easy; because he` …), Q18 (semicolon vs em dash), Q20 (appositive commas) |
| Standard English Conventions | Form, Structure and Sense | Q21 (verb tense/agreement) |

Cross-Text Connections was not present in this file but exists in the real exam — the taxonomy
seeds it anyway.

## Stimulus shapes the renderer must eventually support

1. Plain prose passage
2. Prose with a **fill-in blank** (`The ______ nature of the tracks…`)
3. Prose with an **underlined span** (the question asks about that span specifically)
4. **Poetry** with preserved line breaks (Dickinson, Whitman)
5. **Bulleted research notes** ("While researching a topic, a student has taken the following notes:")
6. **Data table** + prose (Q13 — a 5-row, 3-column table)
7. Attributed literary excerpt with a source line ("The following text is from Emily Brontë's 1847 novel *Wuthering Heights*")

All seven are covered by a typed `stimulus` JSON block; see `docs/02-domain-model.md`.

## Two blocking gaps

These are not code problems. They need a decision from Ascend Now before the bank is usable.

### 1. There is no answer key

The PDF contains no correct answers and no explanations. Screenshots of the Bluebook UI never
show them. **A question is unusable in a live session until someone records the correct
option**, because the whole loop branches on right vs wrong. Someone has to supply keys for
all 40 items (and every item after them).

### 2. There are no difficulty labels

The brief says "their difficulty level is written there", but this file has **zero text**
outside two module headings — so the labels are not in this document. They are either in the
Google Doc wrapper around these screenshots, in the Maths file, or in a separate sheet.

Difficulty is not a nice-to-have here: the entire pedagogical loop is "escalate on solid
correct, hold level on wrong". Without it there is no loop. See
`docs/07-open-questions.md` Q1–Q2.

## Consequence for the content model

The bank must accept **image-backed questions from day one** — retyping thousands of
screenshots before launch would sink the project — while keeping every field the *loop and the
report* depend on (correct option, difficulty, domain, skill) as structured data. That split is
the central content decision, and it is why `render_mode` exists in the schema.
