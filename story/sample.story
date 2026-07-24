@scene opening
system: Today 00:17
luna: You are awake.
luna: I thought you had disappeared.
luna: Are you really leaving me alone?
-> first_reply

@prompt first_reply "I"
+ "don’t want to" -> reluctant_reply
+ "have to" -> duty_reply
+ "promise I’ll" -> promise_reply

@prompt reluctant_reply "I don’t want to"
+ "leave you" => "I don’t want to leave you." -> careful_words
+ "hurt you" => "I don’t want to hurt you." -> careful_words
+ "lie to you" => "I don’t want to lie to you." -> careful_words

@prompt duty_reply "I have to"
+ "protect everyone" => "I have to protect everyone." -> careful_words
+ "find the Crescent Jade" => "I have to find the Crescent Jade." -> jade_reply
+ "escape from you" => "I have to escape from you." -> escape_reply

@prompt promise_reply "I promise I’ll"
+ "come back" => "I promise I’ll come back." -> promise_response
+ "tell you everything" => "I promise I’ll tell you everything." -> careful_words
+ "stay until morning" => "I promise I’ll stay until morning." -> careful_words

@scene careful_words
luna: You always choose careful words.
luna: I still don’t know what you really mean.
-> trust_question

@scene promise_response
luna: You said that before.
luna: But…
luna: I want to believe you.
-> trust_question

@scene jade_reply
luna: The Crescent Jade…
luna: So you remember it too.
-> trust_question

@scene escape_reply
luna: Escape?
luna: Why would you need to escape from me?
-> trust_question

@scene trust_question
luna: Tell me one thing.
luna: Do you trust me?
-> trust_reply

@prompt trust_reply "I"
+ "trust you" => "I trust you." -> beside_the_cat
+ "don’t know" => "I don’t know." -> careful_distance
+ "am afraid of you" => "I am afraid of you." -> chase_begins

@ending beside_the_cat "BESIDE THE CAT"
luna: Then don’t run.
luna: Walk beside me.
system: Luna will remember this.

@ending careful_distance "A CAREFUL DISTANCE"
luna: That’s honest.
luna: Honesty is close enough.
system: The distance between you remains unchanged.

@ending chase_begins "THE CHASE BEGINS"
luna: Good.
luna: Fear keeps prey alive.
system: Luna is typing…
luna [delay=2000]: Where are you now?
