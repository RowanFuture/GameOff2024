
lerp_val = lerp(lerp_val,trans,.1);

if(lerp_val >= .9 && trans){
	room_goto(rm);
	trans = false;
}

if(trans == false && lerp_val < .1){
	instance_destroy();
}