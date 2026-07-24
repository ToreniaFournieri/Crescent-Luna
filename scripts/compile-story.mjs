import { readFile, writeFile, mkdir } from 'node:fs/promises'
import { dirname, relative } from 'node:path'
import { createHash } from 'node:crypto'

const args = process.argv.slice(2)
const check = args[0] === '--check'
const input = args[check ? 1 : 0]
const output = args[check ? 2 : 1]
if (!input || (!check && !output)) throw new Error('usage: compile-story.mjs [--check] <input.story> [output.json]')
const source = await readFile(input, 'utf8')
const lines = source.split(/\r?\n/)
const nodes = [], locations = new Map(), errors = []
let current
const unquote = (value) => { const text = value.trim(); return ((text.startsWith('“') && text.endsWith('”')) || (text.startsWith('"') && text.endsWith('"'))) ? text.slice(1, -1) : text }
const fail = (line, message) => errors.push(`${input}:${line}: ${message}`)
for (let index = 0; index < lines.length; index += 1) {
  const number = index + 1, line = lines[index].trim()
  if (!line || line.startsWith('#')) continue
  const directive = line.match(/^@(scene|prompt|ending)\s+([a-z][a-z0-9_]*)\s*(.*)$/)
  if (directive) {
    const [, kind, id, rest] = directive
    if (locations.has(id)) fail(number, `duplicate node "${id}" (first declared on line ${locations.get(id)})`)
    locations.set(id, number)
    current = kind === 'prompt' ? { kind, id, draft: unquote(rest), choices: [] } : { kind, id, ...(kind === 'ending' ? { title: unquote(rest) } : {}), messages: [], next: null }
    nodes.push(current); continue
  }
  if (!current) { fail(number, 'content appears before the first node'); continue }
  const transition = line.match(/^->\s*([a-z][a-z0-9_]*)$/)
  if (transition) { if (current.kind !== 'scene') fail(number, 'only scenes can have an unconditional transition'); else current.next = transition[1]; continue }
  const choice = line.match(/^[+*]\s*[“"](.+?)[”"]\s*=>\s*[“"](.+?)[”"]\s*->\s*([a-z][a-z0-9_]*)$/)
  if (choice) { if (current.kind !== 'prompt') fail(number, 'choices are only valid in prompts'); else current.choices.push({ id: `${current.id}_${current.choices.length + 1}`, label: choice[1], text: choice[2], next: choice[3] }); continue }
  const message = line.match(/^([a-z][a-z0-9_]*)(?:\s*\[([^\]]+)\])?\s*:\s*(.+)$/i)
  if (message) {
    if (current.kind === 'prompt') fail(number, 'messages are not valid in prompts')
    else { const [, speaker, metadata = '', text] = message; let delay = 0, mode
      for (const item of metadata.split(',').map((part) => part.trim()).filter(Boolean)) { const delayed = item.match(/^delay=(\d+)$/); if (delayed) delay = Number(delayed[1]); else if (/^[a-z]+$/i.test(item)) mode = item; else fail(number, `unsupported metadata "${item}"`) }
      if (delay > 30000) fail(number, 'delay must be between 0 and 30000ms')
      current.messages.push({ speaker: speaker.toLowerCase(), text, ...(mode ? { mode } : {}), ...(delay ? { delay } : {}) }) }
    continue
  }
  fail(number, `unsupported syntax: ${line}`)
}
for (const node of nodes) {
  if (node.kind === 'prompt' && node.choices.length !== 3) fail(locations.get(node.id), `prompt "${node.id}" must have exactly three choices`)
  const targets = node.kind === 'prompt' ? node.choices.map((choice) => choice.next) : node.next ? [node.next] : []
  for (const target of targets) if (!locations.has(target)) fail(locations.get(node.id), `transition to unknown node "${target}"`)
}
if (errors.length) { console.error(errors.join('\n')); process.exit(1) }
const reachable = new Set()
const visit = (id) => { if (reachable.has(id)) return; reachable.add(id); const node = nodes.find((item) => item.id === id); if (!node) return; if (node.kind === 'prompt') node.choices.forEach((choice) => visit(choice.next)); else if (node.next) visit(node.next) }
visit(nodes[0].id)
const unreachable = nodes.filter((node) => !reachable.has(node.id)); if (unreachable.length) console.warn(`warning: unreachable nodes: ${unreachable.map((node) => node.id).join(', ')}`)
const artifact = { formatVersion: 1, storyId: 'crescent-luna', revision: createHash('sha256').update(source).digest('hex').slice(0, 12), entry: nodes[0].id, nodes: Object.fromEntries(nodes.map((node) => [node.id, node])) }
if (!check) { await mkdir(dirname(output), { recursive: true }); await writeFile(output, `${JSON.stringify(artifact, null, 2)}\n`) }
console.log(`${check ? 'validated' : 'compiled'} ${nodes.length} nodes from ${relative(process.cwd(), input)}${check ? '' : ` to ${relative(process.cwd(), output)}`}`)
