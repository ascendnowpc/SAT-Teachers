import type { ReactNode } from 'react'
import { NavLink, useNavigate } from 'react-router-dom'
import { storeStudentKey, storedStudentKey } from '../lib/studentAccount'
import { studentSignOut } from '../lib/studentApi'
import { Logo } from './Logo'

/**
 * The frame of every page in a student's own account (0067, 0070, 0098): the
 * bar with who is signed in, and the three places a student or a parent goes —
 * the tests, every report the teachers have written, the progress card, and
 * their settings.
 */
export function StudentShell({
  student,
  actions,
  children,
}: {
  student?: { full_name: string; display_id: string } | null
  /** Buttons for this page alone — Print, say — beside Sign out. */
  actions?: ReactNode
  children: ReactNode
}) {
  const navigate = useNavigate()

  async function signOut() {
    const key = storedStudentKey()
    if (key) await studentSignOut(key)
    storeStudentKey(null)
    navigate('/login?as=student', { replace: true })
  }

  return (
    <div className="student-home">
      <header className="student-bar no-print">
        <Logo />
        <nav className="student-nav" aria-label="Your account">
          <NavLink to="/student" end className={({ isActive }) => `student-nav-link${isActive ? ' on' : ''}`}>
            My tests
          </NavLink>
          <NavLink to="/student/reports" className={({ isActive }) => `student-nav-link${isActive ? ' on' : ''}`}>
            Reports
          </NavLink>
          <NavLink to="/student/report" end className={({ isActive }) => `student-nav-link${isActive ? ' on' : ''}`}>
            Progress
          </NavLink>
          <NavLink to="/student/settings" end className={({ isActive }) => `student-nav-link${isActive ? ' on' : ''}`}>
            Settings
          </NavLink>
        </nav>
        <div className="student-bar-who">
          {student && (
            <span className="student-chip">
              <span className="student-avatar" aria-hidden="true">
                {initials(student.full_name)}
              </span>
              <span className="student-chip-name">{student.full_name}</span>
              <span className="student-chip-id num">{student.display_id}</span>
            </span>
          )}
          {actions}
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => void signOut()}>
            Sign out
          </button>
        </div>
      </header>
      {children}
    </div>
  )
}

/** Up to two letters, for the chip in the bar. */
export function initials(name: string): string {
  const parts = name.trim().split(/\s+/).filter(Boolean)
  if (parts.length === 0) return '?'
  const letters = parts.length === 1 ? parts[0].slice(0, 2) : parts[0][0] + parts[parts.length - 1][0]
  return letters.toUpperCase()
}
