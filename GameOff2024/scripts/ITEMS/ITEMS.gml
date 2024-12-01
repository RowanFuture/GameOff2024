globalvar grid_size;
grid_size = 8;


function get_grid_string(_grid){

	var _string = "";

	for(var _y = 0; _y < grid_size; _y++){
		for(var _x = 0; _x < grid_size; _x++){
			_string += string(_grid[_y,_x] != 0);
		}
	}
	
	return _string;
}

global.draw_patterns = {};
global.item_pattern_grid = [];
function add_draw_pattern(_pattern_grid,_output_data){
	var _string = get_grid_string(_pattern_grid);
	global.draw_patterns[$ _string] = _output_data;
	global.item_pattern_grid[_output_data] = _pattern_grid;
	global.item_data[_output_data] = {type: ITEM_TYPE.PATTERN};
}

function check_pattern_for_grid_match(_grid){
	var _string = get_grid_string(_grid);
	return global.draw_patterns[$ _string];
}

enum ITEMS {
	APPLE,
	KEY,
	
	BOAT,
	
	ANGEL_FISH,
	GOLD_FISH,
	ANGLER_FISH,
	PUFFER_FISH,
	
	SQUID_TOP,
	SQUID_BOT,
	
	//BIG_FISH_TL,
	//BIG_FISH_TR,
	//BIG_FISH_BL,
	//BIG_FISH_BR,
	
	OARFISH_L,
	OARFISH_M,
	OARFISH_R,
	
	CRAB,
	SHELL,
	CLAM,
	
	FLOWER_1,
	FLOWER_2,
	FLOWER_3,
	FLOWER_4,
	
}

enum FISH_TYPE  {
	
	ANGEL_FISH,
	GOLD_FISH,
	ANGLER_FISH,
	PUFFER_FISH,
	
	SQUID,
	//BIG_FISH,
	OAR_FISH,
}

global.fish_set = [];

global.fish_set[FISH_TYPE.ANGEL_FISH] = [[ITEMS.ANGEL_FISH]];
global.fish_set[FISH_TYPE.GOLD_FISH] = [[ITEMS.GOLD_FISH]];
global.fish_set[FISH_TYPE.ANGLER_FISH] = [[ITEMS.ANGLER_FISH]];
global.fish_set[FISH_TYPE.PUFFER_FISH] = [[ITEMS.PUFFER_FISH]];
global.fish_set[FISH_TYPE.SQUID] = [[ITEMS.SQUID_TOP],[ITEMS.SQUID_BOT]];
//global.fish_set[FISH_TYPE.BIG_FISH] = [[ITEMS.BIG_FISH_TL,ITEMS.BIG_FISH_TR],[ITEMS.BIG_FISH_BL,ITEMS.BIG_FISH_BR]];
global.fish_set[FISH_TYPE.OAR_FISH] = [[ITEMS.OARFISH_L,ITEMS.OARFISH_M,ITEMS.OARFISH_R]];

global.item_data = [];

global.all_collections = [
	[
		ITEMS.ANGEL_FISH,
		ITEMS.GOLD_FISH,
		ITEMS.ANGLER_FISH,
		ITEMS.PUFFER_FISH,
		ITEMS.SQUID_TOP,
		ITEMS.SQUID_BOT,
		ITEMS.OARFISH_L,
		ITEMS.OARFISH_M,
		ITEMS.OARFISH_R,
	],
	[
		ITEMS.CRAB,	
		ITEMS.SHELL,
		ITEMS.CLAM,
	],
	[
		ITEMS.BOAT,
	],
	[
		ITEMS.FLOWER_1,
		ITEMS.FLOWER_2,
		ITEMS.FLOWER_3,
		ITEMS.FLOWER_4,
	],
];

add_draw_pattern([
	[0,0,1,1,0,1,0,0],
	[0,0,0,1,1,0,0,0],
	[0,1,1,0,0,1,1,0],
	[1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1],
	[0,1,1,1,1,1,1,0],
	[0,0,1,1,0,1,0,0],
],ITEMS.APPLE);

add_draw_pattern(
	[[1,1,1,1,0,0,0,0,],[1,0,0,1,0,0,0,0,],[1,0,0,1,1,0,0,0,],[1,1,1,1,1,1,0,0,],[0,0,0,0,1,1,1,0,],[0,0,0,1,1,0,1,1,],[0,0,0,0,0,1,1,1,],[0,0,0,0,0,1,0,0,],]
	, ITEMS.KEY
);

add_draw_pattern(
	[[0,0,0,1,1,1,0,0,],[0,0,1,1,1,0,0,0,],[0,1,1,1,1,0,1,1,],[1,1,1,0,1,1,1,0,],[1,1,1,1,1,1,1,0,],[0,1,1,1,1,0,1,1,],[0,0,1,1,1,0,0,0,],[0,0,0,1,1,1,0,0,],]
	, ITEMS.ANGEL_FISH
);


