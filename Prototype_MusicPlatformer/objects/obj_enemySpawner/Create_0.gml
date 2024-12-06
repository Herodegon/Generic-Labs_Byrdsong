/// @description Initialize spawner
// You can write your code in this editor

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
		instance_create_layer(obj_x,obj_y,"Instances",obj);	
	}
}

poolEnemies = 
[
	{
		name: "Raccoon",
		object: obj_enemy,
		sprite: spr_enemy_down,
		cost: 1
	},
	{
		name: "Rabid Raccoon",
		object: obj_enemy_rabid,
		sprite: spr_enemy_down,
		cost: 5
	},
	{
		name: "Super Raccoon",
		object: obj_enemy_mini_boss,
		sprite: spr_enemy_down,
		cost: 20
	},

];


maxBudget = 8;
waveTimer = 3*MILLISECONDS;		//Time in milliseconds
currTimer = waveTimer;

maxBudgetTimer = 20*MILLISECONDS;
currBudgetTimer = maxBudgetTimer;
budgetIncreaseMult = 1.1;

canSpawn = true;
isPaused = false;
enemyLimit = 3000;

#region Developer Options
spawnWallState = SPAWN_WALL.NONE;

#endregion