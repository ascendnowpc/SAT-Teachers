import { describe, expect, it } from 'vitest'
import { SENDING_GRACE_MS, choosable, deliveryLine } from './pcs'
import type { Profile, ReportEmail } from './types'

const generated = '2026-08-28T16:00:00Z'
const at = (iso: string, plusMs = 0) => Date.parse(iso) + plusMs

function email(over: Partial<ReportEmail> = {}): ReportEmail {
  return {
    session_id: 's',
    generated_at: generated,
    pc_id: 'p',
    sent_to: 'priya@ascendnow.info',
    status: 'sent',
    detail: null,
    attempts: 1,
    updated_at: '2026-08-28T16:00:07Z',
    ...over,
  }
}

describe('deliveryLine', () => {
  it('says nothing before there is a report', () => {
    expect(deliveryLine(null, null, 'Priya Rao')).toBeNull()
  })

  it('says it went, where, and when', () => {
    expect(deliveryLine(email(), generated, 'Priya Rao', at(generated, 60_000))).toEqual({
      tone: 'ok',
      text: 'Emailed to Priya Rao (priya@ascendnow.info), 28 Aug 2026, 16:00 UTC',
    })
  })

  // The email follows the generation by a few seconds.
  it('is sending while a new generation has no email yet', () => {
    expect(deliveryLine(null, generated, 'Priya Rao', at(generated, 5_000))?.tone).toBe('wait')
    expect(deliveryLine(email({ status: 'sending' }), generated, 'Priya Rao', at(generated, 5_000))?.tone).toBe('wait')
  })

  it('stops saying so once it has had its chance', () => {
    const line = deliveryLine(null, generated, 'Priya Rao', at(generated, SENDING_GRACE_MS + 1))
    expect(line).toEqual({ tone: 'none', text: 'The report has not been emailed to Priya Rao.' })
  })

  // Generated again: the email of the earlier generation is not this one's.
  it('does not count an earlier generation’s email as this one’s', () => {
    const regenerated = '2026-08-28T17:00:00Z'
    expect(deliveryLine(email(), regenerated, 'Priya Rao', at(regenerated, 3_000))?.tone).toBe('wait')
    expect(deliveryLine(email(), regenerated, 'Priya Rao', at(regenerated, SENDING_GRACE_MS * 2))?.tone).toBe('none')
  })

  it('says why it failed or was skipped', () => {
    expect(deliveryLine(email({ status: 'failed', detail: 'the mail server refused the sign-in' }), generated, 'Priya Rao')).toEqual({
      tone: 'bad',
      text: 'Could not email Priya Rao: the mail server refused the sign-in',
    })
    expect(deliveryLine(email({ status: 'skipped', detail: 'this student has no PC to send it to' }), generated, null)).toEqual({
      tone: 'none',
      text: 'Not emailed: this student has no PC to send it to',
    })
  })

  it('reads the microseconds Postgres writes', () => {
    const line = deliveryLine(
      email({ generated_at: '2026-08-28T16:00:00.123456+00:00' }),
      '2026-08-28T16:00:00.123456+00:00',
      'Priya Rao',
    )
    expect(line?.tone).toBe('ok')
  })
})

describe('choosable', () => {
  const pc = (over: Partial<Profile>): Profile => ({
    id: 'p',
    role: 'pc',
    display_id: 'PRIR26-1',
    full_name: 'Priya Rao',
    email: 'priya@ascendnow.info',
    pc: null,
    pc_id: null,
    is_active: true,
    suspended_at: null,
    created_at: '2026-01-01T00:00:00Z',
    ...over,
  })

  it('is an active PC', () => {
    expect(choosable(pc({}))).toBe(true)
    expect(choosable(pc({ is_active: false, suspended_at: '2026-02-01T00:00:00Z' }))).toBe(false)
    expect(choosable(pc({ role: 'teacher' }))).toBe(false)
  })
})
