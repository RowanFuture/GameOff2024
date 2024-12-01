/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _all_fish_filled = true;

with(obj_pattern_slot){
	if(
		(
			pattern == ITEMS.FLOWER_1
		||	pattern == ITEMS.FLOWER_2
		||	pattern == ITEMS.FLOWER_3
		||	pattern == ITEMS.FLOWER_4
		) && !filled){
		_all_fish_filled = false;
		break;
	}
}

if(!quest_complete && _all_fish_filled){
	
	reset_talking("Granny Complete","Granny complete repeat");
	
	quest_complete = true;
}