import { dayLabel } from '../lib/bluebook'
import { calendarMonths, type CalendarEvent } from '../lib/calendar'
import { countdownLabel, type StudentGoal } from '../lib/goal'
import type { StudentTest } from '../lib/studentAccount'
import { studentTestTitle } from '../lib/studentApi'
import { SUBJECT_VIEW } from '../lib/subjectProgress'

const WEEKDAYS = ['M', 'T', 'W', 'T', 'F', 'S', 'S']

/** The calendar's events: the SAT, its registration deadline, and the check-ins booked before it. */
export function calendarEvents(goal: StudentGoal | null, tests: StudentTest[] = []): CalendarEvent[] {
  const events: CalendarEvent[] = []
  if (goal?.next_test_on) events.push({ day: goal.next_test_on, kind: 'sat', label: 'SAT' })
  if (goal?.registration_deadline_on) {
    events.push({ day: goal.registration_deadline_on, kind: 'registration', label: 'Registration closes' })
  }
  for (const t of tests) {
    if (t.status !== 'scheduled' && t.status !== 'live') continue
    events.push({
      day: t.scheduled_at.slice(0, 10),
      kind: 'test',
      label: `${studentTestTitle(t)} (${SUBJECT_VIEW[t.subject].name})`,
    })
  }
  return events
}

/**
 * The scope's F12, kept small inside "Aiming for" so the blueprint's layout
 * stands: this month to the SAT (at most three), the test day filled, the
 * registration deadline ringed, a dot on each check-in, and under it each of
 * them with the days to go.
 */
export function MiniCalendar({ events, today }: { events: CalendarEvent[]; today: string }) {
  const months = calendarMonths(today, events)
  const ahead = events.filter((e) => e.day >= today).sort((a, b) => a.day.localeCompare(b.day))
  return (
    <div className="mini-cal">
      <div className="mini-cal-months">
        {months.map((m) => (
          <div key={m.title} className="mini-cal-month">
            <div className="mini-cal-title">{m.title}</div>
            <table className="mini-cal-grid">
              <thead>
                <tr>
                  {WEEKDAYS.map((w, i) => (
                    <th key={i} scope="col">
                      {w}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {m.weeks.map((w, i) => (
                  <tr key={i}>
                    {w.map((d, k) => {
                      const sat = d.events.some((e) => e.kind === 'sat')
                      const reg = d.events.some((e) => e.kind === 'registration')
                      const test = d.events.some((e) => e.kind === 'test')
                      const cls = ['mc-day', d.today && 'is-today', d.past && 'is-past', sat && 'is-sat', reg && 'is-reg']
                        .filter(Boolean)
                        .join(' ')
                      return (
                        <td key={k}>
                          {d.date !== null && (
                            <span className={cls} title={d.events.map((e) => e.label).join(' · ') || undefined}>
                              {d.date}
                              {test && <i className="mc-dot" aria-hidden="true" />}
                            </span>
                          )}
                        </td>
                      )
                    })}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        ))}
      </div>
      {ahead.length > 0 && (
        <ul className="mini-cal-list">
          {ahead.slice(0, 5).map((e) => (
            <li key={`${e.kind}/${e.day}/${e.label}`}>
              <span className={`mc-key is-${e.kind}`} aria-hidden="true" />
              <span className="mini-cal-name">{e.label}</span>
              <span className="num">{dayLabel(e.day)}</span>
              <span className="mini-cal-left">{countdownLabel(e.day, today)}</span>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
