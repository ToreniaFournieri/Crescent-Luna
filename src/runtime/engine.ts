import type { ChatMessage, CompiledStory, RuntimeChoice } from '../types/story'
export interface StoryState { nodeId: string; messages: ChatMessage[]; completed: RuntimeChoice | null; ending: string | null }
let messageId = 0
const stamp = (messages: Omit<ChatMessage, 'id'>[]) => messages.map((message) => ({ ...message, id: `message-${messageId++}` }))
export const createState = (story: CompiledStory): StoryState => ({ nodeId: story.entry, messages: [], completed: null, ending: null })
export function enter(story: CompiledStory, state: StoryState): StoryState {
  let next = state; const seen = new Set<string>()
  while (true) { const node = story.nodes[next.nodeId]; if (!node || node.kind === 'prompt') return next; if (seen.has(node.id)) throw new Error(`Automatic story cycle at ${node.id}`); seen.add(node.id); next = { ...next, messages: [...next.messages, ...stamp(node.messages)], ending: node.kind === 'ending' ? node.title : next.ending }; if (!node.next) return next; next = { ...next, nodeId: node.next } }
}
export const choose = (state: StoryState, choice: RuntimeChoice): StoryState => ({ ...state, completed: choice })
export function send(story: CompiledStory, state: StoryState): StoryState { if (!state.completed) return state; const choice = state.completed; return enter(story, { ...state, nodeId: choice.next, completed: null, messages: [...state.messages, ...stamp([{ speaker: 'nox', text: choice.text }])] }) }
export function restart(story: CompiledStory) { messageId = 0; return enter(story, createState(story)) }
