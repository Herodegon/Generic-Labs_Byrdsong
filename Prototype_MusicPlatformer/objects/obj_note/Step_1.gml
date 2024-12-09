/// @description Handle note movement
// You can write your code in this editor

#region Check for GUI object
if (isPaused && isGuiObject) {isPaused = false;}

#endregion

#region Spawn Projectiles
if (canSpawn)
{
	spawnProjPattern(id,projState,patternInfo,stats,true);
	canSpawn = false;
}

#endregion

#region Movement
if (canMove && moveState == NOTE_MOVEMENT.STRAIGHT && !isPaused)
{
	var objSpeed = moveSpeed;
	if (moveVector_x != 0 && moveVector_y != 0) 
	{
		objSpeed = moveSpeed_diag;
	}
	var deltaX = objSpeed*moveVector_x;
	var deltaY = objSpeed*moveVector_y;
		
	x += deltaX;
	y += deltaY;
}

#endregion

#region Collision
if (!isInvincible && !isPaused)
{
	with (collisionObject)
	{
		if (instance_place(x,y,other) && !isInvincible)
		{
			//Knockback
			if (other.stats.knockback != 0)
			{
				x += other.moveVector_x*(sprite_get_width(sprite_index)/4)*other.stats.knockback;
				y += other.moveVector_y*(sprite_get_height(sprite_index)/4)*other.stats.knockback;
			}
			hp -= other.stats.damage;
			other.hp--;
			if (other.collisionObject == obj_player)
			{
				tookDamage = true;	
			}
		}
	}
}

#endregion

#region Health Check
if (hp <= 0)
{
	instance_destroy();
}

#endregion

#region Timer
if (!isPaused)
{
	if (isDespawnSet)
	{
		if (despawnTimer < 0.25*MILLISECONDS)
		{
			image_alpha = (despawnTimer*4)/MILLISECONDS
		}
		despawnTimer -= global.deltaTime;
		if (despawnTimer <= 0) {instance_destroy();}
	}
}

#endregion