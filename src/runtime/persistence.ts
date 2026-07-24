import type { CompiledStory, RuntimeChoice } from '../types/story'
import type { StoryState } from './engine'

const SAVE_VERSION = 1
const KEY_PREFIX = 'crescent-luna-save'

interface StoredStoryState {
  saveVersion: typeof SAVE_VERSION
  formatVersion: number
  storyId: string
  revision: string
  nodeId: string
  messages: StoryState['messages']
  completedChoiceId: string | null
  ending: string | null
}

const storageKey = (story: CompiledStory, slot: string) => `${KEY_PREFIX}:${story.storyId}:${slot}`

const isStoredState = (value: unknown): value is StoredStoryState => {
  if (!value || typeof value !== 'object') return false
  const save = value as Partial<StoredStoryState>
  return save.saveVersion === SAVE_VERSION
    && typeof save.formatVersion === 'number'
    && typeof save.storyId === 'string'
    && typeof save.revision === 'string'
    && typeof save.nodeId === 'string'
    && Array.isArray(save.messages)
    && (save.completedChoiceId === null || typeof save.completedChoiceId === 'string')
    && (save.ending === null || typeof save.ending === 'string')
    && save.messages.every((message) => message
      && typeof message === 'object'
      && typeof message.id === 'string'
      && typeof message.speaker === 'string'
      && typeof message.text === 'string')
}

export function loadStoryState(story: CompiledStory, slot: string): StoryState | null {
  try {
    const raw = window.localStorage.getItem(storageKey(story, slot))
    if (!raw) return null
    const save: unknown = JSON.parse(raw)
    if (!isStoredState(save)
      || save.formatVersion !== story.formatVersion
      || save.storyId !== story.storyId
      || save.revision !== story.revision) return null

    const node = story.nodes[save.nodeId]
    if (!node) return null
    let completed: RuntimeChoice | null = null
    if (save.completedChoiceId !== null) {
      if (node.kind !== 'prompt') return null
      completed = node.choices.find((choice) => choice.id === save.completedChoiceId) ?? null
      if (!completed) return null
    }
    if (save.ending !== null && node.kind !== 'ending') return null
    return { nodeId: save.nodeId, messages: save.messages, completed, ending: save.ending }
  } catch {
    return null
  }
}

export function saveStoryState(story: CompiledStory, slot: string, state: StoryState): void {
  const save: StoredStoryState = {
    saveVersion: SAVE_VERSION,
    formatVersion: story.formatVersion,
    storyId: story.storyId,
    revision: story.revision,
    nodeId: state.nodeId,
    messages: state.messages,
    completedChoiceId: state.completed?.id ?? null,
    ending: state.ending,
  }
  try {
    window.localStorage.setItem(storageKey(story, slot), JSON.stringify(save))
  } catch {
    // The story remains playable when storage is disabled or full.
  }
}
