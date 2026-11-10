import { describe, expect, it } from 'vitest'
import { archivePath, groupSaved, lastRunText, type SavedReport } from './reportArchive'

const saved = (over: Partial<SavedReport>): SavedReport => ({
  id: 'r',
  student_id: 'st1',
  student_name: 'Kira Archive',
  display_id: 'KIRA26-1',
  subject: 'english',
  session_id: 'se1',
  kind: 'report',
  session_at: '2025-09-01T10:00:00Z',
  made_from: '2025-09-02T10:00:00Z',
  title: 'Report',
  path: 'p',
  bytes: 1000,
  archived_at: '2026-11-09T03:17:00Z',
  ...over,
})

describe('archivePath', () => {
  it('files a report by student, session and generation', () => {
    expect(archivePath('st1', 'se1', '2025-09-02T10:00:00.123456+00:00')).toBe(
      'st1/se1/2025-09-02T10-00-00-123Z.pdf',
    )
  })

  it('gives a report generated again a file of its own', () => {
    expect(archivePath('st1', 'se1', '2025-09-02T10:00:00Z')).not.toBe(
      archivePath('st1', 'se1', '2025-09-03T10:00:00Z'),
    )
  })
})

describe('groupSaved', () => {
  it('gathers each student’s reports, oldest session first, the most recently saved student first', () => {
    const groups = groupSaved([
      saved({ id: 'a', session_at: '2025-10-01T10:00:00Z' }),
      saved({ id: 'b', session_at: '2025-09-01T10:00:00Z' }),
      saved({
        id: 'c',
        student_id: 'st2',
        student_name: 'Bram Archive',
        archived_at: '2026-11-10T03:17:00Z',
      }),
    ])
    expect(groups.map((g) => g.student_name)).toEqual(['Bram Archive', 'Kira Archive'])
    expect(groups[1].reports.map((r) => r.id)).toEqual(['b', 'a'])
  })

  it('puts two generations of one report side by side, the earlier first', () => {
    const [g] = groupSaved([
      saved({ id: 'new', made_from: '2025-09-05T10:00:00Z' }),
      saved({ id: 'old', made_from: '2025-09-02T10:00:00Z' }),
    ])
    expect(g.reports.map((r) => r.id)).toEqual(['old', 'new'])
  })
})

describe('lastRunText', () => {
  const at = '2026-11-09T03:17:00Z'

  it('says it has not run, or ran while off', () => {
    expect(lastRunText(null, null)).toBe('It has not run yet.')
    expect(lastRunText(at, { ran: false, reason: 'off' })).toBe(
      'Last run 9 Nov 2026, 03:17 UTC: off, nothing deleted.',
    )
  })

  it('counts what it deleted', () => {
    expect(lastRunText(at, { ran: true, students: 2, transcripts: 1, waiting: 0 })).toBe(
      'Last run 9 Nov 2026, 03:17 UTC: 2 students and 1 recording deleted.',
    )
  })

  it('says what it held back until the reports are saved, and whether they were sent for saving', () => {
    expect(
      lastRunText(at, { ran: true, students: 0, transcripts: 0, held: 1, waiting: 4, queued: true }),
    ).toBe(
      'Last run 9 Nov 2026, 03:17 UTC: 0 students and 0 recordings deleted. 1 student held until 4 reports are saved — saving them now.',
    )
    expect(lastRunText(at, { ran: true, held: 0, waiting: 1, queued: false })).toContain(
      'Recordings held until 1 report is saved — they could not be sent for saving',
    )
  })
})
