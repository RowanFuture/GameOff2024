
var _hsp = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
var _vsp = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));

var _dir = point_direction(0,0,_hsp,_vsp);
var _move = _hsp !=0 || _vsp != 0;
var _spd = 1.5;

var _ocean_collision = layer_tilemap_get_id(layer_get_id("ocean_barrier"))
var _wall_tiles = layer_tilemap_get_id(layer_get_id("wall_tiles"))

//can_water = place_meeting(x,y,obj_boat);

//using_boat = noone;
//
//var _boat = collision_point(x,y,obj_boat,true,false);
//if(_boat != noone && collision_point(_boat.x,_boat.y,self,true,false) != noone){
//	using_boat = _boat;
//	
//	_spd = 2;
//}

var _lastx = x;
var _lasty = y;


//if(!can_water){
//	array_push(_cola,_ocean_collision);
//}
//array_push(_cola,_wall_tiles);

cola_player = [
	obj_solid,
	_ocean_collision,
	_wall_tiles
];
	
if(state == PLAYER_STATE.IN_CONVERSATION){
	
	image_speed = 0;
	image_index = 0;
	
	var _talk_x = round((x+talk_npc.x)/2);
	var _talk_y = min(y,talk_npc.y)-10;
	
	if(oDialogueSequenceManager.current_dialogue_character.name == "Me"){
		if(me_talking != true){
			me_talking = true;
			cam_trans();
		}
		_talk_x = lerp(_talk_x,x,.8);	
		_talk_y = lerp(_talk_y,y,.7);	
	} else {
		if(me_talking != false){
			me_talking = false;
			cam_trans();
		}
		_talk_x = lerp(_talk_x,talk_npc.x,.8);	
		_talk_y = lerp(_talk_y,talk_npc.y,.7);	
	}
	
	cam_transition = min(cam_transition+.05,1);
	
	cam_x = lerp(cam_x,round(_talk_x),cam_transition);
	cam_y = lerp(cam_y,round(_talk_y),cam_transition);
	
} else if(state == PLAYER_STATE.NORMAL){

	character_move_collide(lengthdir_x(_move * _spd,_dir),lengthdir_y(_move * _spd,_dir),cola_player);
	
	var _still_moving = hsp !=0 || vsp != 0;

	if(_vsp != 0){
		if(_vsp > 0){
			facing = 3;
		} else {
			facing = 1;
		}
	}
	
	if(_hsp != 0){
		if(_hsp > 0){
			facing = 0;
		} else {
			facing = 2;
		}
	}
	
	if(_still_moving && (!audio_is_playing(footstep_sound) || audio_sound_get_track_position(footstep_sound) > .2)){
		footstep_sound = audio_play_sound(snd_footstep,0,false,.05,0,random_range(.7,.8));
	}

	var _sprites = [
		[spr_left_walk,-1],
		[spr_up_walk,1],
		[spr_left_walk,1],
		[spr_down_walk,1],
	];

	sprite_index = _sprites[facing][0];
	image_xscale = _sprites[facing][1];

	image_speed = _still_moving ? 1 : 0;
	image_index = _still_moving ? image_index : 0;
	
	jump_to_mouse = half_hide_menus > .5 && collision_point(mouse_x,mouse_y,obj_boat,true,false) != noone;
	
	jump_to_mouse_vis_pos = [obj_boat.x,obj_boat.y-4,12+dsin(current_time*.2)*2];
	
	cam_transition = min(cam_transition+.05,1);
	
	cam_x = lerp(cam_x,x,cam_transition);
	cam_y = lerp(cam_y,y,cam_transition);
	
	if(mouse_check_button_pressed(mb_left) && jump_to_mouse){
		state = PLAYER_STATE.IN_BOAT;
	audio_play_sound(snd_splash,50,false,1,0,1);
		
		cam_trans();
	}

} else if(state == PLAYER_STATE.IN_BOAT) {


	var _cola_boat = [
		obj_solid,
		_wall_tiles,
		boat_collision
	];
	

	with(obj_boat){
		character_move_collide(lengthdir_x(_move * _spd,_dir),lengthdir_y(_move * _spd,_dir),_cola_boat);
		
		x = clamp(x, 1, room_width-1);
		y = clamp(y, 1, room_height-1);

		other.x = x;
		other.y = y;
		
		first_time_using = false;
		
	}
	
	image_speed = 0;
	image_index = 0;
	
	
	var _mx = round(mouse_x);
	var _my = round(mouse_y);
	
	jump_to_mouse_vis_pos = [_mx,_my-4,8+(dsin(current_time*.2)*.5+.5)*2];

	jump_to_mouse = half_hide_menus > .5 && _mx > 0 && _mx < room_width && _my > 0 && _my < room_height && collision_rectangle(_mx-6,_my-8,_mx+6,_my+1,cola_player,true,false) == noone;
	
	cam_transition = min(cam_transition+.05,1);
	
	cam_x = lerp(cam_x,x,cam_transition);
	cam_y = lerp(cam_y,y,cam_transition);
	
	if(jump_to_mouse && mouse_check_button_pressed(mb_left)){
		
		cam_trans();
	audio_play_sound(snd_splash,50,false,1,0,1);
		
		state = PLAYER_STATE.NORMAL;
		x = _mx;
		y = _my;
	}
	
	
}

