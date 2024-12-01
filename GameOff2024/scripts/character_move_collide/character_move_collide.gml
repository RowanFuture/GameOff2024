function character_move_collide(_move_hsp,_move_vsp,_obj_array){
	
	hsp = _move_hsp;
	vsp = _move_vsp;

	//self[$ "hsp"] = self[$ "hsp"] ?? 0;
	//self[$ "vsp"] = self[$ "vsp"] ?? 0;
	self[$ "d_hsp"] = self[$ "d_hsp"] ?? 0;
	self[$ "d_vsp"] = self[$ "d_vsp"] ?? 0;
	
	var _hsp_recalc = hsp + d_hsp;
	var _vsp_recalc = vsp + d_vsp;
			
	var _whole_hsp = floor(abs(_hsp_recalc))*sign(_hsp_recalc);
	var _whole_vsp = floor(abs(_vsp_recalc))*sign(_vsp_recalc);

	d_hsp = _hsp_recalc-_whole_hsp;
	d_vsp = _vsp_recalc-_whole_vsp;
		
	if(!place_meeting(x+_whole_hsp,y,_obj_array)){
		x += _whole_hsp;
	} else {
		var _one = sign(_whole_hsp);
		while(!place_meeting(x+_one,y,_obj_array)){
			x += _one;
		}
		_whole_hsp = 0;
				
		hsp = 0;
		d_hsp = 0;
	}

	if(!place_meeting(x,y+_whole_vsp,_obj_array)){
		y += _whole_vsp;
	} else {
		var _one = sign(_whole_vsp);
		while(!place_meeting(x,y+_one,_obj_array)){
			y += _one;
		}
		_whole_vsp = 0;

		vsp = 0;
		d_vsp = 0;
	}
}