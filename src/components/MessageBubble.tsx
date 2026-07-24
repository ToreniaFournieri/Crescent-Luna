import type { ChatMessage } from '../types/story'
export function MessageBubble({ message }: { message: ChatMessage }) {
  if (message.speaker === 'system') return <p className="system-message">{message.text}</p>
  const player = message.speaker === 'nox'
  return <div className={`message-row ${player ? 'player' : 'luna'} ${message.mode ?? ''}`}><div className="bubble"><small>{message.speaker}</small>{message.text}</div></div>
}
