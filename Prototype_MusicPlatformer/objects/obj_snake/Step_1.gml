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