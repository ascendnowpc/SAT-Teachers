import { useState } from 'react'
import { IconCalculator, IconCross, IconFormula } from './icons'

/**
 * The tools a student has beside every mathematics question in the real test:
 * the Desmos graphing calculator, the Desmos scientific calculator, and the
 * reference sheet of formulas.
 *
 * The calculators are Desmos's own, embedded — the College Board builds of
 * them, which are the ones Bluebook opens — rather than anything written here.
 * A student who learns the calculator on our screen has learnt the one on the
 * test, and nobody has to maintain a calculator.
 *
 * Each calculator is loaded the first time its tab is opened and then kept, so
 * switching to the reference sheet and back, closing the panel, or moving on
 * to the next question does not throw away what was typed into it. That is why
 * the host keeps this mounted for the whole test and hides it rather than
 * unmounting it.
 */
export type MathTool = 'graphing' | 'scientific' | 'reference'

export const FORMULA_SHEET_URL = '/formula-sheet.jpg'

const DESMOS: Record<Exclude<MathTool, 'reference'>, { url: string; title: string }> = {
  graphing: {
    url: 'https://www.desmos.com/testing/cb-digital-sat/graphing',
    title: 'Desmos graphing calculator',
  },
  scientific: {
    url: 'https://www.desmos.com/testing/cb-digital-sat/scientific',
    title: 'Desmos scientific calculator',
  },
}

const TABS: { tool: MathTool; label: string }[] = [
  { tool: 'graphing', label: 'Graphing' },
  { tool: 'scientific', label: 'Scientific' },
  { tool: 'reference', label: 'Reference' },
]

/**
 * The two buttons that open the panel — Calculator and Reference, the pair
 * Bluebook puts at the top of a mathematics module. Each one closes the panel
 * again when it is already showing what it opens.
 */
export function MathToolButtons({
  tool,
  onTool,
  className = 'btn btn-ghost btn-sm',
}: {
  tool: MathTool | null
  onTool: (tool: MathTool | null) => void
  className?: string
}) {
  const calculatorOn = tool === 'graphing' || tool === 'scientific'
  return (
    <>
      <button
        type="button"
        className={`${className} ${calculatorOn ? 'is-on' : ''}`}
        aria-pressed={calculatorOn}
        onClick={() => onTool(calculatorOn ? null : 'graphing')}
      >
        <IconCalculator /> Calculator
      </button>
      <button
        type="button"
        className={`${className} ${tool === 'reference' ? 'is-on' : ''}`}
        aria-pressed={tool === 'reference'}
        onClick={() => onTool(tool === 'reference' ? null : 'reference')}
      >
        <IconFormula /> Reference
      </button>
    </>
  )
}

/**
 * The panel itself: three tabs and whichever of them is open. Hidden, not
 * removed, while `tool` is null — see above.
 */
export function MathToolsPanel({
  tool,
  onTool,
  className = '',
}: {
  tool: MathTool | null
  onTool: (tool: MathTool | null) => void
  className?: string
}) {
  // Which calculators have been opened, so each iframe loads on first use and
  // then stays.
  const [opened, setOpened] = useState<Set<MathTool>>(() => new Set(tool ? [tool] : []))
  if (tool && !opened.has(tool)) setOpened(new Set(opened).add(tool))

  return (
    <aside className={`math-tools ${className}`} hidden={tool === null} aria-label="Calculator and reference">
      <div className="math-tools-head" role="tablist">
        {TABS.map((t) => (
          <button
            key={t.tool}
            type="button"
            role="tab"
            aria-selected={tool === t.tool}
            className={`math-tab ${tool === t.tool ? 'on' : ''}`}
            onClick={() => onTool(t.tool)}
          >
            {t.label}
          </button>
        ))}
        <span className="spring" />
        <button
          type="button"
          className="math-tools-close"
          onClick={() => onTool(null)}
          aria-label="Close the calculator and reference"
        >
          <IconCross />
        </button>
      </div>

      <div className="math-tools-body">
        {(['graphing', 'scientific'] as const).map((k) =>
          opened.has(k) ? (
            <div key={k} className="math-calc" hidden={tool !== k}>
              <iframe src={DESMOS[k].url} title={DESMOS[k].title} allow="clipboard-write" />
              {/* Desmos decides whether it may be framed, not us. If it ever
                  stops, the student still has the calculator one click away. */}
              <a className="math-calc-out" href={DESMOS[k].url} target="_blank" rel="noreferrer noopener">
                Open in a new tab
              </a>
            </div>
          ) : null,
        )}
        <div className="math-ref" hidden={tool !== 'reference'}>
          <FormulaSheet />
        </div>
      </div>
    </aside>
  )
}

/**
 * The reference sheet, as the image the teachers supplied. Also set inline in
 * the stimulus pane of a mathematics question that has nothing else to put
 * there, so it is beside the question without anything being opened.
 */
export function FormulaSheet({ className = 'formula-sheet' }: { className?: string }) {
  return (
    <img
      className={className}
      src={FORMULA_SHEET_URL}
      alt="SAT mathematics reference sheet: area and volume formulas, right triangle relationships, algebra, exponents and statistics"
      loading="lazy"
    />
  )
}
