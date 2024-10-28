// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum NOTE_DIRECTION
{
	RIGHT,		//E
	DOWNRIGHT,	//F
	DOWN,		//G
	DOWNLEFT,	//A
	LEFT,		//B
	UPLEFT,		//C
	UP,			//D
	UPRIGHT,	//E
	NONE
};

enum NOTE_TYPE
{
	SINGLENOTE,	//Eight-note, quarter-note, etc.
	WAVENOTE,	//AOE single-direction attacks
	ECHONOTE	//AOE multi-direction attacks
};

function getNoteDirection(Controls)
{
	//Get vector of attack inputs
	var inputVector_x = keyboard_check(Controls.note_right) - keyboard_check(Controls.note_left);
	var inputVector_y = keyboard_check(Controls.note_down) - keyboard_check(Controls.note_up);
	
	var noteDir = noone;
	
	#region Check Direction of Inputs
	
	#region Check Right Inputs
	if (inputVector_x == 1)
	{
		if (inputVector_y == 1)
		{
			noteDir = NOTE_DIRECTION.DOWNRIGHT;	
		}	
		else if (inputVector_y == -1)
		{
			noteDir = NOTE_DIRECTION.UPRIGHT;
		}
		else
		{
			noteDir = NOTE_DIRECTION.RIGHT;
		}
	}
	
	#endregion
	
	#region Check Left Inputs
	else if (inputVector_x == -1)
	{
		if (inputVector_y == 1)
		{
			noteDir = NOTE_DIRECTION.DOWNLEFT;	
		}
		else if (inputVector_y == -1)
		{
			noteDir = NOTE_DIRECTION.UPLEFT;
		}
		else
		{
			noteDir = NOTE_DIRECTION.LEFT;
		}
	}
	
	#endregion
	
	#region Check Up/Down Inputs
	else
	{
		if (inputVector_y == 1)
		{
			noteDir = NOTE_DIRECTION.DOWN;
		}
		else if (inputVector_y == -1)
		{
			noteDir = NOTE_DIRECTION.UP;
		}
		else
		{
			noteDir = NOTE_DIRECTION.NONE;
		}
	}
	
	#endregion
	
	#endregion
	
	return noteDir;
};

function getPhrase(phrases,queue)
{	
	var phrase = noone;
	
	#region Checking Unlocked Phrases
	for (i = 0; i < array_length(phrases); i++)
	{
		if (array_length(queue) == array_length(phrases[i].combination))
		{
			if (array_equals(queue,phrases[i].combination))
			{
				phrase = phrases[i];
			}
		}
	}
	
	#endregion
	
	return phrase;
}

function fireNote(noteObj,noteDirection)
{
	var noteVector_x = 0;
	var noteVector_y = 0;
	
	switch(noteDirection)
	{
		case NOTE_DIRECTION.RIGHT:
			noteVector_x = 1;
			noteVector_y = 0;
			break;
		case NOTE_DIRECTION.DOWNRIGHT:
			noteVector_x = 1;
			noteVector_y = 1;
			break;
		case NOTE_DIRECTION.DOWN:
			noteVector_x = 0;
			noteVector_y = 1;
			break;
		case NOTE_DIRECTION.DOWNLEFT:
			noteVector_x = -1;
			noteVector_y = 1;
			break;
		case NOTE_DIRECTION.LEFT:
			noteVector_x = -1;
			noteVector_y = 0;
			break;
		case NOTE_DIRECTION.UPLEFT:
			noteVector_x = -1;
			noteVector_y = -1;
			break;
		case NOTE_DIRECTION.UP:
			noteVector_x = 0;
			noteVector_y = -1;
			break;
		case NOTE_DIRECTION.UPRIGHT:
			noteVector_x = 1;
			noteVector_y = -1;
			break;
		default:
			break;
	}
	var playerSprite = obj_player.sprite_index;
	var obj_x = obj_player.x + sprite_get_width(playerSprite)*noteVector_x;
	var obj_y = obj_player.y + sprite_get_height(playerSprite)*noteVector_y;
	
	noteObj = instance_create_layer(obj_x,obj_y,"Instances",noteObj);
	noteObj.moveVector_x = noteVector_x;
	noteObj.moveVector_y = noteVector_y;
};