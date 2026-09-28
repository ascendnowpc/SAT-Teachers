#!/usr/bin/env node
/**
 * Flattens an edge function and everything it imports into one deployable directory.
 *
 * The functions import their logic from `apps/web/src/lib/` rather than carrying
 * copies, because those are the modules the vitest suite runs against and a
 * second copy would be a second copy to keep right; and they share their I/O —
 * the mail sender, the PDF — through `supabase/functions/_shared/`. The Supabase
 * CLI follows those relative paths on its own, but the Management API takes an
 * explicit list of files and resolves them flat — so deploying that way needs
 * this.
 *
 *   node tools/bundle-edge-function.mjs                   every function
 *   node tools/bundle-edge-function.mjs manage_pc [out]   one of them
 *
 * Writes each function's index.ts and every file it reaches, side by side, in
 * dist/edge/<function>/, with each relative import rewritten to `./<file>`. The
 * dependencies are found by following the imports, not listed by hand: a list
 * went stale the day a library file grew an import, and a stale list deploys
 * and then fails at runtime with a module-not-found.
 *
 * The bundle is generated, never edited: change the sources and run this again.
 */

import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'node:fs'
import { basename, dirname, join, relative, resolve } from 'node:path'

const ROOT = resolve(import.meta.dirname, '..')
const FUNCTIONS = join(ROOT, 'supabase/functions')

/** `from './x.ts'`, `from "../y.ts"`, `import('./z.ts')` — relative ones only. */
const RELATIVE = /(\bfrom\s+|\bimport\s*\(\s*)(['"])(\.{1,2}\/[^'"]+)\2/g

function bundle(name, out) {
  const entry = join(FUNCTIONS, name, 'index.ts')
  if (!existsSync(entry)) throw new Error(`there is no function called ${name}`)

  // Absolute source path -> the name it has in the flat bundle.
  const files = new Map([[entry, 'index.ts']])
  const queue = [entry]
  while (queue.length > 0) {
    const file = queue.shift()
    for (const match of readFileSync(file, 'utf8').matchAll(RELATIVE)) {
      const target = resolve(dirname(file), match[3])
      if (files.has(target)) continue
      if (!existsSync(target)) throw new Error(`${relative(ROOT, file)} imports ${match[3]}, which is not there`)
      const flat = basename(target)
      const taken = [...files].find(([path, as]) => as === flat && path !== target)
      if (taken) {
        throw new Error(`${relative(ROOT, target)} and ${relative(ROOT, taken[0])} would both be ${flat} in the bundle`)
      }
      files.set(target, flat)
      queue.push(target)
    }
  }

  rmSync(out, { recursive: true, force: true })
  mkdirSync(out, { recursive: true })
  for (const [file, flat] of files) {
    const text = readFileSync(file, 'utf8').replace(
      RELATIVE,
      (_all, lead, quote, spec) => `${lead}${quote}./${files.get(resolve(dirname(file), spec))}${quote}`,
    )
    // A path that still points out of the directory would deploy and then fail
    // at runtime with a module-not-found, which is a slow way to learn about it.
    if (/\bfrom\s+['"]\.\.\//.test(text)) throw new Error(`${flat} still reaches outside the bundle`)
    writeFileSync(join(out, flat), text)
  }
  return [...files.values()]
}

const [only, outArg] = process.argv.slice(2)
const names = only
  ? [only]
  : readdirSync(FUNCTIONS, { withFileTypes: true })
      .filter((d) => d.isDirectory() && !d.name.startsWith('_'))
      .map((d) => d.name)
      .sort()

for (const name of names) {
  const out = resolve(only && outArg ? outArg : join(ROOT, 'dist/edge', name))
  const flat = bundle(name, out)
  console.log(`${relative(ROOT, out) || out}\n${flat.map((f) => `  ${f}`).join('\n')}`)
}
