import type { ChatMessage, CompiledStory, MessageSource, RuntimeChoice, RuntimeMessage } from '../types/story'
import type { StoryState } from './engine'

const signature = (message: RuntimeMessage) => JSON.stringify([message.speaker, message.text, message.mode ?? '', message.delay ?? null])

function findSource(story: CompiledStory, message: ChatMessage): MessageSource | null {
  if (message.source) return message.source
  const wanted = signature(message)
  for (const node of Object.values(story.nodes)) {
    if (node.kind !== 'prompt') {
      const messageIndex = node.messages.findIndex((candidate) => signature(candidate) === wanted)
      if (messageIndex !== -1) return { kind: 'node', nodeId: node.id, messageIndex }
    } else {
      const choice = node.choices.find((candidate) => signature({ speaker: 'nox', text: candidate.text }) === wanted)
      if (choice) return { kind: 'choice', nodeId: node.id, choiceId: choice.id }
    }
  }
  return null
}

function localizeMessage(message: ChatMessage, sourceStory: CompiledStory, targetStory: CompiledStory): ChatMessage {
  const source = findSource(sourceStory, message)
  if (!source) return message
  const node = targetStory.nodes[source.nodeId]
  let localized: RuntimeMessage | undefined
  if (source.kind === 'node' && node?.kind !== 'prompt') localized = node?.messages[source.messageIndex]
  if (source.kind === 'choice' && node?.kind === 'prompt') {
    const choice = node.choices.find((candidate) => candidate.id === source.choiceId)
    if (choice) localized = { speaker: 'nox', text: choice.text }
  }
  return localized ? { ...localized, id: message.id, source } : message
}

export function localizeStoryState(state: StoryState, sourceStory: CompiledStory, targetStory: CompiledStory): StoryState {
  const targetNode = targetStory.nodes[state.nodeId]
  let completed: RuntimeChoice | null = null
  if (state.completed && targetNode?.kind === 'prompt') {
    completed = targetNode.choices.find((choice) => choice.id === state.completed?.id) ?? null
  }
  return {
    nodeId: state.nodeId,
    messages: state.messages.map((message) => localizeMessage(message, sourceStory, targetStory)),
    completed,
    ending: state.ending && targetNode?.kind === 'ending' ? targetNode.title : null,
  }
}