add_draw_pattern(
	[[0,0,0,1,1,0,0,0,],[0,0,0,1,0,0,0,0,],[0,1,1,1,1,0,0,1,],[1,1,1,0,1,1,0,1,],[0,0,1,1,1,1,1,1,],[1,1,1,1,1,1,0,1,],[0,1,1,1,1,0,0,1,],[0,0,1,0,1,1,0,0,],]
	, ITEMS.GOLD_FISH
	//idkfish
);
add_draw_pattern(
	[[0,1,1,0,0,0,0,0,],[1,0,0,1,0,0,0,0,],[0,0,0,1,0,0,0,0,],[1,1,1,1,1,0,0,1,],[1,0,1,1,1,1,1,1,],[0,1,0,1,0,1,1,1,],[1,1,1,1,1,1,1,0,],[0,1,1,1,1,1,0,0,],]
	, ITEMS.ANGLER_FISH
	//Angler
);
add_draw_pattern(
	[[0,0,1,0,1,0,0,0,],[0,1,1,1,1,1,0,0,],[1,1,0,1,1,1,1,1,],[0,1,1,1,0,1,1,1,],[1,1,1,0,0,1,1,0,],[1,1,1,1,1,1,1,0,],[0,1,1,1,1,1,0,0,],[0,0,1,0,1,0,0,0,],]
	, ITEMS.PUFFER_FISH
	//pufferfish
);
add_draw_pattern(
	[[0,0,0,1,1,0,0,0,],[0,0,0,1,1,1,0,0,],[0,0,1,1,1,1,1,0,],[0,1,1,1,1,1,1,1,],[1,1,1,1,1,1,0,0,],[0,0,1,1,1,1,0,0,],[0,0,1,1,1,1,1,0,],[0,0,1,1,1,1,1,0,],]
	, ITEMS.SQUID_TOP
	//squid top
);
add_draw_pattern(
[[0,0,1,1,1,1,1,0,],[0,0,1,1,1,1,0,0,],[0,1,1,1,0,0,1,0,],[0,1,1,1,0,0,1,0,],[0,0,1,1,1,1,0,0,],[1,0,1,1,1,1,0,0,],[1,1,1,1,1,1,0,1,],[0,0,1,1,0,1,1,1,],]
	, ITEMS.SQUID_BOT
	//squid bot
);

add_draw_pattern(
[[0,0,0,1,0,0,0,0,],[0,0,0,1,1,0,0,0,],[0,0,0,1,1,1,0,0,],[0,0,0,1,0,0,0,0,],[1,1,1,1,1,1,1,1,],[1,1,1,1,1,1,1,1,],[0,1,1,1,1,1,1,0,],[0,0,1,1,1,1,0,0,],]
	, ITEMS.BOAT
);
add_draw_pattern(
[[0,0,0,0,1,1,0,0,],[0,1,1,1,1,0,1,0,],[1,0,1,0,0,0,0,1,],[1,0,1,0,0,1,1,1,],[1,0,0,1,1,1,1,1,],[0,1,0,0,0,1,1,0,],[0,0,1,1,1,1,0,0,],[0,0,0,1,1,0,0,0,],]
	, ITEMS.CLAM
);
add_draw_pattern(
[[0,1,1,0,0,0,0,0,],[1,1,1,0,0,1,1,0,],[1,1,0,0,0,1,1,1,],[0,1,1,1,1,0,1,1,],[1,0,1,1,1,1,1,1,],[1,1,1,1,0,1,1,0,],[1,0,1,1,1,1,1,0,],[0,0,0,0,1,0,1,0,],]
	, ITEMS.CRAB
);

add_draw_pattern(
[[0,0,1,1,1,1,0,0,],[0,1,1,0,1,1,1,0,],[1,0,0,1,1,1,1,1,],[1,0,0,1,0,1,1,1,],[0,1,1,1,1,1,1,1,],[1,1,0,1,1,1,1,1,],[0,1,1,1,1,1,1,0,],[0,0,1,1,1,1,0,0,],]
	, ITEMS.SHELL
);

add_draw_pattern(
[[1,1,1,0,0,1,1,1,],[1,1,1,1,1,1,1,1,],[1,1,0,0,0,0,1,1,],[0,1,0,1,1,0,1,0,],[0,1,0,1,1,0,1,0,],[1,1,0,0,0,0,1,1,],[1,1,1,1,1,1,1,1,],[1,1,1,0,0,1,1,1,],]
	, ITEMS.FLOWER_1
);
add_draw_pattern(
[[0,0,1,1,1,1,0,0,],[0,0,1,0,0,1,0,0,],[1,1,1,0,0,1,1,1,],[1,0,0,1,1,0,0,1,],[1,0,0,1,1,0,0,1,],[1,1,1,0,0,1,1,1,],[0,0,1,0,0,1,0,0,],[0,0,1,1,1,1,0,0,],]
	, ITEMS.FLOWER_2
);
add_draw_pattern(
[[0,0,1,1,1,1,0,0,],[0,0,1,1,1,1,0,0,],[1,1,0,0,0,0,1,1,],[1,1,0,1,1,0,1,1,],[1,1,0,1,1,0,1,1,],[1,1,0,0,0,0,1,1,],[0,0,1,1,1,1,0,0,],[0,0,1,1,1,1,0,0,],]
	, ITEMS.FLOWER_3
);
add_draw_pattern(
[[0,0,1,1,1,1,0,0,],[0,1,1,0,0,1,1,0,],[1,1,1,0,0,1,1,1,],[1,0,0,1,1,0,0,1,],[1,0,0,1,1,0,0,1,],[1,1,1,0,0,1,1,1,],[0,1,1,0,0,1,1,0,],[0,0,1,1,1,1,0,0,],]
	, ITEMS.FLOWER_4
);


