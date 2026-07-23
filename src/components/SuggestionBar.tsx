import type { Suggestion } from '../types/story'
export function SuggestionBar({ suggestions, disabled, selected, onSelect }: { suggestions: Suggestion[]; disabled: boolean; selected: string | null; onSelect: (s: Suggestion) => void }) {
  return <div className="suggestions" aria-label="Predictive text suggestions">{suggestions.map((s) => <button key={s.id} className={selected === s.id ? 'selected' : ''} disabled={disabled} onClick={() => onSelect(s)}>{s.label}</button>)}</div>
}
