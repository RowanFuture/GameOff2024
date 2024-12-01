draw_clear(c_black);

draw_sprite_ext(spr_title_screen,0,SCREEN_WIDTH/2,SCREEN_HEIGHT/2,.1,.1,0,c_white,1);

draw_set_color(#9eb4b3);
draw_set_halign(fa_center);
draw_set_font(fnt_main);
draw_text_transformed(SCREEN_WIDTH/2,SCREEN_HEIGHT/2+50,"click to start!",1/2,1/2,0);

draw_sprite_ext(spr_pencil,0,GUI_MOUSE_X+sprite_get_xoffset(spr_pencil)-2,GUI_MOUSE_Y-sprite_get_height(spr_pencil)+sprite_get_yoffset(spr_pencil)+2,1,1,0,c_white,1);

