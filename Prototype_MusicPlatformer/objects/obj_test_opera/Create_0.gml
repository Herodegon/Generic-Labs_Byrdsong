/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stats = 
{
	max_hp: 500,
	damage: 1,
	knockback: 0
}

patternInfo =
{
	numNotes: 4,
	maxAngle: 360,
	minAngle: 0,
	radius: 24
}

projState = NOTE_MOVEMENT.CIRCULAR;

despawnTimer *= 2;

canMove = false;
canSpawn = true;
isInvincible = true;