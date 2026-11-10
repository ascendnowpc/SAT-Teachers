import { useEffect, useMemo, useState } from 'react'
import { Link, Navigate, useParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { ReportDocView } from '../components/ReportDocView'
import { StudentShell } from '../components/StudentShell'
import { Notice } from '../components/ui'
import { storeStudentKey, storedStudentKey } from '../lib/studentAccount'
import { loadStudentSessionReport } from '../lib/studentApi'
import { docFromBundle, forTheFamily, type StudentReportBundle } from '../lib/studentReports'

/**
 * One report, in the student's own account (0098): the report the PC is sent,
 * drawn from the same rows by the same function, to read on screen or save as
 * a PDF from the browser.
 */
export function StudentReportView() {
  const { id = '' } = useParams()
  const [key] = useState(() => storedStudentKey())
  const [bundle, setBundle] = useState<StudentReportBundle | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [signedOut, setSignedOut] = useState(false)

  useEffect(() => {
    if (!key || !id) return
    let active = true
    setBundle(null)
    setError(null)
    loadStudentSessionReport(key, id)
      .then((b) => active && setBundle(b))
      .catch((err: unknown) => {
        if (!active) return
        const message = err instanceof Error ? err.message : 'Could not load the report.'
        if (/signed out/i.test(message)) {
          storeStudentKey(null)
          setSignedOut(true)
        } else if (/no such report/i.test(message)) {
          setError('This report is not available. It may not have been written yet.')
        } else setError(message)
      })
    return () => {
      active = false
    }
  }, [key, id])

  const doc = useMemo(() => {
    if (!bundle) return null
    try {
      return forTheFamily(docFromBundle(bundle))
    } catch (e) {
      return e instanceof Error ? e : new Error(String(e))
    }
  }, [bundle])

  // The browser names a saved PDF after the page's title.
  useEffect(() => {
    if (!doc || doc instanceof Error) return
    const before = document.title
    document.title = doc.filename
    return () => {
      document.title = before
    }
  }, [doc])

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  const student = bundle?.session.student
  return (
    <StudentShell
      student={student?.full_name && student.display_id ? { full_name: student.full_name, display_id: student.display_id } : null}
      actions={
        doc && !(doc instanceof Error) ? (
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => window.print()}>
            Save as PDF
          </button>
        ) : null
      }
    >
      <main className="student-main student-report-main">
        <Link className="back-link no-print" to="/student/reports">
          <IconBack /> All reports
        </Link>

        {error && <Notice kind="error">{error}</Notice>}
        {doc instanceof Error && <Notice kind="error">The report could not be drawn: {doc.message}</Notice>}
        {!bundle && !error && <p className="muted">Loading…</p>}

        {doc && !(doc instanceof Error) && <ReportDocView doc={doc} />}
      </main>
    </StudentShell>
  )
}
