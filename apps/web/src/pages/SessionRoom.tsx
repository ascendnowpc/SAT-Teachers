import { Navigate, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { TeacherConsole } from './TeacherConsole'

/**
 * The teacher's room. A student who arrives here — from a link, or from before
 * the exam had its own route — is sent to the exam, which is a page rather
 * than a mode of this one.
 */
export function SessionRoom() {
  const { id } = useParams<{ id: string }>()
  const { isTeacher } = useAuth()

  if (!id) return <div className="page">Session not found.</div>
  if (!isTeacher) return <Navigate to={`/exam/${id}`} replace />
  return <TeacherConsole sessionId={id} />
}
