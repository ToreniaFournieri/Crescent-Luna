# Chat-Based Predictive Text Game — Mock Specification

## 1. Overview

Create a small, browser-based narrative game using React. The entire game is presented inside a single chat interface inspired by the iPhone Messages app.

The player appears to type messages without using a keyboard. Instead, they construct each message by selecting words or phrases from three predictive-text suggestions. Underneath this interaction, the experience is a classical branching gamebook disguised as predictive text input.

> **This document defines the mock only. Runtime implementation is explicitly out of scope for this session.**

## 2. Mock objective

The mock must demonstrate:

- an iPhone Messages-inspired chat interface;
- messages exchanged between the protagonist and Luna;
- a simulated typing indicator;
- three predictive-text suggestions;
- sentence construction through multiple selections;
- branching dialogue based on the completed sentence;
- a short story with approximately two meaningful decisions; and
- a restart function.

The mock does **not** require:

- a server or external API;
- AI-generated dialogue;
- natural-language processing;
- free keyboard input;
- save data;
- sound;
- character portraits;
- multiple screens; or
- complex animations.

## 3. Technology and project organization

Use:

- React;
- TypeScript;
- CSS or Tailwind CSS; and
- local React state only.

The mock must run as a normal browser application. Keep story data separate from UI components. A suggested structure is:

```text
src/
├── App.tsx
├── components/
│   ├── ChatWindow.tsx
│   ├── MessageBubble.tsx
│   ├── TypingIndicator.tsx
│   ├── Composer.tsx
│   └── SuggestionBar.tsx
├── data/
│   └── story.ts
├── types/
│   └── story.ts
└── styles/
    └── chat.css
```

## 4. Screen layout

The application contains one main screen.

### 4.1 Device frame

Display the game in a narrow mobile layout resembling an iPhone screen:

- maximum width: `390px`;
- minimum supported width: `320px`;
- target height: approximately `760px` to `844px`;
- centered on desktop; and
- full width on mobile.

An exact reproduction of iPhone hardware is not required.

### 4.2 Header

The fixed header appears above the scrolling conversation:

```text
‹ Back              Luna              ⋯
                    Online
```

It must include:

- the contact name **Luna**;
- the status **Online** in smaller text;
- a back symbol or button; and
- a menu symbol.

The back and menu controls may be decorative.

### 4.3 Chat history

Messages appear chronologically in the central scrollable area:

- Luna's messages use gray bubbles aligned left;
- player messages use blue bubbles aligned right;
- system messages use small, centered gray text; and
- timestamps are optional.

New content must automatically scroll into view.

Example:

```text
Luna: You are awake.
Luna: I thought you had disappeared.
Player: I had to find the Crescent Jade.
```

### 4.4 Composer

The bottom area resembles the iPhone Messages composer and includes:

- three predictive-text suggestions above the field;
- a read-only, non-editable field showing the sentence under construction;
- a blinking cursor; and
- a send button.

The mobile keyboard must never appear.

## 5. Core interaction

### 5.1 Predictive sentence construction

The player constructs a sentence one suggestion at a time.

Initial state:

```text
Current text: I...
Suggestions: [don't want to] [have to] [promise I'll]
```

After selecting **have to**:

```text
Current text: I have to...
Suggestions: [protect everyone] [find the Crescent Jade] [escape from you]
```

After selecting **find the Crescent Jade**:

```text
Current text: I have to find the Crescent Jade.
Suggestions: none
```

The send button becomes active only when the sentence is complete.

### 5.2 Suggestion behavior

Exactly three suggestion buttons should normally be visible. A suggestion may contain one word, multiple words, punctuation, or a complete final clause.

Selecting a suggestion must:

1. append to or replace the current sentence fragment;
2. update the available suggestions;
3. briefly animate the selected phrase;
4. preserve the unfinished sentence in the composer; and
5. not send automatically unless the story node explicitly requires it.

### 5.3 Sending a message

When the sentence is complete:

