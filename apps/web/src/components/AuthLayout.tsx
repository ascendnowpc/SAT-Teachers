import type { ReactNode } from 'react'
import { Logo } from './Logo'

export function AuthLayout({
  title,
  subtitle,
  children,
  footer,
  headline = 'Every question, every answer, on the record.',
  tagline = 'Build the question bank, run the session, keep the proof.',
}: {
  title: string
  subtitle: string
  children: ReactNode
  footer?: ReactNode
  /** The brand panel's words. Staff by default; a student's link has its own. */
  headline?: string
  tagline?: string
}) {
  return (
    <div className="auth">
      <aside className="auth-brand">
        <span className="blob b1" aria-hidden="true" />
        <span className="blob b2" aria-hidden="true" />
        <span className="blob b3" aria-hidden="true" />
        <div className="auth-brand-inner">
          <Logo onDark />
          <h1>{headline}</h1>
          <p>{tagline}</p>
        </div>
      </aside>

      <main className="auth-panel">
        <div className="auth-card">
          <div className="auth-mobile-logo">
            <Logo />
          </div>
          <div className="card-head">
            <h2>{title}</h2>
            <p className="sub">{subtitle}</p>
          </div>
          {children}
          {footer && <div className="auth-foot">{footer}</div>}
        </div>
      </main>
    </div>
  )
}
