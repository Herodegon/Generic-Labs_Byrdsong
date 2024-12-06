/// @description Insert description here
// You can write your code in this editor
if (distance_to_object(obj_player) > 150 && !isPaused) {
	var ex, ey
	ex = instance_nearest(x, y, obj_player).x;
	ey = instance_nearest(x, y, obj_player).y;
	with (instance_create_layer(x,y,"Instances", obj_fire)) {
		direction = point_direction(x, y, ex, ey);
	}
	for(i=0; i > 5; i++) {
	}
	with (instance_create_layer(x,y,"Instances", obj_fire)) {
		ex = 60 + ex;
		ey = 60 + ey;
		direction = point_direction(x, y, ex, ey);
	}
	
}