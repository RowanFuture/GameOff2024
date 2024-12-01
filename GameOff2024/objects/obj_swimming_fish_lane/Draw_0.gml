var _t = dsin(current_time*.1+x)*.5+.5;

//if(_t == 0 || _t == 1)
//	exit;

x = lerp(anim_x_max,anim_x_min,_t);

var _col = #84a0a1;
for(var _xx = 0; _xx < array_length(fish_grid); _xx++){
	for(var _yy = 0; _yy < array_length(fish_grid[_xx]); _yy++){
		
		for(var _y = 0; _y < 8; _y++){
			for(var _x = 0; _x < 8; _x++){
				if(fish_grid[_xx,_yy][_y,_x]){
					draw_sprite_ext(spr_pixel,0,x+_x+_yy*8,y+_y+_xx*8,1,1,0,_col,1);
				}
			}
		}
		
	}
}