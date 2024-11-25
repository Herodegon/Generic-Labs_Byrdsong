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

despawnTimer *= 2;

isPlayerLocked = false;
isInvincible = true;

var numNotes = 4
var angle = 360/numNotes;
var spriteWidth = sprite_get_width(obj_note.sprite_index);
for (var i = 0; i < numNotes; i++)
{
	spawnPhraseNote(id,NOTE_MOVEMENT.CIRCULAR,i*angle,spriteWidth/2,stats);
}