function __dialogue_friend_conversation_sequences_from_csv(_csv_string) {
	
	var _lines = string_split(_csv_string, "\n", true);
	var _line_count = array_length(_lines);
	
	var _current_sequence = undefined;
	
	var _sequence_map = {};
	
	//_i starts at 1 ignoring table titles (0)
	for(var _i = 1; _i < _line_count; _i++){
	    
		var _values = string_split(_lines[_i], ",", false);
		
		var _sequence_name = _values[0];
		var _character = _values[1];
		var _text = _values[2];
		
		var _dialogue_moment_data = {
			character_key: _character,
			text: string_trim(_text),
		};
		
		//start a new sequence when the sequence field isn't blank
		if(_sequence_name != ""){
			_current_sequence = [];
			_sequence_map[$ _sequence_name] = _current_sequence;
		}
		
		if(_character != "" && _character != "-"){
			array_push(_current_sequence,_dialogue_moment_data);
		}
	}
	
	return _sequence_map;
} 