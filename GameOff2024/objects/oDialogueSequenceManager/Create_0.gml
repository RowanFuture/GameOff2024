dialogue_friend =  DialogueFriend();

dialogue_sequence = dialogue_friend.get_conversation_sequence(sequence_key);

dialogue_pointer = -1;
dialogue_length = array_length(dialogue_sequence);

current_dialogue = undefined;
current_dialogue_character = undefined;

function next_dialogue(){
	dialogue_pointer++;
	
	//if dialogue is over
	if(dialogue_pointer >= dialogue_length){
		
		with(obj_player){
			state = return_state;
			cam_trans();
		}
		
		instance_destroy();
		
	} else {
		
		current_dialogue = dialogue_sequence[dialogue_pointer];
		current_dialogue_character = dialogue_friend.get_character_data(current_dialogue.character_key);
	
		audio_play_sound(snd_npc_talk,50,false,1,0,current_dialogue_character.pitch+random_range(-.02,0.02));
	}
}

just_loaded = true;

next_dialogue();