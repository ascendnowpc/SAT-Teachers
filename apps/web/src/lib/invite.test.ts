import { createHash } from 'node:crypto'
import { describe, expect, it } from 'vitest'
import { inviteLink, isToken, newToken, passwordProblem, tokenFrom, tokenHash } from './invite'

describe('newToken', () => {
  it('is 43 characters a URL carries as they are', () => {
    for (let i = 0; i < 50; i++) expect(newToken()).toMatch(/^[A-Za-z0-9_-]{43}$/)
  })

  it('is the 32 bytes it drew, and nothing else', () => {
    expect(newToken(() => new Uint8Array(32).fill(0xff))).toBe('_'.repeat(42) + '8')
    expect(newToken(() => new Uint8Array(32))).toBe('A'.repeat(43))
  })

  it('differs from one call to the next', () => {
    expect(new Set(Array.from({ length: 100 }, () => newToken())).size).toBe(100)
  })
})

describe('tokenHash', () => {
  it('is the SHA-256 the table keeps, in hex', async () => {
    const token = newToken()
    expect(await tokenHash(token)).toBe(createHash('sha256').update(token).digest('hex'))
    expect(await tokenHash(token)).toMatch(/^[0-9a-f]{64}$/)
  })
})

describe('the link', () => {
  const token = 'A'.repeat(43)

  it('carries the token in the fragment, which no server is sent', () => {
    expect(inviteLink('https://sat-teachers.vercel.app/', token)).toBe(
      `https://sat-teachers.vercel.app/join#token=${token}`,
    )
    expect(inviteLink(undefined, token)).toBe(`https://sat-teachers.vercel.app/join#token=${token}`)
  })

  it('is read back off the page', () => {
    expect(tokenFrom(`#token=${token}`)).toBe(token)
    expect(tokenFrom(new URL(inviteLink('http://localhost:5173', token)).hash)).toBe(token)
  })

  it('reads as nothing when it is not a token', () => {
    expect(tokenFrom('')).toBeNull()
    expect(tokenFrom('#token=short')).toBeNull()
    expect(tokenFrom(`#token=${token}x`)).toBeNull()
    expect(isToken(undefined)).toBe(false)
    expect(isToken('A'.repeat(42) + '=')).toBe(false)
  })
})

describe('passwordProblem', () => {
  it('asks for eight characters and the same twice', () => {
    expect(passwordProblem('short')).toBe('At least 8 characters.')
    expect(passwordProblem('long enough', 'long enougH')).toBe('The two passwords are not the same.')
    expect(passwordProblem('long enough', 'long enough')).toBeNull()
    expect(passwordProblem('long enough')).toBeNull()
  })

  it('refuses spaces alone, and what bcrypt would cut short', () => {
    expect(passwordProblem('          ')).toBe('Not only spaces.')
    expect(passwordProblem('a'.repeat(72))).toBeNull()
    // 36 characters, 72 bytes: fine. 37 of them is 74 bytes.
    expect(passwordProblem('é'.repeat(36))).toBeNull()
    expect(passwordProblem('é'.repeat(37))).toBe('At most 72 characters.')
  })
})
