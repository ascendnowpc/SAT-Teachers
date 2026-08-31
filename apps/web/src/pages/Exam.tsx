import { useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { StudentStage } from './StudentStage'

/**
 * The exam, on its own route and outside the app shell.
 *
 * A student sitting a paper should see the paper: no sidebar, no navigation,
 * and — once they start — no browser either. The route exists so that state is
 * a place rather than a mode, and so the shell has nowhere to render.
 *
 * A teacher who lands here is sent to their own view of the same session.
 */
export function Exam() {
  const { id } = useParams<{ id: string }>()
  const { isTeacher } = useAuth()

  if (!id) return <div className="page">Session not found.</div>
  if (isTeacher) {
    window.location.replace(`/sessions/${id}`)
    return null
  }
  return <StudentStage sessionId={id} />
}
