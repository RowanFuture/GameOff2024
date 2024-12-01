/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _all_fish_filled = true;

with(obj_fish_platter){
	for(var _i = 0; _i < array_length(pattern_objects); _i++){
		if(!pattern_objects[_i].filled){
			_all_fish_filled = false;
			break;
		}
	}
	if(!_all_fish_filled){
			break;
	}
}

if(!quest_complete && _all_fish_filled){
	
	reset_talking("Fisherman Complete","Fisherman complete repeat");
	
	
	
	quest_complete = true;
}