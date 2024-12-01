event_inherited();

bg_sprite = undefined;

if(_w == 1 && _h == 1){
	bg_sprite = spr_1x1_fish_canvas;
}
if(_w == 1 && _h == 2){
	bg_sprite = spr_1x2_fish_canvas;
}
if(_w == 2 && _h == 2){
	bg_sprite = spr_2x2_fish_canvas;
}
if(_w == 3 && _h == 1){
	bg_sprite = spr_3x1_fish_canvas;
}

for(var _i = 0; _i < array_length(pattern_objects); _i++){
	pattern_objects[_i].col = #2c4251;
}