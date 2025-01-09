/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stats = 
{
	max_hp: 500,
	damage: 1,
	knockback: 3,
	objSpeed: moveSpeed*1.5
}

patternInfo =
{
	numNotes: 4,
	maxAngle: 360,
	minAngle: 0,
	radius: 24
}

additionalPatterns =
[
	{
		numNotes: 4,
		maxAngle: 360,
		minAngle: 0,
		radius: 36
	}
]

additionalStats =
[
	{
		max_hp: 500,
		damage: 1,
		knockback: 3,
		objSpeed: -moveSpeed*1.5
	}
]

projState = NOTE_MOVEMENT.CIRCULAR;

despawnTimer *= 2;

canMove = false;
canSpawn = true;
isInvincible = true;