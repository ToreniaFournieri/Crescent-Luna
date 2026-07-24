import { useEffect, useRef, useState } from 'react'
import englishStory from './generated/story-en.json'
import japaneseStory from './generated/story-ja.json'
import { Composer } from './components/Composer'
import { MessageBubble } from './components/MessageBubble'
import { SuggestionBar } from './components/SuggestionBar'
import { TypingIndicator } from './components/TypingIndicator'
import { choose, restart, send } from './runtime/engine'
import { localizeStoryState } from './runtime/localization'
import { loadStoryState, saveStoryState } from './runtime/persistence'
import type { CompiledStory, RuntimeChoice } from './types/story'

type Language = 'en' | 'ja'

const stories: Record<Language, CompiledStory> = {
  en: englishStory as CompiledStory,
  ja: japaneseStory as CompiledStory,
}

const copy = {
  en: { back: 'Back', online: 'Story online', ending: 'ENDING', continued: 'TO BE CONTINUED', escape: 'ESCAPE FROM LUNA', restart: 'Restart Story' },
  ja: { back: '戻る', online: 'ストーリー・オンライン', ending: 'エンディング', continued: '次回へ続く', escape: 'ルナからの脱出', restart: '最初から読む' },
} satisfies Record<Language, Record<string, string>>

const initialLanguage = (): Language => {
  const saved = window.localStorage.getItem('crescent-luna-language')
  if (saved === 'en' || saved === 'ja') return saved
  return window.navigator.language.toLowerCase().startsWith('ja') ? 'ja' : 'en'
}

export default function App() {
  const [language, setLanguage] = useState<Language>(initialLanguage)
  const story = stories[language]
  const labels = copy[language]
  const [state, setState] = useState(() => loadStoryState(story, language) ?? restart(story))
  const [locked, setLocked] = useState(false)
  const [selected, setSelected] = useState<string | null>(null)
  const [typingSpeaker, setTypingSpeaker] = useState<string | null>(null)
  const bottomRef = useRef<HTMLDivElement>(null)
  const playbackRef = useRef(0)
  const timerRef = useRef<number | null>(null)
  const node = story.nodes[state.nodeId]
  const prompt = node?.kind === 'prompt' ? node : null
  useEffect(() => { bottomRef.current?.scrollIntoView({ behavior: 'smooth' }) }, [state, typingSpeaker])
  useEffect(() => { if (!locked) saveStoryState(story, language, state) }, [language, locked, state, story])
  useEffect(() => () => { if (timerRef.current !== null) window.clearTimeout(timerRef.current) }, [])
  const onChoose = (choice: RuntimeChoice) => { if (locked) return; setLocked(true); setSelected(choice.id); window.setTimeout(() => { setState((old) => choose(old, choice)); setSelected(null); setLocked(false) }, 160) }
  const onUndo = () => { if (locked) return; setState((old) => ({ ...old, completed: null })) }
  const onSend = () => {
    if (!state.completed || locked) return
    setLocked(true)
    const next = send(story, state)
    const newMessages = next.messages.slice(state.messages.length)
    const playerMessage = newMessages[0]
    const replies = newMessages.slice(1)
    const sequence = ++playbackRef.current
    setState({ ...next, messages: [...state.messages, playerMessage] })

    const reveal = (index: number) => {
      if (sequence !== playbackRef.current) return
      if (index >= replies.length) {
        setTypingSpeaker(null)
        setState(next)
        setLocked(false)
        return
      }
      const message = replies[index]
      const opponent = message.speaker !== 'nox' && message.speaker !== 'system'
      setTypingSpeaker(opponent ? message.speaker : null)
      const naturalPause = opponent ? Math.min(1800, 700 + message.text.length * 22) : 650
      timerRef.current = window.setTimeout(() => {
        if (sequence !== playbackRef.current) return
        setTypingSpeaker(null)
        setState((current) => ({ ...current, messages: [...current.messages, message] }))
        reveal(index + 1)
      }, message.delay ?? naturalPause)
    }
    timerRef.current = window.setTimeout(() => reveal(0), 450)
  }
  useEffect(() => { const key = (event: KeyboardEvent) => { if (event.key === 'Enter') onSend() }; window.addEventListener('keydown', key); return () => window.removeEventListener('keydown', key) })
  const stopPlayback = () => { playbackRef.current += 1; if (timerRef.current !== null) window.clearTimeout(timerRef.current); timerRef.current = null; setTypingSpeaker(null) }
  const reset = () => { stopPlayback(); setState(restart(story)); setLocked(false); setSelected(null) }
  const changeLanguage = (nextLanguage: Language) => {
    if (nextLanguage === language) return
    stopPlayback()
    window.localStorage.setItem('crescent-luna-language', nextLanguage)
    const nextStory = stories[nextLanguage]
    setState((current) => localizeStoryState(current, story, nextStory))
    setLanguage(nextLanguage)
    setLocked(false)
    setSelected(null)
  }
  const terminal = !locked && !prompt && !state.ending
  return <main className="stage"><section className="phone" aria-label="Crescent Luna story" lang={language}>
    <header><button aria-label={labels.back}>‹ <span>{labels.back}</span></button><div className="conversation-title"><strong>Crescent Luna</strong><small><i /> {labels.online}</small></div><fieldset className="language-switcher" aria-label="Language"><legend>Language</legend><button type="button" aria-pressed={language === 'en'} onClick={() => changeLanguage('en')}>EN</button><button type="button" aria-pressed={language === 'ja'} onClick={() => changeLanguage('ja')}>日本語</button></fieldset></header>
    <div className="chat" aria-live="polite">{state.messages.map((message) => <MessageBubble key={message.id} message={message} />)}{typingSpeaker && <TypingIndicator speaker={typingSpeaker} />}{state.ending && !locked && <div className="ending"><span>{labels.ending}</span><h2>{state.ending}</h2><button onClick={reset}>↻ {labels.restart}</button></div>}{terminal && <div className="ending"><span>{labels.continued}</span><h2>{labels.escape}</h2><button onClick={reset}>↻ {labels.restart}</button></div>}<div ref={bottomRef} /></div>
    <footer>{prompt && !state.ending && !locked && <SuggestionBar suggestions={state.completed ? [] : prompt.choices} disabled={locked} selected={selected} onSelect={onChoose} />}<Composer text={locked ? '' : state.completed?.text ?? prompt?.draft ?? ''} complete={!locked && Boolean(state.completed)} locked={locked || Boolean(state.ending) || terminal} onUndo={onUndo} onSend={onSend} /><div className="home-indicator" /></footer>
  </section></main>
}
