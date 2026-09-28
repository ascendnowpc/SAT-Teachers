import { supabase } from './supabase'

/**
 * Calling an edge function, and hearing what it said when it said no.
 *
 * A function that refuses says why in its body, and the message is the useful
 * half — "there is already an account with that email address" is something a
 * person can act on, where "Edge Function returned a non-2xx status code" is
 * not. The functions put it in `error`, or in `reason` when the refusal is an
 * outcome rather than a fault (a report that could not be sent).
 */
export async function readFunctionError(error: unknown): Promise<string | null> {
  const response = (error as { context?: Response })?.context
  if (!response || typeof response.json !== 'function') return null
  try {
    const body = await response.json()
    if (typeof body?.error === 'string') return body.error
    if (typeof body?.reason === 'string') return body.reason
    return null
  } catch {
    return null
  }
}

/** Invokes a function and returns its body, or throws with the reason it gave. */
export async function callFunction<T>(name: string, body: unknown): Promise<T> {
  const { data, error } = await supabase.functions.invoke<T>(name, { body: body as Record<string, unknown> })
  if (error) throw new Error((await readFunctionError(error)) ?? error.message)
  if (data === null || data === undefined) throw new Error(`${name} answered with nothing`)
  return data
}
