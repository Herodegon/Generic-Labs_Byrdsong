/// @description Insert description here
// You can write your code in this editor

#region Handle Levels
if (canLevelUp)
{
	patternInfo.numNotes += (level-1);
	if (level%3 == 0)
	{
		stats.objSpeed += 0.5;
	}
	if (level%6 == 0)
	{
		stats.objSpeed += 0.5;
	}
	canLevelUp = false;
}

#endregion

// Inherit the parent event
event_inherited();

