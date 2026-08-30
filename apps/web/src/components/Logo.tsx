/**
 * The wordmark itself, taken from the operations dashboard's assets rather than
 * redrawn in CSS: the transparent navy mark for light surfaces, the navy-plated
 * one for dark surfaces — the same pairing the dashboard uses.
 */
export function Logo({ onDark = false }: { onDark?: boolean }) {
  return (
    <img
      className={onDark ? 'logo on-dark' : 'logo'}
      src={onDark ? '/brand/ascend-now-logo-on-navy.png' : '/brand/ascend-now-logo.png'}
      alt="Ascend Now"
    />
  )
}
