function start_dialogue_sequence(_sequence_key){
	instance_create_depth(0,0,0,oDialogueSequenceManager, {
		sequence_key: _sequence_key
	});
}