/// @description Initialize basic note
// You can write your code in this editor

#region Sprite variables
image_speed = 0;

#endregion

#region Note variables
hp = 1;
damage = 1;
knockback = 0;

moveSpeed = obj_player.moveSpeed + 1;
moveSpeed_diag = obj_player.moveSpeed_diag + 1;
moveVector_x = 0;
moveVector_y = 0;
despawnTimer = obj_player.attackDelay*2;

#endregion