@scene part1_dungeon
system: PART I
system: DUNGEON
system: Murid Caravan — Before sunrise
system: Rain clouds hang far beyond the Felidian border.
-> p001_rizos_assignment

@scene p001_rizos_assignment
rizo: Nox.
rizo: Come here.
system: Rizo spreads an old map across a wooden crate.
rizo: I found the entrance.
rizo: The Crescent Jade is somewhere beneath these ruins.
nox [thought]: The treasure every caravan has been searching for.
rizo: You are the only one small enough to enter without disturbing the old passages.
-> p001_reply

@prompt p001_reply “You”

* “want me to go first” => “You want me to go first.” -> p003_rizos_smile
* “found the Crescent Jade” => “You found the Crescent Jade?” -> p002_false_map
* “expect me to enter alone” => “You expect me to enter alone?” -> p003_rizos_smile

@scene p002_false_map
rizo: I found the route.
rizo: The treasure itself is still waiting for us.
system: Rizo taps three circles drawn beside a corridor.
rizo: Three circles mean safe.
rizo: Follow the marks, find the Jade, then come back.
nox [thought]: If I bring it back, no one will call me useless again.
-> p002_reply

@prompt p002_reply “I will”

* “follow the map” => “I will follow the map.” -> p004_split_stair
* “inspect the map first” => “I will inspect the map first.” -> p005_ink_over_scratches
* “ask why no one else is coming” => “I will ask why no one else is coming.” -> p003_rizos_smile

@scene p003_rizos_smile
rizo: Alone?
rizo: You make it sound as though I am abandoning you.
rizo: We will be waiting outside.
rizo: Once you confirm the path, we all go in together.
system: The other bandits avoid looking at Nox.
nox [thought]: No one has prepared a torch.
nox [thought]: No one has packed climbing rope.
-> p003_reply

@prompt p003_reply “Then”

* “give me the map” => “Then give me the map.” -> p002_false_map
* “send someone with me” => “Then send someone with me.” -> p006_no_place
* “tell me what happened to the last scout” => “Tell me what happened to the last scout.” -> p003_last_scout

@scene p003_last_scout
system: Rizo’s smile disappears for only a moment.
rizo: There was no last scout.
rizo: Do not invent reasons to be afraid.
nox [thought]: I did not say I was afraid.
-> p003_last_reply

@prompt p003_last_reply “I”

* “understand” => “I understand.” -> p002_false_map
* “do not believe you” => “I do not believe you.” -> p006_no_place
* “will return with the treasure” => “I will return with the treasure.” -> p002_false_map

@scene p005_ink_over_scratches
system: Nox turns the map toward the morning light.
system: Several arrows have been drawn with fresh black ink.
system: Older markings remain underneath.
nox [thought]: Rizo covered something.
system: Beneath one arrow is a broken crescent symbol.
system: Another corridor has been scratched out completely.
-> p005_reply

@prompt p005_reply “The old markings”

* “may show the safer route” => “The old markings may show the safer route.” -> p009_broken_crescent
* “are probably outdated” => “The old markings are probably outdated.” -> p004_split_stair
* “prove Rizo has been inside before” => “The old markings prove Rizo has been inside before.” -> p003_rizos_smile

@scene p006_no_place
rizo: You want another bandit to risk his life for you?
rizo: Perhaps you are not ready to earn a full share.
bandit: Let the little mouse stay with the wagons.
bandit: We can find someone braver.
nox [thought]: If I refuse, I will never hear the end of it.
-> p006_reply

@prompt p006_reply “I”

* “will enter the dungeon” => “I will enter the dungeon.” -> p002_false_map
* “am leaving the caravan” => “I am leaving the caravan.” -> ending_no_adventure
* “only asked a question” => “I only asked a question.” -> p002_false_map

@ending ending_no_adventure “NO ADVENTURE BEGUN”
system: Nox leaves before sunrise.
system: He never enters the Felidian ruins.
system: He never finds the Crescent Jade.
system: He never meets Luna.
system: Sometimes survival means walking away.
system: But some stories begin only when walking away is no longer possible.

@scene p004_split_stair
system: Felidian Ruins — Upper Dungeon
system: The entrance closes behind Nox with a low stone groan.
system: Two stairways descend beneath the ruins.
system: The left stair is broad and completely dry.
system: The right stair is narrow and damp.
nox [thought]: Rizo’s arrow points left.
system: A faint current of cool air rises from the right.
-> p004_reply

@prompt p004_reply “I will take”

* “the marked dry stair” => “I will take the marked dry stair.” -> p007_breathless_hall
* “the damp stair with moving air” => “I will take the damp stair with moving air.” -> p008_moths_in_dark
* “time to inspect both routes” => “I will take time to inspect both routes.” -> p004_inspection

@scene p004_inspection
system: Dust covers the dry stair.
system: Nothing has disturbed it recently.
system: Tiny pale moths rest near the damp passage.
nox [thought]: Living creatures need air.
-> p004_inspection_reply

@prompt p004_inspection_reply “The”

* “moths may be following fresh air” => “The moths may be following fresh air.” -> p008_moths_in_dark
* “untouched stair must be safer” => “The untouched stair must be safer.” -> p007_breathless_hall
* “map is more reliable than insects” => “The map is more reliable than insects.” -> p007_breathless_hall

@scene p007_breathless_hall
system: The dry stair leads to a long stone corridor.
system: No wind moves through it.
system: No insects crawl between the stones.
rizo [memory]: Three circles mean completely safe.
system: Nox raises his lantern.
system: The flame contracts into a small blue point.
-> p007_reply

@prompt p007_reply “I should”

* “test the air before continuing” => “I should test the air before continuing.” -> p010_dying_flame
* “move quickly before the flame dies” => “I should move quickly before the flame dies.” -> ending_airless_tomb
* “trust the three-circle mark” => “I should trust the three-circle mark.” -> ending_airless_tomb

@scene p010_dying_flame
system: Nox lowers the lantern toward the floor.
system: The flame weakens further.
nox [thought]: It is not being blown out.
nox [thought]: It is suffocating.
system: Behind him, pale moths gather near a narrow crack in the wall.
-> p010_reply

@prompt p010_reply “The moths”

* “must be near fresh air” => “The moths must be near fresh air.” -> p008_moths_in_dark
* “must be hiding treasure” => “The moths must be hiding treasure.” -> ending_airless_tomb
* “will not help me” => “The moths will not help me.” -> ending_airless_tomb

@ending ending_airless_tomb “THE AIRLESS TOMB”
system: Nox continues into the silent corridor.
system: His lantern dies first.
nox [thought]: Rizo said this route was safe.
system: His knees strike the stone.
system: The corridor remains perfectly silent.

@scene p008_moths_in_dark
system: The narrow stair descends beside a wet limestone wall.
system: Pale moths flutter ahead of Nox.
system: They gather wherever cool air enters through the cracks.
nox [thought]: They are showing me where the cave can breathe.
system: Far below, something metallic rings once.
dungeon: Ting.
-> p008_reply

@prompt p008_reply “I will”

* “follow the moths” => “I will follow the moths.” -> p012_chamber_of_bells
* “leave them and follow Rizo’s arrow” => “I will leave them and follow Rizo’s arrow.” -> p007_breathless_hall
* “mark the airflow on the map” => “I will mark the airflow on the map.” -> p009_broken_crescent

@scene p009_broken_crescent
system: Nox compares the scratched-out route with the dungeon wall.
system: A broken crescent has been carved beside a narrow passage.
system: Rizo’s fresh ink redirects travelers away from it.
nox [thought]: He did not make a mistake.
nox [thought]: He covered this route deliberately.
-> p009_reply

@prompt p009_reply “Rizo”

* “wanted me to avoid this passage” => “Rizo wanted me to avoid this passage.” -> p012_chamber_of_bells
* “must have corrected an old error” => “Rizo must have corrected an old error.” -> p007_breathless_hall
* “has already explored the dungeon” => “Rizo has already explored the dungeon.” -> p009_evidence

