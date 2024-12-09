/// @description Run main game tasks
// You can write your code in this editor

show_debug_message("Num Enemies: {0}",global.numEnemies);

#region Update Timer
if (instance_exists(obj_player))
{
	//Set start time to after game initialization
	if (global.gameTimer_start == -1) {global.gameTimer_start = get_timer();}
	
	#region Calculate Game Time
	var prevTime = global.gameTimer;
	
	#region Calculate Time Paused
	if (global.gamePaused && prevPauseState == global.gamePaused)
	{
		prevTime = timePaused;
		timePaused = get_timer()-global.gamePaused_start;
	}
	else if (!global.gamePaused && timePaused > 0)
	{
		totalTimePaused += timePaused;
		timePaused = 0;
	}
	
	#endregion
	
	global.gameTimer = int64((get_timer()-global.gameTimer_start-timePaused-totalTimePaused)/MILLISECONDS);
	
	#endregion
	
	#region Calculate Delta Time
	if (global.gamePaused)
	{
		global.deltaTime = int64((timePaused-prevTime)/MILLISECONDS);
	}
	else
	{
		global.deltaTime = global.gameTimer-prevTime;
	}
	
	#endregion
}

#endregion

#region Pause Screen
if (keyboard_check_pressed(vk_escape) && global.canPause)
{
	global.gamePaused = !global.gamePaused;
	global.displayPaused = !global.displayPaused;
	global.toggleGUI = !global.toggleGUI;
}

#endregion

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
	
	if (global.gamePaused)
	{
		global.gamePaused_start = get_timer();
	}
}
	
prevPauseState = global.gamePaused;

#endregion

#region Reset dev flags
global.forceSpawn = false;

#endregion