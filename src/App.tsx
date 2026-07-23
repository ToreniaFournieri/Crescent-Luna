import { useCallback, useEffect, useRef, useState } from 'react'
import { Composer } from './components/Composer'
import { MessageBubble } from './components/MessageBubble'
import { SuggestionBar } from './components/SuggestionBar'
import { TypingIndicator } from './components/TypingIndicator'
import { endings, firstResponse, nodes, opening } from './data/story'
import type { ChatMessage, Ending, Suggestion } from './types/story'

const wait = (ms: number) => new Promise((resolve) => window.setTimeout(resolve, ms))
let id = 0
const stamp = (messages: Omit<ChatMessage, 'id'>[]) => messages.map((message) => ({ ...message, id: `message-${id++}` }))

export default function App() {
  const [messages, setMessages] = useState<ChatMessage[]>(() => stamp(opening))
  const [nodeId, setNodeId] = useState('start')
  const [complete, setComplete] = useState<string | null>(null)
  const [typing, setTyping] = useState(false)
  const [locked, setLocked] = useState(false)
  const [selected, setSelected] = useState<string | null>(null)
  const [decision, setDecision] = useState(1)
  const [ending, setEnding] = useState<Ending | null>(null)
  const bottomRef = useRef<HTMLDivElement>(null)
  const runRef = useRef(0)
  const node = nodes[nodeId]

  useEffect(() => { bottomRef.current?.scrollIntoView({ behavior: 'smooth' }) }, [messages, typing, nodeId, complete, ending])
  const add = useCallback((items: Omit<ChatMessage, 'id'>[]) => setMessages((old) => [...old, ...stamp(items)]), [])
  const choose = async (suggestion: Suggestion) => {
    if (locked) return
    setLocked(true); setSelected(suggestion.id)
    await wait(180)
    if (suggestion.nextNodeId) setNodeId(suggestion.nextNodeId)
    if (suggestion.completedText) setComplete(suggestion.completedText)
    setSelected(null); setLocked(false)
  }
  const respond = async (text: string, token: number) => {
    await wait(380); if (runRef.current !== token) return
    setTyping(true); await wait(980); if (runRef.current !== token) return
    setTyping(false)
    if (decision === 1) { add(firstResponse(text)); setDecision(2); setNodeId('trust'); setLocked(false); return }
    const result = endings[text]; add(result.messages); setEnding(result)
    if (result.delayedMessage) { await wait(2000); if (runRef.current === token) add([{ speaker: 'luna', text: result.delayedMessage }]) }
    setLocked(false)
  }
  const send = useCallback(() => {
    if (!complete || locked) return
    const text = complete; const token = runRef.current
    add([{ speaker: 'player', text }]); setComplete(null); setLocked(true); void respond(text, token)
  }, [add, complete, locked, decision])
  useEffect(() => {
    const key = (event: KeyboardEvent) => { if (event.key === 'Enter') send() }
    window.addEventListener('keydown', key); return () => window.removeEventListener('keydown', key)
  }, [send])
  const restart = () => { runRef.current += 1; id = 0; setMessages(stamp(opening)); setNodeId('start'); setComplete(null); setTyping(false); setLocked(false); setSelected(null); setDecision(1); setEnding(null) }

  return <main className="stage"><section className="phone" aria-label="Conversation with Luna">
    <header><button aria-label="Back">‹ <span>Back</span></button><div><strong>Luna</strong><small><i /> Online</small></div><button aria-label="Conversation menu">•••</button></header>
    <div className="chat" aria-live="polite">{messages.map((message) => <MessageBubble key={message.id} message={message} />)}{typing && <TypingIndicator />}{ending && <div className="ending"><span>ENDING</span><h2>{ending.title}</h2><button onClick={restart}>↻ Restart Conversation</button></div>}<div ref={bottomRef} /></div>
    <footer>{!ending && <SuggestionBar suggestions={complete || (locked && typing) ? [] : node.suggestions} disabled={locked} selected={selected} onSelect={choose} />}<Composer text={complete ?? node.draftText} complete={Boolean(complete)} locked={locked} onSend={send} /><div className="home-indicator" /></footer>
  </section></main>
}
