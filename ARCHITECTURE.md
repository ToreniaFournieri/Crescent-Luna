# Story Architecture

## Decision

Story authors and the game runtime should use different representations of the
same story:

```text
story source (author-written)
          │
          ▼
  parser + validator
          │
          ▼
compiled story artifact (generated)
          │
          ▼
  small runtime engine ───► React view
```

The author-written files are the source of truth. The compiled artifact is
generated, deterministic, and never edited by hand. React renders runtime
state, but does not contain branching rules or story-specific conditions.

This separation keeps prose reviewable while allowing the runtime to use
stable numeric references, indexed lookups, and precomputed transitions.

## 1. Authoring format

Start with a small, project-specific text format rather than exposing the
runtime TypeScript structure to writers. Markdown-like blocks make dialogue
read naturally in diffs, while explicit directives keep parsing predictable.

The complete current conversation is available in English and Japanese as
[`story/Crescent-Luna-en.story`](story/Crescent-Luna-en.story) and
[`story/Crescent-Luna-ja.story`](story/Crescent-Luna-ja.story). A shortened
source file looks like this:

```text
@scene opening
system: Today 00:17
luna: You are awake.
luna: I thought you had disappeared.
luna: Are you really leaving me alone?
-> first_reply

@prompt first_reply "I"
+ "don’t want to" -> reluctant
+ "have to" -> duty
+ "promise I’ll" -> promise

@prompt duty "I have to"
+ "protect everyone" => "I have to protect everyone." -> generic_reply
+ "find the Crescent Jade" => "I have to find the Crescent Jade." -> jade_reply
+ "escape from you" => "I have to escape from you." -> escape_reply

@scene jade_reply
luna: The Crescent Jade…
luna: So you remember it too.
-> trust_question
```

The first version should deliberately support only the mechanics the game
already has:

- `@scene`, `@prompt`, and `@ending` blocks;
- `luna`, `player`, and `system` dialogue;
- an unconditional `-> target` transition;
- predictive suggestions with an optional completed sentence; and
- optional delays expressed as metadata, not embedded JavaScript.

Delayed dialogue uses `speaker [delay=milliseconds]: text`, as demonstrated by
the final line of the chase ending in the sample.

Avoid a general-purpose expression language initially. When story variables
are needed, add a small declarative condition/effect syntax with an explicit
schema. This prevents authored content from becoming executable application
code.

### Source organization

Use one file per scene or chapter once the story grows:

```text
story/
├── manifest.story
├── chapter-01/
│   ├── opening.story
│   └── luna.story
└── endings/
    └── chapter-01.story
```

IDs must be globally unique, stable, lowercase `snake_case` identifiers. Text
can change without invalidating saves, analytics, or tests. The manifest owns
the entry point and source-file order; filesystem ordering must not affect the
build.

## 2. Compiler boundary

Add a build-time compiler (for example, `scripts/compile-story.ts`) with four
clear phases:

1. **Parse** source files into an authoring AST and retain file/line locations.
2. **Validate** the complete graph and report all actionable errors together.
3. **Normalize** author conveniences into a minimal runtime model.
4. **Emit** a versioned JSON or TypeScript artifact and an optional debug map.

The compiler should reject:

- duplicate or missing node IDs;
- transitions to unknown nodes;
- unreachable nodes (warning at first, error in CI later);
- prompts with no choices or an invalid number of predictive suggestions;
- choices that cannot eventually complete a message;
- endings with outgoing transitions;
- unsupported speakers, directives, or metadata;
- invalid delay ranges; and
- accidental transition-only cycles with no player interaction or ending.

Diagnostics should cite the source path and line, never generated output. A
`story:check` command should parse and validate without writing files, while
`story:build` should produce the artifact. CI should run the check and also
verify that regeneration leaves the working tree unchanged.

## 3. Compiled runtime model

The emitted model should favor direct lookup and a small discriminated union:

```ts
type RuntimeNode =
  | { kind: 'sequence'; messages: RuntimeMessage[]; next: NodeIndex }
  | { kind: 'prompt'; draft: StringIndex; choices: RuntimeChoice[] }
  | { kind: 'ending'; title: StringIndex; messages: RuntimeMessage[] }

interface CompiledStory {
  formatVersion: 1
  storyId: string
  revision: string
  entry: NodeIndex
  strings: string[]
  nodes: RuntimeNode[]
}
```

