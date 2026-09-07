#!/usr/bin/env node
/**
 * Which model should read the recording — measured, not argued.
 *
 * The guard in extraction.ts is already a scorer. It drops any claim whose quote
 * is not verbatim in the transcript, and verbatim quoting under a deep schema is
 * exactly the capability this feature lives or dies on: a model that paraphrases
 * when asked to quote produces a report with nothing in it. So the drop rate is
 * not a proxy for quality here, it is the thing itself.
 *
 * Run the same recording through each vendor and compare:
 *
 *   GEMINI_API_KEY=… ANTHROPIC_API_KEY=… XAI_API_KEY=… \
 *     node tools/bench-extraction.mjs path/to/transcript.txt
 *
 * Only the vendors whose key is set are run. Every call costs real money —
 * roughly 27k input tokens for an hour-long lesson — so it asks nothing and
 * spends nothing you did not set a key for.
 *
 * WHAT THIS DOES NOT TELL YOU
 *
 * A low drop rate means the model quoted honestly. It does not mean the model
 * read the lesson well: a model that returns two safe claims per session will
 * score better than one that returns eight good ones and fumbles a quote. So
 * `kept` is printed beside the rate, and neither number replaces a teacher
 * reading the output. With two transcripts this is a smoke test that ranks
 * vendors on the one thing that is machine-checkable — not an eval.
 */

import { readFileSync } from 'node:fs'
import { parseTranscript, windowsFor } from '../apps/web/src/lib/transcript.ts'
import { questionWindows, validateExtraction } from '../apps/web/src/lib/extraction.ts'
import { EXTRACTION_TOOL, SYSTEM_PROMPT, buildPrompt } from '../apps/web/src/lib/extractionPrompt.ts'
import { KEY_VAR, PROVIDER_NAMES, providerFrom } from '../apps/web/src/lib/providers.ts'

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

  const available = PROVIDER_NAMES.filter((p) => process.env[KEY_VAR[p]])
  if (available.length === 0) {
    console.error(`No keys set. Set any of: ${PROVIDER_NAMES.map((p) => KEY_VAR[p]).join(', ')}`)
    process.exit(1)
  }

  const rows = []
  for (const name of available) {
    const provider = providerFrom((key) => (key === 'EXTRACTION_PROVIDER' ? name : process.env[key]))
    const started = Date.now()
    try {
      const raw = await provider.read({
        system: SYSTEM_PROMPT,
        prompt,
        schema: EXTRACTION_TOOL.input_schema,
        name: EXTRACTION_TOOL.name,
        description: EXTRACTION_TOOL.description,
      })
      const result = validateExtraction(raw, { transcript, windows, roles, domains: DOMAINS })
      rows.push({ provider: name, model: provider.model, seconds: (Date.now() - started) / 1000, ...summarise(result) })
    } catch (e) {
      rows.push({ provider: name, model: provider.model, error: e.message })
    }
  }

  console.log('provider  model                  kept  dropped  drop-rate  feedback  relabelled  covered  secs')
  console.log('─'.repeat(104))
  for (const r of rows) {
    if (r.error) {
      console.log(`${r.provider.padEnd(9)} ${r.model.padEnd(22)} FAILED — ${r.error.slice(0, 60)}`)
      continue
    }
    console.log(
      `${r.provider.padEnd(9)} ${r.model.padEnd(22)} ${String(r.kept).padStart(4)}  ${String(r.dropped).padStart(7)}  ${(r.rate * 100).toFixed(1).padStart(8)}%  ${String(r.feedback).padStart(8)}  ${String(r.relabelled).padStart(10)}  ${String(r.covered).padStart(7)}  ${r.seconds.toFixed(0).padStart(4)}`,
    )
  }

  console.log('\nlower drop-rate is better, but read `kept` beside it — a model that says')
  console.log('little drops little. `relabelled` is how often it overruled Fathom on who')
  console.log('was speaking; near zero means it is not doing the job it is there for.')

  for (const r of rows) {
    if (r.error || r.dropped === 0) continue
    console.log(`\n${r.provider} drops by reason:`, r.byReason)
  }
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
