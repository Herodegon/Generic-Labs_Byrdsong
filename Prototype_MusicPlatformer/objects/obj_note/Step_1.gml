/// @description Handle note movement
// You can write your code in this editor

#region Movement
var objSpeed = moveSpeed;
if (moveVector_x != 0 && moveVector_y != 0) 
{
	objSpeed = moveSpeed_diag;
}
x += objSpeed*moveVector_x;
y += objSpeed*moveVector_y;

#endregion

#region Collision
with (obj_enemy)
{
	if (instance_place(x,y,other))
	{
		//Knockback
		if (other.knockback != 0)
		{
			x += other.moveVector_x*(sprite_get_width(sprite_index)/4)*other.knockback;
			y += other.moveVector_y*(sprite_get_height(sprite_index)/4)*other.knockback;
		}
		hp -= other.damage;
		other.hp--;
	}
}

#endregion

#region Health Check
if (hp <= 0)
{
	instance_destroy();
}

#endregion