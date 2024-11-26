/// @description Movement, attacks, and collision
// You can write your code in this editor

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
	moveMap(move_x,move_y);
	//x += move_x;
	//y += move_y; 
	
	#endregion
}

#endregion

#region Check enemy collision
with (obj_enemy)
{
	if (instance_place(x,y,other))
	{
		if (other.hp > 0)
		{
			other.hp -= damage;
		}
	}
}

if (hp < 0)
{
	hp = 0;
}

#endregion

#region Health Check
if (hp <= 0 && !isInvincible)
{
	sprite_index = spr_player_dead;
	image_speed = 0.2;
	canMove = false;
	canAttack = false;
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
	var noteStruct = noone;
	#region Basic Notes
	if (!phraseMode)
	{
		noteStruct = obj_game.basicNote;
	}
	
	#endregion
	
	#region Phrase System
	else if (phraseMode)
	{
		if (!currPhrase)
		{
			if (array_length(inputQueue) == 5) {inputQueue = [];}
			if (noteDir != array_last(inputQueue)) 
			{
				//show_debug_message("Dir: {0}", noteDir);
				array_push(inputQueue,noteDir);
				inputTimer = inputWindow;
			}
			currPhrase = getPhrase(availablePhrases,inputQueue);
			if (currPhrase)
			{
				canAttack = false;	// Player must stop inputting attacks before they choose a direction
			}
		}
		else
		{
			// Verify the direction input
			if (prevDir == noteDir)
			{
				//show_debug_message("Select currPhrase / Dir: {0}", noteDir);
				noteStruct = currPhrase;
				inputQueue = [];
				currPhrase = noone;
				prevDir = noone;
			}
			else
			{
				prevDir = noteDir;
			}
		}
	}
	
	#endregion
	
	#region Spawn Attack
	if (noteStruct != noone)
	{
		fireNote(noteStruct,noteDir);
		canAttack = false;
		attackTimer = attackDelay;
	}
	
	#endregion
}
else if (currPhrase && noteDir == NOTE_DIRECTION.NONE)		// Wait for player to stop inputting directions
{
	canAttack = true;
}

#endregion

#region Timers
if (attackTimer > 0)
{
	attackTimer -= global.deltaTime;
	if (attackTimer <= 0) {canAttack = true;}
}

if (inputTimer > 0)
{
	inputTimer -= global.deltaTime;	
	if (inputTimer <= 0) {inputQueue = [];}
}

#endregion

#region Adaptive Music
if(instance_exists(obj_soundMachine)) {
	#region Music movement calculations
	if(keyboard_check(Controls.move_right) or keyboard_check(Controls.move_left) or keyboard_check(Controls.move_up) or keyboard_check(Controls.move_down)) {
		// Add a number to walkingLoudness such that it takes 3 seconds to get to full volume
		obj_soundMachine.walkingLoudness += (1 / fps) / 3; 
		obj_soundMachine.walkingLoudness = min(obj_soundMachine.walkingLoudness, 1); // Cap walking loudness at 1
	}else {
		// Subtract a number to walkingLoudness such that it take 1 second to get to min volume
		obj_soundMachine.walkingLoudness -= (1 / fps) / 5;
		obj_soundMachine.walkingLoudness = max(obj_soundMachine.walkingLoudness, 0);// Cap walking loudness at 0
	}
	
	#endregion
	
	#region Music attack calculations
	if(keyboard_check(Controls.note_right) or keyboard_check(Controls.note_left) or keyboard_check(Controls.note_up) or keyboard_check(Controls.note_down)) {
		// Add a number to singingLoudness such that it takes 3 seconds to get to full volume
		obj_soundMachine.singingPoints += (1 / fps) / 3; 
		obj_soundMachine.singingPoints= min(obj_soundMachine.singingPoints, 1); // Cap singing loudness at 1
	}else {
		// Subtract a number to singingLoudness such that it take 1 second to get to min volume
		obj_soundMachine.singingPoints -= (1 / fps) / 5;
		obj_soundMachine.singingPoints = max(obj_soundMachine.singingPoints, 0);// Cap singing loudness at 0
	}
	
	#endregion
}