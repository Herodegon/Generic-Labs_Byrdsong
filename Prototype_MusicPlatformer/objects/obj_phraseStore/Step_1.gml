/// @description Select phrases if player levels up
// You can write your code in this editor

if (instance_exists(obj_player))
{
	#region Create phrase pool for level-up screen
	if (obj_player.canLevelUp && array_length(phraseSelect) == 0)
	{
		var pool = obj_game.poolPhrases;
		
		var numChoices;
		if (array_length(pool) < 3) {numChoices = array_length(pool);}
		else {numChoices = 3;}
		for (var i = 0; i < numChoices; i++)
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
	
	#endregion
	
	#region Let player choose phrase/upgrade
	else if (obj_player.canLevelUp && array_length(phraseSelect) > 0)
	{
		var moveVector_x = keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));
		if (moveVector_x != 0)
		{
			if (currSelect == noone) {currSelect = 0;}
			
			phraseSelect[currSelect].isSelected = false;
			currSelect += moveVector_x;
			if (currSelect < 0)
			{
				currSelect = array_length(phraseSelect)-1;
			}
			else if (currSelect > array_length(phraseSelect)-1)
			{
				currSelect = 0;
			}
			
			phraseSelect[currSelect].isSelected = true;
		}
		else if (keyboard_check_pressed(ord("W")) && currSelect != noone)
		{
			var chosenPhrase = variable_clone(phraseSelect[currSelect].phrase);
			for (var i = 0; i < array_length(obj_player.availablePhrases); i++)
			{
				if (obj_player.availablePhrases[i].name == chosenPhrase.name)
				{
					array_delete(obj_player.availablePhrases,i,1);
					break;
				}
			}
			array_push(obj_player.availablePhrases,chosenPhrase);
			phraseSelect[currSelect].phrase.currLevel++;
			obj_player.canLevelUp = false;
		}
	}
	
	#endregion
	
	#region Cleanup after player has chosen phrase/upgrade
	else if (!obj_player.canLevelUp && array_length(phraseSelect) > 0)
	{
		#region Cleanup all GUI note instances
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
		
		#endregion
		
		#region Return level-up objects back to main pool
		for (var i = array_length(phraseSelect)-1; i >= 0; i--)
		{
			if (phraseSelect[i].phrase.currLevel < phraseSelect[i].phrase.maxLevel)
			{
				array_push(obj_game.poolPhrases,phraseSelect[i].phrase);
			}
			array_pop(phraseSelect);
		}
		
		#endregion
		
		currSelect = noone;
		global.gamePaused = false;
		global.canPause = true
	}
	
	#endregion
}