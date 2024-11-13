/// @description Sprite handling
// You can write your code in this editor

#region Sprite

if (moveVector_x == 0 || moveVector_y == 0)
{	
	if (moveVector_y < 0)
	{
		if (sprite_index != spr_enemy_up) {sprite_index = spr_enemy_up;}
	}
	
	if (moveVector_y > 0)
	{
		if (sprite_index != spr_enemy_down) {sprite_index = spr_enemy_down;}
	}
	
	if (moveVector_x != 0)
	{
		if (sprite_index != spr_enemy_side) {sprite_index = spr_enemy_side;}
		image_xscale = sign(moveVector_x);
	}
	
	//Checks if the player is standing still. If so don't animate and go to idle frame, otherwise animate.
	if(moveVector_y == 0 and moveVector_x == 0) {
		image_speed = 0;
		image_index = 0;
	}else {
		image_speed = 1;
	}
}

#endregion