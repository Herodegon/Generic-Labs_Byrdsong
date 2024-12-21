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
depth = DEPTH_PLAYER;
image_index = 0;
image_speed = 0;

#endregion

#region Player Variables

#region Stat/Movement Variables
max_hp = 100;		//HP set on game start
hp = max_hp;
max_xp = 14;		//XP needed to level up
maxXpAmount = 7;	//Amount more xp needed each level up
xp = 0;
level = 1;			//Overall levels gained (starting at 1)
itemPullRange = sprite_get_width(sprite_index)*2;

moveSpeed = 2;
moveVector_x = 0;
moveVector_y = 0;

#endregion

#region Timers
attackDelay = 0.25*MILLISECONDS
inputWindow = 0.4*MILLISECONDS
invulnerablePeriod = 0.1*MILLISECONDS
attackTimer = 0;
inputTimer = 0;
invulnerableTimer = 0;
hitTimer = 0;

#endregion

#region Attack Variables
availablePhrases = [];	// Array of struct "Phrase"
currPhrase = noone;				// Selected phrase based on inputs
prevDir = noone;				// Used to verify note input
inputQueue = [];				// Array of enum "Note_Direction"
inputQueue_size = 0;			// Number of sprites in queue

#endregion

#endregion

#region Gameplay Flags
canAttack = true;
canMove = true;
canLevelUp = false;
phraseMode = false;

isPaused = false;
tookDamage = false;
isDead = false;

#endregion

#region Debug Flags
isInvincible = false;

#endregion