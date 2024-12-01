draw_grid = [];
draw_grid_col = [];

function reset_draw_grid(){
	for(var _y = 0; _y < grid_size; _y++){
		for(var _x = 0; _x < grid_size; _x++){
			draw_grid[_y,_x] = 0;
			draw_grid_col[_y,_x] = 0;
		}
	}
}

footstep_sound = -1;

me_talking = -1;

ripped_note_grid = [];
note_rip_anim = 0;

reset_draw_grid();

item_in_hand = -1;

talk_interact_show = false;
tp_interact_show = false;

past_item_inventory = [
	//ITEMS.APPLE,
];

hide_menus_lerp = 0;

rotate_pencil = 0;

half_hide_menus = 0;

depth = -10;
placement_size = 16;

facing = 3;

enum PLAYER_STATE {
	NORMAL,
	IN_BOAT,
	IN_CONVERSATION,
	GET_ITEM,
	PORTAL,
}

state = PLAYER_STATE.NORMAL;

var _bw = room_width div 16;
var _bh = room_height div 16;

var _layer = layer_create(15000,"boat barrier");
boat_collision = layer_tilemap_create(_layer,0,0,tl_ocean,_bw,_bh);

var _ocean_collision = layer_tilemap_get_id(layer_get_id("ocean_barrier"))
var _ground_tiles = layer_tilemap_get_id(layer_get_id("ground_tiles"))

for(var _x = 0; _x < _bw; _x++){
	for(var _y = 0; _y < _bh; _y++){
		var _tile = tilemap_get(boat_collision,_x,_y);
		
		var _ground_tile = tile_get_index( tilemap_get(_ground_tiles,_x,_y));
		
		var _is_shore_tile = (
				(_ground_tile >= 48 && _ground_tile < 48+4)
			||	(_ground_tile >= 56 && _ground_tile < 56+4)
			//||	(_ground_tile >= 64 && _ground_tile < 64+4)
		);
		
		if(tile_get_empty(tilemap_get(_ocean_collision,_x,_y)) && !_is_shore_tile){
			_tile = tile_set_index(_tile,1);
		}
		
		tilemap_set(boat_collision,_tile,_x,_y);
	}
}

cola_player = [];

jump_to_mouse = false;
jump_to_mouse_vis_pos = [0,0,0];


cam_x = x;
cam_y = y;

function cam_trans(){
	cam_trans_x = cam_x;
	cam_trans_y = cam_y;
	cam_transition = 0;
}

cam_trans();
cam_transition = 1;

collection_open = false;
collection_open_lerp = 0;

following_objects = [];

color_pal = [
	#84A0A1,
	#2C4251,
	#FB96E7
];

sel_col = 2;

//layer_set_visible(_layer,false);