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

enum NOTE_MOVEMENT
{
	STRAIGHT,		//Note travels in a straight line
	RECTANGULAR,	//Note travels in a rectangular path about origin
	CIRCULAR,		//Note travels in a circular path about origin
	EXTEND			//Note extends from origin
}

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
	for (var i = 0; i < array_length(phrases); i++)
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

function fireNote(struct,dir)
{
	var noteVector_x = 0;
	var noteVector_y = 0;
	
	switch(dir)
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
	var obj_x = obj_player.x;
	var obj_y = obj_player.y;
	if (struct.noteType != NOTE_TYPE.ECHONOTE)
	{
		obj_x += (sprite_get_width(playerSprite)/2)*noteVector_x;
		obj_y += (sprite_get_height(playerSprite)/2)*noteVector_y;
	}
	
	var noteObj = instance_create_layer(obj_x,obj_y,"Instances",struct.object);
	noteObj.moveVector_x = noteVector_x;
	noteObj.moveVector_y = noteVector_y;
	noteObj.moveDir = dir;
	
	noteObj.level = struct.currLevel;
	if (noteObj.level > 1) {noteObj.canLevelUp = true;}
	
	if(object_exists(obj_soundMachine)) {
		obj_soundMachine.targetSingingPoints += struct.musicPointValue;
	}
};

function spawnPhraseNote(obj,moveState,angle,radius,stats)
{
	var pos_x = obj.x + (radius*dcos(angle));
	var pos_y = obj.y + (radius*dsin(angle));
	var objNote = instance_create_layer(pos_x,pos_y,"Instances",obj_phraseNote);
	objNote.moveState = moveState;
	objNote.objTether = obj;
	objNote.radius = radius;
	objNote.angle = angle;
	
	objNote.stats = stats;
	objNote.hp = stats.max_hp;
};

function spawnProjPattern(obj,state,pattInfo,stats,isDirDependant=false)
{
	#region Simplify patternInfo paths
	var maxAngle = pattInfo.maxAngle;
	var minAngle = pattInfo.minAngle;
	var numNotes = pattInfo.numNotes;
	var radius = pattInfo.radius;
	
	#endregion
	
	var angle = 0;
	if (maxAngle-minAngle != 360)
	{
		angle = (maxAngle-minAngle)/(numNotes-1);
	}
	else
	{
		angle = (maxAngle-minAngle)/numNotes;
	}
	if (minAngle < 0) {minAngle = 360+minAngle;}	//Arithmetic doesn't work if minAngle < 0
	
	var objDir = 0;
	//If pattern is dependent on direction from player, add the angle of object 
	//from player to the spawn algorithm
	if (isDirDependant) {objDir = 360-(obj.moveDir*-45);}		
	for (var i = 0; i < numNotes; i++)
	{
		spawnPhraseNote(obj,state,objDir+minAngle+(i*angle),radius,stats);
	}
};