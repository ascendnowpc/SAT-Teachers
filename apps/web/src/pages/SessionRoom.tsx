import { useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { StudentStage } from './StudentStage'
import { TeacherConsole } from './TeacherConsole'

/** One URL, two very different rooms. RLS decides what either can actually read. */
export function SessionRoom() {
  const { id } = useParams<{ id: string }>()
  const { isTeacher } = useAuth()

  if (!id) return <div className="page">Session not found.</div>
  return isTeacher ? <TeacherConsole sessionId={id} /> : <StudentStage sessionId={id} />
}
