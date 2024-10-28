/// @description Movement, attacks, and collision
// You can write your code in this editor

#region Check enemy collision
// TODO: Create enemy collision

#endregion

#region Movement

if (canMove)
{
	#region Speed Calculation
	moveVector_x = (keyboard_check(Controls.move_right)-keyboard_check(Controls.move_left));
	moveVector_y = (keyboard_check(Controls.move_down)-keyboard_check(Controls.move_up));
	var objSpeed = moveSpeed;

	// Handle diagonal movement
	if (moveVector_x != 0 && moveVector_y != 0)
	{
		objSpeed = moveSpeed_diag;
	}

	var move_x = objSpeed*moveVector_x;
	var move_y = objSpeed*moveVector_y;

	#endregion

	#region Collisions
	if instance_place(x+move_x,y+move_y,obj_block)
	{
		move_x = 0;
		move_y = 0;
	}

	// Once calculations and collisions have been handled, move player
	x += move_x;
	y += move_y; 
	
	#endregion
}

#endregion

#region Attack System
#region Check for state change
if (keyboard_check_pressed(Controls.toggle_phraseMode))
{
	phraseMode = !phraseMode;
}

#endregion

var noteDir = getNoteDirection(Controls);
if (noteDir != NOTE_DIRECTION.NONE && canAttack)
{
	var noteObj = noone;
	#region Basic Notes
	if (!phraseMode)
	{
		noteObj = obj_note;
	}
	
	#endregion
	
	#region Phrase System
	else if (phraseMode)
	{
		if (array_length(inputQueue) == 3) {array_delete(inputQueue,0,array_length(inputQueue));}
		if (noteDir != array_last(inputQueue)) 
		{
			show_debug_message("Dir: {0}", noteDir);
			array_push(inputQueue,noteDir);
		}
		var phrase = getPhrase(availablePhrases,inputQueue);
		if (phrase != noone)
		{
			noteObj = phrase.object;
		}
	}
	
	#endregion
	
	#region Attack
	if (noteObj != noone)
	{
		fireNote(noteObj,noteDir);
		canAttack = false;
		alarm[0] = noteDelay;
	}
	
	#endregion
}

#endregion