@scene p009_evidence
system: A strip of red caravan cloth is caught between two stones.
system: It bears the same knot used on Rizo’s supply bags.
nox [thought]: Someone from the caravan came here before me.
nox [thought]: And Rizo told me there was no previous scout.
-> p009_evidence_reply

@prompt p009_evidence_reply “I should”

* “remember that Rizo lied” => “I should remember that Rizo lied.” -> p012_chamber_of_bells
* “turn back and confront him” => “I should turn back and confront him.” -> p009_blocked_return
* “assume the cloth is old” => “I should assume the cloth is old.” -> p007_breathless_hall

@scene p009_blocked_return
system: Nox climbs back toward the entrance.
system: A slab of stone now blocks the upper stair.
nox: Rizo!
system: No answer comes from outside.
nox [thought]: He sealed it after I entered.
-> p012_chamber_of_bells

@scene p012_chamber_of_bells
system: Chamber of Bells
system: Dozens of bronze bells hang from the ceiling.
system: Pale and dark tiles form a path across the floor.
dungeon: Ting.
nox [thought]: I did not touch anything.
system: A second bell moves above a dark tile.
-> p012_reply

@prompt p012_reply “I will”

* “step between the pale tiles” => “I will step between the pale tiles.” -> p013_white_veins
* “walk directly beneath the bells” => “I will walk directly beneath the bells.” -> ending_falling_bell
* “throw a stone onto the floor” => “I will throw a stone onto the floor.” -> p012_test

@scene p012_test
system: Nox throws a loose stone onto a dark tile.
dungeon: TING.
system: A blade sweeps through the air above it.
nox [thought]: The bell announces the trap.
system: Dust on the pale tiles remains undisturbed.
-> p012_test_reply

@prompt p012_test_reply “The”

* “pale tiles avoid the triggers” => “The pale tiles avoid the triggers.” -> p013_white_veins
* “dark tiles activate the bells” => “The dark tiles activate the bells.” -> p013_white_veins
* “shortest route is still best” => “The shortest route is still best.” -> ending_falling_bell

@ending ending_falling_bell “BENEATH THE BELL”
system: Nox steps beneath the largest bell.
dungeon: TING.
system: Something releases above him.
system: The bell strikes the floor hard enough to crack the stone.

@scene p013_white_veins
system: Nox reaches the far side of the bell chamber.
system: White mineral veins run through the limestone floor and walls.
system: The stone cracks softly beneath his boots.
cave: Crack.
nox [thought]: The white sections are weaker than the gray stone.
-> p013_reply

@prompt p013_reply “I should”

* “cross without striking the stone” => “I should cross without striking the stone.” -> p015_rain_mural
* “break the weak floor deliberately” => “I should break the weak floor deliberately.” -> p016_lower_passage
* “test the wall with my hammer” => “I should test the wall with my hammer.” -> p013_collapse

@scene p013_collapse
system: Nox taps the white-veined wall.
cave: Crack.
system: A slab falls between him and the bell chamber.
nox [thought]: One careless blow could bring down the entire passage.
-> p013_collapse_reply

@prompt p013_collapse_reply “I will”

* “move carefully forward” => “I will move carefully forward.” -> p015_rain_mural
* “strike the floor again” => “I will strike the floor again.” -> p016_lower_passage
* “try to reopen the blocked route” => “I will try to reopen the blocked route.” -> ending_buried_scout

@ending ending_buried_scout “THE BURIED SCOUT”
system: Nox strikes the fractured wall.
cave: CRACK.
system: White-veined limestone gives way around him.
system: Rizo’s map remains beneath the rubble.

@scene p016_lower_passage
system: Nox strikes a thin white vein in the floor.
system: The stone breaks, revealing a narrow shaft below.
system: Cool air rises from darkness.
system: Water flows somewhere beneath the dungeon.
nox [thought]: An underground channel.
-> p016_reply

@prompt p016_reply “I will”

* “follow the underground water” => “I will follow the underground water.” -> p017_girl_beneath_moon
* “return to the upper corridor” => “I will return to the upper corridor.” -> p015_rain_mural
* “search the shaft for treasure” => “I will search the shaft for treasure.” -> p018_empty_casket

@scene p015_rain_mural
system: A faded mural covers the next chamber.
system: Felidian priests stand beneath a crescent moon.
system: Between them kneels a young black cat girl.
system: Blue lines fall from the sky onto dry fields.
nox [thought]: A prayer for rain.
system: The girl holds no jewel.
-> p015_reply

@prompt p015_reply “The mural shows”

* “a girl being offered beneath the moon” => “The mural shows a girl being offered beneath the moon.” -> p017_girl_beneath_moon
* “priests presenting a hidden treasure” => “The mural shows priests presenting a hidden treasure.” -> p018_empty_casket
* “the location of the Crescent Jade” => “The mural shows the location of the Crescent Jade.” -> p018_empty_casket

@scene p017_girl_beneath_moon
inscription: WHEN THE MOON BECOMES A CLAW—
inscription: —THE CRESCENT JADE SHALL BE OFFERED.
system: The final word is written beside the painted girl.
nox [thought]: Jade may not mean a stone.
nox [thought]: Or perhaps the girl is carrying it somewhere I cannot see.
-> p017_reply

@prompt p017_reply “The Crescent Jade”

* “may be the girl herself” => “The Crescent Jade may be the girl herself.” -> p019_human_altar
* “must be hidden behind the mural” => “The Crescent Jade must be hidden behind the mural.” -> p018_empty_casket
* “is probably ceremonial jewelry” => “The Crescent Jade is probably ceremonial jewelry.” -> p018_empty_casket

@scene p018_empty_casket
system: A stone casket rests beneath the mural.
system: Nox opens it carefully.
system: There are no gems inside.
system: Only a silver clasp and several strands of black fur.
nox [thought]: This was used for clothing.
nox [thought]: Ceremonial clothing.
-> p018_reply

@prompt p018_reply “I will”

* “examine the clasp” => “I will examine the clasp.” -> p018_clasp
* “take the silver” => “I will take the silver.” -> p020_treasure_pedestal
* “leave the casket untouched” => “I will leave the casket untouched.” -> p019_human_altar

@scene p018_clasp
system: The clasp is shaped like a crescent moon.
system: Its inner surface is lined with black fur.
nox [thought]: It was worn around someone’s neck.
nox [thought]: Not used to hold a jewel.
-> p019_human_altar

@scene p019_human_altar
system: A low altar stands beyond the mural chamber.
system: It is too long to support a jewel.
system: Leather restraints hang from both sides.
system: A narrow channel leads away from its center.
nox [thought]: This altar was made for a person.
system: A soft bell rings beyond the next doorway.
-> p019_reply

@prompt p019_reply “I should”

* “approach quietly” => “I should approach quietly.” -> p021_black_cat_girl
* “call out for the treasure” => “I should call out for the treasure.” -> p022_lunas_claws
* “turn back immediately” => “I should turn back immediately.” -> p020_treasure_pedestal

@scene p020_treasure_pedestal
system: Nox enters a round chamber.
system: An empty pedestal stands beneath an opening in the ceiling.
system: Crescent moonlight falls across its surface.
nox [thought]: Empty.
nox [thought]: Someone reached the treasure first.
system: A black tail disappears behind a pillar.
-> p020_reply

@prompt p020_reply “I will”

* “search behind the pillar” => “I will search behind the pillar.” -> p021_black_cat_girl
* “touch the crescent seal” => “I will touch the crescent seal.” -> p023_collapse_trigger
* “demand that the thief come out” => “I will demand that the thief come out.” -> p022_lunas_claws

@scene p021_black_cat_girl
system: Nox moves around the pillar.
system: A black Felidian girl sits on the floor.
system: A broken ceremonial clasp hangs from her neck.
system: Her yellow eyes remain fixed on him.
luna: You took your time.
nox [thought]: A Felidian.
nox [thought]: A cat.
luna: Did Rizo send you?
-> p021_reply

