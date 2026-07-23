import type { ChatMessage } from '../types/story'
export function MessageBubble({ message }: { message: ChatMessage }) {
  if (message.speaker === 'system') return <p className="system-message">{message.text}</p>
  return <div className={`message-row ${message.speaker}`}><div className="bubble">{message.text}</div></div>
}
