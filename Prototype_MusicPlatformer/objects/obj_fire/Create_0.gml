/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

shotLife = true;
speed = moveSpeed;
	ex = instance_nearest(x, y, obj_player).x;
	ey = instance_nearest(x, y, obj_player).y;
	direction = point_direction(x, y, ex, ey);