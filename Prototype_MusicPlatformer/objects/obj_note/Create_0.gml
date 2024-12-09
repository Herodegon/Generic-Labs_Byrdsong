/// @description Initialize basic note
// You can write your code in this editor

#region Sprite variables
depth = DEPTH_PROJECTILE;
image_speed = 0;
image_alpha = 1;

#endregion

#region Note variables
#region Note stats
stats =
{
	max_hp: 1,
	damage: 1,
	knockback: 0
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

moveSpeed = obj_player.moveSpeed + 1;
moveSpeed_diag = obj_player.moveSpeed_diag + 1;
moveVector_x = 0;
moveVector_y = 0;
moveDir = noone;			//When projectile direction is different than movement direction

moveState = NOTE_MOVEMENT.STRAIGHT;
collisionObject = obj_enemy;

despawnTimer = obj_player.attackDelay*2;

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