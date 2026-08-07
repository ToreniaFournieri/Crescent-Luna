export interface ModelInfo { id: string }
export interface ConversationMessage { role: 'user' | 'assistant'; content: string }

export class LMStudioError extends Error {
  constructor(public readonly kind: 'url' | 'http' | 'payload' | 'network' | 'cors' | 'timeout' | 'aborted', message: string) { super(message) }
}

export function normalizeBaseUrl(input: string): string {
  let url: URL
  try { url = new URL(input.trim()) } catch { throw new LMStudioError('url', 'Enter a valid LM Studio URL.') }
  if (url.protocol !== 'http:' && url.protocol !== 'https:') throw new LMStudioError('url', 'The endpoint must use http:// or https://.')
  const pathname = url.pathname.replace(/\/+$/, '')
  // LM Studio displays the server origin, while its OpenAI-compatible
  // model and chat endpoints live below /v1.
  url.pathname = pathname || '/v1'
  return url.toString().replace(/\/$/, '')
}

async function request(url: string, init: RequestInit): Promise<unknown> {
  try {
    const response = await fetch(url, init)
    if (!response.ok) throw new LMStudioError('http', `LM Studio returned HTTP ${response.status}.`)
    try { return await response.json() } catch { throw new LMStudioError('payload', 'LM Studio returned invalid JSON.') }
  } catch (error) {
    if (error instanceof LMStudioError) throw error
    if (error instanceof DOMException && error.name === 'AbortError') throw new LMStudioError('aborted', 'Request stopped.')
    throw new LMStudioError('network', 'The browser could not reach LM Studio.')
  }
}

export async function discoverModels(baseUrl: string, signal?: AbortSignal): Promise<ModelInfo[]> {
  const modelsUrl = `${normalizeBaseUrl(baseUrl)}/models`
  let data: unknown
  try {
    data = await request(modelsUrl, { signal })
  } catch (error) {
    if (!(error instanceof LMStudioError) || error.kind !== 'network') throw error
    // A no-CORS probe cannot expose response data, but an opaque response proves
    // that LM Studio answered and that its missing CORS permission is the issue.
    try {
      const probe = await fetch(modelsUrl, { mode: 'no-cors', signal })
      if (probe.type === 'opaque') throw new LMStudioError('cors', 'LM Studio is reachable, but the browser cannot read its response.')
    } catch (probeError) {
      if (probeError instanceof LMStudioError) throw probeError
    }
    throw error
  }
  if (!data || typeof data !== 'object' || !Array.isArray((data as { data?: unknown }).data)) throw new LMStudioError('payload', 'LM Studio returned an invalid model list.')
  const models = (data as { data: unknown[] }).data.filter((item): item is ModelInfo => Boolean(item && typeof item === 'object' && typeof (item as ModelInfo).id === 'string' && (item as ModelInfo).id.trim()))
  return models
}

export async function createCompletion(options: { baseUrl: string; model: string; systemPrompt: string; messages: ConversationMessage[]; signal: AbortSignal }): Promise<string> {
  const data = await request(`${normalizeBaseUrl(options.baseUrl)}/chat/completions`, {
    method: 'POST', headers: { 'Content-Type': 'application/json' }, signal: options.signal,
    body: JSON.stringify({ model: options.model, messages: [{ role: 'system', content: options.systemPrompt }, ...options.messages], temperature: 0.75, stream: false }),
  })
  const content = (data as { choices?: Array<{ message?: { content?: unknown } }> } | null)?.choices?.[0]?.message?.content
  if (typeof content !== 'string' || !content.trim()) throw new LMStudioError('payload', 'LM Studio returned no message from Luna.')
  return content.trim()
}
