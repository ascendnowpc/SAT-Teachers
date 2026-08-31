import { Navigate, Route, Routes } from 'react-router-dom'
import { AppLayout } from './components/AppLayout'
import { useAuth } from './context/AuthContext'
import { Dashboard } from './pages/Dashboard'
import { Login } from './pages/Login'
import { QuestionNew } from './pages/QuestionNew'
import { QuestionSetEdit } from './pages/QuestionSetEdit'
import { ReportEdit } from './pages/ReportEdit'
import { QuestionSets } from './pages/QuestionSets'
import { Paper } from './pages/Paper'
import { Questions } from './pages/Questions'
import { SessionNew } from './pages/SessionNew'
import { SessionPaper } from './pages/SessionPaper'
import { SessionReport } from './pages/SessionReport'
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
        <Route path="/sessions/:id/report" element={<SessionReport />} />
        {isTeacher && (
          <>
            <Route path="/sessions/new" element={<SessionNew />} />
            <Route path="/sessions/:id/paper" element={<SessionPaper />} />
            <Route path="/questions" element={<Questions />} />
            <Route path="/questions/new" element={<QuestionNew />} />
            <Route path="/questions/papers/:id" element={<Paper />} />
            <Route path="/pretests" element={<QuestionSets />} />
            <Route path="/pretests/new" element={<QuestionSetEdit />} />
            <Route path="/pretests/:id/edit" element={<QuestionSetEdit />} />
            <Route path="/sessions/:id/report/edit" element={<ReportEdit />} />
          </>
        )}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Route>
    </Routes>
  )
}
