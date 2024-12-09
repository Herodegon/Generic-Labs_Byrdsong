/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

#region Check For Boss Fight
if (instance_exists(obj_player))
{
	with (obj_player)
	{
		//If player is close enough, start boss fight
		if (point_distance(x,y,other.x,other.y) <= other.detectRange)
		{
			if (obj_enemySpawner.enemySpawnerState != SPAWN_STATE.BOSSFIGHT)
			{
				obj_enemySpawner.enemySpawnerState = SPAWN_STATE.BOSSFIGHT;
				obj_enemySpawner.setChaseTarget(other.id);
				other.currState = ENEMY_STATES.FIRE;
			}
		}
		//If player has left boss fight range, end boss fight and begin patrol
		else if (obj_enemySpawner.enemySpawnerState != SPAWN_STATE.NORMAL)
		{
			obj_enemySpawner.enemySpawnerState = SPAWN_STATE.NORMAL;
			obj_enemySpawner.setChaseTarget(obj_player);
			other.currState = ENEMY_STATES.PATROL;
		}
	}
}

#endregion

#region Boss Fight

#endregion

