/// @description Initialize spawner
// You can write your code in this editor

function spawnEnemies(num,obj,spr)
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
		/*
		var randWall = round(random(3));
		switch(randWall)
		{
			case 0:		//Left Wall
				obj_x = camera.cam_x;
				obj_y = round(random_range(camera.cam_y,camera.cam_y+camera.cam_h))-spacing_w;
				break;
			case 1:		//Right Wall
				obj_x = camera.cam_x+camera.cam_w;
				obj_y = round(random_range(camera.cam_y,camera.cam_y+camera.cam_h))+spacing_w;
				break;
			case 2:		//Top Wall
				obj_x = round(random_range(camera.cam_x,camera.cam_x+camera.cam_w))-spacing_h;
				obj_y = camera.cam_y;
				break;
			case 3:		//Bottom Wall
				obj_x = round(random_range(camera.cam_x,camera.cam_x+camera.cam_w))+spacing_h;
				obj_y = camera.cam_y+camera.cam_h;
				break;
		}
		*/
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
maxBudget = 150;
waveTimer = 5*MILLISECONDS;		//Time in milliseconds
currTimer = waveTimer;

canSpawn = true;