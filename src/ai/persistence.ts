import type { LunaLanguage } from './prompts'
import type { ConversationMessage } from './lmStudio'

const VERSION = 1
const SETTINGS_KEY = 'crescent-luna-ai-settings'
const transcriptKey = (language: LunaLanguage) => `crescent-luna-ai-transcript:${language}`
export interface AISettings { baseUrl: string; model: string }
export const defaultSettings: AISettings = { baseUrl: 'http://127.0.0.1:1234/v1', model: '' }

export function loadAISettings(): AISettings {
  try { const value = JSON.parse(localStorage.getItem(SETTINGS_KEY) ?? 'null') as { version?: unknown; baseUrl?: unknown; model?: unknown } | null; if (value?.version === VERSION && typeof value.baseUrl === 'string' && typeof value.model === 'string') return { baseUrl: value.baseUrl, model: value.model } } catch { /* use defaults */ }
  return defaultSettings
}
export function saveAISettings(settings: AISettings) { try { localStorage.setItem(SETTINGS_KEY, JSON.stringify({ version: VERSION, ...settings })) } catch { /* storage is optional */ } }
export function loadTranscript(language: LunaLanguage): ConversationMessage[] {
  try { const value = JSON.parse(localStorage.getItem(transcriptKey(language)) ?? 'null') as { version?: unknown; messages?: unknown } | null; if (value?.version === VERSION && Array.isArray(value.messages) && value.messages.every((m) => m && typeof m === 'object' && (m.role === 'user' || m.role === 'assistant') && typeof m.content === 'string')) return value.messages as ConversationMessage[] } catch { /* start fresh */ }
  return []
}
export function saveTranscript(language: LunaLanguage, messages: ConversationMessage[]) { try { localStorage.setItem(transcriptKey(language), JSON.stringify({ version: VERSION, messages })) } catch { /* storage is optional */ } }
export function hasAIProgress(language: LunaLanguage) { return loadTranscript(language).length > 0 }
