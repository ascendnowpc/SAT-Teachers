import { NavLink, Outlet } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { Logo } from './Logo'

function initials(name: string, fallback: string): string {
  const parts = name.trim().split(/\s+/).filter(Boolean)
  if (parts.length === 0) return fallback.slice(0, 2).toUpperCase()
  return parts.slice(0, 2).map((p) => p[0]!.toUpperCase()).join('')
}

export function AppLayout() {
  const { profile, isTeacher, signOut } = useAuth()
  if (!profile) return null

  return (
    <div className="shell">
      <header className="topbar">
        <Logo />
        <nav>
          <NavLink to="/" end className={({ isActive }) => (isActive ? 'active' : '')}>
            Dashboard
          </NavLink>
          {isTeacher && (
            <NavLink to="/questions" className={({ isActive }) => (isActive ? 'active' : '')}>
              Questions
            </NavLink>
          )}
        </nav>
        <div className="spacer" />
        <div className="who">
          <span className="avatar">{initials(profile.full_name, profile.display_id)}</span>
          <span className="meta">
            <span className="name">{profile.full_name || 'Unnamed'}</span>
            <br />
            <span className="id">{profile.display_id}</span>
          </span>
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => void signOut()}>
            Sign out
          </button>
        </div>
      </header>

      <div className="page">
        <Outlet />
      </div>
    </div>
  )
}
