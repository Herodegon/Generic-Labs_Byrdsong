/// @description Insert description here
// You can write your code in this editor

#region Handle Levels
if (canLevelUp)
{
	patternInfo.numNotes += (level-1)*2;
	patternInfo.radius += (level-1)*2;
	stats.max_hp += floor(level/4)*1;
	stats.damage += floor(level/6)*1;
	canLevelUp = false;
}

#endregion

// Inherit the parent event
event_inherited();

