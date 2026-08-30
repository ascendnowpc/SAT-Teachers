export function Logo({ onDark = false }: { onDark?: boolean }) {
  return (
    <span className={onDark ? 'logo on-dark' : 'logo'}>
      <span className="mark" aria-hidden="true">A</span>
      <span className="word">Ascend</span>
      <span className="now">NOW</span>
    </span>
  )
}
