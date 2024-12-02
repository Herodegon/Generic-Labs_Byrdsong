/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stats = 
{
	max_hp: 100,
	damage: 1,
	knockback: 1
}

patternInfo =
{
	numNotes: 4,
	maxAngle: 30,
	minAngle: -30,
	radius: 4
}

moveSpeed /= 2;

projState = NOTE_MOVEMENT.EXTEND;

canMove = false;
canSpawn = true;
isInvincible = true;

//spawnProjPattern(id,projState,patternInfo,stats,true);