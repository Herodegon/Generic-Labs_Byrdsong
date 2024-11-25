/// @description Initialize player
// You can write your code in this editor

//Initialize player scripts
script_noteSystem();			//Contains functions for checking and using phrases

enum ATTACK_STATES
{
	NOTE,
	PHRASE
};

#region Controls
Controls =
{
	#region Movement Controls
	move_up: ord("W"),
	move_down: ord("S"),
	move_left: ord("A"),
	move_right: ord("D"),
	
	#endregion
	
	#region  Note-playing Controls
	note_up: vk_up,
	note_down: vk_down,
	note_left: vk_left,
	note_right: vk_right,
	
	toggle_phraseMode: vk_space
	
	#endregion
};

#endregion

#region Sprite Initialization
depth = 0;
image_index = 0;
image_speed = 0;

#endregion

#region Player Variables

#region Stat/Movement Variables
max_hp = 100;			//HP set on game start
hp = max_hp;
max_xp = 10;			//XP needed to level up
xp = 0;
level = 0;				//Number of levels gained
itemPullRange = sprite_get_width(sprite_index)*2;

moveSpeed = 2;
moveSpeed_diag = moveSpeed-1;
moveVector_x = 0;
moveVector_y = 0;

#endregion

#region Timers
attackDelay = 0.25*MILLISECONDS
inputWindow = 0.4*MILLISECONDS
attackTimer = 0;
inputTimer = 0;

#endregion

#region Attack Variables
availablePhrases = [obj_game.poolPhrases[0],obj_game.poolPhrases[1]];	// Array of struct "Phrase"
currPhrase = noone;				// Selected phrase based on inputs
prevDir = noone;				// Used to verify note input
inputQueue = [];				// Array of enum "Note_Direction"

#endregion

#endregion

#region Gameplay Flags
canAttack = true;
canMove = true;
canLevelUp = false;
phraseMode = false;

#endregion

#region Debug Flags
isInvincible = false;

#endregion