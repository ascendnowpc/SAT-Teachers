import { useMemo } from 'react'
import { useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { accountGateway } from '../lib/gateway'
import { StudentStage } from './StudentStage'

/**
 * The exam, on its own route and outside the app shell.
 *
 * A student sitting a paper should see the paper: no sidebar, no navigation,
 * and — once they start — no browser either. The route exists so that state is
 * a place rather than a mode, and so the shell has nowhere to render.
 *
 * This is the signed-in door. The other one is /s/:token, which is the same
 * screen for a student who has no account — see StudentLink.
 *
 * A teacher who lands here is sent to their own view of the same session.
 */
export function Exam() {
  const { id } = useParams<{ id: string }>()
  const { isTeacher } = useAuth()
  // The gateway is an effect dependency all the way down, so it is made once
  // per session rather than once per render.
  const gateway = useMemo(() => (id ? accountGateway(id) : null), [id])

  if (!id || !gateway) return <div className="page">Session not found.</div>
  if (isTeacher) {
    window.location.replace(`/sessions/${id}`)
    return null
  }
  return <StudentStage gateway={gateway} />
}
