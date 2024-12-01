function __init_dialogue_friend(){
	
	var _dialogue_data_initial = {}; 
	
	var _dialogue_manager = {
		
		character_data: {},
		conversation_sequences: {},
		
		reload_csv: function(_file_name){
			
		    var _buffer = buffer_load(_file_name);
		    var _string = buffer_read(_buffer, buffer_text);
		    buffer_delete(_buffer);
			
			conversation_sequences = __dialogue_friend_conversation_sequences_from_csv(_string);
		}
	};
	
	//_dialogue_manager.conversation_sequences = __dialogue_friend_conversation_sequences_from_csv(@"");
	_dialogue_manager.reload_csv("dialogue.csv");
	
	return _dialogue_manager;
};
