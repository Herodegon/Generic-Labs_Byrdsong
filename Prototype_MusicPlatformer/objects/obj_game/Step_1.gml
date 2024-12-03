/// @description Run main game tasks
// You can write your code in this editor

#region Update Timer
if (instance_exists(obj_player) && !global.gamePaused)
{
	if (global.gameTimer_start == -1) {global.gameTimer_start = get_timer();}
	
	var prevTime = global.gameTimer;
	global.gameTimer = int64((get_timer()-global.gameTimer_start)/MILLISECONDS);
	show_debug_message("Game Time: {0}",global.gameTimer);
	global.deltaTime = global.gameTimer-prevTime;
	show_debug_message("Delta Time: {0}",global.deltaTime);
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
		canMove = !canMove;
	}
	
	with (obj_enemy)
	{
		canMove = !canMove;
	}
	
	with (obj_enemySpawner)
	{
		canSpawn = !canSpawn;	
	}
}
	
prevPauseState = global.gamePaused;

#endregion

#region Reset dev flags
global.forceSpawn = false;

#endregion