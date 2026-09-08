import { Navigate, Route, Routes, useLocation } from 'react-router-dom'
import { AppLayout } from './components/AppLayout'
import { useAuth } from './context/AuthContext'
import { Dashboard } from './pages/Dashboard'
import { DiagnosticForm } from './pages/DiagnosticForm'
import { Login } from './pages/Login'
import { QuestionNew } from './pages/QuestionNew'
import { ReportEdit } from './pages/ReportEdit'
import { Paper } from './pages/Paper'
import { Questions } from './pages/Questions'
import { SessionNew } from './pages/SessionNew'
import { SessionReport } from './pages/SessionReport'
import { Exam } from './pages/Exam'
import { SessionRoom } from './pages/SessionRoom'
import { Sessions } from './pages/Sessions'
import { Signup } from './pages/Signup'
import { StudentLink } from './pages/StudentLink'

export function App() {
  const { session, profile, loading, isTeacher } = useAuth()

  // The student's link is not a page of the app — it is the app, for whoever
  // holds it. It is matched before anything asks who is signed in, because the
  // answer is "nobody" and that is the whole idea: no gate, no redirect to a
  // login, and no waiting on an auth check that is going to come back empty.
  const { pathname } = useLocation()
  if (pathname.startsWith('/s/')) {
    return (
      <Routes>
        <Route path="/s/:token" element={<StudentLink />} />
      </Routes>
    )
  }

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
      {/* The exam sits outside the shell on purpose: while a paper is open the
          student should see the paper and nothing else. */}
      <Route path="/exam/:id" element={<Exam />} />

      <Route element={<AppLayout />}>
        <Route path="/" element={<Dashboard />} />
        <Route path="/sessions" element={<Sessions />} />
        <Route path="/sessions/:id" element={<SessionRoom />} />
        <Route path="/sessions/:id/report" element={<SessionReport />} />
        {isTeacher && (
          <>
            <Route path="/sessions/new" element={<SessionNew />} />
            <Route path="/questions" element={<Questions />} />
            <Route path="/questions/new" element={<QuestionNew />} />
            <Route path="/questions/:id/edit" element={<QuestionNew />} />
            <Route path="/tests/:id" element={<Paper />} />
            <Route path="/sessions/:id/diagnostic" element={<DiagnosticForm />} />
            <Route path="/sessions/:id/report/edit" element={<ReportEdit />} />
          </>
        )}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Route>
    </Routes>
  )
}