During compilation, symbolic IDs become array indexes, repeated strings may be
interned, response selection becomes explicit graph edges, and defaults are
resolved. Keep a development-only map from indexes back to source IDs and
locations for diagnostics. Optimization should remain modest until profiling
shows that string interning or binary encoding is worthwhile; versioned JSON
is inspectable, cacheable, and likely sufficient for this game's size.

Generated artifacts should live under `src/generated/` and carry a prominent
“do not edit” header. They should be committed so production builds do not
need a custom loader, but their deterministic output must be enforced.

## 4. Runtime responsibilities

Create a framework-independent story engine. Given a compiled story and an
event, it returns the next immutable state plus declarative effects:

```ts
type StoryEvent =
  | { type: 'START' }
  | { type: 'CHOOSE'; choice: number }
  | { type: 'SEND' }
  | { type: 'ADVANCE' }
  | { type: 'RESTART' }
```

The engine owns the current node, draft/completed player text, transcript,
variables, and ending state. It does not call timers, touch the DOM, or import
React. Effects such as `showTyping`, `wait`, `appendMessages`, and
`persistCheckpoint` are interpreted by an application controller. This makes
transitions deterministic and allows an entire story path to be tested without
rendering components or waiting in real time.

React remains responsible for presentation and accessibility. It subscribes
to engine state, dispatches player events, interprets UI effects, and renders
the chat. Story content must not be selected by comparing rendered sentence
text; choices follow compiled edges, so punctuation or localization changes
cannot alter behavior.

## 5. Save and compatibility strategy

Even before persistence is implemented, include `formatVersion`, `storyId`,
and `revision` in artifacts. Future saves should store stable source node IDs
and named choice IDs rather than compiled indexes, because indexes can change
between builds. On load, a migration layer can resolve stable IDs into the
current artifact or deliberately reject an incompatible revision.

Localization should be introduced by assigning stable text keys during
compilation and emitting locale-specific string tables. It should not require
duplicating the story graph.

## 6. Testing layers

- **Parser tests:** syntax, escaping, Unicode punctuation, comments, and source
  locations.
- **Validator tests:** broken references, duplicate IDs, reachability, cycles,
  and incomplete prompts.
- **Golden compiler tests:** small source fixtures compile to stable snapshots.
- **Engine tests:** feed events synchronously and assert state/effects for every
  branch.
- **Graph coverage tests:** enumerate reachable paths and prove each ending can
  be reached.
- **UI tests:** keep a small number for rendering, input locking, restart, and
  accessibility; do not retest branching logic through React.

## 7. Incremental migration plan

1. **Define behavior with tests.** Add engine-level tests around the current
   two-decision story before changing its representation.
2. **Extract a pure engine.** Move branching and progression out of `App.tsx`,
   still consuming the existing TypeScript story data.
3. **Specify the grammar.** Write a formal grammar and representative fixtures
   for every currently used feature. Decide escaping and multiline rules
   before implementing the parser.
4. **Build parser and validator.** Add `story:check`, useful source diagnostics,
   graph validation, and unit tests.
5. **Compile the current story.** Re-author it in `.story` files, generate a
   versioned artifact, and run the same engine tests against it.
6. **Switch the app import.** Load only generated data at runtime, remove the
   handwritten runtime story object, and verify every existing path.
7. **Add author tooling.** Provide formatting, graph visualization, and editor
   syntax support only after real author feedback identifies the pain points.

Each step should be independently shippable. In particular, extracting the
engine before inventing the syntax prevents parser design from being coupled
to React state and timers.

## 8. Non-goals for the first iteration

- Executing JavaScript from story files.
- A visual node editor.
- A binary story format.
- Hot migration of arbitrary old saves.
- A full scripting language or arbitrary boolean expressions.
- Premature compression of a story small enough to ship as readable JSON.

The key optimization is the boundary itself: writers work with narrative text
and stable names, while the application executes a validated, explicit graph.
