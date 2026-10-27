import { describe, expect, it } from 'vitest'
import { parseExplanation, parsePart, parseSourceStats } from './explanation'

// ENG-PRACTICE-CTC-Q01 and Q02 as 0065 stores them.
const Q01 =
  'Why B is correct: Step 1, read the question direction: "how would the author of Text 2 respond to the research discussed in Text 1?" The question asks how Text 2 would respond to the research in Text 1.\n\n' +
  'Why the others are wrong\n' +
  'A: Text 2 actually agrees that spots are beneficial for adult leopards. Step 1, check for agreement: Text 2 begins by stating that spots are already "valuable as a means of concealing adult leopards" as they hunt.\n' +
  'C: Text 2 does not discuss tigers or compare different types of markings. Step 1, check Text 2\'s focus: Author 2 focuses entirely on leopards.\n' +
  'D: Text 2 never critiques the research methods or dataset size mentioned in Text 1. Step 1, analyze the tone: Author 2 adds a new perspective.'

const Q02_C =
  'Choice C suggests a negative impact from construction that is never mentioned in Text 1. Step 1, analyze the obstacle (key phrase: "absence of existing large buildings"): Text 1 argues that the problem was a lack of existing buildings, not the presence of new ones.'

// ENG-PRACTICE-CTC-Q14, in the College Board's words.
const Q14 =
  'Choice D is the best answer because the author of Text 2 says that some parallels between Venice and Ganvié are "tenuous."\n\n' +
  'Choice A is incorrect because, though political factors are discussed in only one passage, that passage is Text 1, not Text 2. Choice B is incorrect because the author of Text 2 does as well. Choice C is incorrect because the author of Text 1 does not consider that contrast.'

describe('parseExplanation', () => {
  it('reads OnePrep’s shape: the key, its step, and each other choice', () => {
    const e = parseExplanation(Q01)!
    expect(e.correct).toBe('B')
    expect(e.why.lead).toBe('')
    expect(e.why.steps).toHaveLength(1)
    expect(e.why.steps[0]).toMatchObject({
      n: 1,
      label: 'Read the question direction',
      keyPhrase: null,
    })
    expect(e.why.steps[0].text).toMatch(/^"how would the author of Text 2/)
    expect(e.why.steps[0].text).toMatch(/research in Text 1\.$/)

    expect(e.others.map((o) => o.option)).toEqual(['A', 'C', 'D'])
    expect(e.others[0].part.lead).toBe(
      'Text 2 actually agrees that spots are beneficial for adult leopards.',
    )
    expect(e.others[0].part.steps[0].label).toBe('Check for agreement')
    expect(e.others[1].part.steps[0].label).toBe("Check Text 2's focus")
  })

  it('takes the key phrase out of the step’s name', () => {
    const p = parsePart(Q02_C)
    expect(p.lead).toMatch(/never mentioned in Text 1\.$/)
    expect(p.steps[0]).toMatchObject({
      label: 'Analyze the obstacle',
      keyPhrase: 'absence of existing large buildings',
    })
    expect(p.steps[0].text).toMatch(/^Text 1 argues/)
  })

  it('keeps an explanation of the key alone (Q42 has no others)', () => {
    const e = parseExplanation(
      "Why B is correct: Step 1, identify Text 1's focus: Text 1 explains hazards from often-gaseous fluorocarbons.",
    )!
    expect(e.why.steps[0].label).toBe("Identify Text 1's focus")
    expect(e.others).toEqual([])
  })

  it('reads the College Board’s shape', () => {
    const e = parseExplanation(Q14)!
    expect(e.correct).toBe('D')
    expect(e.why.lead).toMatch(/^The author of Text 2 says/)
    expect(e.others.map((o) => o.option)).toEqual(['A', 'B', 'C'])
    expect(e.others[0].part.lead).toMatch(/^Though political factors/)
    expect(e.others[2].part.lead).toBe('The author of Text 1 does not consider that contrast.')
  })

  it('leaves a teacher’s prose alone', () => {
    expect(
      parseExplanation(
        'Text 1 says one narrative style is overrepresented. D reverses Text 2, which wants more inquiry.',
      ),
    ).toBeNull()
    expect(parseExplanation(null)).toBeNull()
    expect(parseExplanation('')).toBeNull()
  })
})

describe('parseSourceStats', () => {
  it('reads OnePrep’s numbers', () => {
    expect(
      parseSourceStats(
        'OnePrep rates this easy: 72% of its users answer it correctly, in 1:17 on average; the middle half of correct answers take 48s to 1:55.',
      ),
    ).toEqual({ source: 'OnePrep', accuracy: 72, average: '1:17', middle: ['48s', '1:55'] })
  })

  it('leaves the teachers’ sentence alone', () => {
    expect(parseSourceStats('Two texts about different subjects on the surface.')).toBeNull()
    expect(parseSourceStats(null)).toBeNull()
  })
})
