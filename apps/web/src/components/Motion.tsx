import { useEffect, useState } from 'react'

/** Whether the person has asked for less movement; nothing animates for them. */
function reduced(): boolean {
  try {
    return window.matchMedia('(prefers-reduced-motion: reduce)').matches
  } catch {
    return false
  }
}

/**
 * A figure that counts up to itself when it first appears: "65%" runs 0 → 65
 * and keeps its "%". Anything that is not a number ("—") is shown as it is.
 */
export function CountUp({ value, className, ms = 700 }: { value: string; className?: string; ms?: number }) {
  const match = /^(\D*)(\d+)(.*)$/.exec(value)
  const target = match ? Number(match[2]) : null
  const [shown, setShown] = useState<number | null>(() => (target === null || reduced() ? target : 0))

  useEffect(() => {
    if (target === null || reduced()) {
      setShown(target)
      return
    }
    let frame = 0
    const start = performance.now()
    const from = 0
    const tick = (now: number) => {
      const t = Math.min(1, (now - start) / ms)
      const eased = 1 - Math.pow(1 - t, 3)
      setShown(Math.round(from + (target - from) * eased))
      if (t < 1) frame = requestAnimationFrame(tick)
    }
    frame = requestAnimationFrame(tick)
    return () => cancelAnimationFrame(frame)
  }, [target, ms])

  if (!match || shown === null) return <span className={className}>{value}</span>
  return (
    <span className={className} aria-label={value}>
      {match[1]}
      {shown}
      {match[3]}
    </span>
  )
}
