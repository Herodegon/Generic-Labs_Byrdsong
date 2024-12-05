/// @description Insert description here
// You can write your code in this editor

#region Handle Levels
if (canLevelUp)
{
	patternInfo.numNotes += (level-1);
	if (level%3 == 0)
	{
		moveSpeed += 0.5;
	}
	canLevelUp = false;
}

#endregion

// Inherit the parent event
event_inherited();

