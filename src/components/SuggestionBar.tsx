import type { RuntimeChoice } from '../types/story'
export function SuggestionBar({ suggestions, disabled, selected, onSelect }: { suggestions: RuntimeChoice[]; disabled: boolean; selected: string | null; onSelect: (s: RuntimeChoice) => void }) {
  return <div className="suggestions" aria-label="Predictive text suggestions">{suggestions.map((s) => <button key={s.id} className={selected === s.id ? 'selected' : ''} disabled={disabled} onClick={() => onSelect(s)}>{s.label}</button>)}</div>
}
