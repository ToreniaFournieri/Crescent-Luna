import { useEffect, useRef, useState } from 'react'
import englishStory from './generated/story-en.json'
import japaneseStory from './generated/story-ja.json'
import { Composer } from './components/Composer'
import { MessageBubble } from './components/MessageBubble'
import { SuggestionBar } from './components/SuggestionBar'
import { choose, restart, send } from './runtime/engine'
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
  const [state, setState] = useState(() => restart(story))
  const [locked, setLocked] = useState(false)
  const [selected, setSelected] = useState<string | null>(null)
  const bottomRef = useRef<HTMLDivElement>(null)
  const node = story.nodes[state.nodeId]
  const prompt = node?.kind === 'prompt' ? node : null
  useEffect(() => { bottomRef.current?.scrollIntoView({ behavior: 'smooth' }) }, [state])
  const onChoose = (choice: RuntimeChoice) => { if (locked) return; setLocked(true); setSelected(choice.id); window.setTimeout(() => { setState((old) => choose(old, choice)); setSelected(null); setLocked(false) }, 160) }
  const onUndo = () => { if (locked) return; setState((old) => ({ ...old, completed: null })) }
  const onSend = () => { if (!state.completed || locked) return; setLocked(true); window.setTimeout(() => { setState((old) => send(story, old)); setLocked(false) }, 500) }
  useEffect(() => { const key = (event: KeyboardEvent) => { if (event.key === 'Enter') onSend() }; window.addEventListener('keydown', key); return () => window.removeEventListener('keydown', key) })
  const reset = () => { setState(restart(story)); setLocked(false); setSelected(null) }
  const changeLanguage = (nextLanguage: Language) => {
    if (nextLanguage === language) return
    window.localStorage.setItem('crescent-luna-language', nextLanguage)
    setLanguage(nextLanguage)
    setState(restart(stories[nextLanguage]))
    setLocked(false)
    setSelected(null)
  }
  const terminal = !prompt && !state.ending
  return <main className="stage"><section className="phone" aria-label="Crescent Luna story" lang={language}>
    <header><button aria-label={labels.back}>‹ <span>{labels.back}</span></button><div className="conversation-title"><strong>Crescent Luna</strong><small><i /> {labels.online}</small></div><fieldset className="language-switcher" aria-label="Language"><legend>Language</legend><button type="button" aria-pressed={language === 'en'} onClick={() => changeLanguage('en')}>EN</button><button type="button" aria-pressed={language === 'ja'} onClick={() => changeLanguage('ja')}>日本語</button></fieldset></header>
    <div className="chat" aria-live="polite">{state.messages.map((message) => <MessageBubble key={message.id} message={message} />)}{state.ending && <div className="ending"><span>{labels.ending}</span><h2>{state.ending}</h2><button onClick={reset}>↻ {labels.restart}</button></div>}{terminal && <div className="ending"><span>{labels.continued}</span><h2>{labels.escape}</h2><button onClick={reset}>↻ {labels.restart}</button></div>}<div ref={bottomRef} /></div>
    <footer>{prompt && !state.ending && <SuggestionBar suggestions={state.completed ? [] : prompt.choices} disabled={locked} selected={selected} onSelect={onChoose} />}<Composer text={state.completed?.text ?? prompt?.draft ?? ''} complete={Boolean(state.completed)} locked={locked || Boolean(state.ending) || terminal} onUndo={onUndo} onSend={onSend} /><div className="home-indicator" /></footer>
  </section></main>
}
