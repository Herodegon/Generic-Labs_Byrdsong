/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stats = 
{
	max_hp: 1,
	damage: 2,
	knockback: 0
}

patternInfo =
{
	numNotes: 4,
	maxAngle: 360,
	minAngle: 0,
	radius: 8
}

projState = NOTE_MOVEMENT.CIRCULAR;

despawnTimer *= 2;

isPlayerLocked = false;
canSpawn = true;
isInvincible = true;