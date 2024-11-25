/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(objTether))
{
	if (canMove && moveState == NOTE_MOVEMENT.CIRCULAR)
	{
		var posX = objTether.x + round(radius*dcos(angle));
		var posY = objTether.y + round(radius*dsin(angle));
		x = posX;
		y = posY;
		angle -= moveSpeed;
	}
}
else
{
	instance_destroy();
}