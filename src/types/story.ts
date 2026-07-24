export interface RuntimeMessage { speaker: string; text: string; mode?: string; delay?: number }
export interface RuntimeChoice { id: string; label: string; text: string; next: string }
export type RuntimeNode =
  | { kind: 'scene'; id: string; messages: RuntimeMessage[]; next: string | null }
  | { kind: 'prompt'; id: string; draft: string; choices: RuntimeChoice[] }
  | { kind: 'ending'; id: string; title: string; messages: RuntimeMessage[]; next: null }
export interface CompiledStory { formatVersion: 1; storyId: string; revision: string; entry: string; nodes: Record<string, RuntimeNode> }
export type MessageSource =
  | { kind: 'node'; nodeId: string; messageIndex: number }
  | { kind: 'choice'; nodeId: string; choiceId: string }
export interface ChatMessage extends RuntimeMessage { id: string; source?: MessageSource }
