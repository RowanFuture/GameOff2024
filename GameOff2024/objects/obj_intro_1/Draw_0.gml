var _y = 20;

draw_clear(#2C4251);

var _float = (dsin(current_time*.2)*.5+.5)*4;
var _float1 = (dsin(current_time*.2+30)*.5+.5)*4;

draw_sprite(spr_intro_2,2,(SCREEN_WIDTH div 2) - 118 div 2,_y );
draw_sprite(spr_intro_2,1,(SCREEN_WIDTH div 2) - 118 div 2,_y-_float1 );
draw_sprite(spr_intro_2,0,(SCREEN_WIDTH div 2) - 118 div 2,_y-_float );

draw_sprite(spr_intro_2,3,(SCREEN_WIDTH div 2) - 118 div 2,_y );

draw_set_color(#f3fbce);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(SCREEN_WIDTH div 2+2, 100, "Take this notepad.\nDraw everything you see!");


draw_sprite_ext(spr_pencil,0,GUI_MOUSE_X+sprite_get_xoffset(spr_pencil)-2,GUI_MOUSE_Y-sprite_get_height(spr_pencil)+sprite_get_yoffset(spr_pencil)+2,1,1,0,c_white,1);