1. enable the send button;
2. allow the player to send the message;
3. add it as a blue player bubble;
4. clear the composer;
5. temporarily hide suggestions;
6. show Luna's typing indicator; and
7. display Luna's response before continuing to the next decision.

Recommended configurable timing constants:

- typing indicator begins after `300–500ms`; and
- response appears after `800–1,500ms`.

### 5.4 Incomplete sentences and input locking

The send button remains disabled when:

- the sentence has not reached a valid ending;
- further suggestions are required; or
- Luna's response is being processed.

Lock input during suggestion animation and response processing to prevent rapid duplicate actions.

## 6. Story flow

The mock contains two player messages followed by one of three short endings.

### 6.1 Opening sequence

Display the following sequence automatically:

```text
System: 00:17
Luna: You are awake.
Luna: I thought you had disappeared.
Luna: Are you really leaving me alone?
```

Then activate the first sentence-building interaction.

### 6.2 Decision one

Starting text: `I...`

First suggestions:

1. `don't want to`
2. `have to`
3. `promise I'll`

#### Branch A: `I don't want to...`

Second suggestions:

- `leave you` → `I don't want to leave you.`
- `hurt you` → `I don't want to hurt you.`
- `lie to you` → `I don't want to lie to you.`

#### Branch B: `I have to...`

Second suggestions:

- `protect everyone` → `I have to protect everyone.`
- `find the Crescent Jade` → `I have to find the Crescent Jade.`
- `escape from you` → `I have to escape from you.`

#### Branch C: `I promise I'll...`

Second suggestions:

- `come back` → `I promise I'll come back.`
- `tell you everything` → `I promise I'll tell you everything.`
- `stay until morning` → `I promise I'll stay until morning.`

### 6.3 Luna's first response

Luna responds according to the completed sentence.

#### Trusting response

Condition: `I promise I'll come back.`

```text
Luna: You said that before.
Luna: But...
Luna: I want to believe you.
```

#### Suspicious response

Condition: `I have to escape from you.`

```text
Luna: Escape?
Luna: Why would you need to escape from me?
```

#### Story-goal response

Condition: `I have to find the Crescent Jade.`

```text
Luna: The Crescent Jade...
Luna: So you remember it too.
```

#### Generic fallback response

Condition: every other first-decision sentence.

```text
Luna: You always choose careful words.
Luna: I still don't know what you really mean.
```

### 6.4 Decision two

After the first response, display:

```text
Luna: Tell me one thing.
Luna: Do you trust me?
```

Starting text: `I...`

Each suggestion immediately completes the sentence:

- `trust you` → `I trust you.`
- `don't know` → `I don't know.`
- `am afraid of you` → `I am afraid of you.`

### 6.5 Endings

#### Ending A — Trust

Condition: `I trust you.`

```text
Luna: Then don't run.
Luna: Walk beside me.
System: Luna will remember this.
```

Ending title: **ENDING: BESIDE THE CAT**

#### Ending B — Uncertainty

Condition: `I don't know.`

```text
Luna: That's honest.
Luna: Honesty is close enough.
System: The distance between you remains unchanged.
```

Ending title: **ENDING: A CAREFUL DISTANCE**

#### Ending C — Fear

Condition: `I am afraid of you.`

```text
Luna: Good.
Luna: Fear keeps prey alive.
System: Luna is typing...
```

Wait approximately two seconds, then display:

```text
Luna: Where are you now?
```

Ending title: **ENDING: THE CHASE BEGINS**

## 7. Story data model

Represent story behavior as data instead of hard-coding every branch in React components.

```ts
export type Speaker = "player" | "luna" | "system";

export interface ChatMessage {
  id: string;
  speaker: Speaker;
  text: string;
}

export interface Suggestion {
  id: string;
  label: string;
  nextNodeId?: string;
  completedText?: string;
}

export interface StoryNode {
  id: string;
  draftText: string;
  suggestions: Suggestion[];
  isComplete?: boolean;
  responseMessages?: ChatMessage[];
  nextNodeId?: string;
  endingId?: string;
}

export interface Ending {
  id: string;
  title: string;
  messages: ChatMessage[];
}
```

