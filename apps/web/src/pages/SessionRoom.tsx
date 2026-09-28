import { Navigate, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { AdminSession } from './AdminSession'
import { TeacherConsole } from './TeacherConsole'

/**
 * The teacher's room. A student who arrives here — from a link, or from before
 * the exam had its own route — is sent to the exam, which is a page rather
 * than a mode of this one.
 *
 * A PC arrives here too, from the link in a report's email (0055), and gets
 * the session to read: the admin's page, from their seat. The console is the
 * teacher's, with a button on every row.
 */
export function SessionRoom() {
  const { id } = useParams<{ id: string }>()
  const { isTeacher, isPc } = useAuth()

  if (!id) return <div className="page">Session not found.</div>
  if (isPc) return <AdminSession />
  if (!isTeacher) return <Navigate to={`/exam/${id}`} replace />
  return <TeacherConsole sessionId={id} />
}
