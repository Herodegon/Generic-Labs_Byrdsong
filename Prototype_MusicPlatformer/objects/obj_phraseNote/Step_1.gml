/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(objTether))
{
	//If parent is GUI object, also become a GUI object
	if (objTether.isGuiObject && isGuiObject == false) {isGuiObject = true;}
	
	if (canMove && !isPaused)
	{
		var posX = objTether.x + round(radius*dcos(angle));
		var posY = objTether.y + round(radius*dsin(angle));
		x = posX;
		y = posY;
		if (moveState == NOTE_MOVEMENT.CIRCULAR ||
			moveState == NOTE_MOVEMENT.CIRCULAREXTEND)
		{
			angle -= moveSpeed;
		}
		if (moveState == NOTE_MOVEMENT.EXTEND ||
			moveState == NOTE_MOVEMENT.CIRCULAREXTEND)
		{
			radius += moveSpeed;
		}
	}
	
	if (objTether.despawnTimer < 0.25*MILLISECONDS)
	{
		image_alpha = objTether.image_alpha;
	}
}
else
{
	instance_destroy();
}