A node may represent an unfinished sentence, completed sentence, response sequence, or ending. The implementation may use a different data shape as long as story content remains clearly separated from the UI.

### 7.1 Example story nodes

```ts
const storyNodes = {
  decision1Start: {
    id: "decision1Start",
    draftText: "I",
    suggestions: [
      {
        id: "dontWant",
        label: "don't want to",
        nextNodeId: "decision1DontWant",
      },
      {
        id: "haveTo",
        label: "have to",
        nextNodeId: "decision1HaveTo",
      },
      {
        id: "promise",
        label: "promise I'll",
        nextNodeId: "decision1Promise",
      },
    ],
  },
  decision1HaveTo: {
    id: "decision1HaveTo",
    draftText: "I have to",
    suggestions: [
      {
        id: "protect",
        label: "protect everyone",
        completedText: "I have to protect everyone.",
      },
      {
        id: "jade",
        label: "find the Crescent Jade",
        completedText: "I have to find the Crescent Jade.",
      },
      {
        id: "escape",
        label: "escape from you",
        completedText: "I have to escape from you.",
      },
    ],
  },
} satisfies Record<string, StoryNode>;
```

## 8. React state

Suggested local state:

```ts
const [messages, setMessages] = useState<ChatMessage[]>([]);
const [currentNodeId, setCurrentNodeId] = useState("decision1Start");
const [draftText, setDraftText] = useState("");
const [completedText, setCompletedText] = useState<string | null>(null);
const [isLunaTyping, setIsLunaTyping] = useState(false);
const [isInputLocked, setIsInputLocked] = useState(false);
const [ending, setEnding] = useState<Ending | null>(null);
```

## 9. Visual style

Use an iPhone Messages-inspired appearance without making an exact copy.

### 9.1 Player messages

- align right;
- use a blue background and white text;
- use a rounded bubble; and
- slightly reduce the bottom-right corner radius.

### 9.2 Luna messages

- align left;
- use a light gray background and dark text;
- use a rounded bubble; and
- slightly reduce the bottom-left corner radius.

### 9.3 Suggestions

Display three equal or nearly equal buttons in one row:

- wrap long labels onto multiple lines;
- use a light translucent background;
- use rounded rectangular buttons;
- briefly darken or scale a selected button; and
- disable all suggestions during response animations.

### 9.4 Composer

- use a white or translucent background;
- use a rounded field with a thin gray border;
- show a blinking cursor after the draft;
- use a circular send button;
- display disabled send state in gray; and
- display active send state in blue.

## 10. Typing effects

The player draft appears after each selected suggestion. Optionally reveal the newly selected phrase character by character at approximately `20–40ms` per character. Lock other suggestion buttons during this animation.

Luna's typing indicator displays three subtly animated dots and repeats until her message arrives:

```text
● ● ●
```

## 11. Auto-scroll

Scroll to the newest content whenever:

- the player sends a message;
- Luna begins typing;
- Luna sends a message;
- suggestions change; or
- an ending appears.

Suggested implementation:

```ts
bottomRef.current?.scrollIntoView({
  behavior: "smooth",
});
```

## 12. Restart

After an ending, display a **Restart Conversation** button. Activating it must:

- clear all current messages;
- clear the ending;
- reset story state; and
- replay the opening sequence.

No page refresh is required.

## 13. Accessibility

Include:

- semantic buttons;
- visible keyboard focus states;
- sufficient text contrast;
- `aria-live="polite"` for newly arriving chat messages;
- an `aria-label` for the send button;
- native disabled button states;
- Enter-key support when a completed message is ready; and
- keyboard navigation for all suggestion buttons.

## 14. Responsive behavior

At widths below `360px`:

- reduce suggestion text size as needed;
- allow long suggestions to wrap;
- keep the composer within the viewport; and
- prevent horizontal scrolling.

At desktop widths, center the mobile chat interface and optionally use a neutral page background around it.

## 15. Acceptance criteria

The mock is complete when:

