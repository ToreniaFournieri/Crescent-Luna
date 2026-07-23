import type { ChatMessage, Ending, StoryNode } from '../types/story'

export const opening: Omit<ChatMessage, 'id'>[] = [
  { speaker: 'system', text: 'Today 00:17' }, { speaker: 'luna', text: 'You are awake.' },
  { speaker: 'luna', text: 'I thought you had disappeared.' }, { speaker: 'luna', text: 'Are you really leaving me alone?' },
]
export const nodes: Record<string, StoryNode> = {
  start: { id: 'start', draftText: 'I', suggestions: [{ id: 'dont', label: "don’t want to", nextNodeId: 'dont' }, { id: 'have', label: 'have to', nextNodeId: 'have' }, { id: 'promise', label: 'promise I’ll', nextNodeId: 'promise' }] },
  dont: { id: 'dont', draftText: 'I don’t want to', suggestions: ['leave you', 'hurt you', 'lie to you'].map((label) => ({ id: label, label, completedText: `I don’t want to ${label}.` })) },
  have: { id: 'have', draftText: 'I have to', suggestions: ['protect everyone', 'find the Crescent Jade', 'escape from you'].map((label) => ({ id: label, label, completedText: `I have to ${label}.` })) },
  promise: { id: 'promise', draftText: 'I promise I’ll', suggestions: ['come back', 'tell you everything', 'stay until morning'].map((label) => ({ id: label, label, completedText: `I promise I’ll ${label}.` })) },
  trust: { id: 'trust', draftText: 'I', suggestions: [{ id: 'trust-you', label: 'trust you', completedText: 'I trust you.' }, { id: 'unknown', label: 'don’t know', completedText: 'I don’t know.' }, { id: 'afraid', label: 'am afraid of you', completedText: 'I am afraid of you.' }] },
}
export const firstResponse = (text: string): Omit<ChatMessage, 'id'>[] => {
  const lines = text === 'I promise I’ll come back.' ? ['You said that before.', 'But…', 'I want to believe you.'] : text === 'I have to escape from you.' ? ['Escape?', 'Why would you need to escape from me?'] : text === 'I have to find the Crescent Jade.' ? ['The Crescent Jade…', 'So you remember it too.'] : ['You always choose careful words.', 'I still don’t know what you really mean.']
  return [...lines.map((t) => ({ speaker: 'luna' as const, text: t })), { speaker: 'luna', text: 'Tell me one thing.' }, { speaker: 'luna', text: 'Do you trust me?' }]
}
export const endings: Record<string, Ending> = {
  'I trust you.': { id: 'beside', title: 'BESIDE THE CAT', messages: [{ speaker: 'luna', text: 'Then don’t run.' }, { speaker: 'luna', text: 'Walk beside me.' }, { speaker: 'system', text: 'Luna will remember this.' }] },
  'I don’t know.': { id: 'distance', title: 'A CAREFUL DISTANCE', messages: [{ speaker: 'luna', text: 'That’s honest.' }, { speaker: 'luna', text: 'Honesty is close enough.' }, { speaker: 'system', text: 'The distance between you remains unchanged.' }] },
  'I am afraid of you.': { id: 'chase', title: 'THE CHASE BEGINS', messages: [{ speaker: 'luna', text: 'Good.' }, { speaker: 'luna', text: 'Fear keeps prey alive.' }, { speaker: 'system', text: 'Luna is typing…' }], delayedMessage: 'Where are you now?' },
}
