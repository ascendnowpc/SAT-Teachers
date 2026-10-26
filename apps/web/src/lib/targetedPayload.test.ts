import { describe, expect, it } from 'vitest'
import { fromTargeted, type TargetedPayload } from './targetedPayload'

const payload: TargetedPayload = {
  server_now: '2026-10-23T10:00:30Z',
  session: {
    id: 's1',
    mode: 'targeted',
    status: 'live',
    subject: 'english',
    title: 'Transitions',
    scheduled_at: '2026-10-23T09:59:00Z',
    opened_early_at: null,
    started_at: '2026-10-23T10:00:00Z',
    ended_at: null,
    student: { full_name: 'Tom Linked', display_id: 'TOML26-9' },
    teacher: { full_name: 'Malya Rao' },
  },
  targeted: { question_count: 5, overall_seconds: 600, deadline: '2026-10-23T10:10:00Z' },
  items: [
    {
      id: 'i1',
      sequence_no: 1,
      status: 'published',
      first_viewed_at: '2026-10-23T10:00:00Z',
      time_limit_seconds: 60,
      answered_at: null,
      decided_at: null,
      selected_option: null,
      eliminated_options: [],
      student_confidence: null,
      revealed_result: null,
      revealed_correct_option: null,
      revealed_explanation: null,
      question: {
        id: 'q1',
        subject: 'english',
        passage: 'A passage.',
        passage_underline: null,
        stem: 'Which choice?',
        image_url: null,
        options: [
          { label: 'B', body: 'two' },
          { label: 'A', body: 'one' },
        ],
      },
    },
  ],
}

describe('fromTargeted', () => {
  const out = fromTargeted(payload)

  it('reads the session as a targeted one, with the count and the clock', () => {
    expect(out.session.mode).toBe('targeted')
    expect(out.session.question_count).toBe(5)
    expect(out.targeted).toEqual({
      question_count: 5,
      overall_seconds: 600,
      deadline: '2026-10-23T10:10:00Z',
      server_now: '2026-10-23T10:00:30Z',
    })
  })

  it('puts the question where the screen reads it, with its options and no key', () => {
    const q = out.items[0].questions
    expect(q?.stem).toBe('Which choice?')
    expect(q?.question_options.map((o) => o.label).sort()).toEqual(['A', 'B'])
    expect(q?.question_keys).toBeNull()
    expect(out.items[0].time_limit_seconds).toBe(60)
    expect(out.items[0].first_viewed_at).toBe('2026-10-23T10:00:00Z')
  })
})
