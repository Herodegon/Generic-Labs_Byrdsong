/// @description Enemy AI
// You can write your code in this editor

#region Chase player
if (instance_exists(obj_player) && canMove && !isPaused)
{
	if (currState == ENEMY_STATES.CHASE)
	{	
		#region Movement and collision
		var objSpeed = moveSpeed;
		if (currState == ENEMY_STATES.CHASE && instance_exists(obj_player))
		{
			var delta_x = obj_player.x - x;
			var delta_y = obj_player.y - y;
		}
	
		if (abs(delta_x) > 3 && abs(delta_y) > 3)
		{
			objSpeed = moveSpeed_diag;
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
		var move_x = objSpeed*moveVector_x;
		var move_y = objSpeed*moveVector_y;
	
		#endregion
	
		#region Collision
		if (currState == ENEMY_STATES.CHASE)
		{
			if (instance_place(x+move_x,y+move_y,obj_block) || instance_place(x+move_x,y+move_y,obj_enemy))
			{	
				var obj = noone;
				if (instance_place(x+move_x,y+move_y,obj_enemy))
				{
					obj = instance_place(x+move_x,y+move_y,obj_enemy);
				}
				else
				{
					obj = instance_place(x+move_x,y+move_y,obj_block);
				}
			
				if (obj)
				{
					var vector = point_direction(x+move_x,y+move_y,obj.x,obj.y);
					x -= dcos(vector);
					y += dsin(vector);
				}
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