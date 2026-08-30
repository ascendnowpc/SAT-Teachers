import type { ReactNode } from 'react'
import { Logo } from './Logo'

export function AuthLayout({
  title,
  subtitle,
  children,
  footer,
}: {
  title: string
  subtitle: string
  children: ReactNode
  footer?: ReactNode
}) {
  return (
    <div className="auth">
      <aside className="auth-brand">
        <span className="blob b1" aria-hidden="true" />
        <span className="blob b2" aria-hidden="true" />
        <span className="blob b3" aria-hidden="true" />
        <div className="auth-brand-inner">
          <Logo onDark />
          <h1>Every question, every answer, on the record.</h1>
          <p>Build the question bank, run the session, keep the proof.</p>
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
