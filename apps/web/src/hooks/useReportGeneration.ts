import { useState } from 'react'
import { readRecording } from '../lib/contextExtraction'
import { supabase } from '../lib/supabase'
import type { Session, SessionItem } from '../lib/types'

/**
 * Generating a report, which reads the recording first.
 *
 * Two seats press this button now — the session's teacher on their console,
 * and an admin on the session's page (0048) — and it has to mean the same thing
 * from both, so it is written once. The order is AfterTheTest's, where it came
 * from: read the recording unless the stored reading is of this transcript,
 * then stamp the report; and if the reading fails, say so and offer to go ahead
 * on the form and the answers alone rather than stopping the report behind a
 * model call.
 */
export function useReportGeneration(input: {
  sessionId: string
  session: Session | null
  items: SessionItem[]
  transcriptBody: string
  /** There is a stored reading and it is of the transcript there now. */
  current: boolean
  /** Where the lesson starts in the recording, when somebody has said. */
  offset?: number
  /** Reloads whatever the caller shows, after a reading or a stamp. */
  reload: () => Promise<void>
}) {
  /** What the button is doing, so it can say so rather than just spin. */
  const [stage, setStage] = useState<'idle' | 'reading' | 'generating'>('idle')
  const [error, setError] = useState<string | null>(null)
  /** Set when the reading failed, so the report can go ahead without it. */
  const [readingFailed, setReadingFailed] = useState(false)

  /** The model call. Returns false when it failed, having said why. */
  async function read(): Promise<boolean> {
    setStage('reading')
    try {
      await readRecording({
        sessionId: input.sessionId,
        session: input.session,
        items: input.items,
        transcriptBody: input.transcriptBody,
        offset: input.offset,
      })
      await input.reload()
      setReadingFailed(false)
      return true
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
      setReadingFailed(true)
      return false
    } finally {
      setStage('idle')
    }
  }

  /** Stamps the report. Separated out because it is also the fallback below. */
  async function stamp() {
    setStage('generating')
    const { error: err } = await supabase.rpc('generate_report', { p_session: input.sessionId })
    if (err) setError(err.message)
    await input.reload()
    setStage('idle')
  }

  /**
   * These were two buttons once, and that was the whole misunderstanding:
   * pressing Generate report stamped a timestamp in under a second and never
   * called the model, so a teacher who never happened to press the other button
   * got a report with no reading in it and no way to tell. The reading runs
   * here, first, and only if it fails is there a choice of going ahead without.
   */
  async function generate() {
    setError(null)
    if (!input.current) {
      const ok = await read()
      if (!ok) return
    }
    await stamp()
  }

  /** Explicitly going ahead on the teacher's form and the numbers alone. */
  async function generateWithoutReading() {
    setError(null)
    setReadingFailed(false)
    await stamp()
  }

  return { stage, error, setError, readingFailed, read, generate, generateWithoutReading }
}
