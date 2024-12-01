function angle_lerp(_angle,_goal,_lerp,_max = 360) {
	var _a = angle_difference(_angle,_goal);
	return _angle - min(_max,abs(_a*_lerp))*sign(_a);
}
