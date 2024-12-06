/// @description Insert description here
// You can write your code in this editor

#region Handle Levels
if (canLevelUp)
{
	patternInfo.numNotes += (level-1)*2;
	if (level%3 == 0)
	{
		patternInfo.radius += (level/3)*2;
	}
	canLevelUp = false;
}

#endregion

// Inherit the parent event
event_inherited();

