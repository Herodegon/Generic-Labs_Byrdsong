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
	numNotes: 8,
	maxAngle: 360,
	minAngle: 0,
	radius: 16
}

moveSpeed /= 2;

projState = NOTE_MOVEMENT.CIRCULAR;

despawnTimer *= 1.5;

canMove = false;
canSpawn = true;
isInvincible = true;