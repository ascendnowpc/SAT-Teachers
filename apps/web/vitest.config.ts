import { defineConfig } from 'vitest/config'

// Pure logic only: no DOM, no network, no Supabase. The helpers under src/lib
// are where the rules live, and they are what this suite protects.
export default defineConfig({
  test: {
    environment: 'node',
    include: ['src/**/*.test.ts'],
  },
})
