/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(objTether))
{
	if (canMove)
	{
		var posX = objTether.x + round(radius*dcos(angle));
		var posY = objTether.y + round(radius*dsin(angle));
		x = posX;
		y = posY;
		if (moveState == NOTE_MOVEMENT.CIRCULAR)
		{
			angle -= moveSpeed;
		}
		else if (moveState == NOTE_MOVEMENT.EXTEND)
		{
			radius += moveSpeed;
		}
	}
}
else
{
	instance_destroy();
}