@prompt p021_reply “I”

* “came looking for the Crescent Jade” => “I came looking for the Crescent Jade.” -> p021_jade_reply
* “was sent here by Rizo” => “I was sent here by Rizo.” -> p024_broken_entrance
* “do not know anyone named Rizo” => “I do not know anyone named Rizo.” -> p022_lunas_claws

@scene p021_jade_reply
system: Luna’s expression changes.
luna: The Crescent Jade.
luna: Is that what he told you?
nox: You know where it is.
luna: Closer than you think.
system: Stone grinds somewhere above them.
-> p024_broken_entrance

@scene p022_lunas_claws
luna: A treasure thief should not make demands.
system: Luna rises.
system: Her claws extend with a quiet metallic sound.
nox [thought]: She knows Rizo’s name.
nox [thought]: She was waiting for us.
-> p022_reply

@prompt p022_reply “I will”

* “drop Rizo’s map” => “I will drop Rizo’s map.” -> p022_map
* “run for the doorway” => “I will run for the doorway.” -> p025_chase_begins
* “threaten her with my knife” => “I will threaten her with my knife.” -> p022_threat

@scene p022_map
system: Rizo’s map lands between them.
system: Luna looks down at the fresh black arrows.
luna: He changed the route.
nox: You have seen this map before?
luna: I have seen what happens to those who follow it.
system: The ceiling shudders.
-> p024_broken_entrance

@scene p022_threat
nox: Stay back.
luna: You entered my territory.
luna: You searched our altar.
luna: And now you point a knife at me?
system: A deep crack travels through the chamber.
-> p025_chase_begins

@scene p023_collapse_trigger
system: Nox presses the crescent seal.
system: A hidden mechanism moves beneath the pedestal.
dungeon: TING.
system: The ceiling opening begins to close.
luna: Take your hand away.
-> p023_reply

@prompt p023_reply “I will”

* “release the seal” => “I will release the seal.” -> p024_broken_entrance
* “force it open” => “I will force it open.” -> ending_crushed_pedestal
* “ask Luna what it controls” => “I will ask Luna what it controls.” -> p023_question

@scene p023_question
nox: What does it control?
luna: The entrance.
luna: And now it is collapsing.
system: A roar travels through the upper dungeon.
-> p024_broken_entrance

@ending ending_crushed_pedestal “THE EMPTY PEDESTAL”
system: Nox forces the seal downward.
system: The mechanism locks.
system: The stone ceiling closes around the pedestal.
luna: Let go!
system: The chamber becomes still.

@scene p024_broken_entrance
system: The dungeon shakes.
system: Dust pours from the ceiling.
system: Somewhere above, the entrance collapses.
nox: Rizo!
system: No answer comes through the stone.
luna: He is not coming for you.
nox: You do not know that.
luna: I know exactly what he sent you to do.
system: A second crack splits the chamber floor.
luna: Move.
-> p024_reply

@prompt p024_reply “I will”

* “follow Luna’s warning” => “I will follow Luna’s warning.” -> part2_escape_from_luna
* “run away from her” => “I will run away from her.” -> p025_chase_begins
* “stay and search for another exit” => “I will stay and search for another exit.” -> p024_floor_breaks

@scene p024_floor_breaks
system: The cracked floor gives way.
system: Nox falls into a sloping limestone passage.
system: Luna lands behind him.
luna: Stop running.
nox: I am falling!
system: The passage throws them both into darkness.
-> p025_chase_begins

@scene p025_chase_begins
system: PART II
system: ESCAPE FROM LUNA
system: Limestone Cave — Unknown depth
system: Nox lands in a shallow underground stream.
system: Behind him, Luna rises silently from the water.
luna: Little mouse.
luna: We are not finished.
nox [thought]: The entrance is gone.
nox [thought]: The cat is still here.
system: Somewhere ahead, pale moths flutter toward moving air.
-> p025_reply

@prompt p025_reply “I should”

* “follow the moths” => “I should follow the moths.” -> p028_moth_passage
* “run toward the loudest echo” => “I should run toward the loudest echo.” -> p027_echoing_tunnel
* “ask Luna what she wants” => “I should ask Luna what she wants.” -> p026_stop_running

@scene p026_stop_running
system: Nox turns without moving closer.
nox: What do you want?
luna: For you to stop running.
nox: That is not an answer.
luna: It is the first answer you need.
system: Luna’s eyes move toward the ceiling above Nox.
luna: Do not step backward.
-> p026_reply

@prompt p026_reply “I”

* “will trust that warning” => “I will trust that warning.” -> p029_warning_returned
* “think you are trying to catch me” => “I think you are trying to catch me.” -> p027_echoing_tunnel
* “want you to prove it” => “I want you to prove it.” -> p026_proof

@scene p026_proof
luna: Look above you.
system: White mineral veins cross the limestone ceiling.
nox [thought]: The same weak stone from the dungeon.
luna: One more step and it falls.
nox: You could have let it.
luna: I still need answers.
-> p029_warning_returned

@scene p027_echoing_tunnel
system: Nox runs into a wide tunnel.
system: Every footstep returns from several directions.
cave: Tap.
cave: Tap.
cave: Tap.
nox [thought]: The echoes make it impossible to hear Luna.
system: A black shape moves between the stalagmites.
-> p027_reply

@prompt p027_reply “I will”

* “hide and remain completely still” => “I will hide and remain completely still.” -> p030_stillness
* “keep running through the echoes” => “I will keep running through the echoes.” -> p031_hunters_leap
* “throw stones to confuse Luna” => “I will throw stones to confuse Luna.” -> p027_stones

@scene p027_stones
system: Nox throws stones into three side passages.
cave: Clack.
cave: Clack.
cave: Clack.
system: Luna stops.
luna: Clever.
system: Her voice comes from directly behind Nox.
luna: But you forgot your own breathing.
-> p031_hunters_leap

@scene p028_moth_passage
system: Nox follows the pale moths into a narrow passage.
system: Cool air brushes his whiskers.
system: The passage bends sharply around a wall of white-veined limestone.
system: Luna’s footsteps grow closer.
-> p028_reply

@prompt p028_reply “I can”

* “follow the airflow deeper” => “I can follow the airflow deeper.” -> p029_warning_returned
* “take the wider side tunnel” => “I can take the wider side tunnel.” -> p031_hunters_leap
* “collapse the passage behind me” => “I can collapse the passage behind me.” -> p033_buried_together

@scene p029_warning_returned
system: Nox moves around the weak limestone.
system: Luna follows through the narrow passage.
system: A crack spreads beneath her next step.
nox [thought]: She is watching me, not the floor.
-> p029_reply

@prompt p029_reply “I should”

* “warn Luna about the crack” => “I should warn Luna about the crack.” -> p032_falling_limestone
* “say nothing and let her fall” => “I should say nothing and let her fall.” -> p038_lone_mouse_route
* “use the weak stone to trap her” => “I should use the weak stone to trap her.” -> p033_buried_together

@scene p030_stillness
system: Nox presses himself between two stalagmites.
system: He stops moving.
system: He stops breathing.
system: Luna walks slowly into view.
luna: I can hear your heart.
nox [thought]: She is close enough to touch me.
system: Luna looks past him toward a dark opening.
luna: Something else is following us.
-> p030_reply

@prompt p030_reply “I will”

* “remain still and listen” => “I will remain still and listen.” -> p034_close_enough
* “run while she is distracted” => “I will run while she is distracted.” -> p031_hunters_leap
* “ask what is following us” => “I will ask what is following us.” -> p034_close_enough

@scene p031_hunters_leap
system: Nox runs toward an underground stream.
system: Luna springs from a ledge above him.
luna: Stop!
system: Her shadow covers the water.
-> p031_reply

@prompt p031_reply “I will”

