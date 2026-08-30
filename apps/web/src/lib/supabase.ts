import { createClient } from '@supabase/supabase-js'

const url = import.meta.env.VITE_SUPABASE_URL
const key = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!url || !key) {
  throw new Error(
    'Missing VITE_SUPABASE_URL or VITE_SUPABASE_ANON_KEY. Copy .env.example to .env.local and fill them in.',
  )
}

export const supabase = createClient(url, key, {
  auth: { persistSession: true, autoRefreshToken: true },
})

/**
 * PostgREST's select-string parser cannot infer the shape of aliased embeds
 * (`teacher:profiles!fk(...)`) without generated database types, so it falls
 * back to an error type. These re-type a response against the interfaces in
 * ./types, which are kept in step with supabase/migrations by hand.
 *
 * Replace both with `createClient<Database>` once types are generated.
 */
export function rows<T>(data: unknown): T[] {
  return (data ?? []) as T[]
}

export function row<T>(data: unknown): T | null {
  return (data ?? null) as T | null
}
