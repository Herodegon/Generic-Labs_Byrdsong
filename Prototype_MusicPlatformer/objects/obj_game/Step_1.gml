/// @description Run main game tasks
// You can write your code in this editor

#region Update Timer
if (instance_exists(obj_player))
{
	if (global.gameTimer_start == -1) {global.gameTimer_start = get_timer();}
	
	var prevTime = global.gameTimer;
	global.gameTimer = int64((get_timer()-global.gameTimer_start)/MILLISECONDS)-timePaused;
	show_debug_message("Game Time: {0}",global.gameTimer);
	global.deltaTime = global.gameTimer-prevTime;
	show_debug_message("Delta Time: {0}",global.deltaTime);
	if (global.gamePaused)
	{
		timePaused += global.deltaTime;
		show_debug_message("Time Paused: {0}",timePaused);
	}
}

#endregion

if (keyboard_check_pressed(vk_escape) && global.canPause)
{
	global.gamePaused = !global.gamePaused;
	global.displayPaused = !global.displayPaused;
	global.toggleGUI = !global.toggleGUI;
}

#region Game State
if (prevPauseState != global.gamePaused)
{
	with (obj_player)
	{
		isPaused = !isPaused;
	}
	
	with (obj_note)
	{
		isPaused = !isPaused;
	}
	
	with (obj_enemy)
	{
		isPaused = !isPaused;
	}
	
	with (obj_enemySpawner)
	{
		isPaused = !isPaused;	
	}
}
	
prevPauseState = global.gamePaused;

#endregion

#region Reset dev flags
global.forceSpawn = false;

#endregion