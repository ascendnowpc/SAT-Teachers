import type { ReactNode } from 'react'

/**
 * The few line icons the student's pages use, drawn here so the site carries
 * no icon package: 24×24, a 2px stroke in the text's colour, round ends.
 * Always decorative — the button or label beside one says what it is.
 */
const PATHS = {
  home: (
    <>
      <path d="M3 10.5 12 3l9 7.5" />
      <path d="M5 9.5V20h14V9.5" />
      <path d="M10 20v-6h4v6" />
    </>
  ),
  reports: (
    <>
      <path d="M6 3h8l4 4v14H6z" />
      <path d="M14 3v4h4" />
      <path d="M9 12h6M9 16h4" />
    </>
  ),
  chart: (
    <>
      <path d="M4 20h16" />
      <path d="M7 16v-4M12 16V7M17 16v-7" />
    </>
  ),
  sliders: (
    <>
      <path d="M4 7h9M17 7h3M4 17h3M11 17h9" />
      <circle cx="15" cy="7" r="2" />
      <circle cx="9" cy="17" r="2" />
    </>
  ),
  logout: (
    <>
      <path d="M9 20H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h3" />
      <path d="m16 16 4-4-4-4" />
      <path d="M20 12H10" />
    </>
  ),
  target: (
    <>
      <circle cx="12" cy="12" r="9" />
      <circle cx="12" cy="12" r="5" />
      <circle cx="12" cy="12" r="1.2" />
    </>
  ),
  calendar: (
    <>
      <rect x="3" y="5" width="18" height="16" rx="2.5" />
      <path d="M3 10h18M8 3v4M16 3v4" />
    </>
  ),
  flag: (
    <>
      <path d="M5 21V4" />
      <path d="M5 4h12l-2.5 4L17 12H5" />
    </>
  ),
  cap: (
    <>
      <path d="m2 9 10-5 10 5-10 5z" />
      <path d="M6 11v5c0 1.4 2.7 3 6 3s6-1.6 6-3v-5" />
    </>
  ),
  check: (
    <>
      <circle cx="12" cy="12" r="9" />
      <path d="m8 12.5 2.5 2.5L16 9.5" />
    </>
  ),
  tick: <path d="m5 12.5 4.5 4.5L19 7.5" />,
  sparkles: (
    <>
      <path d="M11 3.5 12.9 8.1 17.5 10l-4.6 1.9L11 16.5l-1.9-4.6L4.5 10l4.6-1.9z" />
      <path d="M18.5 14.5l.8 1.9 1.9.8-1.9.8-.8 1.9-.8-1.9-1.9-.8 1.9-.8z" />
    </>
  ),
  upload: (
    <>
      <path d="M7 18.5a4.5 4.5 0 0 1-.6-8.96A6 6 0 0 1 17.9 8.6 4.3 4.3 0 0 1 17.5 18.5" />
      <path d="M12 12.5v8M9 15.5l3-3 3 3" />
    </>
  ),
  arrow: <path d="M5 12h14M13 6l6 6-6 6" />,
  back: <path d="M19 12H5M11 6l-6 6 6 6" />,
  pencil: (
    <>
      <path d="m4 20 1-4L16 5l3 3L8 19z" />
      <path d="m14 7 3 3" />
    </>
  ),
  book: (
    <>
      <path d="M2.5 5H8a4 4 0 0 1 4 4v11a3 3 0 0 0-3-3H2.5z" />
      <path d="M21.5 5H16a4 4 0 0 0-4 4v11a3 3 0 0 1 3-3h6.5z" />
    </>
  ),
  sigma: <path d="M17 5H7l5.5 7L7 19h10" />,
  chevron: <path d="m6 9 6 6 6-6" />,
  external: (
    <>
      <path d="M14 4h6v6M20 4l-9 9" />
      <path d="M18 14v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h5" />
    </>
  ),
  clock: (
    <>
      <circle cx="12" cy="12" r="9" />
      <path d="M12 7v5l3 2" />
    </>
  ),
  play: <path d="M8 5.5v13l10.5-6.5z" />,
  alert: (
    <>
      <path d="M12 3.5 21.5 20h-19z" />
      <path d="M12 10v4.5M12 17.2v.01" />
    </>
  ),
  trend: (
    <>
      <path d="m3 17 6-6 4 4 8-8" />
      <path d="M15 7h6v6" />
    </>
  ),
  file: (
    <>
      <path d="M6 3h8l4 4v14H6z" />
      <path d="M14 3v4h4" />
    </>
  ),
  rocket: (
    <>
      <path d="M12 2.5c2.9 1.9 4.4 5.2 4.4 9.1L14.6 15H9.4l-1.8-3.4c0-3.9 1.5-7.2 4.4-9.1z" />
      <circle cx="12" cy="9" r="1.6" />
      <path d="m7.6 11.8-2.6 2.4v3.3l3.4-1.7M16.4 11.8l2.6 2.4v3.3l-3.4-1.7M10.6 18l1.4 3.5 1.4-3.5" />
    </>
  ),
  x: <path d="M6 6l12 12M18 6 6 18" />,
} satisfies Record<string, ReactNode>

export type IconName = keyof typeof PATHS

export function Icon({ name, size = 18, className }: { name: IconName; size?: number; className?: string }) {
  return (
    <svg
      className={`icon${className ? ` ${className}` : ''}`}
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth={2}
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
      focusable="false"
    >
      {PATHS[name]}
    </svg>
  )
}
