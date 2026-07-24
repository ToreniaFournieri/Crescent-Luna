export function TypingIndicator({ speaker }: { speaker: string }) {
  return <div className="message-row luna" role="status" aria-label={`${speaker} is typing`}><div className="bubble typing"><small>{speaker}</small><span><i /><i /><i /></span></div></div>
}
