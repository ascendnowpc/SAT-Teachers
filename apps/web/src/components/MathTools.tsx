import { useState, type ReactNode } from 'react'
import { IconCalculator, IconCross, IconFormula } from './icons'

/**
 * The tools a student has beside every mathematics question in the real test:
 * the Desmos graphing calculator, the Desmos scientific calculator, and the
 * reference sheet of formulas. They live in tabs and nowhere else — the
 * question's own panes stay the question's.
 *
 * The calculators are Desmos's own, embedded — the College Board builds of
 * them, which are the ones Bluebook opens — rather than anything written here.
 *
 * The graphing calculator always takes the whole screen: a graph in a third of
 * the width is not one anybody can read. So that the question does not vanish
 * behind it, the screen carries a note with the question on it, which the
 * student can shrink out of the way. The scientific calculator and the
 * reference sheet open docked beside the question, and the square in the
 * panel's header takes them full screen when the student wants the room.
 *
 * Each calculator is loaded the first time its tab is opened and then kept, so
 * switching tabs, closing the panel or moving on to the next question does not
 * throw away what was typed into it. That is why the host keeps this mounted
 * for the whole test and it hides itself rather than unmounting.
 */
export type MathTool = 'graphing' | 'scientific' | 'reference'

export const FORMULA_SHEET_URL = '/formula-sheet.jpg'

const ALL_TOOLS: MathTool[] = ['graphing', 'scientific', 'reference']

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

const LABELS: Record<MathTool, string> = {
  graphing: 'Graphing',
  scientific: 'Scientific',
  reference: 'Reference',
}

/**
 * The buttons that open the panel — Calculator and Reference, the pair
 * Bluebook puts at the top of a mathematics module, or only the ones `tools`
 * allows. Each closes the panel again when it is already showing what it opens.
 */
export function MathToolButtons({
  tool,
  onTool,
  tools = ALL_TOOLS,
  className = 'btn btn-ghost btn-sm',
}: {
  tool: MathTool | null
  onTool: (tool: MathTool | null) => void
  tools?: MathTool[]
  className?: string
}) {
  const hasCalculator = tools.includes('graphing') || tools.includes('scientific')
  const calculatorOn = tool === 'graphing' || tool === 'scientific'
  return (
    <>
      {hasCalculator && (
        <button
          type="button"
          className={`${className} ${calculatorOn ? 'is-on' : ''}`}
          aria-pressed={calculatorOn}
          onClick={() => onTool(calculatorOn ? null : tools.includes('graphing') ? 'graphing' : 'scientific')}
        >
          <IconCalculator /> Calculator
        </button>
      )}
      {tools.includes('reference') && (
        <button
          type="button"
          className={`${className} ${tool === 'reference' ? 'is-on' : ''}`}
          aria-pressed={tool === 'reference'}
          onClick={() => onTool(tool === 'reference' ? null : 'reference')}
        >
          <IconFormula /> Reference
        </button>
      )}
    </>
  )
}

/**
 * The panel itself: its tabs and whichever of them is open. Hidden, not
 * removed, while `tool` is null — see above.
 *
 * `note` is what the full-screen graphing calculator pins beside the graph:
 * the question being worked on. Nothing is pinned when there is none.
 */
export function MathToolsPanel({
  tool,
  onTool,
  tools = ALL_TOOLS,
  note,
  noteTitle = 'Question',
  className = '',
}: {
  tool: MathTool | null
  onTool: (tool: MathTool | null) => void
  tools?: MathTool[]
  note?: ReactNode
  /** The note's title bar — "Question 4". */
  noteTitle?: string
  className?: string
}) {
  // Which calculators have been opened, so each iframe loads on first use and
  // then stays.
  const [opened, setOpened] = useState<Set<MathTool>>(() => new Set(tool ? [tool] : []))
  if (tool && !opened.has(tool)) setOpened(new Set(opened).add(tool))

  // Full screen by choice, for the two that open docked. The graphing
  // calculator has no docked size to come back to.
  const [maximised, setMaximised] = useState(false)
  const full = tool === 'graphing' || (tool !== null && maximised)

  return (
    <aside
      className={`math-tools ${full ? 'is-full' : className}`}
      hidden={tool === null}
      aria-label="Calculator and reference"
    >
      <div className="math-tools-head" role="tablist">
        {tools.map((t) => (
          <button
            key={t}
            type="button"
            role="tab"
            aria-selected={tool === t}
            className={`math-tab ${tool === t ? 'on' : ''}`}
            onClick={() => onTool(t)}
          >
            {LABELS[t]}
          </button>
        ))}
        <span className="spring" />
        {tool !== 'graphing' && (
          <button
            type="button"
            className="math-tools-icon"
            onClick={() => setMaximised((m) => !m)}
            aria-pressed={maximised}
            aria-label={maximised ? 'Back to the side of the question' : 'Full screen'}
            title={maximised ? 'Back to the side of the question' : 'Full screen'}
          >
            {maximised ? <IconRestore /> : <IconSquare />}
          </button>
        )}
        <button
          type="button"
          className="math-tools-icon"
          onClick={() => onTool(null)}
          aria-label="Close"
          title="Close"
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
        {tools.includes('reference') && (
          <div className="math-ref" hidden={tool !== 'reference'}>
            <img
              className="formula-sheet"
              src={FORMULA_SHEET_URL}
              alt="SAT mathematics reference sheet: area and volume formulas, right triangle relationships, algebra, exponents and statistics"
              loading="lazy"
            />
          </div>
        )}

        {tool === 'graphing' && note && <QuestionNote title={noteTitle}>{note}</QuestionNote>}
      </div>
    </aside>
  )
}

/**
 * The question, pinned over the full-screen graph like a sticky note. The
 * minus folds it down to its title bar for a student who wants the whole
 * graph; the same bar opens it again.
 */
function QuestionNote({ title, children }: { title: string; children: ReactNode }) {
  const [folded, setFolded] = useState(false)
  return (
    <div className={`math-note ${folded ? 'folded' : ''}`}>
      <button
        type="button"
        className="math-note-bar"
        onClick={() => setFolded((f) => !f)}
        aria-expanded={!folded}
        aria-label={folded ? 'Show the question' : 'Minimise the question'}
        title={folded ? 'Show the question' : 'Minimise the question'}
      >
        <span>{title}</span>
        <span className="spring" />
        {folded ? <IconSquare size={13} /> : <IconMinus />}
      </button>
      {!folded && <div className="math-note-body">{children}</div>}
    </div>
  )
}

const svg = (size: number) => ({
  width: size,
  height: size,
  viewBox: '0 0 24 24',
  fill: 'none',
  stroke: 'currentColor',
  strokeWidth: 2,
  strokeLinecap: 'round' as const,
  strokeLinejoin: 'round' as const,
})
const IconSquare = ({ size = 15 }: { size?: number }) => (
  <svg {...svg(size)}>
    <rect x="4" y="4" width="16" height="16" rx="1.5" />
  </svg>
)
const IconRestore = ({ size = 15 }: { size?: number }) => (
  <svg {...svg(size)}>
    <rect x="4" y="8" width="12" height="12" rx="1.5" />
    <path d="M8 8V5.5A1.5 1.5 0 0 1 9.5 4h9A1.5 1.5 0 0 1 20 5.5v9a1.5 1.5 0 0 1-1.5 1.5H16" />
  </svg>
)
const IconMinus = ({ size = 15 }: { size?: number }) => (
  <svg {...svg(size)}>
    <path d="M5 12h14" />
  </svg>
)
