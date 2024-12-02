/// @description Select phrases if player levels up
// You can write your code in this editor

if (instance_exists(obj_player))
{
	if (obj_player.canLevelUp && array_length(phraseSelect) == 0)
	{
		var pool = variable_clone(obj_game.poolPhrases);
		for (var i = 0; i < 3; i++)
		{
			var poolSize = array_length(pool);
			var randSelect = irandom(poolSize-1);
			storeObj = {phrase: pool[randSelect],isSelected: false};
			array_push(phraseSelect,storeObj);
			array_delete(pool,randSelect,1);
		}
		global.gamePaused = true;
		global.canPause = false;
	}
	else if (obj_player.canLevelUp && array_length(phraseSelect) > 0)
	{
		var moveVector_x = keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));
		if (moveVector_x != 0)
		{
			if (currSelect == noone) {currSelect = 0;}
			
			phraseSelect[currSelect].isSelected = false;
			if (currSelect < 0)
			{
				currSelect = array_length(phraseSelect)-1;
			}
			else if (currSelect > array_length(phraseSelect)-1)
			{
				currSelect = 0;
			}
			else
			{
				currSelect += moveVector_x;
			}
			phraseSelect[currSelect].isSelected = true;
		}
		else if (keyboard_check_pressed(ord("W")))
		{
			var chosenPhrase = phraseSelect[currSelect].phrase;
			array_push(obj_player.availablePhrases,chosenPhrase);
			obj_player.canLevelUp = false;
		}
	}
	else if (!obj_player.canLevelUp && array_length(phraseSelect) > 0)
	{
		if (instance_exists(obj_note))
		{
			with (obj_note)
			{
				if (isGuiObject)
				{
					instance_destroy();
				}
			}
		}
		phraseSelect = [];
		currSelect = noone;
		global.gamePaused = false;
		global.canPause = true
	}
}