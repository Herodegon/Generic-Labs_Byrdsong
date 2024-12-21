/// @description Enemy AI
// You can write your code in this editor

#region Chase player
if (instance_exists(chaseTarget) && canMove && !isPaused)
{
	if (currState == ENEMY_STATES.CHASE)
	{	
		#region Movement and collision
		var objSpeed = moveSpeed;
		if (currState == ENEMY_STATES.CHASE)
		{
			var delta_x = chaseTarget.x - x;
			var delta_y = chaseTarget.y - y;
		}
		
		if (abs(delta_x) > 3 && abs(delta_y) > 3)
		{
			moveVector_x = sign(delta_x)*1;
			moveVector_y = sign(delta_y)*1;
		}
		else if (abs(delta_x) > 3)
		{
			moveVector_x = sign(delta_x)*1;
			moveVector_y = 0;
		}
		else if (abs(delta_y) > 3)
		{
			moveVector_x = 0;
			moveVector_y = sign(delta_y)*1;
		}
		
		var dir_x = moveVector_x;
		var dir_y = moveVector_y;
		if (moveVector_x != 0 && moveVector_y != 0)
		{
			dir_x /= UNIT_LENGTH;
			dir_y /= UNIT_LENGTH;
		}
		
		var move_x = objSpeed*dir_x;
		var move_y = objSpeed*dir_y;
		
		if (obj_enemySpawner.enemySpawnerState == SPAWN_STATE.BOSSFIGHT &&
			chaseTarget != obj_player)
		{
			var border = irandom_range(chaseTarget.detectRange,chaseTarget.detectRange+100);
			if (point_distance(chaseTarget.x,chaseTarget.y,x,y) < border)
			{
				move_x *= -1;
				move_y *= -1;
			}
		}
			
	
		#endregion
		
		#region Collision
		if (currState == ENEMY_STATES.CHASE)
		{
			if (instance_place(x+move_x,y+move_y,obj_enemy))
			{	
				var obj = instance_place(x+move_x,y+move_y,obj_enemy);
				var vector = point_direction(x,y,obj.x,obj.y);
				x -= dcos(vector);
				y += dsin(vector);
			}
		}
		x += move_x;
		y += move_y;
	
		#endregion
	}
}

#endregion

#region Health Check
if (hp <= 0)
{
	instance_destroy();
}

#endregion

#region Timers
/* TODO: Reduce pathfinding equations down to x per second
if (!isPaused)
{
	if (currPathTimer > 0)
	{
		currPathTimer -= global.deltaTime;
		if (currPathTimer <= 0)
		{
			canCalculateMovement = true;
		}
	}
}
*/

#endregion