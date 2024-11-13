/// @description Run main game tasks
// You can write your code in this editor

#region Update Timer
if (instance_exists(obj_player))
{
	global.gameTimer = (get_timer()-global.gameTimer_start)/1000000;
	show_debug_message("Game Time: {0}",global.gameTimer);
}

#endregion