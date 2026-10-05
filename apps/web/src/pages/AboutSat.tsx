import { Link, useSearchParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import {
  ENGLISH_DOMAINS,
  ENGLISH_SAMPLE_MODULE,
  MATH_DOMAINS,
  MODULE_TWO,
  SOURCES,
  TEST_DAY,
  formatMinutes,
  secondsPerQuestion,
  totalMinutes,
  totalQuestions,
  type Domain,
  type SampleLevel,
  type SatPart,
} from '../lib/satGuide'

/**
 * What the SAT is, before the first diagnostic.
 *
 * A student new to the SAT dropped straight into a test does not know what it
 * is a test of. This is what the mentor shows first — the day, how the
 * adaptive modules work, what each half asks — and then: let's see your level.
 * Pictures over paragraphs: it is read on a shared screen, out loud.
 */
export function AboutSat() {
  const { isTeacher } = useAuth()
  const [params, setParams] = useSearchParams()
  const part: SatPart = params.get('part') === 'math' ? 'mathematics' : 'english'

  const total = totalMinutes()

  return (
    <div className="page sat-guide">
      <div className="page-head">
        <div>
          <h1>What is the SAT?</h1>
          <p className="sub">
            The test US colleges use to compare applicants. Digital, adaptive, and in two halves:
            English, then Math.
          </p>
        </div>
      </div>

      <div className="stats">
        <div className="stat">
          <div className="k">Total time</div>
          <div className="v">{formatMinutes(total)}</div>
          <div className="stat-note">with a 10-min break</div>
        </div>
        <div className="stat">
          <div className="k">Questions</div>
          <div className="v">{totalQuestions()}</div>
          <div className="stat-note">
            {totalQuestions(undefined, 'english')} English · {totalQuestions(undefined, 'mathematics')} Math
          </div>
        </div>
        <div className="stat">
          <div className="k">Score</div>
          <div className="v">400–1600</div>
          <div className="stat-note">200–800 for each half</div>
        </div>
        <div className="stat">
          <div className="k">Format</div>
          <div className="v">Digital</div>
          <div className="stat-note">on a laptop or tablet</div>
        </div>
      </div>

      <div className="section-title">Test day</div>
      <div className="card card-pad sg-block">
        <ol className="sg-day" aria-label="Test day, in order">
          {TEST_DAY.map((s) => (
            <li key={s.label} className={`sg-step sg-${s.part}`} style={{ flexGrow: s.minutes }}>
              <span className="sg-step-name">{s.label}</span>
              <span className="sg-step-meta">
                {s.minutes} min{s.questions !== null && <> · {s.questions} q</>}
              </span>
            </li>
          ))}
        </ol>
        <p className="sg-note">Each half has two modules. You can’t go back to Module 1 once it’s done.</p>
      </div>

      <div className="section-title">It adapts to you</div>
      <div className="card card-pad sg-block">
        <div className="sg-adapt">
          <div className="sg-node sg-base">
            <strong>Module 1</strong>
            <span>Same for everyone · easy, medium and hard mixed</span>
          </div>
          <div className="sg-stem" />
          <div className="sg-decide">How did Module 1 go?</div>
          <div className="sg-fork" aria-hidden="true" />
          <div className="sg-branches">
            <div className="sg-node sg-easier">
              <strong>{MODULE_TWO.easier.label}</strong>
              <span>Score {MODULE_TWO.easier.range}</span>
            </div>
            <div className="sg-node sg-harder">
              <strong>{MODULE_TWO.harder.label}</strong>
              <span>Score {MODULE_TWO.harder.range}</span>
            </div>
          </div>
        </div>
        <p className="sg-tip">
          <strong>Why it matters:</strong> Module 1 decides your ceiling. Only the harder Module 2 opens
          the top scores. It happens twice: once for English, once for Math.
        </p>
      </div>

      <div className="tabs" role="tablist" aria-label="Section">
        {(['english', 'mathematics'] as const).map((p) => (
          <button
            key={p}
            type="button"
            role="tab"
            aria-selected={part === p}
            className={`tab${part === p ? ' on' : ''}`}
            onClick={() => setParams(p === 'mathematics' ? { part: 'math' } : {}, { replace: true })}
          >
            {p === 'english' ? 'English (Reading & Writing)' : 'Math'}
          </button>
        ))}
      </div>

      {part === 'english' ? <EnglishPart /> : <MathPart />}

      <div className="card card-pad sg-next">
        <div>
          <h3>Now, let’s see where you are</h3>
          <p>
            A diagnostic with your mentor: real SAT questions, live. It shows what you already
            know and which skills to work on first.
          </p>
        </div>
        {isTeacher && (
          <Link className="btn btn-primary btn-lg" to="/sessions/new">
            Book the diagnostic
          </Link>
        )}
      </div>

      <p className="sg-sources">
        Source:{' '}
        {SOURCES.map((s, i) => (
          <span key={s.href}>
            {i > 0 && ' · '}
            <a href={s.href} target="_blank" rel="noreferrer">
              {s.label}
            </a>
          </span>
        ))}
      </p>
    </div>
  )
}

function PartFacts({ part }: { part: SatPart }) {
  const steps = TEST_DAY.filter((s) => s.part === part)
  return (
    <div className="sg-facts">
      <span>
        <strong>{steps.length}</strong> modules
      </span>
      <span>
        <strong>{totalMinutes(steps)} min</strong> in all
      </span>
      <span>
        <strong>{totalQuestions(steps)}</strong> questions
      </span>
      <span>
        <strong>≈ {secondsPerQuestion(part)} s</strong> per question
      </span>
    </div>
  )
}

function DomainCards({ domains }: { domains: Domain[] }) {
  return (
    <div className="grid-2 sg-domains">
      {domains.map((d) => (
        <div key={d.name} className="card card-pad sg-domain">
          <div className="sg-domain-head">
            <h3>{d.name}</h3>
            <span className="sg-share">≈{d.share}%</span>
          </div>
          <div className="sg-bar" aria-hidden="true">
            <span style={{ width: `${d.share * 2}%` }} />
          </div>
          <div className="sg-count">{d.questions} questions</div>
          <p className="sg-blurb">{d.blurb}</p>
          <div className="sg-skills">
            {d.skills.map((s) => (
              <span key={s} className="badge badge-neutral">
                {s}
              </span>
            ))}
          </div>
        </div>
      ))}
    </div>
  )
}

const LEVEL_NAME: Record<SampleLevel, string> = {
  easy: 'Easy',
  medium: 'Medium',
  hard: 'Hard',
  unscored: 'Unscored',
}

function EnglishPart() {
  let n = 0
  return (
    <>
      <PartFacts part="english" />
      <p className="sg-lede">
        Short passages — a few lines to a paragraph — with <strong>one question each</strong>. All
        multiple choice.
      </p>

      <div className="section-title">What it tests</div>
      <DomainCards domains={ENGLISH_DOMAINS} />

      <div className="section-title">Inside one module</div>
      <div className="card card-pad sg-block">
        <div className="sg-halves">
          {(['Reading', 'Writing'] as const).map((half) => (
            <div key={half} className="sg-half">
              <div className="sg-half-name">{half}</div>
              <div className="sg-groups">
                {ENGLISH_SAMPLE_MODULE.filter((g) => g.half === half).map((g) => (
                  <div key={g.domain} className="sg-group">
                    <div className="sg-squares">
                      {g.levels.map((l) => {
                        n += 1
                        return (
                          <span key={n} className={`sg-sq sg-${l}`} title={`Q${n} · ${LEVEL_NAME[l]}`}>
                            {n}
                          </span>
                        )
                      })}
                    </div>
                    <div className="sg-group-name">{g.domain}</div>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>
        <div className="sg-legend">
          {(['easy', 'medium', 'hard', 'unscored'] as const).map((l) => (
            <span key={l}>
              <span className={`sg-sq sg-${l}`} /> {LEVEL_NAME[l]}
            </span>
          ))}
        </div>
        <p className="sg-note">
          Questions come grouped by type, in this order — but easy and hard are mixed. Don’t get stuck:
          ~70 seconds each. A couple of questions are trials and don’t count; you won’t know which.
        </p>
      </div>
    </>
  )
}

function MathPart() {
  return (
    <>
      <PartFacts part="mathematics" />
      <p className="sg-lede">
        Mostly multiple choice; about <strong>1 in 4</strong> answers you type in yourself.
      </p>

      <div className="sg-perks">
        <div className="sg-perk">
          <strong>Calculator allowed</strong>
          <span>On every question. Desmos is built into the app.</span>
        </div>
        <div className="sg-perk">
          <strong>Formulas given</strong>
          <span>A reference sheet is one click away.</span>
        </div>
        <div className="sg-perk">
          <strong>Topics mixed</strong>
          <span>Algebra, data and geometry come in any order.</span>
        </div>
      </div>

      <div className="section-title">What it tests</div>
      <DomainCards domains={MATH_DOMAINS} />
      <p className="sg-note sg-note-flat">
        Algebra and Advanced Math are 70% of the section — that’s where the points are.
      </p>
    </>
  )
}
