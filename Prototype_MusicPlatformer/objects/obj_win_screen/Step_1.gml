/// @description Insert description here
// You can write your code in this editor

if (canRevealChar)
{
	screenAlpha += 0.05;	
}

#region Time Until Reveal Question Mark
if (revealTimer > 0)
{
	revealTimer -= global.deltaTime;
	if (revealTimer <= 0)
	{
		canRevealChar = true;	
	}
}

#endregion