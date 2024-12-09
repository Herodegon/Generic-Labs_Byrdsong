/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stats = 
{
	max_hp: 500,
	damage: 8,
	knockback: 0,
	objSpeed: moveSpeed/4
}

patternInfo =
{
	numNotes: 5,
	maxAngle: 360,
	minAngle: 0,
	radius: 24
}

projState = NOTE_MOVEMENT.CIRCULAREXTEND;

despawnTimer = 6*MILLISECONDS;

isPlayerLocked = false;
canMove = false;
canSpawn = true;
isInvincible = true;