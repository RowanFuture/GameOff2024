collider = instance_create_depth(x,y,0,obj_solid);
portal = instance_create_depth(x,y,0,par_interact_portal,{index:4});
collider.visible = false;

instance_deactivate_object(portal);

open = false;

image_index = 1;