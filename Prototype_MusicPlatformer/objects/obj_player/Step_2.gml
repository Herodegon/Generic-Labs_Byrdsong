/// @description Sprite handling
// You can write your code in this editor

#region Sprite

if (canAttack == false)
{
	if (sprite_index != spr_player_playing) {sprite_index = spr_player_playing;}
}
else if (moveVector_x == 0 || moveVector_y == 0)
{
	if (moveVector_y < 0)
	{
		if (sprite_index != spr_player_up) {sprite_index = spr_player_up;}
	}

	if (moveVector_y > 0)
	{
		if (sprite_index != spr_player_down) {sprite_index = spr_player_down;}
	}

	if (moveVector_x != 0)
	{
		if (sprite_index != spr_player_side) {sprite_index = spr_player_side;}
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