* “duck beneath the limestone shelf” => “I will duck beneath the limestone shelf.” -> p035_narrow_ledge
* “jump across the stream” => “I will jump across the stream.” -> p036_underground_stream
* “turn and face her” => “I will turn and face her.” -> p034_close_enough

@scene p032_falling_limestone
nox: Luna! The floor!
system: Luna twists aside.
system: The stone beneath her collapses.
system: One of her legs becomes trapped between two slabs.
luna: Do not come closer.
nox: You are stuck.
luna: I noticed.
system: Cracks continue spreading around her.
-> p032_reply

@prompt p032_reply “I will”

* “help free her leg” => “I will help free her leg.” -> p037_debt_between_enemies
* “leave before the ceiling falls” => “I will leave before the ceiling falls.” -> p038_lone_mouse_route
* “ask her to promise not to chase me” => “I will ask her to promise not to chase me.” -> p032_bargain

@scene p032_bargain
nox: Promise you will not chase me.
luna: Help me first.
nox: That is not how bargains work.
luna: It is how this one works.
system: Another stone falls beside Luna.
-> p032_bargain_reply

@prompt p032_bargain_reply “I”

* “will help without a promise” => “I will help without a promise.” -> p037_debt_between_enemies
* “need your promise first” => “I need your promise first.” -> p038_lone_mouse_route
* “will leave you here” => “I will leave you here.” -> p038_lone_mouse_route

@scene p033_buried_together
system: Nox strikes the white-veined wall.
cave: CRACK.
system: The passage collapses between him and Luna.
system: A second fracture opens beneath Nox.
system: Both of them fall into the same lower chamber.
luna: You tried to bury me.
nox: It did not work.
luna: I noticed that too.
system: A slab pins Luna’s tail beneath the rubble.
-> p033_reply

@prompt p033_reply “I will”

* “dig her free” => “I will dig her free.” -> p037_debt_between_enemies
* “escape while she is trapped” => “I will escape while she is trapped.” -> p038_lone_mouse_route
* “take her crescent clasp” => “I will take her crescent clasp.” -> p040_no_trust

@scene p034_close_enough
system: Nox and Luna face each other across a narrow stream.
system: Neither moves.
luna: Now answer me.
luna: Why did Rizo send you?
-> p034_reply

@prompt p034_reply “He sent me to”

* “find the Crescent Jade” => “He sent me to find the Crescent Jade.” -> p039_honest_thief
* “make sure the route was safe” => “He sent me to make sure the route was safe.” -> p039_honest_thief
* “rescue someone from the dungeon” => “He sent me to rescue someone from the dungeon.” -> p040_no_trust

@scene p035_narrow_ledge
system: Nox squeezes beneath a low limestone shelf.
system: Luna cannot follow without crawling.
system: A climbing rope hangs across a deep crack ahead.
nox [thought]: If I cut it, she cannot cross.
system: The stone beneath Luna’s side of the crack begins to crumble.
-> p035_reply

@prompt p035_reply “I will”

* “leave the rope for Luna” => “I will leave the rope for Luna.” -> p037_debt_between_enemies
* “cut the rope behind me” => “I will cut the rope behind me.” -> p038_lone_mouse_route
* “wait and ask her to stop chasing” => “I will wait and ask her to stop chasing.” -> p034_close_enough

@scene p036_underground_stream
system: Nox lands in cold, fast-moving water.
system: The current carries him away from Luna.
system: Two routes appear ahead.
system: Fresh-air bubbles rise beside a submerged opening.
system: Faint orange light flickers above a rocky slope.
nox [thought]: Air below.
nox [thought]: Torchlight above.
-> p036_reply

@prompt p036_reply “I will follow”

* “the fresh-air bubbles” => “I will follow the fresh-air bubbles.” -> p041_water_beneath_stone
* “the torchlight” => “I will follow the torchlight.” -> p042_bandit_camp
* “the strongest current” => “I will follow the strongest current.” -> p036_waterfall

@scene p036_waterfall
system: The current accelerates.
nox: That was a mistake.
system: Nox falls over a short underground waterfall.
system: He lands beside a narrow passage leading upward.
system: Voices echo beyond it.
-> p042_bandit_camp

@scene p037_debt_between_enemies
system: Nox pulls the last stone away.
system: Luna frees herself and steps back.
luna: You had time to escape.
nox: You warned me first.
luna: That does not make us even.
nox: It makes us less uneven.
system: Luna touches the broken clasp at her neck.
-> p037_reply

@prompt p037_reply “That crescent”

* “belongs to the temple” => “That crescent belongs to the temple.” -> p043_rain_seal
* “is the Crescent Jade” => “That crescent is the Crescent Jade.” -> p037_jade
* “must be valuable” => “That crescent must be valuable.” -> p040_no_trust

@scene p037_jade
luna: No.
luna: This only marked me for the ceremony.
nox: Marked you?
luna: You truly do not know what Rizo is searching for.
system: Luna looks toward the upper passages.
luna: But he has something worse than your map.
-> p043_rain_seal

@scene p038_lone_mouse_route
system: Nox leaves Luna behind.
system: Her voice fades beneath the sound of moving water.
luna: Run, then.
luna: See who is waiting outside.
system: Ahead, torchlight flickers against the cave wall.
-> p038_reply

@prompt p038_reply “I will”

* “follow the torchlight” => “I will follow the torchlight.” -> p042_bandit_camp
* “search for another exit” => “I will search for another exit.” -> p044_false_exit
* “turn back toward Luna” => “I will turn back toward Luna.” -> p047_last_test

@scene p039_honest_thief
nox: I came to steal the Crescent Jade.
nox: I thought it was a jewel.
luna: That does not make you innocent.
nox: I know.
system: Luna studies him carefully.
luna: Show me the map.
-> p039_reply

@prompt p039_reply “I will”

* “give her Rizo’s map” => “I will give her Rizo’s map.” -> p043_rain_seal
* “show it without letting go” => “I will show it without letting go.” -> p039_half_trust
* “say I lost it” => “I will say I lost it.” -> p040_no_trust

@scene p039_half_trust
system: Nox holds out the map but keeps one hand on it.
system: Luna reads the fresh arrows.
luna: He changed the route.
nox: You have seen these markings?
luna: I have seen his work.
luna: Give it to me.
-> p039_half_reply

@prompt p039_half_reply “I”

* “will let go” => “I will let go.” -> p043_rain_seal
* “need it to escape” => “I need it to escape.” -> p040_no_trust
* “want an answer first” => “I want an answer first.” -> p043_rain_seal

@scene p040_no_trust
system: Luna’s expression becomes still.
luna: You lie badly.
nox: I am trying to survive.
luna: So is everyone.
luna: That does not make every choice equal.
system: Luna steps aside from the fresh-air passage.
luna: Go.
nox: You are letting me leave?
luna: I am letting you discover where your map leads.
-> p040_reply

@prompt p040_reply “I will”

* “take the visible exit” => “I will take the visible exit.” -> p042_bandit_camp
* “ask for one more chance” => “I will ask for one more chance.” -> p047_last_test
* “run before she changes her mind” => “I will run before she changes her mind.” -> p044_false_exit

@scene p041_water_beneath_stone
system: Nox dives beneath the limestone shelf.
system: The passage rises into a hidden air pocket.
system: Pale moths cluster near a crack leading upward.
system: Through the stone, Nox hears Murid voices.
bandit [distant]: Rizo said the scout should have opened it by now.
bandit [distant]: If he survived.
nox [thought]: They are here.
nox [thought]: They never intended to rescue me.
-> p041_reply

@prompt p041_reply “I should”

* “return and warn Luna” => “I should return and warn Luna.” -> p045_hidden_vent
* “climb toward the bandits” => “I should climb toward the bandits.” -> p042_bandit_camp
* “listen for Rizo’s plan” => “I should listen for Rizo’s plan.” -> p041_overheard

