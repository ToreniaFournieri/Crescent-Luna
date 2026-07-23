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
