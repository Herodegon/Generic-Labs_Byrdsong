/// @description Select phrases if player levels up
// You can write your code in this editor

if (instance_exists(obj_player))
{
	if (obj_player.canLevelUp && array_length(phraseSelect) == 0)
	{
		var poolSize = array_length(obj_game.poolPhrases);
		for (var i = 0; i < 3; i++)
		{
			var randSelect = irandom(poolSize-1);
			array_push(phraseSelect,obj_game.poolPhrases[randSelect]);
		}
		global.gamePaused = true;
	}
	else if (!obj_player.canLevelUp)
	{
		phraseSelect = [];
		global.gamePaused = false;
	}
}