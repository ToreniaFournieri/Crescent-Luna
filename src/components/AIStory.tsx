import { useCallback, useEffect, useRef, useState } from 'react'
import { createCompletion, discoverModels, LMStudioError, type ConversationMessage, type ModelInfo } from '../ai/lmStudio'
import { loadAISettings, loadTranscript, saveAISettings, saveTranscript, type AISettings } from '../ai/persistence'
import { lunaPrompts, type LunaLanguage } from '../ai/prompts'
import { MessageBubble } from './MessageBubble'
import { TypingIndicator } from './TypingIndicator'

const ui = {
  en: { back: 'Stories', online: 'Luna AI online', connecting: 'Connecting…', generating: 'Generating…', offline: 'LM Studio offline', stopped: 'Request stopped', placeholder: 'Message Luna…', send: 'Send', stop: 'Stop', retry: 'Retry', newChat: 'New conversation', settings: 'Connection settings', endpoint: 'LM Studio server URL', model: 'Loaded model', reconnect: 'Reconnect', noModels: 'LM Studio is reachable, but no model is loaded. Load a model, then reconnect.', privacy: 'Paste the “Reachable at” URL shown by LM Studio; /v1 is added automatically. Conversation content is sent to this endpoint.', confirm: 'Clear this Luna AI conversation? Story I will not be changed.' },
  ja: { back: 'ストーリー', online: 'Luna AI オンライン', connecting: '接続中…', generating: '生成中…', offline: 'LM Studio オフライン', stopped: 'リクエスト停止', placeholder: 'ルナにメッセージ…', send: '送信', stop: '停止', retry: '再試行', newChat: '新しい会話', settings: '接続設定', endpoint: 'LM Studio サーバーURL', model: '読み込み済みモデル', reconnect: '再接続', noModels: 'LM Studioには接続できましたが、モデルがありません。モデルを読み込んで再接続してください。', privacy: 'LM Studioの「Reachable at」に表示されるURLを貼り付けてください。/v1は自動的に追加されます。会話内容はこのエンドポイントへ送信されます。', confirm: 'Luna AIの会話を消去しますか？ストーリーIは変更されません。' },
}

type Status = 'connecting' | 'online' | 'generating' | 'offline' | 'stopped'
function friendlyError(error: unknown, language: LunaLanguage) {
  const cors = language === 'ja' ? 'サーバー、URL、LM StudioのCORS設定を確認してください。HTTPSページではHTTPのlocalhost接続がブラウザーに拒否される場合があります。' : 'Check the server, URL, and LM Studio CORS settings. On an HTTPS page, the browser may block an HTTP localhost connection.'
  if (error instanceof LMStudioError && error.kind === 'http') return `${error.message} Check that the selected model is still loaded.`
  if (error instanceof LMStudioError && (error.kind === 'payload' || error.kind === 'url')) return error.message
  return cors
}

