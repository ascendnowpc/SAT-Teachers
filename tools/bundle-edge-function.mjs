#!/usr/bin/env node
/**
 * Flattens the edge function and its imports into one deployable directory.
 *
 * The function imports the guard and the prompt from `apps/web/src/lib/` rather
 * than carrying copies, because those are the modules the vitest suite runs
 * against and a second copy would be a second copy to keep right. The Supabase
 * CLI follows those relative paths on its own, but the Management API takes an
 * explicit list of files and resolves them flat — so deploying that way needs
 * this.
 *
 *   node tools/bundle-edge-function.mjs [outdir]
 *
 * Writes index.ts plus its dependencies side by side, with the entrypoint's
 * `../../../apps/web/src/lib/x.ts` rewritten to `./x.ts`. The library files
 * already import each other as `./x.ts`, so they are copied unchanged.
 *
 * The bundle is generated, never edited: change the sources and run this again.
 */

import { copyFileSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs'
import { basename, join, resolve } from 'node:path'

const ROOT = resolve(import.meta.dirname, '..')
const FUNCTION = join(ROOT, 'supabase/functions/extract_session_context/index.ts')
const LIB = join(ROOT, 'apps/web/src/lib')

/** Everything the entrypoint pulls in, and everything those pull in. */
const DEPENDENCIES = [
  'asked.ts',
  'extraction.ts',
  'extractionPrompt.ts',
  'gemini.ts',
  'transcript.ts',
]

const out = resolve(process.argv[2] ?? join(ROOT, 'dist/edge/extract_session_context'))
mkdirSync(out, { recursive: true })

const entry = readFileSync(FUNCTION, 'utf8').replaceAll('../../../apps/web/src/lib/', './')
writeFileSync(join(out, 'index.ts'), entry)

for (const file of DEPENDENCIES) copyFileSync(join(LIB, file), join(out, file))

// A path that still points out of the directory would deploy and then fail at
// runtime with a module-not-found, which is a slow way to learn about a typo.
const stray = entry.match(/from\s+'[^']*\.\.\//g)
if (stray) {
  console.error(`index.ts still reaches outside the bundle: ${stray.join(', ')}`)
  process.exit(1)
}

console.log(`${out}\n  index.ts\n${DEPENDENCIES.map((f) => `  ${basename(f)}`).join('\n')}`)
