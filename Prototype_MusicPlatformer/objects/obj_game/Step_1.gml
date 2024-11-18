/// @description Run main game tasks
// You can write your code in this editor

#region Update Timer
if (instance_exists(obj_player))
{
	if (global.gameTimer_start == -1) {global.gameTimer_start = get_timer();}
	
	var prevTime = global.gameTimer;
	global.gameTimer = int64((get_timer()-global.gameTimer_start)/MILLISECONDS);
	show_debug_message("Game Time: {0}",global.gameTimer);
	global.deltaTime = global.gameTimer-prevTime;
	show_debug_message("Delta Time: {0}",global.deltaTime);
}

#endregion

#region Reset dev flags
global.forceSpawn = false;

#endregion