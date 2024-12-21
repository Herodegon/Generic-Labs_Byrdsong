/// @description Insert description here
// You can write your code in this editor

#region Handle Levels
if (canLevelUp)
{
	patternInfo.numNotes += (level-1);
	stats.damage += floor(level/6)*1;
	stats.objSpeed += floor(level/4)*0.5;
	canLevelUp = false;
}

#endregion

// Inherit the parent event
event_inherited();

