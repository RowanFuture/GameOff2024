var _y = 20;

draw_clear(#2C4251);

draw_sprite(spr_intro_1,7,(SCREEN_WIDTH div 2) - 118 div 2,_y);
draw_sprite(spr_intro_1,6,(SCREEN_WIDTH div 2) - 118 div 2 + dcos(current_time),_y+dsin(current_time));

var _a = [];
for(var _t = 0; _t <= 1; _t++){
	
	var _move  = lerp(0,1,(current_time/2000 + _t*.5) mod 1);
	
	if(_t == 1){
		if(_a[0] < _move){
			array_insert(_a,0,_move);
		} else {
			array_push(_a,_move);
		}
	} else {
		array_push(_a,_move);
	}
}

for(var _i = 0; _i < 2; _i ++){
	var _move = _a[_i];
	
	var _move_d = twerp(TwerpType.in_quart,0,1,_move);

	var _move_side = twerp(TwerpType.out_sine,1,0,_move);
	
	draw_sprite_ext(spr_intro_1,4,(SCREEN_WIDTH div 2) - 118/2 - 50*_move_side,_y+_move_d*30,1,1,0,c_white,1);
	draw_sprite_ext(spr_intro_1,5,(SCREEN_WIDTH div 2) - 118/2 + 30*_move_side,_y+_move_d*30,1,1,0,c_white,1);
}

draw_sprite(spr_intro_1,3,(SCREEN_WIDTH div 2) - 118 div 2,_y+dsin(current_time*.5));

draw_sprite(spr_intro_1,((current_time) div 200) mod 2 + 1,(SCREEN_WIDTH div 2) - 118 div 2,_y);

draw_sprite_ext(spr_intro_1,0,(SCREEN_WIDTH div 2) - 118 div 2,_y + dsin(current_time)*1,1,1,0,c_white,1);
draw_sprite_ext(spr_intro_smoke,current_time div 150,(SCREEN_WIDTH div 2)-8,_y+35 + dsin(current_time)*1,1,1,0,c_white,1);

draw_sprite(spr_intro_1,8,(SCREEN_WIDTH div 2) - 118 div 2,_y );

draw_set_color(#f3fbce);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(SCREEN_WIDTH div 2, 100, "Time for a school trip!");


draw_sprite_ext(spr_pencil,0,GUI_MOUSE_X+sprite_get_xoffset(spr_pencil)-2,GUI_MOUSE_Y-sprite_get_height(spr_pencil)+sprite_get_yoffset(spr_pencil)+2,1,1,0,c_white,1);