1. The game opens directly to the chat interface.
2. Luna's opening messages appear automatically.
3. The player sees exactly three initial suggestions.
4. Selecting a suggestion updates the unfinished sentence.
5. A second suggestion set appears where required.
6. The player cannot manually type in the composer.
7. The send button activates only for complete sentences.
8. Sending creates a blue player message bubble.
9. Luna displays a typing indicator before replying.
10. At least one first decision changes Luna's response.
11. A second decision leads to one of three endings.
12. The entire game remains in one chat window.
13. The conversation automatically scrolls downward.
14. Restart resets the mock without refreshing the page.
15. The project contains no server or external API dependency.

## 16. Design principle

The player should feel:

> “I decided what to say.”

The interface should not feel like:

> “I selected option B.”

Do not display:

- option numbers;
- branch labels;
- decision menus;
- game statistics;
- visible node IDs; or
- traditional visual-novel choice boxes.

All choices must appear as natural predictive-text suggestions.

## 17. Future extensions

Do not implement these in the first mock, but keep the architecture extensible for:

- hidden trust and fear values;
- suggestions influenced by previous choices;
- words that become unavailable;
- deceptive or corrupted suggestions;
- deleted or edited messages;
- fake connection failures;
- multiple chat contacts;
- delayed messages;
- persistent save data;
- localization;
- alternative protagonists; and
- predictive text controlled by an unknown character.

## 18. Luna AI — second storyline

### 18.1 Scope and relationship to the main story

**Luna AI** is a second, experimental storyline powered by a local language
model through LM Studio. It exists alongside the authored predictive-text
story and must not replace or alter that story's deterministic engine,
compiled story files, choices, saves, or endings.

The application must offer two clearly named experiences:

- **Story I — Crescent Luna:** the existing authored, predictive-text story;
  and
- **Story II — Luna AI:** a free-form conversation between the player as Nox
  and a model-controlled Luna.

The requirements in sections 1–17 continue to describe Story I. In
particular, the restrictions against manual input, external APIs, and servers
apply to the original mock, not to Luna AI. Story II has the additional and
overriding requirements in this section.

The two modes must have independent transcripts and restart actions. Switching
modes must never erase progress in the other mode.

### 18.2 Narrative premise

Luna AI begins after Nox has made contact with Luna through the Crescent Jade.
The exact outcome of Story I must not be assumed, so the opening should work as
an alternate route or continuation without declaring one authored ending
canonical.

The initial situation is:

- the Jade has opened a private text-like channel between Nox and Luna;
- Luna appears to be trapped, but her motives are uncertain;
- Rizo and the Felidian ruins remain relevant to the mystery;
- Nox must decide whether Luna is asking for help, manipulating him, or trying
  to protect him; and
- the conversation should gradually reveal story hooks rather than delivering
  all exposition in the opening response.

The model controls Luna only. It must not write dialogue, thoughts, decisions,
or physical actions on Nox's behalf.

### 18.3 Luna's model instructions

Every new conversation must begin with a version-controlled system prompt
stored in the repository, separate from React components. English and Japanese
variants must communicate the same narrative facts and behavioral rules.

The system prompt must instruct the model to:

- remain in character as Luna;
- treat the user as Nox;
- speak through a private channel created by the Crescent Jade;
- preserve the mystery around Luna, the Jade, Rizo, and the ruins;
- never describe itself as an AI assistant or language model;
- never decide what Nox says, thinks, feels, or does;
- respond naturally to the player's actual message;
- reveal information gradually and avoid repeating established exposition;
- ask no more than one meaningful question per turn;
- favor concise chat messages over essay-length narration;
- keep most turns suitable for one to three message bubbles;
- use the language selected in the application; and
- gently return to the fiction when the player asks an unrelated question.

The prompt is an instruction to the model, not part of the visible transcript.
It must not be stored repeatedly with each saved conversation.

### 18.4 Entry and mode selection

The decorative Back control in the conversation header should open a compact
story-selection view. That view must show:

