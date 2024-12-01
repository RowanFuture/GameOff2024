if(!instance_exists(obj_transition) && mouse_check_button_pressed(mb_left)){
	instance_create_depth(x,y,0,obj_transition,{rm: rm_intro2});
}