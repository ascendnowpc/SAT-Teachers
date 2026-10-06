import { Navigate, Route, Routes, useLocation } from 'react-router-dom'
import { AppLayout } from './components/AppLayout'
import { useAuth } from './context/AuthContext'
import { AboutSat } from './pages/AboutSat'
import { Account } from './pages/Account'
import { AdminSession } from './pages/AdminSession'
import { AdminTeacher } from './pages/AdminTeacher'
import { AdminUsers } from './pages/AdminUsers'
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
import { Join } from './pages/Join'
import { SessionRoom } from './pages/SessionRoom'
import { Sessions } from './pages/Sessions'
import { Pending } from './pages/Pending'
import { Signup } from './pages/Signup'
import { StudentLink } from './pages/StudentLink'

export function App() {
  const { session, profile, loading, isTeacher, isAdmin, isPending } = useAuth()

  // The student's link is not a page of the app — it is the app, for whoever
  // holds it. It is matched before anything asks who is signed in, because the
  // answer is "nobody" and that is the whole idea: no gate, no redirect to a
  // login, and no waiting on an auth check that is going to come back empty.
  const location = useLocation()
  if (location.pathname.startsWith('/s/')) {
    return (
      <Routes>
        <Route path="/s/:token" element={<StudentLink />} />
      </Routes>
    )
  }

  // A PC's link to choose a password, for the same reason: whoever opens it
  // cannot sign in yet, and choosing the password is what signs them in.
  if (location.pathname === '/join') return <Join />

  if (loading) return <div className="center-fill">Loading…</div>

  if (!session) {
    return (
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/signup" element={<Signup />} />
        {/* Where they were going comes along, so a link in an email — a PC's
            report, say — lands on the session once they have signed in
            rather than on the dashboard. */}
        <Route path="*" element={<Navigate to="/login" replace state={{ from: location }} />} />
      </Routes>
    )
  }

  // Signed in, but the profile row from the signup trigger has not arrived yet.
  if (!profile) return <div className="center-fill">Setting up your account…</div>

  // A teacher account nobody has approved yet. There is no half-open version of
  // this screen to show them: every policy in the schema asks is_teacher(),
  // which asks is_active, so the app behind this would be empty tables and
  // errors rather than a smaller product.
  if (isPending) return <Pending />

  // Signed in while still on the sign-in page: on to wherever they were going
  // when they were sent to it. The sign-in page asks for the same thing, but
  // this router can win the race to render first, and "/login" is not one of
  // its pages.
  const from = (location.state as { from?: { pathname?: string; search?: string } } | null)?.from
  const onward = from?.pathname && from.pathname !== '/login' ? `${from.pathname}${from.search ?? ''}` : '/'

  return (
    <Routes>
      <Route path="/login" element={<Navigate to={onward} replace />} />

      {/* The exam sits outside the shell on purpose: while a paper is open the
          student should see the paper and nothing else. */}
      <Route path="/exam/:id" element={<Exam />} />

      <Route element={<AppLayout />}>
        <Route path="/" element={<Dashboard />} />
        <Route path="/sessions" element={<Sessions />} />
        <Route path="/sessions/:id" element={<SessionRoom />} />
        <Route path="/sessions/:id/report" element={<SessionReport />} />
        <Route path="/account" element={<Account />} />
        <Route path="/about-sat" element={<AboutSat />} />
        {isAdmin && (
          <>
            <Route path="/admin/users" element={<AdminUsers />} />
            <Route path="/admin/teachers/:id" element={<AdminTeacher />} />
            <Route path="/admin/sessions/:id" element={<AdminSession />} />
            {/* The old overview counted sessions on a page that is not the
                sessions list. Users is where its people half went. */}
            <Route path="/admin" element={<Navigate to="/admin/users" replace />} />
          </>
        )}
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