- the names and short descriptions of Story I and Story II;
- saved-progress status for each mode;
- a visible experimental/local-model label on Luna AI; and
- whether the most recently configured LM Studio endpoint is connected.

The selected mode may be saved locally. Returning to either mode restores its
own most recent state.

### 18.5 Luna AI chat interface

Story II should reuse the existing phone frame, message bubbles, scrolling,
typing indicator, language switcher, and visual identity. It must feel like a
Crescent Luna story rather than an API console.

In Luna AI mode:

- Nox's messages are aligned right using the player bubble style;
- Luna's messages are aligned left;
- connection and story events use centered system text;
- the predictive suggestion bar is not shown;
- the composer accepts free-form multiline text;
- Enter sends a non-empty message;
- Shift+Enter inserts a newline;
- the send action is disabled while a response is pending;
- a Stop action cancels an in-progress request;
- a Retry action is available after a failed request without duplicating the
  player's preceding message; and
- New conversation clears only the Luna AI transcript after confirmation.

The header status must distinguish at least the following states:

- `Connecting…`;
- `Luna AI online`;
- `Generating…`;
- `LM Studio offline`; and
- `Request stopped`.

The composer must have an accessible label, visible focus state, and disabled
state. It must never send whitespace-only content.

### 18.6 LM Studio connection

Luna AI uses LM Studio's OpenAI-compatible local API. The default configuration
is:

```text
Base URL: http://127.0.0.1:1234/v1
Models:   http://127.0.0.1:1234/v1/models
Chat:     http://127.0.0.1:1234/v1/chat/completions
```

The base URL must be configurable at runtime. The application must normalize
trailing slashes and accept only an `http:` or `https:` URL. Machine-specific
model identifiers, conversation data, and credentials must not be committed
to the repository.

On entry to Story II or when the user requests reconnection, the application
must call `GET /v1/models`. A successful response populates a model selector.
The first loaded model may be selected by default, but the choice must remain
editable and must be saved as a model ID rather than as a display label.

An empty model list is not an online-ready state. The interface should explain
that LM Studio is reachable but no model is loaded.

For development and manual verification, the basic connectivity check is:

```bash
curl http://127.0.0.1:1234/v1/models
```

This command verifies the local HTTP server only. It does not verify that a
browser is allowed to reach the endpoint.

### 18.7 Chat completion requests

The first implementation should use non-streaming
`POST /v1/chat/completions`. Streaming may be added later without changing the
saved transcript format.

Each request must contain:

- the selected model ID;
- the current language's Luna system prompt;
- the ordered Nox and Luna conversation messages;
- a bounded temperature suitable for narrative conversation; and
- `stream: false`.

The HTTP layer must be independent of React and must validate the response
before returning it to the UI. A response is successful only when it contains
a non-empty assistant message. Invalid JSON, an absent completion choice, or
empty assistant content must be presented as recoverable errors.

Each generation must use an `AbortController`. The request must be aborted
when the player presses Stop, starts a new conversation, changes story mode,
or leaves the component. An aborted request must not append a late response.

### 18.8 Request lifecycle

Sending a Luna AI message follows this sequence:

1. Validate that a model is selected and the draft is non-empty.
2. Append the Nox message to the visible transcript immediately.
3. Clear the draft and lock duplicate sending.
4. Show Luna's typing indicator and the `Generating…` status.
5. Submit the system prompt and transcript to LM Studio.
6. Append the validated Luna response.
7. Remove the typing indicator, restore `Luna AI online`, and unlock input.
8. Persist the completed transcript.

If the request fails, Nox's message remains visible. The UI must remove the
typing indicator, explain the failure in plain language, and offer Retry. Retry
resends the pending completion request and does not append Nox's message a
second time.

### 18.9 Error states and diagnostics

The UI must distinguish these conditions where reasonably possible:

- connection refused or endpoint unreachable;
- LM Studio reachable with no loaded model;
- browser CORS rejection;
- browser mixed-content or local-network-access rejection;
- request timeout;
- non-successful HTTP status;
- malformed or incomplete JSON response;
- generation canceled by the player; and
- selected model no longer available.

