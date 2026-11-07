import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'

/**
 * How a student gets in, said wherever a teacher copies their link: the
 * student ID the link asks for (0066), and the PIN that goes with it for the
 * Student sign-in (0067). Staff read the PIN; "New PIN" is for when one has
 * been forgotten or shared — it signs the student out everywhere.
 */
export function StudentIdNote({
  studentId,
  displayId,
}: {
  studentId?: string | null
  displayId?: string | null
}) {
  const [pin, setPin] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!studentId) return
    let active = true
    void supabase
      .from('student_pins')
      .select('pin')
      .eq('student_id', studentId)
      .maybeSingle()
      .then(({ data }) => {
        if (active) setPin((data as { pin: string } | null)?.pin ?? null)
      })
    return () => {
      active = false
    }
  }, [studentId])

  if (!displayId) return null

  async function newPin() {
    if (!studentId) return
    if (!window.confirm('Give this student a new PIN? The old one stops working and they are signed out.')) return
    setBusy(true)
    setError(null)
    const { data, error: err } = await supabase.rpc('reset_student_pin', { p_student: studentId })
    if (err) setError(err.message)
    else setPin(data as string)
    setBusy(false)
  }

  return (
    <div className="link-note">
      <p>
        Student ID <strong className="num">{displayId}</strong>
        {pin && (
          <>
            {' '}· PIN <strong className="num">{pin}</strong>{' '}
            <button type="button" className="link-btn" onClick={() => void newPin()} disabled={busy}>
              {busy ? 'Changing…' : 'New PIN'}
            </button>
          </>
        )}
      </p>
      <p className="link-note-sub">
        The link asks for the ID.{pin && ' Without the link, students sign in on the Student tab with both.'}
      </p>
      {error && <p className="link-note-error">{error}</p>}
    </div>
  )
}
