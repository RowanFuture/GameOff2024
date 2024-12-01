is_talking = instance_exists(oDialogueSequenceManager)
&& oDialogueSequenceManager.current_dialogue_character.name == character_data.name;

sprite_index = is_talking ? character_data.talk_sprite : character_data.idle_sprite;