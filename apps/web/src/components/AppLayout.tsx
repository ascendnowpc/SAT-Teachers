import { NavLink, Outlet } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { Logo } from './Logo'
import { IconCalendar, IconHome, IconLogout, IconStack } from './icons'

function initials(name: string, fallback: string): string {
  const parts = name.trim().split(/\s+/).filter(Boolean)
  if (parts.length === 0) return fallback.slice(0, 2).toUpperCase()
  return parts.slice(0, 2).map((p) => p[0]!.toUpperCase()).join('')
}

export function AppLayout() {
  const { profile, isTeacher, signOut } = useAuth()
  if (!profile) return null

  const cls = ({ isActive }: { isActive: boolean }) => (isActive ? 'active' : '')

  return (
    <div className="shell">
      <aside className="side">
        <div className="side-inner">
          <Logo onDark />

          <nav>
            <NavLink to="/" end className={cls}>
              <IconHome /> Dashboard
            </NavLink>
            <NavLink to="/sessions" className={cls}>
              <IconCalendar /> Sessions
            </NavLink>
            {/* The three tests are the first thing Questions opens on, so a
                second nav item for them would point at the same list. */}
            {isTeacher && (
              <NavLink to="/questions" className={cls}>
                <IconStack /> Questions
              </NavLink>
            )}
          </nav>

          <div className="spring" />

          <div className="side-user">
            <span className="avatar">{initials(profile.full_name, profile.display_id)}</span>
            <span className="meta">
              <span className="name">{profile.full_name || 'Unnamed'}</span>
              <span className="id">{profile.display_id}</span>
            </span>
          <button type="button" onClick={() => void signOut()} aria-label="Sign out" title="Sign out">
            <IconLogout />
          </button>
          </div>
        </div>
      </aside>

      <main className="main">
        <Outlet />
      </main>
    </div>
  )
}
