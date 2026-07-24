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
@scene part2_escape_from_luna
system: PART II
system: ESCAPE FROM LUNA
system: Limestone Cave — Unknown depth
system: Nox follows Luna into the underground passage.
luna: Stay close, little mouse.
nox [thought]: The entrance is gone.
nox [thought]: For now, Luna is the only guide I have.
system: Pale moths flutter ahead toward moving air.