@scene p041_overheard
rizo [distant]: Once the little fool clears the route, we take the girl.
bandit [distant]: And the Jade?
rizo [distant]: The girl will lead us to it.
bandit [distant]: What about the Rain Seal?
rizo [distant]: Keep your voice down.
nox [thought]: Rain Seal.
nox [thought]: Luna needs to hear this.
-> p045_hidden_vent

@scene p042_bandit_camp
system: Nox climbs through a narrow opening.
system: Daylight shines beyond the limestone ridge.
system: Rizo and the Murid bandits wait beside a second entrance.
system: Weapons, ropes, and cages are arranged around the camp.
rizo: Nox.
rizo: You survived.
system: Rizo smiles as though this was always the plan.
-> p042_reply

@prompt p042_reply “I”

* “found the route” => “I found the route.” -> part3_rizo_welcome
* “know you lied to me” => “I know you lied to me.” -> part3_rizo_confrontation
* “need to observe before speaking” => “I need to observe before speaking.” -> part3_camp_from_above

@scene p043_rain_seal
luna: Rizo stole a ceremonial seal from a Felidian convoy.
luna: Black stone. Silver edge. A crescent cut through the center.
nox: I saw it hanging from his belt.
system: Luna’s claws extend.
luna: The Rain Seal opens the Temple of Abundance.
nox: And the Crescent Jade is inside?
luna: You still think this is about treasure.
-> p043_reply

@prompt p043_reply “I will help you”

* “recover the Rain Seal” => “I will help you recover the Rain Seal.” -> p046_temporary_truce
* “find the Crescent Jade” => “I will help you find the Crescent Jade.” -> p040_no_trust
* “if you promise me a reward” => “I will help you if you promise me a reward.” -> p040_no_trust

@scene p044_false_exit
system: Nox follows a rising passage toward daylight.
system: Fresh boot prints cover the damp ground.
system: A rope has been fixed to the final climb.
nox [thought]: Someone prepared this exit recently.
system: Murid voices come from above.
-> p044_reply

@prompt p044_reply “I should”

* “climb into the bandit camp” => “I should climb into the bandit camp.” -> p042_bandit_camp
* “turn back toward Luna” => “I should turn back toward Luna.” -> p047_last_test
* “hide and observe first” => “I should hide and observe first.” -> part3_camp_from_above

@scene p045_hidden_vent
system: Nox returns through the flooded passage.
system: Luna waits beside the stream.
luna: You found the exit.
nox: I found Rizo.
luna: That is not the same thing.
nox: He has cages.
nox: And he has the Rain Seal.
system: Luna becomes completely still.
-> p045_reply

@prompt p045_reply “I came back because”

* “you needed to know” => “I came back because you needed to know.” -> p046_temporary_truce
* “I cannot fight him alone” => “I came back because I cannot fight him alone.” -> p046_temporary_truce
* “I want a share of the reward” => “I came back because I want a share of the reward.” -> p040_no_trust

@scene p046_temporary_truce
luna: You will lead me to Rizo.
nox: And then we are even?
luna: No.
nox: Then what happens after?
luna: After we recover the Rain Seal, I decide whether you are a thief, a prisoner, or something less inconvenient.
nox: That is not very reassuring.
luna: It is more honest than Rizo.
-> p046_reply

@prompt p046_reply “We should”

* “travel together” => “We should travel together.” -> p048_within_reach
* “keep our distance” => “We should keep our distance.” -> p047_last_test
* “have you walk in front” => “We should have you walk in front.” -> p047_last_test

@scene p047_last_test
system: Luna blocks the narrow route back toward the surface.
luna: Put down the knife.
nox: You still have claws.
luna: I cannot put those down.
nox: Convenient.
luna: Decide.
-> p047_reply

@prompt p047_reply “I will”

* “put down the knife” => “I will put down the knife.” -> p048_within_reach
* “pretend to surrender” => “I will pretend to surrender.” -> p049_broken_truce
* “keep it but lower the blade” => “I will keep it but lower the blade.” -> p047_compromise

@scene p047_compromise
system: Nox lowers the knife without releasing it.
system: Luna watches his hand.
luna: Not trust.
nox: Not yet.
luna: Honest enough.
-> p048_within_reach

@scene p048_within_reach
system: Nox walks beside Luna through the limestone passage.
system: Her claws remain close enough to reach him.
system: For the first time, he does not run.
luna: Rizo sent you first because he thought you were expendable.
nox: I know.
luna: And you still intended to steal from us.
nox: I know that too.
luna: Good.
nox: Why is that good?
luna: Because excuses are harder to trust than guilt.
system: Torchlight appears ahead.
-> p048_reply

@prompt p048_reply “Rizo”

* “has to be stopped” => “Rizo has to be stopped.” -> part3_enemy_of_enemy
* “will not expect us together” => “Rizo will not expect us together.” -> part3_enemy_of_enemy
* “may still forgive me” => “Rizo may still forgive me.” -> p048_doubt

@scene p048_doubt
luna: Forgive you?
luna: He sent you into a sealed dungeon.
nox: The caravan was my home.
luna: A cage can feel like home if you have never seen the door.
system: Rizo’s camp is visible through the final crack.
-> p048_doubt_reply

@prompt p048_doubt_reply “I”

* “will face him with you” => “I will face him with you.” -> part3_enemy_of_enemy
* “need to speak to him alone” => “I need to speak to him alone.” -> part3_rizo_confrontation
* “want to observe the camp first” => “I want to observe the camp first.” -> part3_camp_from_above

@scene p049_broken_truce
system: Nox lowers the knife.
system: Then he lunges toward Luna’s wrist.
system: Luna catches his arm before the blade moves halfway.
luna: There you are.
nox: Let go.
luna: You wanted me to trust you first.
system: Her grip tightens.
-> p049_reply

@prompt p049_reply “I”

* “was afraid” => “I was afraid.” -> ending_hunter_catches_mouse
* “can still help you” => “I can still help you.” -> ending_hunter_catches_mouse
* “will never trust a cat” => “I will never trust a cat.” -> ending_hunter_catches_mouse

@ending ending_hunter_catches_mouse “THE HUNTER CATCHES THE MOUSE”
luna: Fear keeps prey alive.
luna: Betrayal merely makes the chase shorter.
system: Nox’s knife falls into the stream.
system: This time, Luna does not let him run.

@scene part3_enemy_of_enemy
system: PART III
system: RIZO
system: Limestone Ridge — Bandit Camp
system: Nox leads Luna toward the hidden entrance.
nox: Rizo has at least eight bandits.
luna: Nine.
nox: How do you know?
luna: I can hear the one pretending not to be afraid.
system: Luna looks at Nox.
luna: Stay behind me when the fighting begins.
nox: I thought I was leading.
luna: You led me here.
luna: Try not to become useful as bait again.
-> p052_enemy_of_enemy

@scene part3_rizo_welcome
system: PART III
system: RIZO
system: Limestone Ridge — Bandit Camp
rizo: Welcome back, Nox.
rizo: Tell us everything you found.
system: Behind Rizo, a black-and-silver crescent hangs from his belt.
nox [thought]: The Rain Seal.
-> p050_rizo_welcome

@scene part3_rizo_confrontation
system: PART III
system: RIZO
system: Limestone Ridge — Bandit Camp
nox: You changed the map.
rizo: And yet here you are.
nox: You sealed the entrance behind me.
rizo: I prevented the danger from following you out.
system: The bandits begin surrounding Nox.
-> p054_one_mouse_against_rizo

@scene part3_camp_from_above
system: PART III
system: RIZO
system: Limestone Ridge — Above the Bandit Camp
system: Nox hides among the rocks overlooking the camp.
system: Rizo speaks with two armed bandits beside an iron cage.
rizo: Once the girl appears, take her alive.
bandit: And Nox?
rizo: If he survived, he has already served his purpose.
-> p051_camp_from_above

