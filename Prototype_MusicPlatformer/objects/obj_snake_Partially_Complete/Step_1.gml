/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(obj_player))
{
	if (point_distance(x,y,obj_player.x,obj_player.y) < targetRange)
	{
		currState = ENEMY_STATES.FIRE;
	}
}
else
{
	currState = ENEMY_STATES.CHASE;
}
if(currState = ENEMY_STATES.FIRE && instance_exists(obj_player)) {
	var ex, ey
	if(canShoot) {
	canShoot = false;
	alarm[0] = 50
	instance_create_layer(x,y,"Instances", obj_fire)
	/*
	ex = instance_nearest(x, y, obj_player).x;
	ey = instance_nearest(x, y, obj_player).y;
	with (instance_create_layer(x,y,"Instances", obj_fire)) {
			direction = point_direction(x, y, ex, ey);
		}
		*/
	}

}