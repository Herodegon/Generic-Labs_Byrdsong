/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stats = 
{
	max_hp: 100,
	damage: 1,
	knockback: 1,
	objSpeed: (moveSpeed*3)/4
}

patternInfo =
{
	numNotes: 6,
	maxAngle: 30,
	minAngle: -30,
	radius: 4
}

projState = NOTE_MOVEMENT.EXTEND;

canMove = false;
canSpawn = true;
isInvincible = true;

//spawnProjPattern(id,projState,patternInfo,stats,true);