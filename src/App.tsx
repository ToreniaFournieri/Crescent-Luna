import { useEffect, useRef, useState } from 'react'
import compiled from './generated/story.json'
import { Composer } from './components/Composer'
import { MessageBubble } from './components/MessageBubble'
import { SuggestionBar } from './components/SuggestionBar'
import { choose, restart, send } from './runtime/engine'
import type { CompiledStory, RuntimeChoice } from './types/story'

const story = compiled as CompiledStory
export default function App() {
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
  const terminal = !prompt && !state.ending
  return <main className="stage"><section className="phone" aria-label="Crescent Luna story">
    <header><button aria-label="Back">‹ <span>Back</span></button><div><strong>Crescent Luna</strong><small><i /> Story online</small></div><button aria-label="Conversation menu">•••</button></header>
    <div className="chat" aria-live="polite">{state.messages.map((message) => <MessageBubble key={message.id} message={message} />)}{state.ending && <div className="ending"><span>ENDING</span><h2>{state.ending}</h2><button onClick={reset}>↻ Restart Story</button></div>}{terminal && <div className="ending"><span>TO BE CONTINUED</span><h2>ESCAPE FROM LUNA</h2><button onClick={reset}>↻ Restart Story</button></div>}<div ref={bottomRef} /></div>
    <footer>{prompt && !state.ending && <SuggestionBar suggestions={state.completed ? [] : prompt.choices} disabled={locked} selected={selected} onSelect={onChoose} />}<Composer text={state.completed?.text ?? prompt?.draft ?? ''} complete={Boolean(state.completed)} locked={locked || Boolean(state.ending) || terminal} onUndo={onUndo} onSend={onSend} /><div className="home-indicator" /></footer>
  </section></main>
}
