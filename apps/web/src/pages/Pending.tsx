import { AuthLayout } from '../components/AuthLayout'
import { Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'

/**
 * A teacher account that has not been approved yet.
 *
 * Signup is open to anybody with an email address, and a teacher account reads
 * every answer key in the bank, every student's name and PC, and the house
 * content everyone else's sessions are built from. 0044 writes a new teacher
 * inactive for exactly that reason, so this is the screen between creating an
 * account and being let into one.
 *
 * It is a whole screen rather than a banner over an empty app because there is
 * no smaller version of the product to show: every policy in the schema asks
 * is_teacher(), is_teacher() asks is_active, and the app behind this would be
 * blank tables and errors that say nothing about why.
 *
 * Only a PENDING account reaches this screen. An account an admin has taken
 * away is banned at the auth server (0045), so it never gets a session to show
 * anything to — it is stopped at the sign-in form instead.
 */
export function Pending() {
  const { profile, signOut } = useAuth()

  return (
    <AuthLayout
      title="Your account is waiting for approval"
      subtitle="An admin at Ascend Now has to let a teacher account in before it can see any sessions."
      footer={
        <button type="button" className="btn btn-ghost btn-sm" onClick={() => void signOut()}>
          Sign out
        </button>
      }
    >
      <Notice kind="info">
        Nothing else is needed from you. Tell whoever runs the platform that{' '}
        <strong>{profile?.full_name || profile?.email}</strong> is waiting — a new account sits at
        the top of their overview — and sign in again once they say it is done.
      </Notice>
      {profile && (
        <p className="sub" style={{ marginTop: 14 }}>
          Your id is <strong className="num">{profile.display_id}</strong>.
        </p>
      )}
    </AuthLayout>
  )
}
