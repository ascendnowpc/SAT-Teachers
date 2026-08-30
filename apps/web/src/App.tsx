import { Navigate, Route, Routes } from 'react-router-dom'
import { AppLayout } from './components/AppLayout'
import { useAuth } from './context/AuthContext'
import { Dashboard } from './pages/Dashboard'
import { Login } from './pages/Login'
import { QuestionNew } from './pages/QuestionNew'
import { Questions } from './pages/Questions'
import { SessionNew } from './pages/SessionNew'
import { SessionRoom } from './pages/SessionRoom'
import { Sessions } from './pages/Sessions'
import { Signup } from './pages/Signup'

export function App() {
  const { session, profile, loading, isTeacher } = useAuth()

  if (loading) return <div className="center-fill">Loading…</div>

  if (!session) {
    return (
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="*" element={<Navigate to="/login" replace />} />
      </Routes>
    )
  }

  // Signed in, but the profile row from the signup trigger has not arrived yet.
  if (!profile) return <div className="center-fill">Setting up your account…</div>

  return (
    <Routes>
      <Route element={<AppLayout />}>
        <Route path="/" element={<Dashboard />} />
        <Route path="/sessions" element={<Sessions />} />
        <Route path="/sessions/:id" element={<SessionRoom />} />
        {isTeacher && (
          <>
            <Route path="/sessions/new" element={<SessionNew />} />
            <Route path="/questions" element={<Questions />} />
            <Route path="/questions/new" element={<QuestionNew />} />
          </>
        )}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Route>
    </Routes>
  )
}
