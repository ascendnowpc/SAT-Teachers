import { useMemo } from 'react'
import { useParams } from 'react-router-dom'
import { linkGateway } from '../lib/gateway'
import { StudentStage } from './StudentStage'

/**
 * The session, opened from the link the teacher sent.
 *
 * No account, no sign-in, no list to find it in: the URL is the whole of the
 * student's app, and it names exactly one session. Everything they can do with
 * it — start, answer, switch level, hand in — goes through the token RPCs,
 * which check the token and then do precisely what the signed-in student's own
 * calls would have done.
 *
 * It sits outside the auth gate in App, so a teacher who happens to be signed
 * in on the same browser still sees the student's screen here. That is the
 * point of the route: it is what the student is looking at.
 */
export function StudentLink() {
  const { token } = useParams<{ token: string }>()
  const gateway = useMemo(() => (token ? linkGateway(token) : null), [token])

  if (!token || !gateway) {
    return (
      <div className="exam-wait">
        <h2>That link is not valid</h2>
        <p>Ask your teacher to send it again.</p>
      </div>
    )
  }

  return <StudentStage gateway={gateway} />
}
