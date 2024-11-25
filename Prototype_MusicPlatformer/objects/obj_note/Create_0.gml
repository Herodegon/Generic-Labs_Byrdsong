/// @description Initialize basic note
// You can write your code in this editor

#region Sprite variables
image_speed = 0;

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
moveDir = noone;

moveState = NOTE_MOVEMENT.STRAIGHT;

despawnTimer = obj_player.attackDelay*2;

#region Default flags
isDespawnSet = true;		//Set if object will despawn after x amount of time
isPlayerLocked = true;		//Movement locked to player's position
canMove = true;				//Will move each frame
canSpawn = false;			//Is able to spawn projectiles
isInvincible = false;		//Object does not die

#endregion

#endregion