camera_set_view_pos(view_camera[0], cam_x - SCREEN_WIDTH div 2, cam_y - SCREEN_HEIGHT div 2);
//,0,room_width-SCREEN_WIDTH),//,0,room_height-SCREEN_HEIGHT)

var _item_type = ITEM_TYPE.OBJECT;
if(item_in_hand != -1){
	var _item_data = global.item_data[item_in_hand];
	_item_type = _item_data.type;
}

//if(_item_type == ITEM_TYPE.OBJECT){
	
	placement_x = (round(mouse_x / 8)-1)*8;
	placement_y = (round(mouse_y / 8)-1)*8;
	
	placement_size = 16;

//} else {
//	
//	placement_x = (mouse_x div 8)*8;
//	placement_y = (mouse_y div 8)*8;
//	
//	placement_size = 8;
//
//}
	
//can_place = collision_rectangle(placement_x+1,placement_y+1,placement_x+15,placement_y+15,obj_solid,true,false) == noone;

//if(item_in_hand == ITEMS.KEY){
//	
//	can_place = collision_rectangle(placement_x+1,placement_y+1,placement_x+15,placement_y+15,obj_door,true,false) != noone;
//}

var _rotate_flip = false;

if(item_in_hand == -1){
	if(mouse_check_button(mb_right)){
		_rotate_flip = true;
	}
}

rotate_pencil = lerp(rotate_pencil,_rotate_flip,.3);

var _nx = x;
var _ny = y-8;
for(var _i = 0; _i < array_length(following_objects); _i++){
	var _o = following_objects[_i];
	
	_o.x = x;
	_o.y = y;
	_o.visible = false;
	//if(point_distance(_nx,_ny,_o.x,_o.y) > 14){
	//	_o.x = lerp(_o.x,_nx,.1);
	//	_o.y = lerp(_o.y,_ny,.1);
	//}
	
	if(point_distance(_o.x,_o.y,_o.final_place.x,_o.final_place.y) < 150){
		_o.col = _o.final_place.col;
		_o.following = false;
		_o.visible = true;
		
		array_delete(following_objects,_i,1);
		_i--;
	}
	
	_nx = _o.x;
	_ny = _o.y;
}