@scene p050_rizo_welcome
rizo: Welcome back, Nox.
rizo: Tell us everything you found.
system: Behind Rizo, a black-and-silver crescent hangs from his belt.
nox [thought]: The Rain Seal.
system: Two bandits close the path behind Nox.
-> p050_reply

@prompt p050_reply “I”

* “found the route to the temple” => “I found the route to the temple.” -> p053_back_among_bandits
* “found a Felidian girl” => “I found a Felidian girl.” -> p050_luna_question
* “know you sent me there to die” => “I know you sent me there to die.” -> p054_one_mouse_against_rizo

@scene p050_luna_question
system: Rizo’s hand moves to the Rain Seal.
rizo: A black cat girl?
nox: You know her?
rizo: I know what she is worth.
nox [thought]: Not who she is.
nox [thought]: What she is worth.
-> p050_luna_reply

@prompt p050_luna_reply “She”

* “is not your treasure” => “She is not your treasure.” -> p054_one_mouse_against_rizo
* “knows where the Crescent Jade is” => “She knows where the Crescent Jade is.” -> p053_back_among_bandits
* “escaped deeper into the cave” => “She escaped deeper into the cave.” -> p050_lie

@scene p050_lie
rizo: Deeper?
system: Rizo studies Nox’s face.
rizo: Then you will lead us to her.
nox: I do not know the route.
rizo: You found your way out.
rizo: You will find your way back.
-> p053_back_among_bandits

@scene p051_camp_from_above
system: Nox watches from the limestone ridge.
system: Rizo stands beside an iron cage.
system: The Rain Seal hangs from his belt.
rizo: Once the girl appears, take her alive.
bandit: And Nox?
rizo: If he survived, he has already served his purpose.
system: Another bandit unfolds a copy of Nox’s map.
-> p051_reply

@prompt p051_reply “I should”

* “keep listening” => “I should keep listening.” -> p055_price_of_girl
* “steal the Rain Seal now” => “I should steal the Rain Seal now.” -> p060_knife_behind_smile
* “leave before they find me” => “I should leave before they find me.” -> p056_escape_without_luna

@scene p052_enemy_of_enemy
system: Nox leads Luna through a narrow crack above the camp.
system: Nine Murid bandits wait below.
system: Rizo stands beside an iron cage.
system: The Rain Seal hangs from his belt.
luna: There.
nox: I see it.
luna: No.
luna: You see the seal.
luna: I see what he intends to do with it.
-> p052_reply

@prompt p052_reply “We should”

* “attack before they move” => “We should attack before they move.” -> p057_lunas_assault
* “listen to Rizo first” => “We should listen to Rizo first.” -> p055_price_of_girl
* “steal the seal without fighting” => “We should steal the seal without fighting.” -> p052_stealth

@scene p052_stealth
nox: I can reach his tent from the rear.
luna: Alone?
nox: I am small enough.
luna: That was Rizo’s argument too.
nox: This time I chose it.
system: Luna watches him for a long moment.
luna: Then I will make sure he is looking elsewhere.
-> p060_knife_behind_smile

@scene p053_back_among_bandits
system: Rizo places one arm around Nox’s shoulders.
rizo: You see?
rizo: I told them you would return.
system: None of the bandits meet Nox’s eyes.
rizo: Now show us the entrance.
nox [thought]: They brought ropes.
nox [thought]: Weapons.
nox [thought]: And a cage.
-> p053_reply

@prompt p053_reply “I will”

* “guide them toward the sacred gate” => “I will guide them toward the sacred gate.” -> p058_open_sacred_gate
* “lead them toward the Felidian guards” => “I will lead them toward the Felidian guards.” -> p059_guard_line
* “pretend to cooperate until I can act” => “I will pretend to cooperate until I can act.” -> p060_knife_behind_smile

@scene p054_one_mouse_against_rizo
nox: You changed the map.
nox: You sealed the entrance behind me.
rizo: And still you returned.
nox: You expected me to die.
rizo: I expected you to be useful.
system: The bandits form a circle around Nox.
rizo: Do not confuse survival with importance.
-> p054_reply

@prompt p054_reply “I will”

* “draw my knife” => “I will draw my knife.” -> ending_one_mouse_caravan
* “pretend to surrender” => “I will pretend to surrender.” -> p060_knife_behind_smile
* “call for Luna” => “I will call for Luna.” -> p054_call_luna

@scene p054_call_luna
nox: Luna!
system: Silence answers him.
rizo: The Felidian girl?
rizo: You escaped from her and still expect her to save you?
system: Rizo draws his blade.
-> ending_one_mouse_caravan

@ending ending_one_mouse_caravan “ONE MOUSE AGAINST THE CARAVAN”
system: Nox raises his knife.
system: Rizo does not move first.
system: He does not need to.
system: Eight bandits close around Nox.
rizo: Courage is useful.
rizo: But only when someone powerful can afford it.
system: Nox learns too late that bravery is not the same as strength.

@scene p055_price_of_girl
system: Rizo speaks beside the iron cage.
rizo: The priests lost their sacrifice.
bandit: You mean the girl?
rizo: I mean the Crescent Jade.
bandit: I thought it was a jewel.
rizo: So did every fool who died searching for it.
system: Luna’s claws press into the limestone.
luna: He knows.
nox: Not everything.
rizo: With the girl and the Rain Seal, the priests will pay us enough to buy a city.
-> p055_reply

@prompt p055_reply “I should”

* “return to Luna with the truth” => “I should return to Luna with the truth.” -> p057_lunas_assault
* “bargain with Rizo” => “I should bargain with Rizo.” -> p061_rizos_bargain
* “wait until he reveals the temple route” => “I should wait until he reveals the temple route.” -> p055_route

@scene p055_route
rizo: The Moon Gate lies beneath the eastern ridge.
rizo: The seal opens it.
bandit: And if the priests refuse to pay?
rizo: Then we sell the girl elsewhere.
system: Luna’s breathing becomes quieter.
nox [thought]: That is worse than anger.
-> p057_lunas_assault

@scene p056_escape_without_luna
system: Nox slips away from the camp.
system: Open land stretches beyond the limestone ridge.
system: The road back toward Murid territory is unguarded.
nox [thought]: I could leave.
nox [thought]: Rizo would have the girl.
nox [thought]: The priests would have their sacrifice.
nox [thought]: But I would live.
-> p056_reply

@prompt p056_reply “I will”

* “leave Felidian territory” => “I will leave Felidian territory.” -> ending_mouse_escaped_alone
* “return for the Rain Seal” => “I will return for the Rain Seal.” -> p060_knife_behind_smile
* “search for Luna first” => “I will search for Luna first.” -> p057_lunas_assault

@ending ending_mouse_escaped_alone “THE MOUSE WHO ESCAPED ALONE”
system: Nox walks until the limestone hills disappear behind him.
system: No one follows.
system: No claws reach for him.
system: No bandit calls his name.
system: Months later, he hears that the Felidian priests completed their ceremony.
system: He never asks what became of Luna.

@scene p057_lunas_assault
system: Luna drops from the ridge into the center of the camp.
bandit: Felidian!
rizo: Take her alive!
system: Luna cuts the nearest lantern rope.
system: Darkness falls across the camp.
luna: Nox.
luna: Now.
-> p057_reply

@prompt p057_reply “I will”

* “cut the bandits’ escape ropes” => “I will cut the bandits’ escape ropes.” -> p062_bandits_in_darkness
* “pursue Rizo directly” => “I will pursue Rizo directly.” -> p063_moon_gate_opens
* “free the frightened pack animals” => “I will free the frightened pack animals.” -> p057_animals

@scene p057_animals
system: Nox cuts the caravan animals loose.
system: Frightened beasts scatter through the camp.
system: Tents collapse.
system: Supplies roll down the ridge.
bandit: Stop them!
system: Half the bandits abandon the fight.
luna: Effective.
nox: You sound surprised.
luna: I am adjusting my expectations.
-> p062_bandits_in_darkness

