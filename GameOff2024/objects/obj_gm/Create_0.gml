#macro SCREEN_WIDTH 192
#macro SCREEN_HEIGHT 144
#macro PIXEL_RES 4

#macro GUI_MOUSE_X device_mouse_x_to_gui(0)
#macro GUI_MOUSE_Y device_mouse_y_to_gui(0)

window_set_size(SCREEN_WIDTH * PIXEL_RES,SCREEN_HEIGHT * PIXEL_RES);
surface_resize(application_surface,SCREEN_WIDTH,SCREEN_HEIGHT);
window_center();

display_set_gui_size(SCREEN_WIDTH,SCREEN_HEIGHT);

application_surface_draw_enable(false);

draw_set_font(fnt_main);

room_goto_next();

//global.init_audio = false;
global.audio_active = false;

	audio_master_gain(.7);
	
playing_music = -1;

global.music_id = snd_intro;