/// @description Enemy AI
// You can write your code in this editor

#region Chase player
if (currState == States.CHASE)
{	
	#region Movement and collision
	var objSpeed = moveSpeed;
	if (currState == States.CHASE && instance_exists(obj_player))
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
	if (currState == States.CHASE)
	{
		var i = 0;
		while(instance_place(x+move_x,y+move_y,obj_block) || instance_place(x+move_x,y+move_y,obj_enemy))
		{	
			if (i == 2)
			{
				move_x = 0;
				move_y = 0;
				break;
			}
			
			if (instance_place(x,y+move_y,obj_block) || instance_place(x,y+move_y,obj_enemy))
			{
				move_x = objSpeed*moveVector_x;
				move_y = 0;
			}
			else
			{
				move_y = objSpeed*moveVector_y;
				move_x = 0;
			}
			
			i++;
		}
	}
	x += move_x;
	y += move_y;
	
	#endregion
}

#endregion

#region Health Check
if (hp <= 0)
{
	instance_destroy();
}

#endregion