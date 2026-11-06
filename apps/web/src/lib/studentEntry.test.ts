import { describe, expect, it } from 'vitest'
import {
  normaliseStudentId,
  readableEntryError,
  rememberEntry,
  rememberedEntry,
  type KeyStore,
} from './studentEntry'

function memory(): KeyStore & { data: Map<string, string> } {
  const data = new Map<string, string>()
  return {
    data,
    getItem: (k) => data.get(k) ?? null,
    setItem: (k, v) => void data.set(k, v),
  }
}

describe('normaliseStudentId', () => {
  it('reads an ID the way people type it', () => {
    expect(normaliseStudentId('  bato26-1 ')).toBe('BATO26-1')
    expect(normaliseStudentId('BATO 26-1')).toBe('BATO26-1')
    expect(normaliseStudentId('JOXK26-2')).toBe('JOXK26-2')
  })
})

describe('readableEntryError', () => {
  it('says which half was wrong', () => {
    expect(readableEntryError('that student ID does not match this link')).toMatch(/Check it and try again/)
    expect(readableEntryError('that link is not valid')).toMatch(/Ask your teacher/)
  })

  it('passes anything else through', () => {
    expect(readableEntryError('Failed to fetch')).toBe('Failed to fetch')
  })
})

describe('the key, kept for the visit', () => {
  it('is kept per link', () => {
    const store = memory()
    rememberEntry('link-a', 'key-a', store)
    expect(rememberedEntry('link-a', store)).toBe('key-a')
    expect(rememberedEntry('link-b', store)).toBeNull()
  })

  it('is simply absent when there is no storage', () => {
    rememberEntry('link-a', 'key-a', null)
    expect(rememberedEntry('link-a', null)).toBeNull()
  })

  it('survives storage that throws', () => {
    const broken: KeyStore = {
      getItem: () => {
        throw new Error('blocked')
      },
      setItem: () => {
        throw new Error('blocked')
      },
    }
    expect(() => rememberEntry('link-a', 'key-a', broken)).not.toThrow()
    expect(rememberedEntry('link-a', broken)).toBeNull()
  })
})
