/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stats = 
{
	max_hp: 500,
	damage: 2,
	knockback: 0,
	objSpeed: moveSpeed
}

patternInfo =
{
	numNotes: 2,
	maxAngle: 360,
	minAngle: 0,
	radius: 24
}

projState = NOTE_MOVEMENT.CIRCULAREXTEND;
collisionObject = obj_player;

despawnTimer = 2*MILLISECONDS;

isPlayerLocked = false;
canSpawn = true;
isInvincible = true;
