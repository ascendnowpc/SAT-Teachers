type P = { size?: number }
const base = (size: number) => ({
  width: size, height: size, viewBox: '0 0 24 24', fill: 'none',
  stroke: 'currentColor', strokeWidth: 1.8,
  strokeLinecap: 'round' as const, strokeLinejoin: 'round' as const,
})

export const IconHome = ({ size = 17 }: P) => (
  <svg {...base(size)}><path d="M3 10.5 12 3l9 7.5" /><path d="M5 9.5V21h14V9.5" /></svg>
)
export const IconCalendar = ({ size = 17 }: P) => (
  <svg {...base(size)}><rect x="3" y="5" width="18" height="16" rx="2" /><path d="M8 3v4M16 3v4M3 10h18" /></svg>
)
export const IconStack = ({ size = 17 }: P) => (
  <svg {...base(size)}><path d="M12 3 3 7.5l9 4.5 9-4.5L12 3Z" /><path d="M3 12.5 12 17l9-4.5" /><path d="M3 17 12 21.5 21 17" /></svg>
)
export const IconLogout = ({ size = 16 }: P) => (
  <svg {...base(size)}><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" /><path d="m16 17 5-5-5-5" /><path d="M21 12H9" /></svg>
)
export const IconChevron = ({ size = 14 }: P) => (
  <svg {...base(size)} className="chev"><path d="m9 5 7 7-7 7" /></svg>
)
export const IconBack = ({ size = 15 }: P) => (
  <svg {...base(size)}><path d="m15 19-7-7 7-7" /></svg>
)
export const IconCheck = ({ size = 15 }: P) => (
  <svg {...base(size)} strokeWidth={2.4}><path d="m20 6-11 11-5-5" /></svg>
)
export const IconCross = ({ size = 15 }: P) => (
  <svg {...base(size)} strokeWidth={2.4}><path d="M18 6 6 18M6 6l12 12" /></svg>
)
export const IconVideo = ({ size = 15 }: P) => (
  <svg {...base(size)}><rect x="2" y="6" width="13" height="12" rx="2" /><path d="m22 8-7 4 7 4V8Z" /></svg>
)
export const IconPlus = ({ size = 15 }: P) => (
  <svg {...base(size)} strokeWidth={2.2}><path d="M12 5v14M5 12h14" /></svg>
)
export const IconTrash = ({ size = 14 }: P) => (
  <svg {...base(size)}><path d="M3 6h18M8 6V4a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2" /><path d="M6 6v14a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V6" /></svg>
)

export const IconGrip = ({ size = 15 }: P) => (
  <svg {...base(size)} strokeWidth={2.2}><path d="M9 6h.01M9 12h.01M9 18h.01M15 6h.01M15 12h.01M15 18h.01" /></svg>
)
export const IconClock = ({ size = 15 }: P) => (
  <svg {...base(size)}><circle cx="12" cy="12" r="9" /><path d="M12 7v5.5l3.5 2" /></svg>
)

export function IconClipboard() {
  return (
    <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor"
      strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="M9 3h6a1 1 0 0 1 1 1v1H8V4a1 1 0 0 1 1-1z" />
      <path d="M16 5h2a1 1 0 0 1 1 1v13a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h2" />
      <path d="M9 11h6M9 15h4" />
    </svg>
  )
}
