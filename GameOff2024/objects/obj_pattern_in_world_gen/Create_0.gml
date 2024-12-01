var _pattern_grid = global.item_pattern_grid[item_id];

var _width = sprite_get_width(object_get_sprite(object_type));
var _height = sprite_get_height(object_get_sprite(object_type));
	
for(var _y = 0; _y < 8; _y++){
	for(var _x = 0; _x < 8; _x++){
		if(_pattern_grid[_y,_x]){
			instance_create_depth(x+_width*_x,y+_height*_y,0,object_type);
		}
	}
}