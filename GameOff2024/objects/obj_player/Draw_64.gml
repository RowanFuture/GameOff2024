surface_set_target(application_surface);

	function draw_tb(_x,_y,_txt,_c){
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		var _w = string_width_ext(_txt,12,170);
		var _h = string_height_ext(_txt,12,170);
		
		_x -= round(_w/2*_c);
		
		draw_set_color(#f3fbce);
		draw_roundrect(_x-4,_y-2,_x+_w+4-1,_y+_h+2-1,false);
		
		draw_set_color(#2c4251);
		draw_text_ext(_x,_y,_txt,12,170);
	
	}

	with(oDialogueSequenceManager){
		if(current_dialogue_character != undefined
		&& current_dialogue != undefined){
	
			//draw_tb(20,6,current_dialogue_character.name);
			draw_tb(SCREEN_WIDTH div 2,10,current_dialogue.text,twerp(TwerpType.out_elastic,.5,1,other.cam_transition));
	
		}
	}

	var _border = 0;

	var _total_size = grid_size*5-1+_border*2;

	var _xx = SCREEN_WIDTH div 2 - _total_size div 2;
	var _yy = SCREEN_HEIGHT - round(_total_size*(1.1-max(1.5*hide_menus_lerp,half_hide_menus*.8)));
	
	draw_sprite(spr_note,0,_xx,_yy);
	draw_sprite(spr_palette,0,_xx-15,_yy);
	
	draw_set_color(#FB96E7);
	
	for(var _i = 0; _i < array_length(color_pal); _i++){
		
		var _hover = point_in_rectangle(GUI_MOUSE_X,GUI_MOUSE_Y,_xx-15,_yy + _i*9,_xx-15+8,_yy+_i*9+8);
		
		if(_hover){
			if(mouse_check_button_pressed(mb_left))
				sel_col = _i;
			
			draw_rectangle_polyfill(_xx-15,_yy + _i*9,_xx-15+9,_yy+9+ _i*9,true);
		}
		
		if(sel_col = _i)
			draw_rectangle_polyfill(_xx-15+1,_yy+1 + _i*9,_xx-15+8,_yy+8+ _i*9,true);
	}
	
	if( point_in_rectangle(GUI_MOUSE_X,GUI_MOUSE_Y,_xx-30,_yy-12,_xx+grid_size*5+12,_yy+grid_size*5+12)){
		if(half_hide_menus > .5)
			if(!audio_is_playing(snd_paper_open))audio_play_sound(snd_paper_open,10,false,.2);
		
		half_hide_menus = lerp(half_hide_menus,0,.15);
	} else {
		half_hide_menus = lerp(half_hide_menus,1,.15);
	}
	
	with(obj_note_part)
		draw_self();
	
	for(var _y = 0; _y < grid_size; _y++){
		for(var _x = 0; _x < grid_size; _x++){
			var _rx = _xx+_border+_x*5;
			var _ry = _yy+_border+_y*5;
			var _rs = 3;
			
			var _hover = item_in_hand == -1  && point_in_rectangle(GUI_MOUSE_X,GUI_MOUSE_Y,_rx,_ry,_rx+_rs+1,_ry+_rs+1);
			
			if(_hover){
				if(mouse_check_button(mb_left)){
					if(draw_grid[_y,_x] == 0)
						audio_play_sound(snd_pencil,10,false,.5,0,random_range(.9,1));
					
					draw_grid_col[_y,_x] = sel_col;
					
					draw_grid[_y,_x] = max(draw_grid[_y,_x],1);
				}
				if(mouse_check_button(mb_right) && draw_grid[_y,_x]){
					audio_play_sound(snd_rubber,10,false,.5,0,random_range(.95,1));
					
					draw_grid[_y,_x] = 0;
					instance_create_depth(_rx,_ry,0,obj_note_part,{image_blend: color_pal[draw_grid_col[_y,_x]] });
				}
			}
			
			//if(draw_grid[_y,_x]){
			//	draw_set_color(#FB96E7);
			//	draw_rectangle_polyfill(_rx-1,_ry-1,_rx+_rs+1,_ry+_rs+1,false);
			//}
			
			if(_hover){
				draw_set_color(#FB96E7);
				draw_rectangle_polyfill(_rx-1,_ry-1,_rx+_rs+1,_ry+_rs+1,true);
			}
			
			if(draw_grid[_y,_x]){
				draw_grid[_y,_x] = min(draw_grid[_y,_x]+1,10);
				
				var _col = color_pal[draw_grid_col[_y,_x]];
				
				if(draw_grid[_y,_x] < 5){
					draw_sprite_ext(spr_note_drawn,_x+_y*6,_rx,_ry,1,1,0,_col,1);
				} else {
					draw_set_color(_col);
					draw_rectangle_polyfill(_rx,_ry,_rx+_rs,_ry+_rs,false);
				}
			}
		}
	}
	
	//if(item_in_hand != -1)
	//	note_rip_anim = min(note_rip_anim+.02,1);
	
	var _match = check_pattern_for_grid_match(draw_grid);
	if(_match != undefined){
		
		var _state = global.item_state[$ string(item_in_hand)];
	
		if(!_state){
			_state = {};
			global.item_state[$ string(item_in_hand)] = _state;
		}
	
		if(_state[$ "collected"] == true){
			item_in_hand = -1;
			state = return_state;
		} else {
		
			audio_play_sound(snd_lvl_up,50,false,1);
		
			if(state != PLAYER_STATE.GET_ITEM)
				return_state = state;
		
			state = PLAYER_STATE.GET_ITEM;
			get_item_t = 0;
		
			//note_rip_anim = 0;
			ripped_note_grid = variable_clone(draw_grid);
		
			array_push(past_item_inventory,_match);
			item_in_hand = _match;
		
			reset_draw_grid();
		
		}
	}
	
	//if(item_in_hand != -1 && note_rip_anim > 0 && note_rip_anim , 1){
	//	var _time = note_rip_anim;
	//
	//	var _angle = twerp(TwerpType.out_cubic,0,6,_time*2);
	//	var _rev_angle = twerp(TwerpType.in_cubic,6,0,max(0,_time-.5)*2);
	//	var _size = twerp(TwerpType.inout_expo,1,.25,_time);
	//	var _small_size = twerp(TwerpType.inout_expo,2,1,_time);
	//	var _move_to_cursor = twerp(TwerpType.inout_sine,0,1,max(0,_time-.5)*2);
	//
	//	//20 -> 8
	//
	//	//if(_time < .5){
	//		matrix_set(matrix_world,matrix_build(_xx+20,_yy+20,0,0,0,_angle,_size,_size,1));
	//		
	//			var _xoff = -20;
	//			var _yoff = -20;
	//		
	//			draw_sprite(spr_note_rip,0,_xoff,_yoff);
	//
	//			for(var _y = 0; _y < grid_size; _y++){
	//				for(var _x = 0; _x < grid_size; _x++){
	//			
	//					var _rx = _xoff+_border+_x*5;
	//					var _ry = _yoff+_border+_y*5;
	//					//ripped_note_grid
	//		
	//					if(ripped_note_grid[_y,_x]){
	//						draw_set_color(#FB96E7);
	//						draw_rectangle_polyfill(_rx,_ry,_rx+_rs,_ry+_rs,false);
	//					}
	//				}
	//			}
	//
	//		matrix_set(matrix_world,matrix_build_identity());
	//	//} else {
		//	
		//	matrix_set(matrix_world,matrix_build(SCREEN_WIDTH div 2,SCREEN_HEIGHT div 2,0,0,0,0,4,4,1));
		//	
		//	draw_pattern_grid(-4, - 4,ripped_note_grid,#FB96E7);
		//	
		//	matrix_set(matrix_world,matrix_build_identity());
		//	
		//	/*var _px = lerp(_xx+8,GUI_MOUSE_X,_move_to_cursor);
		//	var _py = lerp(_yy+8,GUI_MOUSE_Y,_move_to_cursor);
		//	matrix_set(matrix_world,matrix_build(_px,_py,0,0,0,_rev_angle,_small_size,_small_size,1));
		//	
		//	var _item_data = global.item_data[item_in_hand];
		//	
		//	if(_item_data.type == ITEM_TYPE.OBJECT){
		//		draw_sprite_ext(_item_data.sprite,0,0,0,1,1,0,c_white,1);
		//	} else {
		//		//draw_sprite(spr_note_small,0,0,0);
		//		//
		//		for(var _y = 0; _y < grid_size; _y++){
		//			for(var _x = 0; _x < grid_size; _x++){
		//			
		//				var _rx = _x;
		//				var _ry = _y;
		//				//ripped_note_grid
		//			
		//				if(ripped_note_grid[_y,_x]){
		//					draw_set_color(#FB96E7);
		//					draw_rectangle_polyfill(_rx,_ry,_rx,_ry,false);
		//				}
		//			}
		//		}
		//	}
		//
		//	matrix_set(matrix_world,matrix_build_identity());*/
		//}
	//}
	
	//var _xx = SCREEN_WIDTH div 2 - _total_size*1.5;
	//
	//var _total_h = ceil(array_length(past_item_inventory) / 4)*10-2+_border*2;
	//var _total_size = 4*10-2+_border*2;
	//
	//var _yy = SCREEN_HEIGHT - _total_h*(1-1.5*hide_menus_lerp);
	//
	//draw_set_color(c_black);
	//draw_rectangle_polyfill(_xx,_yy,_xx+_total_size-1,_yy+_total_h-1,false);
	//
	//var _ix = 0;
	//var _iy = 0;
	//for(var _i = 0; _i < array_length(past_item_inventory); _i++){
	//	
	//	var _item_data = item_data[past_item_inventory[_i]];
	//	
	//	var _ixx = _border + _xx + _ix;
	//	var _iyy = _border + _yy + _iy;
	//	
	//	if(point_in_rectangle(GUI_MOUSE_X,GUI_MOUSE_Y,_ixx,_iyy,_ixx+8,_iyy+8)){
	//		if(mouse_check_button_pressed(mb_left)){
	//			item_in_hand = past_item_inventory[_i];
	//		}
	//	}
	//	
	//	draw_sprite(_item_data.sprite,0,_ixx + sprite_get_xoffset(_item_data.sprite),_iyy + sprite_get_yoffset(_item_data.sprite));
	//	
	//	_ix += 10;
	//	if(_ix+8 >= 4*10){
	//		_ix = 0;
	//		_iy += 10;
	//	}
	//	
	//}


//draw_set_color(#f3fbce);
//draw_rectangle_polyfill(SCREEN_WIDTH div 2,0,SCREEN_WIDTH,100,false);

var _hover = false;

if(!instance_exists(oDialogueSequenceManager) && item_in_hand == -1){
	
	draw_set_color(#2c4251);
	draw_circle(6,6,16+dsin(current_time*.1)*2,false);
	draw_set_color(#FB96E7);
	draw_circle(6,6,16+dsin(current_time*.1)*2,true);
	
	draw_sprite_ext(spr_apple,0,10,10,1,1,0,c_white,1);
	
	_hover = point_in_rectangle(GUI_MOUSE_X,GUI_MOUSE_Y, 0,0,26,26);
}

collection_open = item_in_hand != -1 || _hover;

var _lc = collection_open_lerp;

collection_open_lerp = lerp(collection_open_lerp,collection_open,.2);

if(collection_open && collection_open_lerp > .5 && _lc < .5){
	audio_play_sound(snd_paper_open,50,false,.8);
}


if(collection_open_lerp > .1 && _hover){

	//draw_sprite_tiled_ext(spr_dither,round(collection_open_lerp),0,0,1,1,#2c4251,1);
	
	draw_tb(SCREEN_WIDTH/2,10,"COLLECTED",1);

	var _y = 24;
	for(var _i = 0; _i < array_length(global.all_collections); _i++){
		var _x = 10;
		for(var _j = 0; _j < array_length(global.all_collections[_i]); _j++){
			var _pattern = global.all_collections[_i][_j];
	
			draw_set_color(#f3fbce);
			draw_rectangle_polyfill(_x-2,_y-2,_x+8+2-1,_y+8+2-1,false);
	
			var _state = global.item_state[$ string(_pattern)] ?? {};
	
			if(_state && _state[$ "collected"]){
		
				var _g = global.item_pattern_grid[_pattern];
		
				draw_pattern_grid(_x,_y,_g,#2c4251);
			}
			_x += 14;
		}
		_y += 14;
	}
	
	
}


if(item_in_hand != -1 && state == PLAYER_STATE.GET_ITEM){
	
	get_item_t++;
	
	var _move = twerp(TwerpType.out_cubic,0,50, clamp(0,50,get_item_t)/50);
	
	draw_set_color(#f3fbce);
	
	var _sc = twerp(TwerpType.inout_cubic,0,1, clamp(0,30,get_item_t)/30);
	
	if(_sc >= .5 && mouse_check_button_pressed(mb_left)){
		
		state = return_state;
	}
	
	//var _sc = clamp(0,30,get_item_t)/30;

	draw_triangle(_move,0,2*_move,0,SCREEN_WIDTH/2,SCREEN_HEIGHT/2,false);
	draw_triangle(0,100+_move,0,100+2*_move,SCREEN_WIDTH/2,SCREEN_HEIGHT/2,false);
	draw_triangle(SCREEN_WIDTH,30+_move,SCREEN_WIDTH,30+2*_move,SCREEN_WIDTH/2,SCREEN_HEIGHT/2,false);
	draw_circle(SCREEN_WIDTH/2,SCREEN_HEIGHT/2,_sc*19+dsin(current_time*.4)*1,false);
	
	draw_tb(SCREEN_WIDTH/2,20,"DISCOVERED SECRET",1);
	
	matrix_set(matrix_world,matrix_build(SCREEN_WIDTH div 2,SCREEN_HEIGHT div 2,0,0,0,0,_sc*3,_sc*3,1));

	draw_pattern_grid(-4, - 4,ripped_note_grid,#FB96E7);

	matrix_set(matrix_world,matrix_build_identity());
	
}


	
//	if(item_in_hand != -1){
//		//var _item_data = item_data[item_in_hand]
//		//draw_sprite(_item_data.sprite,0,GUI_MOUSE_X,GUI_MOUSE_Y);
//	} else
draw_sprite_ext(spr_pencil,rotate_pencil > .5,GUI_MOUSE_X+sprite_get_xoffset(spr_pencil)-2,GUI_MOUSE_Y-sprite_get_height(spr_pencil)+sprite_get_yoffset(spr_pencil)+2,1,1,rotate_pencil > .5 ? rotate_pencil*180+180 : rotate_pencil*180,c_white,1);
draw_sprite_ext(spr_pencil,(rotate_pencil > .5) + 2,GUI_MOUSE_X+sprite_get_xoffset(spr_pencil)-2,GUI_MOUSE_Y-sprite_get_height(spr_pencil)+sprite_get_yoffset(spr_pencil)+2,1,1,rotate_pencil > .5 ? rotate_pencil*180+180 : rotate_pencil*180,color_pal[sel_col],1);



surface_reset_target();
