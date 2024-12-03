/// @description Developer Commands
// You can write your code in this editor

if (global.devCommandsActive)
{
	if (keyboard_check_pressed(ord("P")))
	{
		global.forceSpawn = true;
	}

	if (keyboard_check_pressed(ord("I")))
	{
		isInvincible = !isInvincible;
	}

	if (keyboard_check_pressed(ord("G")))
	{
		global.toggleGUI = !global.toggleGUI;
	}

	if (keyboard_check_pressed(vk_subtract))
	{
		obj_player.xp++;
	}

	if (keyboard_check_pressed(vk_right))
	{
		obj_enemySpawner.spawnWallState = SpawnWall.RIGHT;
	}

	if (keyboard_check_pressed(vk_left))
	{
		obj_enemySpawner.spawnWallState = SpawnWall.LEFT;
	}

	if (keyboard_check_pressed(vk_up))
	{
		obj_enemySpawner.spawnWallState = SpawnWall.TOP;
	}

	if (keyboard_check_pressed(vk_down))
	{
		obj_enemySpawner.spawnWallState = SpawnWall.BOTTOM;
	}
}