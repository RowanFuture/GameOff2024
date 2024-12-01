
lerp_val = lerp(lerp_val,trans,.1);

if(lerp_val >= .9 && trans){
	if(long_timer > 0){
		long_timer--;
		
		if(long_timer > 50){
			if(!audio_is_playing(snd_running))audio_play_sound(snd_running,50,false,.86);
		}
	} else {
		with(obj_player){
			x = other.x;
			y = other.y;
			state = PLAYER_STATE.NORMAL;
		}
		trans = false;
	}
}

if(trans == false && lerp_val < .1){
	instance_destroy();
}