@scene p058_open_sacred_gate
system: Nox leads the bandits along the ridge.
system: A stone gate stands between two carved Felidian pillars.
system: Three guards wait before it.
guard: Stop there.
guard: Return the Rain Seal.
rizo: Nox.
rizo: Show them how useful you can be.
-> p058_reply

@prompt p058_reply “I will”

* “attack the Felidian guards” => “I will attack the Felidian guards.” -> ending_price_of_rain
* “turn against Rizo” => “I will turn against Rizo.” -> p059_guard_line
* “warn the guards about Luna” => “I will warn the guards about Luna.” -> p059_guard_line

@scene p059_guard_line
nox: Rizo stole the Rain Seal.
nox: He plans to capture the Crescent Jade.
system: The guards raise their spears.
guard: And you traveled with him.
nox: Yes.
guard: Then surrender.
system: Rizo’s bandits close from behind.
-> p059_reply

@prompt p059_reply “I will”

* “surrender and explain everything” => “I will surrender and explain everything.” -> p064_prisoner_of_priests
* “run back to Rizo” => “I will run back to Rizo.” -> ending_price_of_rain
* “create a distraction and escape” => “I will create a distraction and escape.” -> p059_escape

@scene p059_escape
system: Nox kicks loose stones down the ridge.
system: Guards and bandits turn toward the noise.
system: Nox slips beneath the gate’s side wall.
system: A narrow aqueduct leads into darkness.
-> p075_forgotten_aqueduct

@scene p060_knife_behind_smile
system: Nox returns to Rizo’s side.
rizo: Changed your mind?
nox: I understand my place now.
rizo: Good.
system: Rizo turns toward the map.
system: The Rain Seal hangs within Nox’s reach.
-> p060_reply

@prompt p060_reply “I will”

* “steal the Rain Seal” => “I will steal the Rain Seal.” -> p065_stolen_rain_seal
* “wait for a safer opportunity” => “I will wait for a safer opportunity.” -> p061_rizos_bargain
* “attack Rizo from behind” => “I will attack Rizo from behind.” -> p060_attack

@scene p060_attack
system: Nox draws his knife.
system: Rizo catches his wrist without turning.
rizo: Better.
rizo: At least now you are trying to be dangerous.
system: Rizo throws Nox to the ground.
-> ending_one_mouse_caravan

@scene p061_rizos_bargain
rizo: You are angry.
nox: You sent me to die.
rizo: I sent you to become valuable.
rizo: And now you are.
system: Rizo places a small pouch of coins before Nox.
rizo: Help me deliver the girl to the priests.
rizo: You will receive a full share.
-> p061_reply

@prompt p061_reply “I will”

* “accept my share” => “I will accept my share.” -> ending_price_of_rain
* “free Luna secretly” => “I will free Luna secretly.” -> p066_mouse_cuts_cage
* “ask what the priests intend to do” => “I will ask what the priests intend to do.” -> p061_ceremony

@scene p061_ceremony
rizo: They will pray for rain.
nox: With a girl tied to an altar?
rizo: Priests always make simple things theatrical.
nox: She will die.
rizo: One girl.
rizo: One valley.
rizo: And enough gold to keep our caravan alive for years.
-> p061_final_reply

@prompt p061_final_reply “That”

* “is murder” => “That is murder.” -> p066_mouse_cuts_cage
* “is a fair price” => “That is a fair price.” -> ending_price_of_rain
* “sounds like the priests’ problem” => “That sounds like the priests’ problem.” -> ending_price_of_rain

@ending ending_price_of_rain “THE PRICE OF RAIN”
system: Rizo delivers Luna and the Rain Seal to the Felidian priests.
system: The priests pay in gold, water, and safe passage.
system: Rizo gives Nox the full share he promised.
rizo: You wanted treasure.
rizo: Now you have it.
system: As the caravan leaves, a ceremonial bell rings behind them.
nox [thought]: The bag is heavier than I expected.
system: No one looks back.

@scene p062_bandits_in_darkness
system: The camp dissolves into confusion.
system: Several bandits run toward the ridge.
system: Two fall when their escape rope snaps.
bandit: Help us!
system: Rizo runs toward the Moon Gate with the Rain Seal.
luna: He is getting away.
-> p062_reply

@prompt p062_reply “I will”

* “rescue the trapped bandits” => “I will rescue the trapped bandits.” -> p067_better_leader
* “leave them and chase Rizo” => “I will leave them and chase Rizo.” -> p063_moon_gate_opens
* “order them to stop fighting” => “I will order them to stop fighting.” -> p067_better_leader

@scene p063_moon_gate_opens
system: Rizo reaches a black stone gate.
system: He presses the Rain Seal into a crescent-shaped hollow.
temple: THUM.
system: The gate opens inward.
rizo: Too slow, Nox.
system: Rizo disappears into the darkness beyond it.
system: The stone gate begins closing.
-> p063_reply

@prompt p063_reply “I will”

* “follow Rizo immediately” => “I will follow Rizo immediately.” -> p069_rizos_trail
* “wait for Luna” => “I will wait for Luna.” -> p068_into_temple_together
* “try to remove the Rain Seal first” => “I will try to remove the Rain Seal first.” -> p063_seal_rejects

@scene p063_seal_rejects
system: Nox reaches for the seal.
system: The crescent hollow closes around his hand.
temple: TING.
nox: Not that bell again.
system: Luna pulls him backward before a stone blade falls.
luna: You are very committed to repeating mistakes.
-> p068_into_temple_together

@scene p064_prisoner_of_priests
system: The Felidian guards bind Nox’s hands.
guard: The high priest will decide whether you are a thief or a witness.
nox: Rizo has the Rain Seal.
guard: We know.
nox: Then why are you still guarding this gate?
guard: Because he does not have the Crescent Jade.
system: The guard looks toward the cave behind Nox.
-> p064_reply

@prompt p064_reply “I will”

* “reveal that Luna is nearby” => “Luna is nearby.” -> p070_priests_escort
* “conceal Luna’s location” => “I do not know where Luna is.” -> p064_conceal
* “say Rizo plans to sell her” => “Rizo plans to sell her.” -> p070_priests_escort

@scene p064_conceal
guard: You are lying.
nox: I learned from Rizo.
guard: Then perhaps you learned why lies fail before priests.
system: The guards lead Nox toward an older aqueduct entrance.
-> p075_forgotten_aqueduct

@scene p065_stolen_rain_seal
system: Nox cuts the cord from Rizo’s belt.
system: The Rain Seal drops into his hand.
rizo: Nox.
system: Every bandit turns toward him.
system: Luna appears on the ridge above.
-> p065_reply

@prompt p065_reply “I will”

* “throw the seal to Luna” => “I will throw the seal to Luna.” -> p068_into_temple_together
* “keep it for myself” => “I will keep it for myself.” -> p071_seals_false_promise
* “use it to bargain with Rizo” => “I will use it to bargain with Rizo.” -> p065_bargain

@scene p065_bargain
nox: Let me leave.
nox: Or the seal goes over the cliff.
rizo: You would not destroy the only thing worth more than your life.
nox: You keep making that comparison.
system: Rizo steps closer.
-> p065_bargain_reply

@prompt p065_bargain_reply “I will”

* “throw it to Luna” => “I will throw it to Luna.” -> p068_into_temple_together
* “give it back to Rizo” => “I will give it back to Rizo.” -> p061_rizos_bargain
* “run for the gate with it” => “I will run for the gate with it.” -> p071_seals_false_promise

@scene p066_mouse_cuts_cage
system: Nox waits until Rizo turns away.
system: He slips behind the iron cage.
system: Luna sits inside with her wrists bound.
luna: You came back.
nox: Quiet.
luna: That is what you said before dropping the knife.
nox: I am trying to rescue you.
luna: Then try more quickly.
-> p066_reply

@prompt p066_reply “I will”

