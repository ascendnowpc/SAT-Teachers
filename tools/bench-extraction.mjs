#!/usr/bin/env node
/**
 * Reading a transcript without a database, to see what actually comes back.
 *
 * The guard in extraction.ts is already a scorer: it drops any claim whose quote
 * is not verbatim, and verbatim quoting under a deep schema is the capability
 * this feature lives or dies on — a model that paraphrases when asked to quote
 * produces a report with nothing in it. So the drop rate is not a proxy for
 * quality here, it is the thing itself.
 *
 *   GEMINI_API_KEY=… node tools/bench-extraction.mjs path/to/transcript.txt 23
 *
 * Use it to check a prompt change against a real recording before deploying it,
 * and to see what a new model id does. Each run costs one call — roughly 25k
 * input tokens for an hour-long lesson.
 *
 * WHAT THIS DOES NOT TELL YOU
 *
 * A low drop rate means the model quoted honestly. It does not mean it read the
 * lesson well: two safe claims score better than eight good ones with a fumbled
 * quote. So `kept` is printed beside the rate, and neither number replaces a
 * teacher reading the output. With two transcripts this is a smoke test, not an
 * eval.
 */

import { readFileSync } from 'node:fs'
import { parseTranscript, windowsFor } from '../apps/web/src/lib/transcript.ts'
import { questionWindows, validateExtraction } from '../apps/web/src/lib/extraction.ts'
import { EXTRACTION_SCHEMA, SYSTEM_PROMPT, buildPrompt } from '../apps/web/src/lib/extractionPrompt.ts'
import { KEY_VAR, readerFrom } from '../apps/web/src/lib/gemini.ts'

const DOMAINS = [
  'information_and_ideas',
  'craft_and_structure',
  'expression_of_ideas',
  'standard_english_conventions',
]

/**
 * Questions spread evenly across the lesson.
 *
 * A bench has no session rows, so the windows are synthetic. That is fine for
 * what is being measured — whether a model quotes verbatim from the window it
 * was handed — and it is not fine for anything about alignment, which is why
 * this script does not report on alignment.
 */
function syntheticWindows(transcript, count, offset) {
  const base = Date.now()
  const span = Math.max(60, Math.floor((transcript.duration - offset) / count))
  const items = Array.from({ length: count }, (_, k) => ({
    id: `item-${k + 1}`,
    startedAt: new Date(base + k * span * 1000).toISOString(),
  }))
  const aligned = windowsFor(items, transcript.duration, offset)
  return questionWindows(
    items.map((i, k) => ({ itemId: i.id, sequence: k + 1, window: aligned.get(i.id) ?? null })),
  )
}

function rolesFor(transcript, teacherHint) {
  const roles = {}
  for (const speaker of transcript.speakers) {
    roles[speaker] = speaker.toLowerCase().includes(teacherHint.toLowerCase())
      ? 'teacher'
      : 'student'
  }
  return roles
}

function summarise(result) {
  const q = result.extraction.questions
  const kept =
    q.reduce(
      (n, x) =>
        n +
        x.teacherFeedback.length +
        (x.studentReasoning ? 1 : 0) +
        (x.misunderstanding ? 1 : 0) +
        (x.vocabularyGap ? 1 : 0),
      0,
    ) + result.extraction.session.domainEvidence.length

  const relabelled = q.reduce(
    (n, x) =>
      n +
      [x.studentReasoning, x.misunderstanding, x.vocabularyGap, ...x.teacherFeedback].filter(
        (c) => c?.evidence.relabelled,
      ).length,
    0,
  )

  const byReason = {}
  for (const d of result.drops) byReason[d.reason] = (byReason[d.reason] ?? 0) + 1

  return {
    kept,
    dropped: result.drops.length,
    rate: kept + result.drops.length === 0 ? 0 : result.drops.length / (kept + result.drops.length),
    covered: q.filter((x) => x.covered).length,
    feedback: q.reduce((n, x) => n + x.teacherFeedback.length, 0),
    relabelled,
    byReason,
  }
}

async function main() {
  const [file, questionCount = '20', teacherHint = 'malya'] = process.argv.slice(2)
  if (!file) {
    console.error('usage: node tools/bench-extraction.mjs <transcript.txt> [questions] [teacher-name]')
    process.exit(1)
  }

  const body = readFileSync(file, 'utf8')
  const transcript = parseTranscript(body)
  if (transcript.lines.length === 0) {
    console.error('No timestamped turns in that file — is it a Fathom export?')
    process.exit(1)
  }

  const roles = rolesFor(transcript, teacherHint)
  const windows = syntheticWindows(transcript, Number(questionCount), 150)

  const prompt = buildPrompt({
    transcript,
    windows,
    roles,
    answers: windows.map((w) => ({
      itemId: w.itemId,
      sequence: w.sequence,
      correct: true,
      chose: null,
      answer: null,
      section: null,
      skill: null,
    })),
    form: DOMAINS.map((domain) => ({
      domain,
      label: domain.replace(/_/g, ' '),
      performance: null,
      performanceNote: '',
      strengths: '',
      gaps: '',
      targets: '',
    })),
    reflection: '',
  })

  console.log(`${file}: ${transcript.lines.length} turns, ${windows.length} windows`)
  console.log(`prompt: ${(prompt.length / 1024).toFixed(0)} KB\n`)

  if (!process.env[KEY_VAR]) {
    console.error(`${KEY_VAR} is not set.`)
    process.exit(1)
  }

  const reader = readerFrom((key) => process.env[key])
  const started = Date.now()
  let row
  try {
    const raw = await reader.read({ system: SYSTEM_PROMPT, prompt, schema: EXTRACTION_SCHEMA })
    const result = validateExtraction(raw, { transcript, windows, roles, domains: DOMAINS })
    row = { model: reader.model, seconds: (Date.now() - started) / 1000, ...summarise(result) }
  } catch (e) {
    console.error(`${reader.model} failed: ${e.message}`)
    process.exit(1)
  }

  console.log(`model       ${row.model}`)
  console.log(`kept        ${row.kept}`)
  console.log(`dropped     ${row.dropped}`)
  console.log(`drop-rate   ${(row.rate * 100).toFixed(1)}%`)
  console.log(`feedback    ${row.feedback}   (teacher feedback found across all questions)`)
  console.log(`relabelled  ${row.relabelled}   (times it overruled Fathom on who was speaking)`)
  console.log(`covered     ${row.covered} of ${windows.length}`)
  console.log(`seconds     ${row.seconds.toFixed(0)}`)
  if (row.dropped > 0) console.log('\ndrops by reason:', row.byReason)

  console.log('\nlower drop-rate is better, but read `kept` beside it — a model that says')
  console.log('little drops little. `relabelled` near zero means it is not doing the job')
  console.log('it is there for: overruling Fathom on who was speaking.')
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
