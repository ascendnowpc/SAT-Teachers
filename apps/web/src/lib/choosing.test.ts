import { describe, expect, it } from 'vitest'
import {
  choosable,
  nextUp,
  placeOf,
  standings,
  toLevelTests,
  type LevelTest,
  type LevelTestRow,
} from './choosing'
import type { ItemStatus, Question } from './types'

function item(id: string, question: string, status: ItemStatus, sequence: number) {
  return { id, question_id: question, status, sequence_no: sequence }
}

function question(id: string): Question {
  return {
    id,
    created_by: null,
    subject: 'english',
    section: null,
    skill: null,
    passage: null,
    passage_underline: null,
    image_url: null,
    source_ref: null,
    stem: `Stem ${id}`,
    difficulty: 'easy',
    difficulty_rationale: null,
    target_seconds: null,
    status: 'published',
    created_at: '2026-09-01T00:00:00Z',
    question_options: [],
    question_keys: null,
  }
}

describe('nextUp', () => {
  it('is the lowest staged sequence number', () => {
    const items = [
      item('a', 'qa', 'answered', 1),
      item('b', 'qb', 'published', 2),
      item('d', 'qd', 'staged', 4),
      item('c', 'qc', 'staged', 3),
    ]
    expect(nextUp(items)?.id).toBe('c')
  })

  // A chosen question heads the queue it was built from, and the questions
  // before it in the test come last — so "next" is by sequence, never by the
  // question's place in the test.
  it('follows the queue, not the test order', () => {
    const items = [item('m7', 'q-m7', 'staged', 21), item('m1', 'q-m1', 'staged', 35)]
    expect(nextUp(items)?.id).toBe('m7')
  })

  it('is nothing when the queue has run out', () => {
    expect(nextUp([item('a', 'qa', 'answered', 1), item('b', 'qb', 'voided', 2)])).toBeNull()
  })
})

describe('standings', () => {
  const items = [
    item('a', 'qa', 'answered', 1),
    item('r', 'qr', 'revealed', 2),
    item('v', 'qv', 'voided', 3),
    item('p', 'qp', 'published', 4),
    item('s1', 'qs1', 'staged', 5),
    item('s2', 'qs2', 'staged', 6),
  ]
  const map = standings(items)

  it('says what happened to each question', () => {
    expect(map.get('qa')).toBe('answered')
    expect(map.get('qr')).toBe('answered')
    expect(map.get('qv')).toBe('set_aside')
    expect(map.get('qp')).toBe('on_screen')
  })

  it('marks the head of the queue as next, and the rest as free', () => {
    expect(map.get('qs1')).toBe('next')
    expect(map.get('qs2')).toBe('free')
  })

  it('leaves a question with no row out, which callers read as free', () => {
    expect(map.has('q-never-loaded')).toBe(false)
  })

  // Only a session from before the level tests can hold a question twice, and
  // the row that was in front of the student is the one that counts.
  it('lets the row that was asked speak for a question held twice', () => {
    const twice = standings([item('x1', 'qx', 'staged', 9), item('x2', 'qx', 'answered', 1)])
    expect(twice.get('qx')).toBe('answered')
  })
})

describe('choosable', () => {
  it('is anything that has not been in front of the student', () => {
    expect(choosable('next')).toBe(true)
    expect(choosable('free')).toBe(true)
    expect(choosable('answered')).toBe(false)
    expect(choosable('on_screen')).toBe(false)
    expect(choosable('set_aside')).toBe(false)
  })
})

describe('toLevelTests', () => {
  const rows: LevelTestRow[] = [
    {
      id: 'set-hard',
      level: 'hard',
      title: 'English — Hard',
      question_set_items: [{ position: 1, questions: question('h1') }],
    },
    {
      id: 'set-easy',
      level: 'easy',
      title: 'English — Easy',
      question_set_items: [
        { position: 3, questions: question('e3') },
        { position: 1, questions: question('e1') },
        { position: 2, questions: question('e2') },
      ],
    },
    { id: 'set-paper', level: null, title: 'A source paper', question_set_items: [] },
  ]
  const tests = toLevelTests(rows)

  it('puts the tests easiest first and leaves out anything that is not one', () => {
    expect(tests.map((t) => t.level)).toEqual(['easy', 'hard'])
  })

  it('orders each test by its own positions', () => {
    expect(tests[0].questions.map((q) => q.id)).toEqual(['e1', 'e2', 'e3'])
  })

  // The printed test drops a question that did not come back and numbers the
  // rest, so this has to as well or the two screens disagree about "easy 3".
  it('drops a row whose question did not come back, as the printed test does', () => {
    const gap = toLevelTests([
      {
        id: 's',
        level: 'medium',
        title: 'M',
        question_set_items: [
          { position: 1, questions: question('m1') },
          { position: 2, questions: null },
          { position: 3, questions: question('m3') },
        ],
      },
    ])
    expect(gap[0].questions.map((q) => q.id)).toEqual(['m1', 'm3'])
  })
})

describe('placeOf', () => {
  const tests: LevelTest[] = [
    { id: 'e', level: 'easy', title: 'Easy', questions: [question('e1'), question('e2')] },
    { id: 'm', level: 'medium', title: 'Medium', questions: [question('m1'), question('m2')] },
  ]

  it('is the test and the number the test gives it', () => {
    expect(placeOf(tests, 'm2')).toEqual({ level: 'medium', number: 2 })
    expect(placeOf(tests, 'e1')).toEqual({ level: 'easy', number: 1 })
  })

  it('is nothing for a question no test holds', () => {
    expect(placeOf(tests, 'retired')).toBeNull()
  })
})
