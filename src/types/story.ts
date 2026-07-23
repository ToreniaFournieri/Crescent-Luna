export type Speaker = 'player' | 'luna' | 'system'
export interface ChatMessage { id: string; speaker: Speaker; text: string }
export interface Suggestion { id: string; label: string; nextNodeId?: string; completedText?: string }
export interface StoryNode { id: string; draftText: string; suggestions: Suggestion[] }
export interface Ending { id: string; title: string; messages: Omit<ChatMessage, 'id'>[]; delayedMessage?: string }
