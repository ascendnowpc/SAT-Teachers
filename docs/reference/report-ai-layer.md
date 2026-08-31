# The AI layer, and where it goes

A decision doc. The deterministic analysis
([`transcript-analysis.md`](transcript-analysis.md)) reads the recording into verdicts and
findings without a model. This is about what a model adds on top, what it must never be given, and
which option to build first.

## The constraint everything else follows from

> The parent will not accept — and should not accept — AI-generated narrative about their child. A
> fluent paragraph that is subtly wrong is worse than no report at all.

So the line is: **the model supplies phrasing, never facts.** Concretely, three rules that are
checkable rather than aspirational:

1. **Evidence allowlist.** The prompt carries the only valid item ids and transcript line ids.
   Anything citing outside the list is dropped, not repaired.
2. **Quotes are verified by string match** against the actual turn. A quote that is not verbatim is
   dropped.
3. **Numbers are substituted, never generated.** Any figure in the output is a token
   (`{{accuracy.craft_and_structure}}`) filled from the computed report.

A drop is a silent quality signal, so drops are logged and a rising drop rate is a prompt bug.

## What the model must never be given

**Alignment.** "Which part of this conversation is about question 7" is already answered by
`first_viewed_at` plus the transcript's own timestamps. Asking a model is asking for a guess with a
citation attached, and it is where invented attributions come from. This is not a cost decision —
it stays deterministic even if inference were free.

## The four options

### A — deterministic only *(built, shipping today)*

Markers → verdicts → findings, offered as buttons. No model, no network, no key.

- **For:** zero cost, zero latency, offline, unit tested, same transcript gives the same findings
  twice, nothing to leak.
- **Against:** the sentences are templated. "Explained her own reasoning on Q10, Q11, Q12 and Q13"
  is true and dull, and a teacher will rewrite most of them.
- **Verdict:** this is the floor, and it must keep working on its own. It is what happens on a busy
  week and what happens when the model is down.

### B — phrasing over accepted findings *(recommended first build)*

The teacher accepts the findings they agree with. The model is then given **only those findings,
their quotes and the computed numbers**, and asked for one parent-facing paragraph per domain.

- **Input:** accepted findings (text + question numbers + quote), the Tier 1 numbers, the skill
  taxonomy. **Not** the transcript, not the question bank.
- **Output:** structured — `{domain, paragraph, cites:[finding_id]}` — not free prose.
- **For:** the smallest possible surface. The model cannot invent a finding because it is not
  asked for one; it is rewriting sentences a teacher has already signed. Validation is trivial.
- **Against:** ceiling is a nicer register, not a deeper reading.
- **Cost:** one call per report, a few thousand tokens. Rounding error.

### C — extraction over aligned windows

The model gets one question's aligned transcript window at a time and returns a structured reading
of it: did the student give a reason, what did they eliminate and why, what did they misunderstand.
It replaces the regex markers rather than the phrasing.

- **For:** catches what patterns miss — sarcasm, a reason given three turns later, a student whose
  idiom is not this student's. The regexes are tuned to one recording, and that is a real fragility.
- **Against:** 18 calls per session. And it is the first option where the model can be *wrong about
  what happened*, so every claim needs the quote shown next to it.
- **Design:** run it **alongside** A, not instead of it, and show disagreement. Where the regexes and
  the model agree, confidence is high; where they differ, that is the row a teacher should read.
- **Cost:** ~18 calls × a short window. Still small, but now per-session and user-visible in latency.

### D — full draft

Transcript plus answers in, finished report out.

- **Against:** this is the failure mode the whole design exists to avoid. It has to be given the
  alignment problem, it will produce statistics, and there is no cheap way to check a fluent
  paragraph. Not recommended at any price.

## Recommendation

**B now, C next, never D.** B is a day's work, cannot invent anything, and fixes the actual
complaint (templated sentences). C is the real upgrade but should ship as a second opinion beside
the deterministic markers, not as a replacement for them — the moment it is the only reader, a
wrong reading has nothing to contradict it.

## Where it runs

Not the browser: the key would ship to every client. Two candidates —

| | Supabase Edge Function | Render service |
| --- | --- | --- |
| Auth | already has the session JWT and RLS | needs its own verification |
| Deploy | `supabase functions deploy` | already in the stack diagram |
| Fit | it is one request, one response | earns its place if the pipeline grows |

**Start with an Edge Function** (`draft_report_sections`), called with a session id. It re-derives
the findings server-side rather than trusting what the client posts — otherwise "the model only
sees accepted findings" is a client-side promise, which is not a promise.

## The contract

```
POST  /functions/v1/draft_report_sections   { session_id }

  server:  assert the caller is the session's teacher
           load the computed report + the accepted findings + their quotes
           call the model with structured output
           validate: cites ∈ allowlist · quotes verbatim · no bare digits
           return  { sections: [{domain, paragraph, cites}], dropped: [...] }

  client:  shows each paragraph as a suggestion, exactly like today's findings —
           the teacher accepts it into the box, edits it, or ignores it
```

Nothing is written to `session_domain_notes` by the function. The teacher still types the accept.

## What to measure before trusting it

- **Drop rate** — claims failing the allowlist or the quote match. Rising means the prompt broke.
- **Teacher edit distance** — how much of an accepted paragraph survives to publish. If teachers
  rewrite 80% of it, B is not earning its call.
- **Agreement with the deterministic verdicts** (option C only). On the 7 August recording the
  regexes match the teacher's own diagnosis chips on all five misses; that is the bar C has to
  clear, and it is a real regression test rather than a vibe.

## Model choice

Latest Claude models; see the `claude-api` reference for current ids and pricing before wiring
anything. Structured output via a tool schema, not "reply in JSON" — validation belongs at the
tool-call layer so the model retries on mismatch instead of returning prose that has to be parsed.