export function AIStory({ onBack }: { onBack: () => void }) {
  const [language, setLanguage] = useState<LunaLanguage>(() => localStorage.getItem('crescent-luna-language') === 'ja' ? 'ja' : 'en')
  const [messages, setMessages] = useState<ConversationMessage[]>(() => loadTranscript(language))
  const [settings, setSettings] = useState(loadAISettings)
  const [models, setModels] = useState<ModelInfo[]>([])
  const [draft, setDraft] = useState('')
  const [status, setStatus] = useState<Status>('connecting')
  const [error, setError] = useState('')
  const [retryable, setRetryable] = useState(false)
  const controller = useRef<AbortController | null>(null)
  const bottom = useRef<HTMLDivElement>(null)
  const labels = ui[language]

  const connect = useCallback(async (configuration: AISettings) => {
    controller.current?.abort(); const active = new AbortController(); controller.current = active
    setStatus('connecting'); setError('')
    try {
      const found = await discoverModels(configuration.baseUrl, active.signal)
      if (active.signal.aborted) return
      setModels(found)
      if (!found.length) { setStatus('offline'); setError(ui[language].noModels); return }
      const selected = found.some((m) => m.id === configuration.model) ? configuration.model : found[0].id
      const next = { ...configuration, model: selected }
      if (selected !== configuration.model) setSettings(next)
      saveAISettings(next); setStatus('online')
    } catch (cause) { if (!active.signal.aborted) { setStatus('offline'); setError(friendlyError(cause, language)) } }
  }, [language])
  useEffect(() => { const initial = loadAISettings(); const timer = window.setTimeout(() => void connect(initial), 0); return () => { window.clearTimeout(timer); controller.current?.abort() } }, [connect])
  useEffect(() => { bottom.current?.scrollIntoView({ behavior: 'smooth' }) }, [messages, status])

  const generate = async (conversation: ConversationMessage[]) => {
    if (!settings.model) { setError(labels.noModels); return }
    const active = new AbortController(); controller.current = active; setStatus('generating'); setError(''); setRetryable(false)
    try {
      const content = await createCompletion({ baseUrl: settings.baseUrl, model: settings.model, systemPrompt: lunaPrompts[language], messages: conversation, signal: active.signal })
      if (active.signal.aborted) return
      const completed = [...conversation, { role: 'assistant' as const, content }]; setMessages(completed); saveTranscript(language, completed); setStatus('online')
    } catch (cause) {
      if (active.signal.aborted) return
      setStatus('offline'); setError(friendlyError(cause, language)); setRetryable(true)
    }
  }
  const send = () => {
    const content = draft.trim(); if (!content || status === 'generating') return
    const next = [...messages, { role: 'user' as const, content }]; setMessages(next); setDraft(''); void generate(next)
  }
  const stop = () => { controller.current?.abort(); setStatus('stopped'); setError(''); setRetryable(true) }
  const retry = () => { if (messages.at(-1)?.role === 'user') void generate(messages) }
  const reset = () => { if (!window.confirm(labels.confirm)) return; controller.current?.abort(); setMessages([]); saveTranscript(language, []); setDraft(''); setError(''); setRetryable(false); setStatus(models.length ? 'online' : 'offline') }
  const changeLanguage = (next: LunaLanguage) => { if (next === language) return; controller.current?.abort(); saveTranscript(language, messages); localStorage.setItem('crescent-luna-language', next); setLanguage(next); setMessages(loadTranscript(next)); setStatus('connecting'); setError('') }
  const statusText = labels[status]
  return <section className="phone ai-story" aria-label="Luna AI story" lang={language}>
    <header><button type="button" onClick={() => { controller.current?.abort(); onBack() }}>‹ <span>{labels.back}</span></button><div className="conversation-title"><strong>Luna AI <em>LOCAL · EXPERIMENTAL</em></strong><small><i className={status} /> {statusText}</small></div><fieldset className="language-switcher" aria-label="Language"><legend>Language</legend><button type="button" aria-pressed={language === 'en'} onClick={() => changeLanguage('en')}>EN</button><button type="button" aria-pressed={language === 'ja'} onClick={() => changeLanguage('ja')}>日本語</button></fieldset></header>
    <div className="chat" aria-live="polite">{messages.length === 0 && <p className="ai-intro">{language === 'ja' ? '翡翠が温かくなり、秘密の通信路が開いた。ルナは向こう側にいる。' : 'The Jade warms in your hand. A private channel opens—and Luna is on the other side.'}</p>}{messages.map((message, index) => <MessageBubble key={`${index}-${message.role}`} message={{ id: String(index), speaker: message.role === 'user' ? 'nox' : 'luna', text: message.content }} />)}{status === 'generating' && <TypingIndicator speaker="luna" />}{error && <div className="ai-error" role="alert">{error}{retryable && <button type="button" onClick={retry}>{labels.retry}</button>}</div>}<div ref={bottom} /></div>
    <footer><details className="ai-settings"><summary>{labels.settings}</summary><label>{labels.endpoint}<input value={settings.baseUrl} disabled={status === 'generating'} onChange={(e) => { const next = { ...settings, baseUrl: e.target.value }; setSettings(next); saveAISettings(next) }} /></label><label>{labels.model}<select value={settings.model} disabled={!models.length || status === 'generating'} onChange={(e) => { const next = { ...settings, model: e.target.value }; setSettings(next); saveAISettings(next) }}>{models.map((m) => <option key={m.id} value={m.id}>{m.id}</option>)}</select></label><p>{labels.privacy}</p><div><button type="button" onClick={() => void connect(settings)} disabled={status === 'generating'}>{labels.reconnect}</button><button type="button" onClick={reset}>{labels.newChat}</button></div></details><div className="ai-composer"><textarea aria-label={labels.placeholder} placeholder={labels.placeholder} value={draft} disabled={status === 'generating'} rows={1} onChange={(e) => setDraft(e.target.value)} onKeyDown={(e) => { if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); send() } }} />{status === 'generating' ? <button className="stop" type="button" onClick={stop}>{labels.stop}</button> : <button className="send" type="button" aria-label={labels.send} disabled={!draft.trim() || !settings.model} onClick={send}>↑</button>}</div><div className="home-indicator" /></footer>
  </section>
}