if(item_in_hand != -1 && state != PLAYER_STATE.GET_ITEM){
	var _item_data = global.item_data[item_in_hand];
	
	var _state = global.item_state[$ string(item_in_hand)];
	
	if(!_state){
		_state = {};
		global.item_state[$ string(item_in_hand)] = _state;
	}
	
	if(_state[$ "collected"] != true){
	
		_state[$ "collected"] = true;
	
		if(_item_data.type == ITEM_TYPE.PATTERN){
		
			var _item_in_hand = item_in_hand;
		
			var _target = noone;
			with(obj_pattern_slot){
				if(filled == false){
					if(pattern ==_item_in_hand){
						_target = id;
					}
				}
			}
		
			if(_target != noone){
			
				_target.filled = true;
			
				var _inst = instance_create_depth(x,y,0,obj_pattern_object,{
					item_type: _item_in_hand,
					final_place: _target,
				});
				_inst.col = #FB96E7;//
		
				array_push(following_objects,_inst);
		
			}
		
		} else {
	
		
			var _item_in_hand = item_in_hand;
		
			var _target = noone;
			with(obj_object_slot){
				if(filled == false){
					if(type ==_item_in_hand){
						_target = id;
					}
				}
			}
		
			if(_target != noone){
			
				var _item_data = global.item_data[_item_in_hand];
		
				with(_item_data.object)
					instance_destroy();
			
				with(_target){
			
					instance_create_depth(x,y,0,_item_data.object)
					filled = true;
				}
		
			}
		
		}
	}
	item_in_hand = -1;
}
	
//if(item_in_hand != -1 && can_place && mouse_check_button_pressed(mb_left)){
//	var _item_data = global.item_data[item_in_hand];
//	
//	if(_item_type == ITEM_TYPE.OBJECT){
//		instance_create_depth(placement_x + 8 + sprite_get_xoffset(_item_data.sprite) - sprite_get_width(_item_data.sprite) div 2,placement_y + 8 + sprite_get_yoffset(_item_data.sprite) - sprite_get_height(_item_data.sprite) div 2,0,_item_data.object);
//	}
//	
//	item_in_hand = -1;
//}
//
//if(mouse_check_button_pressed(mb_right)){
//	item_in_hand = -1;
//}

if(keyboard_check_pressed(vk_f12)){
	if(window_get_fullscreen())
		window_set_fullscreen(false);
	else
		window_set_fullscreen(true);
}

if(item_in_hand == -1 && collection_open_lerp < .4 && !instance_exists(oDialogueSequenceManager)){
	hide_menus_lerp = lerp(hide_menus_lerp,0,.2);
} else {
	//if(note_rip_anim > .5)
	hide_menus_lerp = lerp(hide_menus_lerp,1,.1);
}

var _npc_under_hand = collision_point(mouse_x,mouse_y,par_npc,true,false);
var _interact_portal_under_hand = collision_point(mouse_x,mouse_y,par_interact_portal,true,false);

talk_interact_show = false;
tp_interact_show = false;

var _portal_collide = instance_place(x,y,par_interact_portal);

function teleportal(_inst){
	
	audio_play_sound(snd_door,50,false,1,0,1);

	var _index = _inst.index;
	
	with(obj_portal_end){
		if(index = _index){
			var _trans = instance_create_depth(x,y,0,obj_transition_portal);
			_trans.long_timer = long_timer;
			other.state = PLAYER_STATE.PORTAL;
			break;
		}
	}
	
	for(var _i = 0; _i < array_length(following_objects); _i++){
		following_objects[_i].x = x;
		following_objects[_i].y = y;
	}
}

if(state == PLAYER_STATE.NORMAL && _portal_collide != noone){
	
	teleportal(_portal_collide);
	
} else if( half_hide_menus > .5 && _interact_portal_under_hand != noone && state == PLAYER_STATE.NORMAL){
	
	tp_interact_show = true;
	
	talk_npc = _interact_portal_under_hand;
	
	if( mouse_check_button_pressed(mb_left)){
		teleportal(_interact_portal_under_hand);
	}
	
} else if( half_hide_menus > .5 && _npc_under_hand != noone && state == PLAYER_STATE.NORMAL && item_in_hand == -1){
	
	talk_npc = _npc_under_hand;
	
	talk_interact_show = true;
	
	if( mouse_check_button_pressed(mb_left)){
	
		if(_npc_under_hand.first_time_talking){
		
			start_dialogue_sequence(_npc_under_hand.first_time_sequence);
		
			_npc_under_hand.first_time_talking = false;
		} else {
	
			start_dialogue_sequence(_npc_under_hand.repeat_sequence);
		}
		
		me_talking = -1;
		cam_trans();
		return_state = state;
		state = PLAYER_STATE.IN_CONVERSATION;

	}
}

depth = -y;

//if(keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_middle)){
//	collection_open = !collection_open;
//}
