import { useState } from 'react'
import { hasAIProgress } from './ai/persistence'
import { ClassicStory } from './components/ClassicStory'
import { AIStory } from './components/AIStory'

type Mode = 'classic' | 'ai' | 'select'
const savedMode = (): Mode => { const value = localStorage.getItem('crescent-luna-mode'); return value === 'classic' || value === 'ai' ? value : 'select' }
export default function App() {
  const [mode, setMode] = useState<Mode>(savedMode)
  const choose = (next: Exclude<Mode, 'select'>) => { localStorage.setItem('crescent-luna-mode', next); setMode(next) }
  if (mode === 'classic') return <main className="stage"><ClassicStory onBack={() => setMode('select')} /></main>
  if (mode === 'ai') return <main className="stage"><AIStory onBack={() => setMode('select')} /></main>
  const language = localStorage.getItem('crescent-luna-language') === 'ja' ? 'ja' : 'en'
  return <main className="stage"><section className="phone story-select" aria-label="Choose a story"><div className="story-select-inner"><p className="eyebrow">CRESCENT LUNA</p><h1>{language === 'ja' ? '物語を選ぶ' : 'Choose your story'}</h1><button type="button" onClick={() => choose('classic')}><span>I</span><strong>Story I — Crescent Luna</strong><small>{language === 'ja' ? '予測テキストで進む原作ストーリー' : 'The authored predictive-text story'}</small><em>{language === 'ja' ? '保存済みの進行状況' : 'Saved progress available'}</em></button><button type="button" onClick={() => choose('ai')}><span>II</span><strong>Story II — Luna AI</strong><small>{language === 'ja' ? 'ローカルモデルでルナと自由に会話' : 'A free-form conversation with Luna'}</small><em>LOCAL · EXPERIMENTAL · {hasAIProgress(language) ? 'SAVED' : 'NEW'}</em></button><p className="connection-note">LM Studio connection is checked when Story II opens.</p></div></section></main>
}