* “open the cage and escape with her” => “I will open the cage and escape with her.” -> p068_into_temple_together
* “demand a reward first” => “I will demand a reward first.” -> p071_seals_false_promise
* “ask her to attack Rizo immediately” => “I will ask her to attack Rizo immediately.” -> p057_lunas_assault

@scene p067_better_leader
system: Nox cuts the trapped bandits free.
bandit: Why help us?
nox: Because Rizo would not.
system: The remaining bandits hesitate.
bandit: He sent you first.
bandit: Then he left us behind too.
system: Rizo reaches the Moon Gate alone.
-> p067_reply

@prompt p067_reply “I will tell them to”

* “stand down and leave Felidian territory” => “Stand down and leave Felidian territory.” -> p072_caravan_divides
* “follow me against Rizo” => “Follow me against Rizo.” -> p072_caravan_divides
* “chase Rizo without me” => “Chase Rizo without me.” -> p073_expendable_again

@scene p068_into_temple_together
system: Nox and Luna stand before the Moon Gate.
system: Ancient Felidian writing circles the crescent-shaped lock.
luna: Rizo has gone inside.
nox: Then we follow him.
luna: The main gate is meant for priests.
nox: Is there another entrance?
luna: There was once an aqueduct.
-> p068_reply

@prompt p068_reply “We should”

* “enter through the Moon Gate” => “We should enter through the Moon Gate.” -> p074_temple_of_abundance
* “search for the old aqueduct” => “We should search for the old aqueduct.” -> p075_forgotten_aqueduct
* “wait for the guards” => “We should wait for the guards.” -> p070_priests_escort

@scene p069_rizos_trail
system: Nox slips through the gate before it closes.
system: The corridor beyond is lined with black floor tiles.
system: Rizo’s footprints cross them in an uneven pattern.
system: Several untouched tiles bear shallow crescent marks.
nox [thought]: He stepped on some tiles and avoided others.
nox [thought]: That does not mean he knew which were safe.
-> p069_reply

@prompt p069_reply “I will”

* “step exactly where Rizo stepped” => “I will step exactly where Rizo stepped.” -> p076_first_offering_hall
* “inspect the threshold first” => “I will inspect the threshold first.” -> p075_forgotten_aqueduct
* “take the untouched crescent tiles” => “I will take the untouched crescent tiles.” -> p069_trap

@scene p069_trap
system: Nox steps on an untouched crescent tile.
temple: TING.
system: Stone shutters fall behind him.
system: Water begins pouring into the corridor.
-> p093_flooded_shaft

@scene p070_priests_escort
system: Felidian guards surround Nox and Luna.
guard: The Crescent Jade has returned.
luna: I returned for the Rain Seal.
guard: The high priest will hear you.
luna: He heard me before I ran.
system: The guards open a ceremonial path toward the temple.
-> p070_reply

@prompt p070_reply “I will”

* “cooperate for now” => “I will cooperate for now.” -> p077_procession_white_robes
* “help Luna escape into the side passages” => “I will help Luna escape into the side passages.” -> p075_forgotten_aqueduct
* “ask whether the sacrifice is voluntary” => “Is the sacrifice voluntary?” -> p070_answer

@scene p070_answer
guard: The Crescent Jade was chosen.
nox: That was not my question.
guard: One life protects the valley.
luna: That was not his question.
system: The guards tighten their formation.
-> p077_procession_white_robes

@scene p071_seals_false_promise
system: Nox holds the Rain Seal.
system: The black stone is warm in his hands.
nox [thought]: With this, I can open the temple myself.
system: A narrow sealed door stands beneath the ridge.
system: Its hollow matches the crescent shape.
-> p071_reply

@prompt p071_reply “I will”

* “use the seal on the first door” => “I will use the seal on the first door.” -> ending_false_treasure
* “return it to Luna” => “I will return it to Luna.” -> p068_into_temple_together
* “hide it and enter through the aqueduct” => “I will hide it and enter through the aqueduct.” -> p075_forgotten_aqueduct

@ending ending_false_treasure “THE FALSE TREASURE”
system: Nox presses the Rain Seal into the door.
system: The crescent lock accepts it.
system: The floor opens beneath him.
nox [thought]: It opened.
system: The seal was never a key to every door.
system: Only a mark of authority.
system: The temple does not recognize Nox as its bearer.

@scene p072_caravan_divides
system: The Murid bandits lower their weapons.
system: Some flee toward the caravan road.
system: Others remain beside Nox.
bandit: Rizo has the seal.
bandit: And he knows the Moon Gate.
nox: Then we reach the temple another way.
system: Luna points toward a dry channel cut into the ridge.
luna: The old aqueduct.
-> p072_reply

@prompt p072_reply “We will”

* “enter through the aqueduct” => “We will enter through the aqueduct.” -> p075_forgotten_aqueduct
* “pursue Rizo through the main gate” => “We will pursue Rizo through the main gate.” -> p076_first_offering_hall
* “send the bandits home and continue alone” => “Go home. Luna and I will continue.” -> p075_forgotten_aqueduct

@scene p073_expendable_again
system: The bandits rush after Rizo.
system: Nox remains behind.
system: A moment later, bells ring inside the Moon Gate.
temple: TING.
temple: TING.
temple: TING.
system: Screams echo through the stone.
nox [thought]: He sent them first.
nox [thought]: Just as he sent me.
-> ending_one_mouse_caravan

@scene p074_temple_of_abundance
system: PART IV
system: SECRET OF THE TEMPLE OF ABUNDANCE
system: The Moon Gate closes behind Nox and Luna.
system: The air smells of dust, incense, and distant water.
system: Rain carvings cover the walls.
system: Rizo’s footprints lead toward a golden corridor.
system: Older water channels descend in the opposite direction.
luna: The priests will already know the gate opened.
nox: Then we should move.
-> p074_reply

@prompt p074_reply “We should follow”

* “the ancient rain carvings” => “We should follow the ancient rain carvings.” -> p078_door_without_shadow
* “Rizo’s footprints” => “We should follow Rizo’s footprints.” -> p079_rizos_triggered_trap
* “the sound of water below” => “We should follow the sound of water below.” -> p075_forgotten_aqueduct

@scene p075_forgotten_aqueduct
system: PART IV
system: SECRET OF THE TEMPLE OF ABUNDANCE
system: Nox and Luna enter a dry stone channel beneath the temple.
system: Mineral stains show that water once flowed here.
system: A faint trickle sounds somewhere below.
system: Chanting echoes from an opening above.
luna: This passage predates the current priesthood.
nox: How do you know?
luna: The old builders expected water to enter.
luna: The priests expect blood.
-> p075_reply

@prompt p075_reply “We should follow”

* “the sound of water” => “We should follow the sound of water.” -> p080_dry_reservoir
* “the chanting above” => “We should follow the chanting above.” -> p081_high_priest
* “Rizo’s scratches on the wall” => “We should follow Rizo’s scratches on the wall.” -> p076_first_offering_hall

@scene p076_first_offering_hall
system: PART IV
system: SECRET OF THE TEMPLE OF ABUNDANCE
system: Nox enters a chamber filled with ceremonial gifts.
system: Golden bowls line the walls.
system: Rizo’s footprints cross the dust.
system: One bowl has already been removed.
nox [thought]: He took the first treasure he saw.
system: A low stone door waits beyond the offerings.
-> p076_reply

@prompt p076_reply “I will”

* “leave the gold untouched” => “I will leave the gold untouched.” -> p078_door_without_shadow
* “take one golden bowl” => “I will take one golden bowl.” -> p082_weight_of_gold
* “study the marks beneath the bowls” => “I will study the marks beneath the bowls.” -> p076_marks

@scene p076_marks
system: Beneath every bowl is a carved image.
system: Grain beneath one.
system: Water beneath another.
system: A kneeling girl beneath the empty place.
nox [thought]: The gifts are not all objects.
nox [thought]: They are things the valley gives up.
-> p078_door_without_shadow