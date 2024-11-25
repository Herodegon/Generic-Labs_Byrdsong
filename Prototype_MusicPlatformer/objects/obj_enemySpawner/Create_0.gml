/// @description Initialize spawner
// You can write your code in this editor

enum SpawnWall
{
	LEFT,
	RIGHT,
	TOP,
	BOTTOM,
	NONE
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
			show_debug_message("Spawn Wall is not none");
			switch(spawnWallState)
			{
				case SpawnWall.LEFT:		//Left Wall
					obj_x = camera.cam_x;
					obj_y = round(random_range(camera.cam_y,camera.cam_y+camera.cam_h))-padding;
					break;
				case SpawnWall.RIGHT:		//Right Wall
					obj_x = camera.cam_x+camera.cam_w;
					obj_y = round(random_range(camera.cam_y,camera.cam_y+camera.cam_h))+padding;
					break;
				case SpawnWall.TOP:			//Top Wall
					obj_x = round(random_range(camera.cam_x,camera.cam_x+camera.cam_w))-padding;
					obj_y = camera.cam_y;
					break;
				case SpawnWall.BOTTOM:		//Bottom Wall
					obj_x = round(random_range(camera.cam_x,camera.cam_x+camera.cam_w))+padding;
					obj_y = camera.cam_y+camera.cam_h;
					break;
			}
		}
		instance_create_layer(obj_x,obj_y,"Instances",obj);	
	}
}

poolEnemies = [
	{
		name: "Raccoon",
		object: obj_enemy,
		sprite: spr_enemy_down,
		cost: 1
	}
];

//TODO: Add enemy instance limit
maxBudget = 8;
waveTimer = 5*MILLISECONDS;		//Time in milliseconds
currTimer = waveTimer;

canSpawn = false;

#region Developer Options
spawnWallState = SpawnWall.NONE;

#endregion