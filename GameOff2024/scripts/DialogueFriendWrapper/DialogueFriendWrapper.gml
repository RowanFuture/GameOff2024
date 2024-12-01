function DialogueFriendWrapper(_dialogue_manager) constructor {
	__internal_dialogue_manager = _dialogue_manager;
	
	//builder functions
	static set_character_data = function(_character_key, _character_data){
		__internal_dialogue_manager.character_data[$ _character_key] = _character_data;
		
		return self;
	}
	
	//getters
	static get_character_data = function(_character_key){
		return __internal_dialogue_manager.character_data[$ _character_key];
	}
	static get_conversation_sequence = function(_sequence_key){
		return __internal_dialogue_manager.conversation_sequences[$ _sequence_key];
	}
}