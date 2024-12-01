var _set = pattern_data;

slot_grid = [];


_h = array_length(_set);
_w = array_length(_set[0]);

//bg_sprite = undefined;
//
//if(_w == 1 && _h == 1){
//	bg_sprite = spr_1x1_fish_canvas;
//}
//if(_w == 1 && _h == 2){
//	bg_sprite = spr_1x2_fish_canvas;
//}
//if(_w == 2 && _h == 2){
//	bg_sprite = spr_2x2_fish_canvas;
//}
//if(_w == 3 && _h == 1){
//	bg_sprite = spr_3x1_fish_canvas;
//}

pattern_objects = [];

for(var _xx = 0; _xx < _h; _xx++){
	for(var _yy = 0; _yy < _w; _yy++){
		
		var _inst = instance_create_depth(x+_yy*8,y+_xx*8,0,obj_pattern_slot);
		
		array_push(pattern_objects,_inst);
		
		_inst.pattern = _set[_xx,_yy];
		
		slot_grid[_xx,_yy] = _inst;
		
	}
}
