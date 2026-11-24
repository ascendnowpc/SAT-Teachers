import { dayLabel } from '../lib/bluebook'
import { calendarMonths, type CalendarEvent } from '../lib/calendar'
import { countdownLabel, daysUntil, localToday, type StudentGoal } from '../lib/goal'
import type { StudentTest } from '../lib/studentAccount'
import { studentTestTitle } from '../lib/studentApi'
import { SUBJECT_VIEW } from '../lib/subjectProgress'

const WEEKDAYS = ['M', 'T', 'W', 'T', 'F', 'S', 'S']

/**
 * The student's calendar (the scope's F12): this month to their SAT, with the
 * registration deadline, the test day and the check-ins booked between, and
 * under it each of those with the days to go.
 */
export function GoalCalendar({ goal, tests }: { goal: StudentGoal | null; tests: StudentTest[] }) {
  const today = localToday()
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
      tone: SUBJECT_VIEW[t.subject].tone,
    })
  }
  const months = calendarMonths(today, events)
  const ahead = events.filter((e) => e.day >= today).sort((a, b) => a.day.localeCompare(b.day))

  return (
    <section className="dash-panel goal-calendar" aria-label="Your calendar">
      <div className="dash-panel-head">
        <h2>Calendar</h2>
        {goal?.next_test_on && daysUntil(goal.next_test_on, today) >= 0 && (
          <span className="cal-countdown">
            <b className="num">{daysUntil(goal.next_test_on, today)}</b> days to the SAT
          </span>
        )}
      </div>
      <div className="cal-months">
        {months.map((m) => (
          <div key={m.title} className="cal-month">
            <div className="cal-title">{m.title}</div>
            <table className="cal-grid">
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
                      const test = d.events.find((e) => e.kind === 'test')
                      const cls = [
                        'cal-day',
                        d.today ? 'is-today' : '',
                        d.past ? 'is-past' : '',
                        sat ? 'is-sat' : '',
                        reg ? 'is-reg' : '',
                      ]
                        .filter(Boolean)
                        .join(' ')
                      return (
                        <td key={k}>
                          {d.date !== null && (
                            <span className={cls} title={d.events.map((e) => e.label).join(' · ') || undefined}>
                              {d.date}
                              {test && <i className={`cal-dot tone-${test.tone ?? 'sky'}`} aria-hidden="true" />}
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
      {ahead.length > 0 ? (
        <ul className="cal-list">
          {ahead.slice(0, 5).map((e) => (
            <li key={`${e.kind}/${e.day}/${e.label}`}>
              <span className={`cal-key is-${e.kind}${e.tone ? ` tone-${e.tone}` : ''}`} aria-hidden="true" />
              <span className="cal-list-name">{e.label}</span>
              <span className="cal-list-day">{dayLabel(e.day)}</span>
              <span className="cal-list-left">{countdownLabel(e.day, today)}</span>
            </li>
          ))}
        </ul>
      ) : (
        <p className="dash-empty">Add your SAT date and registration deadline to your goals to see them here.</p>
      )}
    </section>
  )
}
