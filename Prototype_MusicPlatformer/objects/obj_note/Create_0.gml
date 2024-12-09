/// @description Initialize basic note
// You can write your code in this editor

#region Sprite variables
depth = DEPTH_PROJECTILE;
image_speed = 0;
image_alpha = 1;

#endregion

#region Note variables
#region Note stats
moveSpeed = 3;
moveSpeed_diag = 2;
moveVector_x = 0;
moveVector_y = 0;
moveDir = noone;			//When projectile direction is different than movement direction

stats =
{
	max_hp: 1,
	damage: 1,
	knockback: 0,
	objSpeed: moveSpeed
}
hp = stats.max_hp;
level = 1;
canLevelUp = false;

patternInfo =
{
	numNotes: 4,
	maxAngle: 360,
	minAngle: 0,
	radius: 8
}

#endregion

moveState = NOTE_MOVEMENT.STRAIGHT;
collisionObject = obj_enemy;

despawnTimer = 0.5*MILLISECONDS;

#region Default flags
isDespawnSet = true;		//Set if object will despawn after x amount of time
isPlayerLocked = true;		//Movement locked to player's position
canMove = true;				//Will move each frame
canSpawn = false;			//Is able to spawn projectiles
isInvincible = false;		//Object does not die

isGuiObject	= false;
isPaused = false;

#endregion

#endregion