if(playing_music != -1
&& !audio_is_playing(global.music_id) && audio_sound_get_gain(playing_music) >= .3){
	audio_sound_gain(playing_music,0,200);
}

if(audio_sound_get_gain(playing_music) == 0){
	audio_stop_sound(playing_music);
	playing_music = audio_play_sound(global.music_id,90,true,0);
	audio_sound_gain(playing_music,.3,600);
}

global.music_id = snd_intro;