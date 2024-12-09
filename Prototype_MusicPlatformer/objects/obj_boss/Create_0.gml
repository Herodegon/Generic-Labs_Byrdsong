/// @description Initialize Boss
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 1000;
damage = 5;
attackPhrase = obj_game.bossPhrases[0];

detectRange = 300;
offset = 0;

currState = ENEMY_STATES.PATROL;

canFireTimer = 0.3*MILLISECONDS;
currFireTimer = canFireTimer;

canMove = false;
isBoss = true;

