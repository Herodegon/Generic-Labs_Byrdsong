/// @description Initialize spawner
// You can write your code in this editor

//Initialize enemy pool
script_enemies()

enum SPAWN_STATE
{
	NORMAL,
	BOSSFIGHT
}

enum SPAWN_WALL
{
	LEFT,
	RIGHT,
	TOP,
	BOTTOM,
	NONE
}

enum ENEMY_STATES
{
	PATROL,
	CHASE,
	FIRE,
	CHARGE,
}

setChaseTarget = function(obj)
{
	if (instance_exists(obj_enemy))
	{
		with (obj_enemy)
		{
			if (!isBoss)
			{
				if (chaseTarget != obj)
				{
					chaseTarget = obj;
				}
			}
		}
	}
	enemyChaseTarget = obj;
}

spawnEnemies = function(num,obj,spr)
{
	var camera = getCameraFeatures();
	var padding = sprite_get_width(spr);
	var obj_radius = camera.cam_w+padding;
	for (var i = 0; i < num; i++)
	{
		var obj_dir = random(360);
		var dist_x = round(obj_radius*dcos(obj_dir));
		var dist_y = round(obj_radius*dsin(obj_dir));
		var obj_x = camera.cam_centerX+dist_x;
		var obj_y = camera.cam_centerY+dist_y;
		
		// Developer spawn method for enemies to spawn from a 
		// specific direction
		if (spawnWallState != noone)
		{
			switch(spawnWallState)
			{
				case SPAWN_WALL.LEFT:		//Left Wall
					obj_x = camera.cam_x-padding;
					obj_y = irandom_range(camera.cam_y,camera.cam_y+camera.cam_h);
					break;
				case SPAWN_WALL.RIGHT:		//Right Wall
					obj_x = camera.cam_x+camera.cam_w+padding;
					obj_y = irandom_range(camera.cam_y,camera.cam_y+camera.cam_h);
					break;
				case SPAWN_WALL.TOP:			//Top Wall
					obj_x = irandom_range(camera.cam_x,camera.cam_x+camera.cam_w);
					obj_y = camera.cam_y-padding;
					break;
				case SPAWN_WALL.BOTTOM:		//Bottom Wall
					obj_x = irandom_range(camera.cam_x,camera.cam_x+camera.cam_w);
					obj_y = camera.cam_y+camera.cam_h+padding;
					break;
			}
		}
		var objEnemy = instance_create_layer(obj_x,obj_y,"Instances",obj);	
		objEnemy.chaseTarget = enemyChaseTarget;
	}
}

availableEnemies = [];
enemyChaseTarget = obj_player;

maxBudget = 8;
waveTimer = 3*MILLISECONDS;		//Time in milliseconds
currTimer = waveTimer;

maxBudgetTimer = 20*MILLISECONDS;
currBudgetTimer = maxBudgetTimer;
budgetIncreaseMult = 1.1;

addEnemyTimer = 60*MILLISECONDS;
currEnemyTimer = 0;

addBossTimer = 3*60*MILLISECONDS;
currBossTimer = addBossTimer;


canSpawn = true;
isPaused = false;
enemyLimit = 1000;

#region Developer Options
enemySpawnerState = SPAWN_STATE.NORMAL;
spawnWallState = SPAWN_WALL.NONE;

#endregion