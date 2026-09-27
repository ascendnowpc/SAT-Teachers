import { useEffect, useState } from 'react'
import { toLevelTests, type LevelTest, type LevelTestRow } from '../lib/choosing'
import { rows, supabase } from '../lib/supabase'
import type { Subject } from '../lib/types'

/**
 * The three tests for a subject, loaded once, for choosing the next question.
 *
 * Once per console rather than per opening of the picker: they do not change
 * during a lesson, and the console needs them anyway to say which test and
 * which number the next question is. The key is not asked for — choosing a
 * question is not grading it, and a key on the teacher's screen while they talk
 * a student through the next one is a key read out by accident.
 *
 * Null subject loads nothing, which is how a finished session opts out.
 */
export function useLevelTests(subject: Subject | null) {
  const [tests, setTests] = useState<LevelTest[]>([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!subject) return
    let gone = false
    setLoading(true)

    void (async () => {
      const { data, error: err } = await supabase
        .from('question_sets')
        .select('id, level, title, question_set_items(position, questions(*, question_options(*)))')
        .eq('subject', subject)
        .eq('is_active', true)
        .not('level', 'is', null)
      if (gone) return
      if (err) setError(err.message)
      else {
        setError(null)
        setTests(toLevelTests(rows<LevelTestRow>(data)))
      }
      setLoading(false)
    })()

    return () => {
      gone = true
    }
  }, [subject])

  return { tests, loading, error }
}