Errors should describe the next useful action, such as starting the LM Studio
server, loading a model, checking the base URL, enabling the appropriate CORS
setting, or retrying model discovery. Raw stack traces must not be shown in the
chat.

### 18.10 Browser and deployment limitations

The primary supported workflow is local:

1. Start LM Studio and load a model on the Mac.
2. Enable the LM Studio local API server.
3. Run Crescent Luna locally with `npm run dev`.
4. Open the Vite development URL in the browser.
5. Connect Luna AI to `http://127.0.0.1:1234/v1`.

The public GitHub Pages build is served over HTTPS. A browser may block its
request to an HTTP localhost endpoint because of mixed-content, CORS, or local
network access policies. The application must report this limitation honestly;
it must not imply that a successful command-line `curl` guarantees browser
access.

No public inference proxy is part of this feature. Such a proxy could expose
private conversations, require credential management, and create an
unauthenticated public inference service. Hosted use may be revisited only with
a separately designed security and deployment specification.

### 18.11 Local data and privacy

Luna AI should store separate, versioned records for:

- the active application mode;
- the LM Studio base URL and selected model;
- the English AI transcript; and
- the Japanese AI transcript.

The application must not persist an in-flight request, abort controller, raw
server error, or duplicated system prompt. If an API token is supported later,
it must not be committed and should default to session-only storage.

The settings view must explain that `127.0.0.1` refers to the visitor's own
computer and that conversation content is sent to the endpoint they configure.

### 18.12 Architecture boundaries

The Luna AI implementation should be divided into these responsibilities:

- **Mode controller:** selects Story I or Story II and preserves independent
  state;
- **Classic story view:** contains the existing deterministic story UI and
  engine integration;
- **AI story view:** owns the draft, transcript, request lifecycle, and
  connection presentation;
- **LM Studio client:** performs model discovery and chat completion requests
  without importing React;
- **AI prompt module:** owns localized, version-controlled Luna instructions;
  and
- **AI persistence module:** validates and migrates saved settings and
  transcripts.

The authored story engine must not import the LM Studio client. AI responses
must not be converted into compiled story nodes or written into generated
story artifacts.

### 18.13 Testing requirements

Automated HTTP-client tests should mock `fetch` and cover:

- successful model discovery;
- empty model discovery;
- endpoint normalization;
- unreachable endpoints and non-successful HTTP responses;
- malformed model and completion payloads;
- a valid assistant completion;
- empty assistant content; and
- cancellation with `AbortController`.

AI interaction tests should cover:

- sending a free-form message;
- preventing empty or duplicate sends;
- the Luna typing state;
- successful response rendering;
- Retry without duplicate Nox messages;
- Stop behavior and ignored late responses;
- resetting only the AI conversation;
- switching modes during a request;
- restoring saved settings and transcripts; and
- selecting the correct localized prompt.

Existing Story I story validation, engine behavior, localization, saves,
restart, and predictive-text interactions are regression requirements.

### 18.14 Luna AI acceptance criteria

Luna AI is complete when:

1. The player can choose between Story I and Story II.
2. Story I continues to behave as it did before the addition.
3. Each mode restores its own independent progress.
4. Story II discovers loaded models through `GET /v1/models`.
5. The player can configure the LM Studio base URL and model.
6. Story II accepts free-form multiline input without showing predictive
   suggestions.
7. Sending immediately displays the Nox message and then Luna's typing state.
8. A valid chat completion is displayed as Luna without controlling Nox.
9. Input remains locked against duplicate sends while generation is pending.
10. The player can stop a pending request.
11. A failed request can be retried without duplicating the Nox message.
12. Empty models, offline endpoints, malformed responses, and browser access
    restrictions have actionable error states.
13. English and Japanese conversations use matching localized Luna prompts.
14. New conversation clears Story II without clearing Story I.
15. No model ID, credential, or private transcript is committed.
16. The README documents local setup, the `curl` check, CORS considerations,
    and GitHub Pages limitations.