//add_draw_pattern(
//	[[0,0,0,0,0,0,0,0,],[0,0,0,0,0,0,0,1,],[0,0,0,0,0,0,1,1,],[0,0,0,0,1,1,1,1,],[0,0,0,1,1,1,1,1,],[0,0,1,1,1,1,0,1,],[0,1,1,0,1,1,0,1,],[0,1,1,1,1,1,0,1,],]
//	, ITEMS.BIG_FISH_TL
//	//big fish TL
//);
//add_draw_pattern(
//	[[1,1,1,0,0,0,0,0,],[1,1,0,0,0,0,0,0,],[1,1,0,0,0,0,0,0,],[1,1,1,0,0,0,0,0,],[1,1,1,1,0,0,0,1,],[1,1,1,1,1,0,1,1,],[1,1,1,1,1,0,1,1,],[1,1,1,1,1,1,1,0,],]
//	, ITEMS.BIG_FISH_TR
//	//big fish TR
//);
//add_draw_pattern(
//	[[0,1,1,1,1,1,0,1,],[1,1,1,1,1,0,1,1,],[0,0,1,0,0,1,1,1,],[0,0,0,1,1,1,1,1,],[0,0,0,0,1,1,1,1,],[0,0,0,0,0,0,1,1,],[0,0,0,0,0,0,0,0,],[0,0,0,0,0,0,0,0,],]
//	, ITEMS.BIG_FISH_BL
//	//big fish BL
//);
//add_draw_pattern(
//	[[1,1,1,1,1,1,1,0,],[1,1,1,1,1,0,1,1,],[1,1,1,1,1,0,1,1,],[1,1,1,1,0,0,0,1,],[1,1,1,0,0,0,0,0,],[1,1,0,0,0,0,0,0,],[1,1,1,0,0,0,0,0,],[0,1,1,1,0,0,0,0,],]
//	, ITEMS.BIG_FISH_BR
//	//big fish BL
//);

add_draw_pattern(
[[0,0,1,0,0,0,0,0,],[0,1,0,0,1,0,0,0,],[0,1,0,1,0,0,0,0,],[0,1,1,1,0,1,0,1,],[1,1,0,1,1,1,1,1,],[0,1,1,1,1,1,1,1,],[1,0,1,1,1,1,1,1,],[0,1,1,1,1,1,1,1,],]
	, ITEMS.OARFISH_L
	//big fish BL
);
add_draw_pattern(
	[[0,0,0,0,0,0,0,0,],[0,0,0,0,0,0,0,0,],[0,0,0,0,0,0,0,0,],[0,1,0,1,0,1,0,1,],[1,1,1,1,1,1,1,1,],[1,1,1,1,1,1,1,1,],[1,1,1,1,1,1,1,1,],[1,1,1,1,1,1,1,1,],]
	, ITEMS.OARFISH_M
	//big fish BL
);
add_draw_pattern(
	[[0,0,0,0,0,0,0,0,],[0,0,0,0,0,0,0,0,],[0,0,0,0,0,0,0,0,],[0,1,0,1,0,1,0,0,],[1,1,1,1,1,1,1,0,],[1,1,1,1,1,1,1,1,],[1,1,1,1,1,1,1,1,],[1,1,1,1,1,1,1,0,],]
	, ITEMS.OARFISH_R
	//big fish BL
);

enum ITEM_TYPE {
	OBJECT,
	PATTERN
}

global.item_data[ITEMS.APPLE] = {
	type: ITEM_TYPE.OBJECT,
	object: obj_apple,
	sprite: spr_apple
};

global.item_data[ITEMS.KEY] = {
	type: ITEM_TYPE.OBJECT,
	object: obj_key,
	sprite: spr_key
};


global.item_data[ITEMS.BOAT] = {
	type: ITEM_TYPE.OBJECT,
	object: obj_boat,
	sprite: spr_boat
};



//global.item_data[ITEMS.BIG_FISH_TL] = {type: ITEM_TYPE.PATTERN};
//global.item_data[ITEMS.BIG_FISH_TR] = {type: ITEM_TYPE.PATTERN};
//global.item_data[ITEMS.BIG_FISH_BL] = {type: ITEM_TYPE.PATTERN};
//global.item_data[ITEMS.BIG_FISH_BR] = {type: ITEM_TYPE.PATTERN};

global.item_state = {};

function draw_pattern_grid(_xx,_yy,_pg,_col){
	
	for(var _y = 0; _y < 8; _y++){
		for(var _x = 0; _x < 8; _x++){
			if(_pg[_y,_x]){
				draw_sprite_ext(spr_pixel,0,_xx+_x,_yy+_y,1,1,0,_col,1);
			}
		}	
	}
}