event_inherited();

quest_complete = false;

reset_talking("Granny Intro","Granny Repeat");

instance_create_depth(x,y,0,obj_pattern_slot,{pattern: ITEMS.FLOWER_1 });
instance_create_depth(x+8,y,0,obj_pattern_slot,{pattern: ITEMS.FLOWER_2 });
instance_create_depth(x,y+8,0,obj_pattern_slot,{pattern: ITEMS.FLOWER_3 });
instance_create_depth(x+8,y+8,0,obj_pattern_slot,{pattern: ITEMS.FLOWER_4 });
