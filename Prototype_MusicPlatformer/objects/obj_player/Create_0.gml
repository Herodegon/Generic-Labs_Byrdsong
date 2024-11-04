/// @description Initialize player
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor
#macro MAX_ATTACK_DELAY 15
#macro MAX_INPUT_TIMER 15
#macro MAX_PICKUP_DISTANCE 16

Phrase = 
{
	name: "Quarter Note",
	noteType: NOTE_TYPE.SINGLENOTE,
	object: obj_quarternote,
	sprite: spr_quarternote,
	combination: [NOTE_DIRECTION.DOWN,
				  NOTE_DIRECTION.DOWNRIGHT,
				  NOTE_DIRECTION.RIGHT]	
}

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

#region Camera Initialization
initCamera();

#endregion

#region Player Variables
moveSpeed = 2;
moveSpeed_diag = moveSpeed-1;
moveVector_x = 0;
moveVector_y = 0;

noteDelay = MAX_ATTACK_DELAY;
inputTimer = MAX_INPUT_TIMER;
availablePhrases = [Phrase];	// Array of struct "Phrase"
currPhrase = noone;				// Selected phrase based on inputs
prevDir = noone;
inputQueue = [];				// Array of enum "Note_Direction"

canAttack = true;
canMove = true;
phraseMode = false;

#endregion