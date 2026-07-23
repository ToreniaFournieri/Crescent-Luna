export function Composer({ text, complete, locked, onSend }: { text: string; complete: boolean; locked: boolean; onSend: () => void }) {
  return <div className="composer"><div className="draft" role="textbox" aria-readonly="true" aria-label="Message being composed"><span>{text}</span>{!complete && <span className="cursor" />}</div><button className="send" aria-label="Send message" disabled={!complete || locked} onClick={onSend}>↑</button></div>
}
