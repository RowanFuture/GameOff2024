function draw_rectangle_polyfill(_x1,_y1,_x2,_y2,_outline){
	draw_sprite_stretched_ext(spr_rectangle_render,_outline,_x1,_y1,_x2-_x1+1,_y2-_y1+1,draw_get_color(),1);
}