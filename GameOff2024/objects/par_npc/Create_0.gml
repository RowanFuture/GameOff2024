//dialogue set up

//NPC_Character_Key = "Fisherman";
//
//first_time_sequence = "";
//repeat_sequence = "";

var _dia = DialogueFriend();
character_data = _dia.get_character_data(NPC_Character_Key);

first_time_talking = true;

is_talking = false;

function reset_talking(_first_time_seq,_repeat_seq){
	first_time_sequence = _first_time_seq;
	repeat_sequence = _repeat_seq;
	first_time_talking = true;
}

depth = -y;