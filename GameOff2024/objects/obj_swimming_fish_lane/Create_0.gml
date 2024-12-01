var _set = global.fish_set[fish_type];

fish_grid = [];

var _w = array_length(_set[0]);

for(var _xx = 0; _xx <  array_length(_set); _xx++){
	for(var _yy = 0; _yy < array_length(_set[_xx]); _yy++){
		
		fish_grid[_xx,_yy] =  global.item_pattern_grid[_set[_xx,_yy]];
	}
}

anim_x_max = x+image_xscale*16-_w;
anim_x_min = x;