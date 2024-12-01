//if(item_in_hand != -1 && can_place){
//	
//	var _place_x = placement_x;
//	var _place_y = placement_y;
//	
//	draw_set_color(c_black);
//	draw_rectangle_polyfill(_place_x,_place_y,_place_x+placement_size-1,_place_y+placement_size-1,true);
//
//}

var _mx = jump_to_mouse_vis_pos[0];
var _my = jump_to_mouse_vis_pos[1];

if( jump_to_mouse) {
	
	draw_set_color(#fb96e7);
	draw_circle(_mx,_my,jump_to_mouse_vis_pos[2],true);
	
	draw_primitive_begin(pr_linestrip);
	for(var _i = 0; _i < 7; _i++){
		var _x = lerp(x,_mx,(_i+1)/8);
		var _y = lerp(y,_my,(_i+1)/8)-dsin((_i+1)/8*180)*30;
		draw_vertex(_x,_y);
	}
	draw_primitive_end();
}


if(state == PLAYER_STATE.IN_CONVERSATION && me_talking != -1){
	if(me_talking){
		draw_sprite(spr_talk_sheet,current_time/150,x+6,y-20);
	} else {
		draw_sprite(spr_talk_sheet,current_time/150,talk_npc.x+8,talk_npc.y-20);

	}
}

if(talk_interact_show){
	draw_set_color(#fb96e7);
	draw_circle(talk_npc.x,talk_npc.y-13,14+(.5+.5*dsin(current_time*.2))*3,true);
	draw_sprite(spr_talk_interact_icon,current_time/150,talk_npc.x+8,talk_npc.y-20);
}

if(tp_interact_show){
	draw_set_color(#fb96e7);
	draw_circle(talk_npc.x+9,talk_npc.y+9,4+(.5+.5*dsin(current_time*.2))*6,true);
	//draw_sprite(spr_talk_interact_icon,current_time/150,talk_npc.x+8,talk_npc.y-20);
}


if(collection_open_lerp > .1){

	draw_sprite_tiled_ext(spr_dither,round(collection_open_lerp),0,0,1,1,#2c4251,1);

}