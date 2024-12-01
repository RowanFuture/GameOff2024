if(!just_loaded && mouse_check_button_pressed(mb_left)){
	next_dialogue();
	
	if(current_dialogue && current_dialogue.text == "There. Much Better."){
		with(obj_boat_painting)
			visible = true;
	} else if(current_dialogue && current_dialogue.text == "Well done. Go on through now!"){
		with(obj_door)
			open = true;
	}
}

just_loaded = false;