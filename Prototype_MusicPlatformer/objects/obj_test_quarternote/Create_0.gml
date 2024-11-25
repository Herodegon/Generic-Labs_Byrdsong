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
	radius: 8
}

projState = NOTE_MOVEMENT.CIRCULAR;

despawnTimer *= 2;

isPlayerLocked = false;
canSpawn = true;
isInvincible = true;

/*
var numNotes = 4;
var angle = 360/numNotes;
var spriteWidth = sprite_get_width(spr_eighthnote);
for (var i = 0; i < numNotes; i++)
{
	spawnPhraseNote(id,NOTE_MOVEMENT.CIRCULAR,i*angle,spriteWidth,stats);
}
*/

//spawnProjPattern(id,projState,patternInfo,stats,true);